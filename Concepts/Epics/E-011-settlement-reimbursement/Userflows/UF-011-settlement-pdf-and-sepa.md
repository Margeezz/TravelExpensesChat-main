# UF-011 Settlement: PDF Summary and SEPA Export

## Scope
- Epic: `E-011-settlement-reimbursement`
- Goal: Allow Finance to generate PDF payment summaries and SEPA exports.
- Entry: Finance opens the Finance dashboard or follows a deep link.
- Exit: PDF/SEPA file generated and downloaded; audit entry recorded.

## Personas & Context
- Finance role only. Access controlled by RBAC.

## Flow (numbered)
1) Finance opens Finance dashboard (top-level tab when `activeRole=Finance`; otherwise via Settings → Finance)
   - System: Shows payment overview with export actions.
2) Finance selects "Export CSV (bank)" or "Generate PDF summary"
   - System: Generates the selected file; shows progress; downloads on completion.
3) Deep link guard
   - If active role is not Finance and user opens `/finance/dashboard`, System shows 403 card with CTA "Switch to Finance"; on confirm, switches role and opens dashboard.
4) Audit
   - System records audit with userId, `activeRole`, action, entityId, timestamp.

## Screens & States
- Screen: Finance Dashboard
  - Loading: Skeleton charts and tables
  - Empty: "No pending payments"
  - Error: Export failed; Retry
  - Validation: Permission check; hide actions for non-Finance

## Navigation
- Finance dashboard → Export history → back preserves filters

## Components & Tokens
- Components: DashboardHeader, ExportButtons, Table, Chart, Toast
- Tokens: E-002 tokens; clear affordances for export actions

## Accessibility & Responsiveness
- A11y: Buttons labeled; announce download start/complete via aria-live
- Breakpoints: Desktop-first dashboard; mobile tables stack; charts responsive

## Telemetry (optional)
- Events: finance_dashboard_opened, export_csv_clicked, export_pdf_clicked, export_completed, export_failed, role_switch_cta_shown, role_switch_cta_accepted
