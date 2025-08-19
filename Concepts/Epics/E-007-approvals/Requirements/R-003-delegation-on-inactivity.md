# R-003 Delegation on Inactivity

## Why
Prevent stuck approvals.

## Behavior
- Delegate task if the manager remains inactive beyond a configurable SLA threshold (business days)
- SLA days are configured in Settings (see `E-012 Admin & Configuration / R-004 Approvals SLA Settings`), default 5, range 1–30
- Notify both original approver and delegate on delegation; include deep links
- Keep audit of delegation (who, when, from → to)

## Scenarios (BDD)
Scenario: Auto‑delegate after inactivity
Given a manager has not acted for the configured SLA duration
When the threshold is reached
Then the task is delegated to the configured delegate
And both parties are notified
And an audit entry records the delegation
