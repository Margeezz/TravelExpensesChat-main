# R-002 Approval Sheet (Approve/Reject + Comment)

## Why
Enable decisive approvals with clear context while keeping the UI simple.

## Behavior
- Primary action: Approve (optional note field)
- Secondary action: Reject (required comment textarea)
- Tertiary actions: Delegate, Remind me later, Open in Chat, Download PDF summary
- Decision gating: Allow Approve when warnings (yellow) exist → require confirm; Block Approve when blockers (red) exist
- Idempotency: Multiple attempts resolve to a single decision; subsequent attempts show "Already decided"
- Receipts preview: lightweight modal from the list; close returns to sheet
- Activity & comments: show decision history and inline comments; reject comment required; approve note optional
- Audit: record approver, timestamp, decision, note/comment, and submission hash

## Scenarios (BDD)
Scenario: Reject requires comment
Given a manager opens an approval task
When they click Reject
Then they must enter a comment to proceed

Scenario: Approve with warnings requires confirm
Given a task with policy warnings but no blockers
When the manager clicks Approve
Then a confirmation is required before applying the decision

Scenario: Approve blocked on blockers
Given a task with policy blockers
When the manager clicks Approve
Then the action is blocked and the blockers are highlighted

Scenario: Idempotent decision
Given an approval was already decided
When another decision is attempted
Then the system shows "Already decided" and no new audit entry is created

## Accessibility & Performance
- Keyboard operable actions; labels on fields; announce decision results via aria-live
- Initial load uses skeletons; receipt previews lazy-load

## Telemetry (optional)
- Events: approval_opened, approve_clicked, reject_clicked, reject_comment_added, decision_confirmed, decision_blocked, decision_conflict, open_in_chat_clicked, pdf_download_clicked

## Access Control
- Only users with Manager role and who are the assigned approver can act on the approval sheet; others see read-only.

## Scenarios (BDD) — access
Scenario: Non-manager cannot approve
Given a signed-in user without the Manager role
When they open an approval sheet via deep link
Then actions Approve/Reject are not shown
And a message indicates insufficient permissions
