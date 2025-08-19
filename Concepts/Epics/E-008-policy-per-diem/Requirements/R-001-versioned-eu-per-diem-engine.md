# R-001 Versioned EU Per‑Diem Engine

## Why
Ensure accurate, auditable EU per‑diems over time with EUR base currency and ECB FX rates.

## Behavior
- **MVP Scope**: EU per-diems only (no other jurisdictions in MVP)
- **Base Currency**: EUR (Euro) as primary currency
- **FX Source**: ECB daily rates; store rate + timestamp (as-of date)
- **Effective-dated Tables**: Per country/city with versioning
- **Calculation Rules**: Per-day proration by local destination midnight
- **Rounding**: Round half-up to 2 decimal places
- **Version History**: Complete audit trail with rollback capability

## Technical Requirements
- **EU Coverage**: All EU member states with city-specific rates
- **Effective Dating**: Rate changes with clear effective dates
- **Proration Logic**: Per-day calculation by local midnight
- **Meal Reductions**: Matrix-based meal reduction factors
- **FX Integration**: ECB rate lookup and storage
- **Audit System**: Complete change history with user attribution

## Scenarios (BDD)
Scenario: EU per-diem rate calculation
Given a trip to Berlin on 2025‑01‑15
When computing per‑diem
Then the EU rate effective on 2025‑01‑15 is used
And the amount is calculated in EUR with ECB FX rates

Scenario: Effective-dated rate change
Given a per-diem rate change for Paris effective 2025-02-01
When computing per-diem for a trip spanning January-February
Then different rates apply for different periods
And the change is audited with effective date tracking

Scenario: EUR base currency with ECB FX
Given a receipt in USD from a trip to Rome
When calculating reimbursement
Then the amount is converted to EUR using ECB rates
And the FX rate and date are stored for audit purposes
