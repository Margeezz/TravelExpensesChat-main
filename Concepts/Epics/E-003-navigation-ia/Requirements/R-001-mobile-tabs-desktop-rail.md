# R-001 Mobile Tabs & Desktop Rail

## Why
Support efficient navigation across key areas.

## Behavior
- Mobile tabs: Chat, Review, Approvals, Settings
- Desktop left‑rail mirrors the sections
- Default home: Chat; remember last-used view per user

## Role-based visibility (MVP)
- Traveler: Chat, Review, Settings
- Manager: Approvals, Review (team scope), Settings
- Finance: Finance (top-level tab when activeRole=Finance; replaces Chat); otherwise reachable under Settings → Finance
- IT Administrator: Settings (Admin/Configuration)
- Users with multiple roles can switch via the global Role Switcher; tabs update immediately.

## Scenarios (BDD)
Scenario: Switch between tabs
Given the user is on Chat
When the user taps Review
Then the Review section is shown

Scenario: Manager sees Approvals, Traveler does not
Given a user with only Traveler role
When they open the app
Then the Approvals tab is hidden

And given a user with Manager role active
When they open the app
Then the Approvals tab is visible

Scenario: Deep link offers role switch
Given a user with Manager role available but active role is Traveler
When they open `/approvals/:id`
Then a 403 card shows with CTA to switch to Manager
And tapping it switches role and opens the approval
