# R-001 Manager View Toggle

## Why
Allow travelers to preview approval rendering.

## Behavior
- Toggle in UI to switch to manager view
- Read‑only preview; no state changes
- Return to traveler view persists state

## Scenarios (BDD)
Scenario: Toggle to manager view
Given a traveler is reviewing a report
When they toggle Manager View
Then the approval sheet preview is shown
