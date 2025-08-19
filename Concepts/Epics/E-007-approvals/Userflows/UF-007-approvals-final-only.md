# UF-007 Approvals (Final-Only)

> Note: The in-chat approval flow is primary for MVP. This sheet-based flow remains available as an optional detail view.

## Scope
- Epic: `E-007-approvals`
- Goal: One-tap final approvals with preview and safe delegation.
- Entry: Manager opens Approvals tab or deep link to a task.
- Exit: Task approved/rejected; delegation if inactive.

## Personas & Context
- Manager; Traveler uses Manager View toggle (read-only preview).
- Default approver is the employee’s line manager from the directory (overrideable by IT Administrator).

## Flow (numbered)
1) Manager opens Approvals tab
   - System: Shows condensed cards; newest first.
2) Manager taps a task → Approval Sheet
   - System: Shows summary, totals, policy status; Approve/Reject actions.
3) Reject path
   - Manager taps Reject; System requires comment; on submit, decision recorded with timestamp/actor.
4) Approve path
   - Manager taps Approve; System records decision; state changes to Final Approved; triggers downstream.
5) Delegation on inactivity
   - If no action for threshold (e.g., 3 days), System delegates; notifies both; audit entry.
6) Traveler preview
   - Traveler toggles Manager View; System shows read-only Approval Sheet.
7) Deep link guard
   - If active role is Traveler and user opens `/approvals/:id`, System shows 403 card with CTA "Switch to Manager"; on confirm, switches role and opens the approval.

## Screens & States
- Screen: Approvals List
  - Loading: Skeleton cards
  - Empty: "No approvals pending"
  - Error: Fetch error; Retry
- Screen: Approval Sheet
  - Loading: Inline skeleton for totals
  - Empty: n/a
  - Error: Decision failed; inline error; retry
  - Validation: Reject requires comment; buttons disabled during submit

## Navigation
- Approvals list → Approval Sheet → back maintains scroll position
- Traveler Review → Manager View toggle → back to traveler view

## Components & Tokens
- Components: ApprovalCard, ApprovalSheet, CommentInput, Button, Toast, Badge
- Tokens: E-002 tokens; clear affordances for Approve (primary) and Reject (ghost/danger)

## Accessibility & Responsiveness
- A11y: Buttons labeled; comment input with aria-required; focus returns to previous element
- Breakpoints: Mobile-first sheet; desktop side panel

## Telemetry (optional)
- Events: approvals_opened, approval_opened, approval_decision(type), approval_reject_no_comment_blocked, delegation_triggered
