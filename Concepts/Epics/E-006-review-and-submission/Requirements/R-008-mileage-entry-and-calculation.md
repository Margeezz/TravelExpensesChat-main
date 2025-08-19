# R-008 Mileage Entry & Calculation

## Why
Provide a simple, auditable way to reimburse private car trips using policy per‑km rates.

## Behavior
- Create a mileage expense with fields: date, origin (optional), destination (optional), distance in kilometers, vehicle class (optional per policy).
- Auto-detect country/policy rate from trip context and date; compute amount = kilometers × effective per‑km rate.
- Show rate label and source (country, vehicle class, effective date). Link to policy info (read-only in MVP).
- Allow manual override of rate with required audit note.
- Support edit/delete with undo for 10 minutes.
- Suggest remembered routes (e.g., Home ↔ Client HQ); flag outlier distances and require confirm.
- Chat intents: “Add 42 km to Trip Berlin on Jan 16” and “Change yesterday’s mileage to 38 km”; confirmation before apply.

## Scenarios (BDD)
Scenario: Create mileage with auto rate
Given a trip in Germany on 2025‑01‑16
And the user adds mileage of 42 km
When the system computes reimbursement
Then the per‑km rate effective on 2025‑01‑16 for Germany is applied
And the amount is shown with the rate label

Scenario: Override rate with audit note
Given a mileage entry exists
When the user overrides the rate
Then a required note is captured and linked in audit

Scenario: Chat creates mileage
Given the user is in Chat
When the user says "Add 42 km to Berlin trip on Jan 16"
Then the system disambiguates if needed and creates a mileage expense
And posts a confirmation with undo


