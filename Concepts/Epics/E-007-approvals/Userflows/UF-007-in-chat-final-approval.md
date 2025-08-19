# UF-007 In-Chat Final Approval

## Scope
- Epic: `E-007-approvals`
- Goal: Allow approvers to approve/reject directly in chat with auditability.
- Entry: Approver opens Chat or receives a chat notification for a pending approval.
- Exit: Item approved/rejected with audit confirmation.

## Personas & Context
- Manager (approver); Traveler can view read-only in chat.

## Flow (numbered)
1) System posts an approval card in chat (Title, amount, policy status) with Approve/Reject actions
   - System: Only visible/actionable to the assigned approver; others see read-only.
2) Approver taps Approve
   - System: Records decision; updates item to Final Approved; posts confirmation with approver, timestamp, audit link.
3) Approver taps Reject
   - System: Prompts for required comment; on submit, records Final Rejected; posts confirmation.
4) Delegation on inactivity
   - System: If no action within threshold, posts delegation notice; new approver receives card; audit updated.
5) Errors
   - System: Shows inline error with retry; prevents double-submit; idempotent on retries.

## Screens & States
- Screen: Chat Home (Approvals context)
  - Loading: Skeleton card placeholder
  - Empty: "No approvals pending"
  - Error: Decision failed; inline error; retry action
  - Validation: Reject requires comment; actions disabled during submit

## Navigation
- Chat approval card → Approval Sheet (optional) for full details

## Components & Tokens
- Components: ApprovalCard (chat), Button, CommentInput, Badge, Toast
- Tokens: E-002 tokens; clear affordances for Approve (primary) and Reject (danger)

## Accessibility & Responsiveness
- A11y: Buttons labeled; comment input aria-required; announce decision results via aria-live
- Breakpoints: Mobile-first card; desktop side panel for details

## Telemetry (optional)
- Events: chat_approval_card_shown, chat_approval_approve, chat_approval_reject, chat_approval_error, chat_delegation_triggered
