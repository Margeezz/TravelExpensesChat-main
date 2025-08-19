# User Inputs — Consolidated (2025-08-08)

This file consolidates all user inputs from 2025-08-08 without loss of information. Original sources are preserved below in chronological order.

---

## Source: 2025-08-08_1012-user-input.md

# User Input – Decisions (2025-08-08 10:12)

Context: Post-capture desktop workflow needs and manager review UX.

Decisions
- Receipt Inbox with drag-and-drop: YES. Provide an inbox of unassigned receipts; drag onto trips/days; support batch select; show confidence and duplicate flags.
- Cross-trip receipt move: YES. Allow moving receipts between trips; totals/per-diems recompute; keep audit trail.
- Manager view toggle: YES. Add “Switch to manager view” for travelers to preview; managers get a condensed approval sheet with Approve/Reject (+ comment on reject), delegation, and accessibility.
- Baseline visibility (Plan vs Actual): HIDE for MVP. Focus on actuals (receipts + per-diems); add baseline later.

Implications
- Review workspace shows: trip list with status and missing-items; per-day travel times; country detection; per-diem breakdown with meal reductions; reimbursement summary.
- Add three requirements under Review & Submission and Approvals areas accordingly.

Next
- Hand to Paulina to update the requirements and (optionally) regenerate the breakdown.

---

## Source: 2025-08-08_1022-user-input.md

# User Input – Clarification Answers (2025-08-08 10:22)

Decisions
- Multi-currency FX source: Use ECB (EZB) daily rates at the receipt transaction date.
- Meal reductions: Use policy defaults; meal toggles per day (breakfast/lunch/dinner).
- Duplicates handling: Provide a Duplicates section in the Receipt Inbox requiring confirmation before assignment.

Implications
- Reimbursement summary uses ECB by default and displays FX rate/date.
- Receipt inbox includes a dedicated Duplicates section with confirm/dismiss flow.

Next
- Requirements updated accordingly; ready for export.

---

## Source: 2025-08-08_1525-user-input.md

# 2025-08-08 15:25

- Decision: Adopt Mobile‑First responsive web app with brand colors (white/orange/blue) and create a dedicated Mobile & Design System track.
- Notes: Keep consistency with existing product; define tokens, responsive layout, a11y, performance, push, capture, i18n, security, error states, animations.
- Next: Generate consolidated export and run review.

---

## Source: 2025-08-08_1542-user-input.md

# 2025-08-08 15:42

Decision snapshot (Stefan → for Paulina later)

- Product form: Responsive Web‑App, no PWA, no Offline.
- Dark‑Mode: yes.
- Browsers: Edge/Chrome/Firefox primary; Safari nice‑to‑have.
- Scope commitment: implement Top‑Priorität + Wichtig (aus Stefan‑Liste) end‑to‑end.
  - Top‑Priorität: Design‑System & Tokens, Komponentenbibliothek, A11y AA, Performance‑Budgets, Responsive‑Regeln, Capture‑UX (ohne Offline), Fehler/Leere/Loading, Sicherheit/Session.
  - Wichtig: UX‑Telemetry (RUM), HEIC‑Kompatibilität, i18n DE/EN, IA & Gesten/Shortcuts, Dedupe beim Capture, Einstellungen, Browser‑Matrix & Fallbacks.

Implications on existing requirements

- Remove/soften offline mentions in capture/review (no queuing, no background sync).
- Keep notifications via In‑App/Email (no Web‑Push).
- Add a Design‑System/Responsive set of requirements (IDs to be defined by Paulina).

User‑flow gaps to define (priority ★ to ★★★★★)

- ★★★★★ Navigation IA (tabs/left‑rail) & deep links
  - Mobile tabs: Capture, Travels, Review, Approvals, Settings. Desktop: left‑rail.
  - Stable deep links: trip, receipt, approval task.
- ★★★★★ Capture flow specifics
  - File‑picker with camera hint, multi‑upload, client compression (200–400 KB), auto‑rotate/de‑skew, progress + cancel.
  - Duplicate check at capture (Assign anyway / Merge / View match).
- ★★★★★ Error & retry model
  - Per‑message/file status, actionable errors with reference codes, safe re‑submit. No offline queues.
- ★★★★ First‑time experience & onboarding
  - SSO sign‑in, permission prompts (camera/files) with rationale, empty‑state coach‑marks.
- ★★★★ Trip readiness surfacing
  - Inline checklist in chat/review; quick‑fix actions for missing destination/dates/purpose.
- ★★★★ Performance UX details
  - Skeletons <100 ms, list virtualization, image thumbnail sizes, CDN/cache headers.
