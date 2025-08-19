# R-005 Global Role Switcher

## Why
Support users who hold multiple roles (e.g., Traveler + Manager) by allowing quick switching of the active role to show the correct navigation and permissions.

## Behavior
- Control location: avatar menu in the top app bar labeled "Active role"; appears only when user has >1 roles.
- Options reflect assigned roles: Traveler, Manager, Finance, IT Administrator.
- Default restores last used role per device; switching updates visible tabs/routes immediately without reload.
- Routing guard: when opening a route not allowed by the current active role, show 403 card with CTA to switch to a permitted role.
- Finance IA: when switching to Finance, the Finance tab replaces Chat for the session; switching away restores Chat.
- Telemetry: track role_switch_opened, role_selected, role_switch_completed.

## Scenarios (BDD)
Scenario: Switch role updates navigation
Given a user has roles Traveler and Manager
And their active role is Traveler
When they select Manager from the Role Switcher
Then the Approvals tab becomes visible and Chat is hidden

Scenario: Restore last role
Given a user set Manager as active role previously on this device
When they reopen the app
Then Manager is active and the corresponding tabs/routes are shown

Scenario: 403 with switch CTA
Given a user has roles Traveler and Manager
And their active role is Traveler
When they open an Approvals deep link
Then a 403 card is shown with a "Switch to Manager" CTA
And selecting it switches role and navigates to the approval

Scenario: Switching to Finance replaces Chat with Finance tab
Given a user has roles Traveler and Finance
And their active role is Traveler
When they select Finance from the Role Switcher
Then the Finance tab appears and Chat is removed from the tab bar for the session
And deep links to Chat remain accessible via shortcuts
