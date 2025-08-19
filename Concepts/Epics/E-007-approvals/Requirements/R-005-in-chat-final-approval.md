# R-005 In-Chat Final Approval

## Why
Speed up approvals by letting approvers act directly in chat while preserving auditability.

## Behavior
- Approvers receive approval cards/messages in chat with Approve/Reject actions and required comment on reject.
- Role/permission checks ensure only the assigned approver sees actions.
- Decision updates the item state immediately and posts a confirmation with audit details.
- Optional: "Why over limit?" explanation link shows LLM rationale using policy context.

## Scenarios (BDD)
Scenario: Approve in chat
Given an approval awaiting the final approver
When the approver clicks Approve in chat
Then the item state changes to Final Approved
And the audit trail records the approver, timestamp, and decision

Scenario: Reject in chat with note
Given an approval awaiting the final approver
When the approver clicks Reject and enters a note
Then the item state changes to Final Rejected
And the note is recorded in the audit trail
