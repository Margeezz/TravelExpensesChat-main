# R-004 Final-Only Approval Model

## Why
Keep the approval process simple and fast for MVP while maintaining compliance and audit requirements through a single, final approver model.

## Behavior
- **Single Approver**: Each submission has exactly one approver responsible for the final decision
- **Immediate State Change**: Approval decision immediately changes submission state to Final Approved/Rejected
- **No Intermediate Steps**: No intermediate approval steps are configured in MVP
- **Complete Audit Trail**: Record approver, timestamp, decision, and any comments
- **Business Rule Enforcement**: Apply business rules and policy validation before allowing approval

## Business Rules
 - **Approver Assignment**: Each submission must have exactly one assigned approver (default = employee’s line manager from the directory; overrideable by IT Administrator)
- **Decision Finality**: Once approved/rejected, the decision cannot be changed
- **Comment Requirement**: Rejections require mandatory comment explaining the reason
- **Policy Validation**: Approvals blocked if business rules or policy violations exist
- **Audit Requirements**: Complete audit trail with user attribution and timestamp

## Scenarios (BDD)
Scenario: Final approver approves submission
Given a submission awaiting approval
And exactly one approver is assigned
When the approver clicks Approve
Then the submission state becomes Final Approved
And the audit trail records the approver and timestamp
And the submission is moved to the approved queue
And stakeholders are notified of the approval

Scenario: Final approver rejects with required comment
Given a submission awaiting approval
And exactly one approver is assigned
When the approver clicks Reject and enters a comment
Then the submission state becomes Final Rejected
And the comment is stored in the audit trail
And the rejection reason is communicated to the submitter
And the submission is returned for correction

Scenario: System prevents adding additional approval steps
Given system configuration for approvals
When an admin attempts to add a second approval step
Then the system rejects the change in MVP with an explanatory message
And the current single-approver model is maintained
And guidance is provided on post-MVP multi-step capabilities

Scenario: Approval blocked due to policy violations
Given a submission has policy violations
When the approver attempts to approve
Then the approval is blocked
And specific policy violations are clearly displayed
And guidance is provided on how to resolve the issues
And the submission remains in pending status

Scenario: Approver delegation handling
Given the assigned approver is unavailable
When the delegation period expires
Then the system automatically delegates to the backup approver
And the original approver is notified of the delegation
And the audit trail records the delegation action
And the submission timeline is adjusted accordingly
