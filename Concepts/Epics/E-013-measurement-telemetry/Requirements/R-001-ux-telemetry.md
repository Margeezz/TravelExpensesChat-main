# R-001 UX Telemetry (RUM)

## Why
Measure real user performance and usage to improve UX.

## Behavior
- Capture core web vitals and route timings
- Attach anonymized session/log IDs to feedback
- Opt-out setting per tenant

## Scenarios (BDD)
Scenario: Route timing is recorded
Given telemetry is enabled
When the user navigates to /review
Then route timing is sent with anonymized session ID