- ★★★ HEIC handling strategy
  - Client convert (where supported) or server fallback; consistent quality.
- ★★★ Settings
  - Language (DE/EN), Theme (Light/Dark), Email prefs.
- ★★★ Support & feedback
  - In‑app feedback with screenshot/redaction; link to audit/log IDs.
- ★★★ Privacy & consent
  - Brief notices for data usage; link to policy; minimal client storage; session lock after inactivity.

Next (proposal)

- Paulina: update/remove offline mentions, add the above requirement stubs with acceptance criteria.
- ReviewTeam: check A11y/Perf budgets and IA for completeness.

---

## Source: 2025-08-08_1616-user-input.md

# Input — Option 1 Gap Analysis & Product Sharpening (Mid‑Market T&E)

Author: Stefan (Product)
Date: 2025-08-08 16:16

## Context
- Selected Option 1 from Marktsepp: TravelPerk (travel) + Rydoo or Expensify (expenses) + Spendesk (cards/spend).
- Goal: Map against current requirements and identify gaps; derive product learnings and sharpening moves.

## Coverage vs Gaps (high level)
- Covered (by vendors, to integrate):
  - Travel inventory, flexible changes, CO₂ visibility (TravelPerk), approvals (basic), duty-of-care.
  - Mobile OCR and automated expense extraction (Rydoo/Expensify), mileage, per‑diems (baseline), policy rules, accounting integrations.
  - Cards/reimbursements/budgets and spend control (Spendesk).
- Gaps (need our product to own):
  - Chat-first capture, background aggregation, clarification chat, streaming OCR status, confidence + raw text, p95 ≤ 2.0 s.
  - Review UI: cross‑trip receipt reassignment, travel times editor, country/day per‑diem breakdown with overrides & audit, reimbursement summary with ECB FX labels.
  - Policy AI: PolicyScore I/O, explainable tooltips, dynamic per‑diems with proration & meal reductions, CO₂ cost trade‑offs, adaptive exceptions, config import/export, versioning/rollback, Ready‑fields policy.
  - Flow engine: BPMN orchestration across vendor webhooks with idempotency, event transitions, logging, health/metrics.
  - Approvals: Final‑only approval model, delegation on inactivity, comment‑on‑reject, decision audit, manager “switch to view”. Align/disable vendor approvals.
  - Settlement: PDF summary, FiBu posting (DATEV/SAP), SEPA payroll/reimbursement, archive & audit export logs, reconciliation.
  - Admin: Per‑diem management UI (versioned/effective‑dated), Ready‑fields editor, policy config UI, roles/permissions, monitoring dashboard.
  - Mobile: Performance budgets, capture via OS share/compression, a11y/i18n/security.

## Integration Risks & Decisions Needed
- System of record: Who owns per‑diems/policy and reimbursements? (us vs vendor)
- Approvals: Turn off vendor approvals or mirror into our flow engine.
- OCR: Use vendor OCR or our pipeline? Our specs require confidence/raw text + chat streaming.
- CO₂ scope: Travel (TravelPerk) vs expenses/per‑diems in our product; unify presentation.

## Product Sharpening (proposed)
1) Own the “capture→Ready” edge
   - Keep Chat-first capture and Review UI intact; add a Vendor Ingest Adapter spec (webhooks + polling) and a Confidence Schema.
2) Own policy/ratings with explainability
   - Implement PolicyScore + explain tooltips; versioned EU per‑diem engine; Ready‑fields validator; import/export.
3) Orchestrate cross‑systems
   - BPMN layer with idempotent webhook handling; mapping tables for vendor event types → our states.
4) Clear SoR boundaries
   - Per‑diems/policy/approvals/settlement in our system; travel inventory and card issuance in vendors.

## Options
- A) Hybrid (Recommended): Our UI/engine + vendor travel/cards + optional vendor OCR fallback.
- B) Vendor‑first: Leverage vendor UIs; minimal wrapper for gaps (risks: UX/control fragmentation).
- C) Build‑first: Full in‑house stack; highest control, longest time‑to‑market.

## Next Steps
Decision: Option A (Hybrid) — ACCEPTED.

Operating defaults (set):
- System of Record: per‑diems, policy, approvals, settlement = OUR SYSTEM.
- OCR: OUR OCR primary; vendor OCR as fallback only.
- Approvals Routing: vendor approvals DISABLED; route via the flow engine.

Immediate actions:
- Draft “Vendor Integration Layer” requirements (events, idempotency, mapping, retries).
- Spike: TravelPerk webhooks + Rydoo/Expensify API to confirm confidence fields/latency and event coverage.
- Update Policy AI with CO₂ trade‑off UI pattern and per‑receipt CO₂ scope.
