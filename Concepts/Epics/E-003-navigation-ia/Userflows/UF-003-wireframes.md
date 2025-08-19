# UF-003 Wireframes — Navigation, Tabs, Deep Links

## Scope
- Epic: `E-003-navigation-ia`
- Goal: Show key screens/states for navigation, role switching, and deep links with Finance IA.

## Mobile — Tab Bar (default role ≠ Finance)
```
┌───────────────────────────────────────┐
│  App Bar       [Search]   [Avatar ▾] │
├───────────────────────────────────────┤
│                                       │
│            Chat Home Content          │
│                                       │
├───────────────────────────────────────┤
│ [Chat ●]   [Review]   [Approvals] [⚙] │
└───────────────────────────────────────┘
```
- Selected indicator ● on current tab (AA contrast)
- Keyboard: C focuses Chat input

## Mobile — Tab Bar (activeRole=Finance → Finance replaces Chat)
```
┌───────────────────────────────────────┐
│  App Bar       [Search]   [Avatar ▾] │
├───────────────────────────────────────┤
│                                       │
│           Finance Dashboard            │
│                                       │
├───────────────────────────────────────┤
│ [Finance ●] [Review]   [Approvals] [⚙] │
└───────────────────────────────────────┘
```
- Chat not in tab bar; still reachable via shortcut overlay

## Desktop — Left Rail
```
┌────────────────────────────────────────────────────────────┐
│ [Chat/Finance]                                             │
│ [Review]                                                   │
│ [Approvals]                                                │
│ [Settings]                                                 │
├──────────────┬─────────────────────────────────────────────┤
│  Rail        │  Content (Chat or Finance Dashboard)        │
│              │                                             │
└──────────────┴─────────────────────────────────────────────┘
```
- Rail mirrors tabs; Finance replaces Chat entry when active

## Shortcuts Overlay (desktop)
```
┌───────────────── Shortcuts ( ? ) ─────────────────┐
│ C  → Focus Chat                                   │
│ G,R → Go to Review                                │
│ G,A → Go to Approvals                             │
│ /   → Search / Command Palette                    │
└───────────────────────────────────────────────────┘
```
- When Finance is active and Chat is not in the tab bar, C still opens Chat

## 403 Card with Role-Switch CTA
```
┌──────────────── 403: Not allowed ────────────────┐
│ You need Manager role to open this approval.     │
│ [Switch to Manager]   [Cancel]                   │
└──────────────────────────────────────────────────┘
```
- Variant: "Switch to Finance" for Finance routes

## Deep Link — Entity Highlight
```
┌──── Receipt Detail ───────────────────────────────┐
│ [Back]  Receipt #123   Status: Approved          │
│ ────────────────────────────────────────────────  │
│  [Card highlighted for 2s]                        │
│  ...                                              │
└──────────────────────────────────────────────────┘
```
- Chat context chip appears when deep link re-opens via Chat

## States
- Loading: Skeleton for rails/tabs; content skeleton per screen
- Empty: Clear guidance per section (no data)
- Error: Inline error + Retry; route-not-found → fallback

## Components
- AppBar, AvatarMenu (with Role Switcher), TabBar, Rail, Toast, ShortcutOverlay, 403Card

## Accessibility
- Tabs role="tablist"; ARIA-selected on active
- Announce tab changes; focus management between rail and content

## Telemetry
- nav_app_launch, nav_tab_switch, deeplink_open, role_switch_cta_shown, role_switch_cta_accepted, shortcut_overlay_open
