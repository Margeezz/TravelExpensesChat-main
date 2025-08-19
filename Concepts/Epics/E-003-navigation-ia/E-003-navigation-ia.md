# E-003 Navigation & Deep Links

## Intent
Define IA, navigation, and deep links for mobile and desktop to enable fast task switching.

## In-Scope
- Mobile tabs: Chat, Review, Approvals, Settings; Finance appears as a top-level tab when activeRole=Finance (replaces Chat)
- Desktop left‑rail with equivalent sections
- Global Role Switcher to change active role; tabs update immediately
- Stable deep links to trip, receipt, approval task with role-switch CTA when needed
- Default home: Chat (remember last-used view) except when activeRole=Finance, then Finance dashboard is default

## Out-of-Scope (optional)
- Navigation animations beyond basics

## Requirements
- See structure and naming in `Workflow/Conventions.md`.
- Reference list (optional):
- R-001 Mobile Tabs & Desktop Rail
- R-002 Stable Deep Links
- R-003 Gestures & Shortcuts
- R-004 Chat as Primary Entry (Default Home)
- R-005 Global Role Switcher
