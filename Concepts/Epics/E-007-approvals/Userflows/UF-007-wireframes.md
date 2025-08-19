# UF-007 Wireframes — Approvals (Final-Only + In-Chat)

## Scope
- Epic: `E-007-approvals`
- Goal: Show Approvals list, Approval Sheet, and in-chat approval card.

## Mobile — Approvals List
```
┌────────────── Approvals (Manager) ───────────────┐
│ [Card] Trip Milan — €243.20  [Warnings •]        │
│        Alice • Due: Today                        │
│ [Card] Trip Berlin — €118.50                     │
│        Bob • Due: Tomorrow                       │
└──────────────────────────────────────────────────┘
```
- Cards show submitter, amount, due, policy status
- Traveler sees read-only preview via Manager View toggle

## Mobile — Approval Sheet
```
┌────────────── Approval ─────────────┐
│ Totals    Policy Status (warnings)  │
│ Receipts (preview)                  │
│ Comments & Activity                 │
│                                      │
│ [Reject (requires comment)] [Approve]│
└──────────────────────────────────────┘
```
- Reject opens comment modal; Approve confirms if warnings
- Accessibility: buttons labeled; aria-required on comment

## Desktop — Approval Sheet (Side Panel)
```
┌───────── List ───────┬──────────── Details ───────────┐
│ Card list            │ Header: submitter/amount       │
│ …                    │ Tabs: Summary • Receipts • Log │
│                      │ Footer: Reject • Approve       │
└──────────────────────┴────────────────────────────────┘
```
- Back preserves scroll position

## In-Chat Approval Card (for assigned approver)
```
┌──────────────── Approval ─────────────────┐
│ Milan €243.20 — Warnings: 1             │
│ [Reject]   [Approve]                     │
│ "Reject requires comment"                │
└───────────────────────────────────────────┘
```
- Others see read-only; actions hidden

## Guards & Defaults
- Default approver = employee’s line manager (overrideable by IT Administrator)
- Deep link guard: 403 with "Switch to Manager" CTA when needed

## States
- Loading: Skeleton cards; inline skeleton in sheet
- Empty: "No approvals pending"
- Error: Decision failed → inline error + Retry

## Components
- ApprovalCard (list & chat), ApprovalSheet, CommentModal, Toast, Badge

## Accessibility
- Focus returns to previous element after decision; aria-live announces results

## Telemetry
- approvals_opened, approval_opened, approval_decision(type), approval_reject_no_comment_blocked, delegation_triggered
