# R-009 Internationalization (DE/EN)

## Why
Serve German and English users consistently.

## Behavior
- All UI strings localized to DE and EN
- Locale switch in settings with instant apply
- Dates/numbers formatted per locale

## Scenarios (BDD)
Scenario: Locale switch updates UI
Given the UI language is English
When the user selects Deutsch
Then all visible strings render in German
