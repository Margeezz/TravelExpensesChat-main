# UF-006 Review, Fix & Submit

## Scope
- Epic: `E-006-review-and-submission`
- Goal: Make a trip Ready and submit with clarity on per‑diems and FX.
- Entry: User opens Review section or deep link to a trip.
- Exit: Trip submitted (or Ready with issues resolved).

## Personas & Context
- Traveler; Manager preview via toggle (read-only).

## Flow (numbered)
1) Trip list shows status and missing items
   - System: Each trip shows indicators (e.g., Missing purpose, receipts).
2) User opens Trip A → Review workspace
   - System: Shows per-day timeline, receipts list (with Move actions on cards), per‑diem panel, and Mileage card.
3) Cross‑trip move
   - User uses Move on a receipt card or menu; System recomputes totals/per‑diems; audit logs move; Undo 10 minutes.
4) Meal reductions
   - User toggles lunch provided; System recalculates per‑diem; adds audit note.
5) Mileage entry
   - User adds 42 km; System auto‑applies per‑km rate by date/country; shows computed amount with rate label.
6) Travel times editor
   - User adjusts end time; System validates overlaps/gaps; recomputes if needed.
7) Reimbursement summary
   - System displays totals with ECB FX rate/date per receipt and in summary.
8) Readiness checklist
   - User fixes missing destination via quick‑fix; Ready badge turns green when all complete.
9) Submit
   - User clicks Submit; System blocks if not Ready; else submits and shows confirmation.

## Screens & States
- Screen: Review – Trip List
  - Loading: Skeleton list
  - Empty: "No trips yet"
  - Error: Fetch error + Retry
- Screen: Review – Trip Detail
  - Loading: Panels lazy-load; skeletons under 100 ms
  - Empty: Per‑receipt or per‑day panels can show empty state hints
  - Error: Inline errors with reference codes; safe retry per action
  - Validation: Prevent move if submission locked

## Navigation
- Trip list → Trip detail → Receipt detail (optional)
- Manager View toggle → read-only preview of approval sheet

## Components & Tokens
- Components: Checklist, Timeline, ReceiptList, PerDiemPanel, MileageCard, SummaryFX, Toggle, TimeEditor, SubmitBar
- Tokens: E-002 tokens; consistent spacing/typography; status colors

## Accessibility & Responsiveness
- A11y: Announce recalculations; focus management after quick-fix; tables have headers; keyboard operable controls
- Breakpoints: Mobile-first stacked panels; desktop split view

## Telemetry (optional)
- Events: review_cross_trip_move, per_diem_toggle(meal), travel_time_changed, fx_rate_viewed, readiness_complete, submit_clicked, submit_blocked(reason)
