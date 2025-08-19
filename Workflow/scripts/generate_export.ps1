Param(
  [string]$EpicsRoot = 'Concepts/Epics',
  [string]$OutputDir = 'Output',
  [string]$FilePrefix = 'Requirements_'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -Path $EpicsRoot)) {
  Write-Error "Epics root not found: $EpicsRoot"
  exit 1
}

# Ensure output directory exists
if (-not (Test-Path -Path $OutputDir)) {
  New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

# Compute timestamped output path
$timestamp = Get-Date -Format 'yyyyMMdd-HHmm'
$OutputPath = Join-Path $OutputDir ("$FilePrefix$timestamp.md")

# Buffer lines in memory for a single write at the end
$lines = New-Object System.Collections.Generic.List[string]

$lines.Add('# Project Export')
$lines.Add('')
$lines.Add('This document consolidates all epics and requirements.')
$lines.Add('')
$lines.Add('---')

# Enumerate epic folders by name
Get-ChildItem -Path $EpicsRoot -Directory | Sort-Object Name | ForEach-Object {
  $epicDir = $_.FullName
  $epicFile = (Get-ChildItem -Path $epicDir -File -Filter 'E-*.md' | Sort-Object Name | Select-Object -First 1)
  if (-not $epicFile) { return }

  # Add a blank line between epics
  $lines.Add('')
  # Append epic content
  $epicContent = Get-Content -Path $epicFile.FullName -Raw
  $lines.AddRange($epicContent -split "`r?`n")

  # Requirements heading
  $lines.Add('')
  $lines.Add('### Requirements')

  # Append each requirement file sorted by name
  $reqDir = Join-Path $epicDir 'Requirements'
  if (Test-Path -Path $reqDir) {
    Get-ChildItem -Path $reqDir -File -Filter '*.md' | Sort-Object Name | ForEach-Object {
      $lines.Add('')
      $reqContent = Get-Content -Path $_.FullName -Raw
      $lines.AddRange($reqContent -split "`r?`n")
    }
  }

  # Userflows heading
  $lines.Add('')
  $lines.Add('### Userflows')

  # Append each userflow file sorted by name
  $ufDir = Join-Path $epicDir 'Userflows'
  if (Test-Path -Path $ufDir) {
    Get-ChildItem -Path $ufDir -File -Filter '*.md' | Sort-Object Name | ForEach-Object {
      $lines.Add('')
      $ufContent = Get-Content -Path $_.FullName -Raw
      $lines.AddRange($ufContent -split "`r?`n")
    }
  }

  # Separator after each epic
  $lines.Add('')
  $lines.Add('---')
}

# Write out (UTF8 without BOM)
[System.IO.File]::WriteAllText($OutputPath, ($lines -join [Environment]::NewLine), [System.Text.UTF8Encoding]::new($true))
Write-Host "Export rebuilt at $OutputPath"
