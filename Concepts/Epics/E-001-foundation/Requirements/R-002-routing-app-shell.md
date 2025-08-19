# R-002 Routing & App Shell

## Why
Provide a stable layout and navigational backbone for all modules.

## Behavior
- App shell renders header/nav/content regions
- Header contains avatar menu with Global Role Switcher (visible only when user has >1 roles)
- Client-side routing with route guards; unauthorized routes show a 403 card with a role-switch CTA when applicable
- Fallback route for unknown URLs

## Scenarios (BDD)
Scenario: Guarded route redirects unauthenticated user
Given an unauthenticated user
When they navigate to /review
Then they are redirected to /signin

Scenario: Unauthorized route shows 403 with switch CTA
Given an authenticated user with roles Traveler and Manager
And active role Traveler
When they open /approvals/123
Then a 403 card is shown with CTA to switch to Manager
And selecting it switches role and opens the approval
