#requires -Version 5.1
<#
.SYNOPSIS
  Validate the repository's Copilot agent and skill metadata before sharing an update.
#>
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repo '.github\skills'
$errors = New-Object System.Collections.Generic.List[string]

foreach ($directory in Get-ChildItem $skillRoot -Directory) {
    $path = Join-Path $directory.FullName 'SKILL.md'
    if (-not (Test-Path $path)) {
        $errors.Add("Missing SKILL.md: $($directory.Name)")
        continue
    }

    $text = [System.IO.File]::ReadAllText($path)
    if ($text -notmatch '(?s)\A---\r?\n(.*?)\r?\n---') {
        $errors.Add("Missing or malformed frontmatter: $path")
        continue
    }

    $frontmatter = $Matches[1]
    $nameMatch = [System.Text.RegularExpressions.Regex]::Match($frontmatter, '(?m)^name:\s*(.+?)\s*$')
    if (-not $nameMatch.Success -or $nameMatch.Groups[1].Value.Trim('"', "'") -ne $directory.Name) {
        $errors.Add("Skill name must match its directory '$($directory.Name)': $path")
    }
    if ($frontmatter -notmatch '(?m)^description:\s*\S') {
        $errors.Add("Skill description is missing: $path")
    }
    if ($frontmatter -notmatch '(?m)^user-invocable:\s*true\s*$') {
        $errors.Add("Skill must support direct slash-command invocation: $path")
    }
    if ($frontmatter -match '(?m)^disable-model-invocation:\s*true\s*$') {
        $errors.Add("Skill cannot be selected for plain-English routing: $path")
    }
}

$bpeAgent = [System.IO.File]::ReadAllText((Join-Path $repo '.github\agents\bpe-agent.agent.md'))
$gtmAgent = [System.IO.File]::ReadAllText((Join-Path $repo '.github\agents\gtm-agent.agent.md'))
foreach ($entry in @(
    @{ Agent = 'BPE'; Text = $bpeAgent },
    @{ Agent = 'GTM'; Text = $gtmAgent }
)) {
    if ($entry.Text -notmatch '(?m)^user-invocable:\s*true\s*$') {
        $errors.Add("$($entry.Agent) Agent must be user-invocable.")
    }
    if ($entry.Text -notmatch '(?m)^disable-model-invocation:\s*true\s*$') {
        $errors.Add("$($entry.Agent) Agent must not be selectable by model invocation.")
    }
}
foreach ($entry in @(
    @{ Agent = 'BPE'; Text = $bpeAgent; Required = @('bpe-process-documentation.instructions.md', 'gtm-team-context.instructions.md', 'atlassian/searchConfluence', 'atlassian/getConfluenceContent', 'atlassian/createConfluenceContent') },
    @{ Agent = 'GTM'; Text = $gtmAgent; Required = @('gtm-team-context.instructions.md', 'work-item-formatting.instructions.md', 'atlassian/createConfluenceContent') }
)) {
    foreach ($file in $entry.Required) {
        if ($entry.Text -notmatch [regex]::Escape($file)) {
            $errors.Add("$($entry.Agent) Agent is missing required instruction or tool allowlist entry: $file")
        }
    }
}

$readme = [System.IO.File]::ReadAllText((Join-Path $repo 'README.md'))
$setup = [System.IO.File]::ReadAllText((Join-Path $repo 'docs\training\01-setup.md'))
if ($readme -notmatch '(?m)\|\s*`salesforce`\s*\|') {
    $errors.Add('README must document the Salesforce MCP server name as salesforce.')
}
if ($setup -notmatch '(?m)^\s*"salesforce"\s*:') {
    $errors.Add('Setup guide must configure the Salesforce MCP server as salesforce.')
}
if ($setup -match 'sf-mcp-server') {
    $errors.Add('Setup guide uses the obsolete sf-mcp-server name.')
}
foreach ($tool in @('get_username', 'list_all_orgs', 'run_soql_query', 'resume_tool_operation')) {
    if ($setup -notmatch [regex]::Escape("""$tool""")) {
        $errors.Add("Setup guide must explicitly allow the read-only Salesforce tool '$tool'.")
    }
}

if ($errors.Count -gt 0) {
    throw ("Copilot configuration validation failed:`r`n - " + ($errors -join "`r`n - "))
}

Write-Host 'Copilot agent and skill configuration is valid.'
