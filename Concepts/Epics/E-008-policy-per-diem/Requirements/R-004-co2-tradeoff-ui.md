# R-004 CO₂ Trade‑Off UI

## Why
Expose environmental impact alongside policy and cost.

## Behavior
- Display per‑receipt CO₂ scope indicator
- Show trade‑off tooltip between cost and CO₂ where applicable
- Persist CO₂ data for export

## Scenarios (BDD)
Scenario: CO₂ indicator shown on receipt
Given a receipt eligible for CO₂ scope
When viewing the receipt
Then a CO₂ indicator is displayed with tooltip
