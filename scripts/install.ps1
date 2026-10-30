#requires -Version 5.1
<#
.SYNOPSIS
  Copies the team agents, skills and instructions into your personal Copilot folder.
.DESCRIPTION
  Run from the repo folder:  powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
  Existing files with the same name are overwritten. Your own other files are not touched.
  Agents and skills retired by the consolidation are moved to <target>\backup-retired (not deleted).
  Run it again after every "git pull" to pick up updates.
#>
param(
    [string]$Target = (Join-Path $HOME '.copilot')
)

$repo = Split-Path -Parent $PSScriptRoot

$retiredAgents = 'bpe-change-impact-analyst', 'bpe-meeting-recap', 'bpe-process-cartographer',
    'bpe-process-flow-builder', 'bpe-readiness-checker', 'bpe-test-uat-coverage',
    'gtm-ado-agent', 'gtm-monthly-leadership'
$retiredSkills = 'gtm-my-work', 'gtm-work-item-summary', 'gtm-bug-triage', 'gtm-bug-report',
    'bpe-find-process-sources', 'bpe-mine-ado-for-process', 'bpe-m365-research-prompt'

$backup = Join-Path $Target 'backup-retired'
foreach ($name in $retiredAgents) {
    $file = Join-Path $Target "agents\$name.agent.md"
    if (Test-Path $file) {
        New-Item -ItemType Directory -Force -Path "$backup\agents" | Out-Null
        Move-Item $file "$backup\agents" -Force
        Write-Host "Retired agent moved to backup: $name"
    }
}
foreach ($name in $retiredSkills) {
    $dir = Join-Path $Target "skills\$name"
    if (Test-Path $dir) {
        New-Item -ItemType Directory -Force -Path "$backup\skills" | Out-Null
        Move-Item $dir "$backup\skills" -Force
        Write-Host "Retired skill moved to backup: $name"
    }
}

foreach ($folder in 'agents', 'skills', 'instructions') {
    $source = Join-Path $repo $folder
    $dest = Join-Path $Target $folder
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $dest -Recurse -Force
    $count = (Get-ChildItem $source -Recurse -File).Count
    Write-Host "Copied $count files to $dest"
}
Write-Host 'Done. Close and reopen the Copilot app, pick GTM Agent or BPE Agent, then type /gtm-help or /bpe-help.'
