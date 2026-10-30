#requires -Version 5.1
<#
.SYNOPSIS
  Copies the team agents, skills and instructions into your personal Copilot folder.
.DESCRIPTION
  Run from the repo folder:  powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
  Existing files with the same name are overwritten. Your own other files are not touched.
  Run it again after every "git pull" to pick up updates.
#>
param(
    [string]$Target = (Join-Path $HOME '.copilot')
)

$repo = Split-Path -Parent $PSScriptRoot
foreach ($folder in 'agents', 'skills', 'instructions') {
    $source = Join-Path $repo $folder
    $dest = Join-Path $Target $folder
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $dest -Recurse -Force
    $count = (Get-ChildItem $source -Recurse -File).Count
    Write-Host "Copied $count files to $dest"
}
Write-Host 'Done. Restart the Copilot app or CLI, then type /bpe-help.'
