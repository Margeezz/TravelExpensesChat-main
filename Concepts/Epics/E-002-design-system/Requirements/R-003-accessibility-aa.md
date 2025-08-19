# R-003 Accessibility AA

## Why
Ensure inclusive access and compliance.

## Behavior
- Meet WCAG 2.2 AA for contrast, focus, semantics
- Keyboard navigation for all interactive components
- Announce dynamic changes via ARIA where needed

## Scenarios (BDD)
Scenario: Focus visible on keyboard navigation
Given a user navigates by keyboard
When tabbing through inputs
Then focus is clearly visible on each element
