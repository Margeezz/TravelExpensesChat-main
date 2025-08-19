# R-001 Cross‑Trip Move

## Why
Maintain accurate grouping of receipts while preserving data integrity and providing clear audit trails for compliance.

## Behavior
- **Receipt Movement**: Move receipts across trips with immediate recomputation of totals
- **Data Validation**: Prevent moves that would create invalid business scenarios
- **Audit Trail**: Maintain complete audit trail of all moves with user attribution
- **Business Rules**: Enforce business logic to prevent inappropriate moves
- **User Confirmation**: Require explicit confirmation for significant moves

## Business Rules
- **Move Validation**: Prevent move if submission is locked or approved
- **Data Recalculation**: Automatically recalculate trip totals, per-diems, and reimbursements
- **Audit Requirements**: Log all moves with before/after values and business justification
- **Permission Check**: Verify user has permission to move receipts between trips
- **Business Logic**: Prevent moves that violate company policy or compliance rules

## Scenarios (BDD)
Scenario: Successful cross-trip receipt move
Given a receipt assigned to Trip A
When the user moves it to Trip B
Then Trip A totals decrease and Trip B totals increase accordingly
And all calculations (per-diems, reimbursements) are updated
And the move is logged in the audit trail with user attribution

Scenario: Move prevented due to locked submission
Given a receipt is assigned to Trip A
When Trip A is locked for submission
Then the move operation is blocked
And a clear message explains why the move cannot proceed
And guidance is provided on when moves will be allowed again

Scenario: Move with business rule validation
Given a user attempts to move a receipt to Trip B
When the move would violate business policy
Then the operation is prevented
And the specific policy violation is explained
And alternative solutions are suggested

Scenario: Bulk move of multiple receipts
Given multiple receipts are selected in Trip A
When the user moves them to Trip B
Then all receipts are moved in a single operation
And totals are recalculated for both trips
And a summary of the bulk move is displayed
And individual audit entries are created for each receipt

Scenario: Move with approval workflow impact
Given a receipt is moved from Trip A to Trip B
When Trip A was previously approved
Then the approval status is updated accordingly
And stakeholders are notified of the change
And the approval workflow is adjusted if needed
