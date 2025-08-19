# UF-003 Navigation: Tabs, Gestures & Deep Links

## Scope
- Epic: `E-003-navigation-ia`
- Goal: Let users switch areas fast on mobile; open deep links reliably.
- Entry: App launch or following a deep link.
- Exit: Target section visible; correct entity focused.

## Personas & Context
- All roles; mobile-first with gestures; desktop left-rail parity.

## Flow (numbered)
1) App launch → default view
   - System: If `activeRole=Finance`, open Finance dashboard; else open Chat by default. If a last-used view exists, restore it.
2) User presses global Chat key (e.g., C) or taps Chat icon
   - System: Brings Chat to foreground from any section; preserves context. If Finance is active and Chat is not in the tab bar, Chat opens via shortcut overlay.
3) User swipes left
   - System: Switches to "Review"; announces change for SR.
4) User taps "Review" tab
   - System: Navigates to Review list; persists last view per user.
5) Email arrives with receipt link `/receipts/123`
   - User taps deep link
   - System: Auth guard; if signed in → opens receipt detail; highlights card; Chat shows a context chip when invoked.
6) Deep link to approval `/approvals/456` while active role is Traveler
   - System: Shows 403 card with CTA "Switch to Manager"; on confirm, switches role and opens the approval.
7) Deep link to finance `/finance/dashboard` while active role is Traveler
   - System: Shows 403 card with CTA "Switch to Finance"; on confirm, switches role and opens Finance dashboard.

## Screens & States
- Screen: App Shell + Tabs/Rail + Chat entry
  - Loading: Top-level skeleton for initial route
  - Empty: N/A
  - Error: Route-not-found → fallback route
  - Validation: Safe-area tabs; min hit targets 44 px
- Screen: Shortcuts Overlay (desktop)
  - Loading: none
  - Empty: List of shortcuts
  - Error: none

## Navigation
- Sections: Chat (primary; replaced by Finance when `activeRole=Finance`) ↔ Review ↔ Approvals ↔ Settings
- Deep links: `/trips/:id`, `/receipts/:id`, `/approvals/:id`, `/finance/dashboard`, `/chat?trip=:id`
- Back gesture respected on mobile; keyboard shortcuts on desktop

## Components & Tokens
- Components: TabBar, Rail (desktop), Toast, ShortcutOverlay, ChatEntry
- Tokens: Spacing for safe areas; contrast AA for selected tab

## Accessibility & Responsiveness
- A11y: Tabs are role="tablist"; ARIA-selected on current; announce tab changes; Chat entry reachable via keyboard and SR labeled
- Breakpoints: TabBar on mobile; left-rail on ≥ lg; maintain focus order

## Telemetry (optional)
- Events: nav_app_launch, nav_chat_open, nav_tab_switch, deeplink_open, role_switch_cta_shown, role_switch_cta_accepted, shortcut_overlay_open
