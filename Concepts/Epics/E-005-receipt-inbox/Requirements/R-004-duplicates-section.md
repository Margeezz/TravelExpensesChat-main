# R-004 Duplicates Section (Confirm/Dismiss)

## Why
Require explicit review of suspected duplicates.

## Behavior
- Dedicated Duplicates section in Inbox
- Confirm as duplicate or Dismiss as not a duplicate
- Keep audit of decision and actor

## Scenarios (BDD)
Scenario: Dismiss a false positive
Given a receipt appears in Duplicates
When the user dismisses it
Then it is removed from Duplicates and returns to Inbox
