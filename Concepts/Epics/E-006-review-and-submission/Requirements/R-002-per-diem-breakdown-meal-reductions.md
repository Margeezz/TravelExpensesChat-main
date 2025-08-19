# R-002 Per‑Diem Breakdown & Meal Reductions

## Why
Provide transparent per‑diem calculation with policy defaults.

## Behavior
- Show per‑day per‑diem with country detection and rate source label (country/city, effective date)
- Meal toggles (breakfast/lunch/dinner) affecting amounts per policy; support batch apply across selected days
- Track overrides with audit note; provide "Explain" tooltip with calculation details

## Scenarios (BDD)
Scenario: Meal toggle reduces per‑diem
Given lunch is toggled as provided
When the per‑diem recalculates
Then the day's amount decreases per policy rules
