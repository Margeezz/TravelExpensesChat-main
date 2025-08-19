# UF-005 Receipt Inbox Triage

## Scope
- Epic: `E-005-receipt-inbox`
- Goal: Quickly assign receipts to trips/days with clarity on confidence and duplicates.
- Entry: User opens Inbox; alternatively arrives from Chat via "View in Inbox" on a duplicate prompt.
- Exit: Receipts assigned or reviewed (duplicates confirmed/dismissed).

## Personas & Context
- Traveler/Reviewer on desktop and mobile.

## Flow (numbered)
1) Inbox loads
   - System: Shows cards with thumbnail, amount, date, confidence badge.
2) User drags a receipt onto Trip A / Day 1
   - System: Highlights drop zone; on drop → assigns; shows success toast; Inbox count decrements.
3) User selects 3 receipts (batch)
   - System: Batch bar appears; user chooses Assign → Trip B / Day 2; all move; undo option (10 s).
4) Receipt appears in Duplicates section
   - System: Shows Duplicates tab; user opens; reviews pair; taps Dismiss false positive. From Chat, simple duplicates can be resolved inline without opening Inbox.
5) Low confidence receipt
   - System: Tooltip reveals raw text and per-field confidence.

## Screens & States
- Screen: Inbox
  - Loading: Skeleton grid/list
  - Empty: "No receipts in Inbox" with hint how to add
  - Error: Fetch error with Retry
  - Validation: Drag targets constrained to valid trips/days; undo within 10 s
- Screen: Duplicates
  - Loading: Pair previews
  - Empty: "No suspected duplicates"
  - Error: If confirm/dismiss fails → inline error; retry

## Navigation
- Inbox ↔ Duplicates section
- Receipt card → opens receipt detail (optional); back returns to context

## Components & Tokens
- Components: ReceiptCard, Badge (confidence/duplicate), DragTargets, Checkbox, BatchBar, Toast
- Tokens: State colors; spacing grid; typography per E-002

## Accessibility & Responsiveness
- A11y: Keyboard drag alternatives (assign via menu); ARIA drop targets; tooltips accessible
- Breakpoints: Grid → list; ensure tap targets ≥ 44 px

## Telemetry (optional)
- Events: inbox_assign_drag, inbox_batch_assign(count), duplicate_confirmed, duplicate_dismissed, confidence_tooltip_opened
