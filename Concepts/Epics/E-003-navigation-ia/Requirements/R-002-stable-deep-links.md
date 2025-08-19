# R-002 Stable Deep Links

## Why
Enable direct access to specific entities for users and emails.

## Behavior
- Stable routes for trip, receipt, approval task
- Open correct view and highlight the entity
- Preserve auth guard and fallback to sign‑in
- Role-aware guard: if the current active role lacks permission, show a 403 card with CTA to switch to a permitted role and then continue
- Chat context chip: deep links can open chat focused on an entity and show a context chip (trip/receipt/approval)

## Scenarios (BDD)
Scenario: Open receipt deep link
Given the user is signed in
When visiting /receipts/123
Then the receipt 123 is displayed and highlighted

Scenario: Role switch CTA on approval deep link
Given the user has Manager role but active role is Traveler
When visiting /approvals/456
Then a 403 card is shown with CTA "Switch to Manager"
And selecting it switches role and opens the approval 456

Scenario: Role switch CTA on Finance deep link
Given the user has Finance role but active role is Traveler
When visiting /finance/dashboard
Then a 403 card is shown with CTA "Switch to Finance"
And selecting it switches role and opens the Finance dashboard
