# UF-012 Admin: Per‑Diems, Policy Config & Roles

## Scope
- Epic: `E-012-admin-configuration`
- Goal: Allow admins to manage per‑diems, import/export policy configs with versioning/rollback, and control roles/permissions.
- Entry: Admin opens Admin section.
- Exit: Changes saved with audit; permissions enforced.

## Personas & Context
- Admin role only.

## Flow (numbered)
1) Admin opens Admin Home
   - System: Shows tabs: Per‑Diems, Policy, Roles.
2) Per‑Diems tab
   - Admin edits a rate row effective 2025‑10‑01; System validates fields; on save, new version stored with audit; success toast.
3) Policy tab
   - Admin clicks Import; selects policy.json; System validates coverage/conflicts; on success creates new version with rollback option; shows diff summary.
4) Roles tab
   - Admin assigns "Finance" role to user X; System updates permissions; logs audit event; restricted pages reflect new access.

## Screens & States
- Screen: Admin – Per‑Diems
  - Loading: Table skeleton
  - Empty: No rows → CTA to add first rate
  - Error: Save/validate error with details; no partial commits
  - Validation: Effective‑dated constraints; required columns
- Screen: Admin – Policy Config
  - Loading: Version list
  - Empty: No versions yet
  - Error: Import failed → show errors; allow download of error report
  - Validation: Block apply if conflicts; enable rollback
- Screen: Admin – Roles
  - Loading: Users/roles list
  - Empty: No assignments
  - Error: Update failed → retry
  - Validation: Enforce permission checks across app

## Navigation
- Admin → Per‑Diems / Policy / Roles tabs
- Version history detail → rollback confirmation dialog

## Components & Tokens
- Components: Tabs, Table, Dialog, Upload, DiffViewer, RoleSelector, Toast
- Tokens: E-002 tokens; semantic colors for add/change/remove; clear focus rings

## Accessibility & Responsiveness
- A11y: Tables with headers and summaries; dialogs labeled; keyboard navigation across cells
- Breakpoints: Tables collapse columns; actions move into kebab menus on small screens

## Telemetry (optional)
- Events: admin_perdiem_save, policy_import_start/success/fail, policy_rollback, role_update_success/fail
