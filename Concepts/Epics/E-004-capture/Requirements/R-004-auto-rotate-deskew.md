# R-004 Auto‑Rotate & De‑skew

## Why
Improve OCR accuracy and readability.

## Behavior
- Auto‑rotate based on EXIF/heuristics
- De‑skew mild perspective distortions
- Preserve original file when: (a) user toggles "Keep original" in settings, or (b) automatic correction confidence is below a configured threshold.

## Scenarios (BDD)
Scenario: Skewed image is corrected
Given a skewed receipt image
When processing completes
Then the preview shows a de‑skewed version
