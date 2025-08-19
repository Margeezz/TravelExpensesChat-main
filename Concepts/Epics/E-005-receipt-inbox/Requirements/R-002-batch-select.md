# R-002 Batch Select

## Why
Allow bulk actions for faster triage.

## Behavior
- Multi‑select receipts by checkbox or shift‑click
- Batch assign to target trip/day
- Batch delete/dismiss with confirmation

## Scenarios (BDD)
Scenario: Batch assign
Given 3 receipts are selected
When the user assigns them to Trip A / Day 2
Then all 3 receipts move to that destination
