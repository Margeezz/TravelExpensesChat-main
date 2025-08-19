# R-004 Approvals SLA Settings

## Why
Allow Finance Administrators to configure approval inactivity thresholds through an intuitive guided interface.

## Behavior
- **User Persona**: Finance Administrator (Medium-High technical skill)
- **Interface**: Guided setup wizard with progressive disclosure
- **Setting**: Approval inactivity SLA (business days) with sensible defaults and guardrails
- **Calendar Basis**: Business-day calendar (weekends excluded); holiday handling out of scope for MVP
- **Applies To**: `E-007 Approvals / R-003 Delegation on Inactivity`
- **Effect Timing**: Changes apply promptly to new and existing tasks
- **Audit**: Complete audit trail with user, timestamp, old → new value
- **Setup Time**: Target under 30 minutes for new admin configuration

## Scenarios (BDD)
Scenario: Finance Administrator updates SLA through guided interface
Given a Finance Administrator with permissions
When they use the guided SLA configuration wizard
Then the SLA is changed to a new value in business days
And new and existing approval tasks reflect the new SLA
And an audit entry records the change with user attribution

Scenario: SLA validation and business day calculation
Given an admin sets a new SLA
When the system processes the change
Then validation ensures the value is within allowable range
And business day calculation excludes weekends automatically

Scenario: Real-time SLA application
Given an SLA change is made
When the system processes the update
Then existing approval tasks are updated promptly
And new tasks immediately use the new SLA value
