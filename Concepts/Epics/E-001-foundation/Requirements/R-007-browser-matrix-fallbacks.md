# R-007 Browser Matrix & Fallbacks

## Why
Provide predictable behavior across supported browsers.

## Behavior
- Support current major browsers
- Provide graceful degradation and documented fallbacks for unsupported APIs

## Scenarios (BDD)
Scenario: Unsupported API uses fallback
Given Safari lacks the preferred API
When the feature is used
Then the documented fallback is applied
