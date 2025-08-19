# R-001 Per‑Diem Management UI

## Why
Allow Finance Administrators to maintain versioned, effective-dated per-diem rates through an intuitive guided interface that ensures data accuracy and compliance.

## Behavior
- **User Persona**: Finance Administrator (Medium-High technical skill)
- **Interface**: Guided setup wizard with progressive disclosure and validation
- **Functionality**: Edit versioned, effective-dated per-diem tables with rollback capability
- **Validation**: Real-time validation against required fields, formats, and business rules
- **Audit**: Track change history with complete audit trail and user attribution
- **Setup Time**: Target <30 minutes for new admin configuration

## Business Rules
- **Rate Validation**: Per-diem rates must be within acceptable business ranges
- **Effective Dating**: Rate changes must have clear effective dates with no gaps
- **Version Control**: All rate changes create new versions with rollback capability
- **Business Logic**: Rate changes must not violate company policy or compliance rules
- **Approval Workflow**: Significant rate changes may require additional approval
- **Data Integrity**: Prevent overlapping effective dates and conflicting rate structures

## Scenarios (BDD)
Scenario: New admin completes per-diem setup
Given a new Finance Administrator starts configuration
When they follow the guided setup wizard
Then per-diem rates are configured in under 30 minutes
And validation ensures data accuracy
And the setup is logged in the audit trail
And the admin receives confirmation of successful setup

Scenario: Update effective-dated rate with audit
Given an admin edits a per-diem rate
When saving a new effective date
Then the rate is stored with the new effective date
And the change is recorded in history with user attribution
And the new rate is immediately available for calculations
And stakeholders are notified of the rate change

Scenario: Bulk import with validation
Given an admin uploads a CSV file with per-diem rates
When the system processes the import
Then validation errors are shown in real-time
And successful imports are applied with audit trail
And the admin can review and approve the changes
And any conflicts with existing rates are highlighted

Scenario: Rate change with business rule validation
Given an admin attempts to set a rate outside acceptable range
When the validation runs
Then the change is blocked
And clear explanation of the business rule violation is provided
And guidance is given on acceptable rate ranges
And the admin can adjust the rate accordingly

Scenario: Rate rollback to previous version
Given a per-diem rate change causes issues
When the admin requests a rollback
Then the system reverts to the previous version
And the rollback is logged in the audit trail
And all affected calculations are updated
And stakeholders are notified of the rollback
