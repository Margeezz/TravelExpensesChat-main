# R-003 Reimbursement Summary (ECB FX)

## Why
Ensure accurate multi‑currency totals with transparent rates.

## Behavior
- Use ECB daily FX rate at receipt transaction date by default
- Display FX rate and date per receipt and in summary
- Allow admin override source later (not in MVP UI)

## Scenarios (BDD)
Scenario: Display ECB rate used
Given a receipt in USD dated 2025‑05‑10
When viewing the summary
Then the applied ECB rate and date 2025‑05‑10 are displayed
