# R-004 Travel Times Editor

## Why
Allow correction of travel segments affecting per‑diems.

## Behavior
- Edit start/end times per travel day
- Validate overlaps and gaps
- Recompute per‑diems when any edited segment changes the day-tier thresholds (e.g., <8h → ≥8h, ≥24h), overnight transitions, or country boundary crossings.

## Scenarios (BDD)
Scenario: Adjust travel end time
Given a travel day ending at 18:00
When the user changes it to 20:00
Then the per‑diem is recomputed if the edit crosses a policy threshold or boundary
