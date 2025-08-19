# UF-011 Wireframes — Finance Dashboard & Exports

## Scope
- Epic: `E-011-settlement-reimbursement`
- Goal: Show Finance dashboard layout and export interactions.

## Desktop — Finance Dashboard (activeRole=Finance)
```
┌──────── Finance Dashboard ────────┬───────────────┐
│ [Export CSV] [Generate PDF]       │ KPIs          │
│                                    │ • Pending     │
│ Chart: Monthly Trends              │ • Total €     │
│                                    │ • SLA %       │
│ Table: Pending Payments            │               │
│  Employee   Amount   Due   Status  │               │
│  Alice      €243.20  Today  Ready  │               │
│  Bob        €118.50  Tomorrow Warn │               │
└───────────────────────────────────────────────────┘
```
- Actions top-right; table sortable; chart responsive

## Mobile — Finance Dashboard
```
┌── KPIs ──┐
│ Pending  │  [Export CSV]
│ Total €  │  [Generate PDF]
│ SLA %    │
└──────────┘
[Chart]
[Table]
```
- Actions stacked; tables become cards

## Export Progress & Result
```
┌──────── Export ────────┐
│ Generating CSV…  82%   │
│ [Cancel]                │
└─────────────────────────┘

Toast: "CSV exported"  [Download]
```
- Audit on completion with userId, activeRole, action

## 403 Card with Role-Switch CTA (deep link)
```
┌──────────────── 403: Not allowed ────────────────┐
│ You need Finance role to access the dashboard.   │
│ [Switch to Finance]   [Cancel]                   │
└──────────────────────────────────────────────────┘
```

## States
- Loading: Skeleton charts/tables
- Empty: "No pending payments"
- Error: Export failed → Retry
- Validation: Hide actions for non-Finance

## Components
- DashboardHeader, ExportButtons, KPIGroup, Chart, Table, Toast, 403Card

## Accessibility
- Buttons labeled; aria-live for download start/complete

## Telemetry
- finance_dashboard_opened, export_csv_clicked, export_pdf_clicked, export_completed, export_failed, role_switch_cta_shown, role_switch_cta_accepted
