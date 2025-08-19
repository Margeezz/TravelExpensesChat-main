# R-005 Trip Readiness Checklist

## Why
Surface missing information early.

## Behavior
- Inline checklist for missing destination, dates, purpose
- Quick‑fix actions to resolve missing items
- Ready status shown in Review

## Scenarios (BDD)
Scenario: Resolve missing destination
Given a trip missing destination
When the user sets the destination via quick‑fix
Then the checklist item is marked complete
