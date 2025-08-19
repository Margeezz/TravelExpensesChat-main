# R-003 Confidence & Duplicate Flags

## Why
Expose OCR reliability and duplication risk.

## Behavior
- Display OCR confidence indicator
- Flag potential duplicates visually
- Tooltip shows raw text and confidence details

## Scenarios (BDD)
Scenario: Low confidence is visible
Given a receipt with low OCR confidence
When viewing the Inbox card
Then a low‑confidence badge is shown
