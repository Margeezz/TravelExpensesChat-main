# R-003 OCR Fallback Integration

## Why
Ensure extraction resilience by falling back to vendor OCR when needed.

## Behavior
- Use our OCR as primary
- On failure/low confidence, route to vendor OCR
- Merge results with provenance

## Scenarios (BDD)
Scenario: Fallback to vendor OCR
Given our OCR returns low confidence
When fallback is triggered
Then vendor OCR is invoked and results are merged with provenance labels
