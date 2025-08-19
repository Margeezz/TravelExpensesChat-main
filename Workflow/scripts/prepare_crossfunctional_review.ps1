Param(
  [string]$EpicsRoot = 'Concepts/Epics',
  [string]$InputsRoot = 'Inputs',
  [string]$ReviewsDir = 'Reviews',
  [string]$TemplatePath = 'Workflow/Templates/Review_CrossFunctional.md'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -Path $ReviewsDir)) {
  New-Item -ItemType Directory -Path $ReviewsDir -Force | Out-Null
}

$timestamp = Get-Date -Format 'yyyyMMdd-HHmm'
$reviewPath = Join-Path $ReviewsDir ("Review_{0}.md" -f $timestamp)

# Start with template
if (-not (Test-Path -Path $TemplatePath)) { throw "Template not found: $TemplatePath" }
$content = Get-Content -Path $TemplatePath -Raw -Encoding UTF8

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('# Review ' + $timestamp)
$lines.Add('')
$lines.AddRange($content -split "`r?`n")

# Build index from epics/requirements
$lines.Add('')
$lines.Add('<!-- Index -->')

if (-not (Test-Path -Path $EpicsRoot)) { throw "Epics root not found: $EpicsRoot" }
$reqFiles = Get-ChildItem -Path $EpicsRoot -Recurse -File -Filter 'R-*.md' |
  Where-Object { $_.FullName -match '(\\|/)Requirements(\\|/)' } |
  Sort-Object FullName

function Get-Title {
  param([string]$text, [string]$fallback)
  $titleLine = ($text -split "`r?`n" | Where-Object { $_ -match '^#\s+' } | Select-Object -First 1)
  if ([string]::IsNullOrWhiteSpace($titleLine)) { return $fallback }
  return ($titleLine -replace '^#\s+', '')
}

$currentEpic = ''
foreach ($f in $reqFiles) {
  $raw = Get-Content -Path $f.FullName -Raw -Encoding UTF8
  $title = Get-Title -text $raw -fallback $f.BaseName

  $cwd = (Resolve-Path .).Path
  if ($cwd -and $f.FullName.StartsWith($cwd)) {
    $rel = $f.FullName.Substring($cwd.Length) -replace '^[\\/]+',''
  } else { $rel = $f.FullName }

  $epic = ([regex]::Match($rel, 'Concepts(\\|/)Epics(\\|/)([^/\\]+)(\\|/)')).Groups[3].Value
  if ($epic -ne $currentEpic) {
    $currentEpic = $epic
    $lines.Add(('### ' + $epic)) | Out-Null
  }
  $lines.Add(('* ' + $title + ' - ' + $rel)) | Out-Null
}

# Heuristic candidate issues per persona (signals only)
$lines.Add('')
$lines.Add('<!-- Candidate findings (heuristics) below. Replace with real findings. -->')

function Find-AmbiguousTerms {
  param([string]$text)
  $terms = @('should','maybe','approximately','about','roughly','etc','tbd','ideally','as needed','if possible')
  $found = New-Object System.Collections.Generic.HashSet[string]
  foreach ($t in $terms) { if ($text -match ("\\b{0}\\b" -f [regex]::Escape($t))) { $null = $found.Add($t) } }
  if ($text -match '\?{2,}') { $null = $found.Add('???') }
  return ,([string[]]$found)
}

function Collect-Heuristics {
  param($files)
  $result = [ordered]@{ RE=@(); BA=@(); UX=@(); Sec=@(); Arch=@(); QA=@() }
  foreach ($f in $files) {
    $raw = Get-Content -Path $f.FullName -Raw -Encoding UTF8
    $title = Get-Title -text $raw -fallback $f.BaseName
    $rel = $f.FullName.Substring((Resolve-Path .).Path.Length) -replace '^[\\/]+',''

    $amb = Find-AmbiguousTerms -text $raw
    if ($amb.Count -gt 0) {
      $result.RE += ,("Ambiguity in " + $title + " - terms: " + (($amb | Select-Object -Unique) -join ', ') + " (" + $rel + ")")
      $result.QA += ,("Hard to test wording in " + $title + " (" + $rel + ")")
    }

    if ($raw -notmatch '## Scenarios' -and $raw -notmatch 'Scenario:') {
      $result.QA += ,("Missing BDD scenarios in " + $title + " (" + $rel + ")")
    }

    if ($title -notmatch '^R-\\d{3}') {
      $result.RE += ,("Title missing ID prefix in " + $title + " (" + $rel + ")")
    }

    if ($raw -match 'performance|budget|ms|latency') { $result.Arch += ,("Performance criteria present - verify thresholds in " + $title + " (" + $rel + ")") }
    if ($raw -match 'privacy|consent|pii|gdpr') { $result.Sec += ,("Privacy/consent present - verify legal basis in " + $title + " (" + $rel + ")") }
    if ($raw -match 'accessib|a11y|keyboard|screen reader') { $result.UX += ,("Accessibility considerations present - verify WCAG mapping in " + $title + " (" + $rel + ")") }
  }
  return $result
}

$heur = Collect-Heuristics -files $reqFiles

function Append-ToSection {
  param([System.Collections.Generic.List[string]]$buffer, [string]$header, [string[]]$items)
  $idx = $buffer.FindIndex({ param($x) $x -eq $header })
  if ($idx -lt 0) { return }
  $insertAt = $idx + 1
  foreach ($it in ($items | Select-Object -Unique)) {
    if (-not [string]::IsNullOrWhiteSpace($it)) { $buffer.Insert($insertAt, '- ' + $it); $insertAt++ }
  }
}

Append-ToSection -buffer $lines -header '### RE - Requirements Engineering' -items $heur.RE
Append-ToSection -buffer $lines -header '### BA - Business Analysis' -items $heur.BA
Append-ToSection -buffer $lines -header '### UX - User Experience' -items $heur.UX
Append-ToSection -buffer $lines -header '### Sec - Security/Privacy/Compliance' -items $heur.Sec
Append-ToSection -buffer $lines -header '### Arch - Architecture/Performance/Resilience' -items $heur.Arch
Append-ToSection -buffer $lines -header '### QA - Testability/Scenarios' -items $heur.QA

[System.IO.File]::WriteAllText($reviewPath, ($lines -join [Environment]::NewLine), [System.Text.UTF8Encoding]::new($true))
Write-Host ('Prepared cross-functional review: ' + $reviewPath)



