Param(
  [string]$InputPath
)

$ErrorActionPreference = 'Stop'

# If no input path provided, pick the newest export under Output/Requirements_*.md
if (-not $PSBoundParameters.ContainsKey('InputPath') -or [string]::IsNullOrWhiteSpace($InputPath)) {
  $latest = Get-ChildItem -Path 'Output' -Filter 'Requirements_*.md' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
  if (-not $latest) {
    Write-Error "No export found under Output/Requirements_*.md"
    exit 1
  }
  $InputPath = $latest.FullName
}

if (-not (Test-Path -Path $InputPath)) {
  Write-Error "Input file not found: $InputPath"
  exit 1
}

# Read source line-by-line to handle fenced blocks
$lines = Get-Content -Path $InputPath

$inFence = $false
$awaitPath = $false
$output = New-Object System.Collections.Generic.List[string]

for ($i = 0; $i -lt $lines.Count; $i++) {
  $line = $lines[$i]

  if (-not $inFence) {
    if ($line -eq '```markdown') {
      $inFence = $true
      $awaitPath = $true
      continue
    }
    $output.Add($line)
    continue
  }

  # Inside fence
  if ($awaitPath) {
    if ($line -match '^\s*<<\s*(.+?)\s*>>\s*$') {
      $rel = $Matches[1]
      if (Test-Path -Path $rel) {
        $fileContent = Get-Content -Path $rel -Raw
        # Insert the referenced file content verbatim
        $output.Add($fileContent)
      } else {
        $output.Add("Missing file: $rel")
      }
      # Next expected line should be closing fence; skip until we find it
      $awaitPath = $false
      continue
    } else {
      # Unexpected: treat as normal text within fence (write the opening fence and current line)
      $output.Add('```markdown')
      $output.Add($line)
      $inFence = $false
      $awaitPath = $false
      continue
    }
  } else {
    # Consume lines until closing fence
    if ($line -eq '```') {
      $inFence = $false
      $awaitPath = $false
      continue
    }
    # Skip intermediary lines within placeholder fences
    continue
  }
}

# Write back (UTF8 without BOM)
[System.IO.File]::WriteAllText($InputPath, ($output -join [Environment]::NewLine), [System.Text.UTF8Encoding]::new($true))
Write-Host "Inlined placeholders in $InputPath"
