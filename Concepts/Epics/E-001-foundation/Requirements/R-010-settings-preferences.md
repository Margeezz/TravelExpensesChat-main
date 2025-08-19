# R-010 Settings & Preferences

## Why
Allow users to tailor basic experience and notifications.

## Behavior
- Language preference: DE/EN with instant apply
- Theme preference: Light/Dark with persistence
- Email notifications preferences: approvals, submissions (opt-in/out)

## Scenarios (BDD)
Scenario: Turn off approval emails
Given email notifications are on by default
When the user turns off Approval emails in Settings
Then new approval notifications are no longer emailed
And in-app notifications remain unaffected
