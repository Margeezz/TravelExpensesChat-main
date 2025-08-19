# R-002 Component Library

## Why
Provide reusable building blocks to speed delivery and ensure quality.

## Behavior
- Ship minimal core components first (button, input, select, table, modal, toast) — defer advanced components until later
- Document props, states, and a11y behavior
- Versioned releases with changelog

## Scenarios (BDD)
Scenario: Component docs include a11y behavior
Given a developer views Button docs
When reading the spec
Then keyboard and screen reader behavior is documented
