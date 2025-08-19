# R-001 Design Tokens

## Why
Ensure consistent theming and rapid UI changes.

## Behavior
- Define tokens for color (incl. brand white/orange/blue), spacing, typography
- Support Light and Dark themes with contrast AA
- Tokens consumable in code and docs

## Scenarios (BDD)
Scenario: Theme switch applies tokens
Given the app is in Light theme
When the user toggles Dark mode
Then components render using Dark token values
