# Epic Breakdown (MVP)

- E-001 Foundation/Core — App shell, auth/session, RBAC & active role audit, routing, error model, privacy/consent, performance budgets, telemetry, browser support. Chat privacy/PII redaction and in-thread error/retry.
- E-002 Design System & Components — Tokens, components, responsive rules, accessibility AA.
- E-003 Navigation & Deep Links — Mobile tabs, desktop left‑rail, role-based tab visibility, Finance as a top‑level tab when activeRole=Finance (replaces Chat), global Role Switcher, stable deep links with role‑switch CTA, Chat as primary entry except when Finance role is active (remember last view).
- E-004 Capture UX — Conversational capture & commands via chat (attach files, streaming OCR, duplicate checks, assign/merge/dismiss), file pick/upload, compression, de‑skew, progress/cancel.
- E-005 Receipt Inbox — Inbox of unassigned receipts, drag‑and‑drop assignment, batch select, confidence/duplicate flags, Duplicates section.
- E-006 Review & Submission — Trip list with readiness and quick‑fix chips, Chat Q&A, cross‑trip move, travel times editor, per‑diem breakdown with meal reductions, mileage (per‑km) with policy rates, reimbursement summary with ECB FX label.
- E-007 Approvals — Final‑only approvals; default approver is the employee’s line manager from the directory; in‑chat approve/reject with note; manager view toggle, approval sheet, delegation.
- E-008 Policy & Per‑Diems — Versioned EU per‑diem engine, PolicyScore with explain tooltips, Ready‑fields validator.
- E-009 Vendor Integration Layer — Hybrid integration with TravelPerk (travel), Rydoo (expenses), Spendesk (cards). Webhooks/polling ingest, confidence schema, OCR fallback. Vendor approvals DISABLED.
- E-010 Flow Orchestration — BPMN, idempotency/retries, vendor event mapping, Intent→BPMN mapping with audit links to chat threads.
- E-011 Settlement & Reimbursement — CSV export for payment proposals, PDF payment summary, Finance role dashboard with statistics. NO payment processing (manual execution).
- E-012 Admin & Configuration — Per‑diem mgmt UI (versioned), policy config UI (import/export), roles/permissions (IT Administrator, Finance Administrator), approvals SLA setting (business days), guided setup wizard.
- E-013 Measurement & Telemetry — RUM and metrics (post-MVP).

**Roles & IA Updates**
- **Finance Role**: Dashboard for payment overview, statistics, CSV export, PDF summaries
- **Admin Personas**: IT Administrator and Finance Administrator only (Department Manager removed)

Out‑of‑Scope (MVP):
- Offline/PWA, background sync/queues
- Baseline Plan vs Actual (hidden)
- Payment processing (manual execution by finance team)
- Complex BPMN features (lightweight step runner only)
