# R-005 Performance Budgets

## Why
Ensure responsive UX across devices.

## Behavior
- Define budget: LCP ≤ 2.5 s (p75), TTI ≤ 3.5 s (p75)
- List virtualization for >100 items
- CDN/cache headers for static assets

## Scenarios (BDD)
Scenario: Large list uses virtualization
Given a list with 500 receipts
When rendering the list
Then only visible rows are rendered
