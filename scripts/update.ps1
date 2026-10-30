#requires -Version 5.1
<#
.SYNOPSIS
  Fast-forwards this checkout, validates the agent configuration, and installs it for the current user.
.DESCRIPTION
  Run from any directory in the repository. The pull is refused when the working tree is not clean.
  Use -SkipPull to validate and install the current checkout without contacting the remote.
#>
param(
    [string]$Target = (Join-Path $HOME '.copilot'),
    [switch]$SkipPull
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

if (-not (Test-Path (Join-Path $repo '.git'))) {
    throw "Repository metadata was not found at $repo."
}

if (-not $SkipPull) {
    $changes = & git -C $repo status --porcelain
    if ($LASTEXITCODE -ne 0) {
        throw 'Could not inspect the Git working tree.'
    }
    if ($changes) {
        throw 'The working tree has uncommitted changes. Commit or stash them, then rerun; or use -SkipPull to install the current checkout.'
    }

    & git -C $repo pull --ff-only
    if ($LASTEXITCODE -ne 0) {
        throw 'Git could not fast-forward this branch. Resolve the branch/remote state, then rerun.'
    }
}

& (Join-Path $PSScriptRoot 'validate.ps1')
& (Join-Path $PSScriptRoot 'install.ps1') -Target $Target

Write-Host "Updated personal Copilot files from $repo."
Write-Host 'Restart Copilot and start a new session to load the updated agents and skills.'
