# UF-001 Auth, Session & Consent

## Scope
- Epic: `E-001-foundation`
- Goal: Secure, low-friction sign-in with robust session handling and clear consent.
- Entry: Unauthenticated user visits any guarded route.
- Exit: User is signed in with an active session; permissions granted or declined with rationale captured.

## Personas & Context
- Traveler/Manager/Finance: Enterprise SSO, on mobile-first web.

## Flow (numbered)
1) User opens `/review` (guarded)
   - System: Redirects to `/signin` with returnUrl=/review.
2) User taps "Sign in with SSO"
   - System: Redirects to IdP; shows loading state; returns with token.
3) System establishes session
   - System: Stores session; navigates to returnUrl; renders skeleton <100 ms.
3a) Default landing (no returnUrl)
   - System: Navigates to Chat Home (default) and restores last-used view if present.
4) First camera/files access (e.g., Capture)
   - System: Shows concise rationale; asks permission (Allow/Deny).
5) Inactivity threshold reached (15 min)
   - System: Locks session; shows unlock screen; preserves unsaved UI state.
6) User unlocks (tap "Unlock" → re-auth)
   - System: Silent re-auth if possible; else IdP; returns to last route or Chat Home.
7) User signs out
   - System: Clears session; returns to `/signin`.

## Screens & States
- Screen: Sign In
  - Loading: Spinner during IdP redirect/return
  - Empty: SSO button and info
  - Error: Auth error with reference code; Retry
  - Validation: Block multiple rapid taps; disable when loading
- Screen: Consent Prompt (Camera/Files)
  - Loading: none
  - Empty: Rationale text + Allow/Deny
  - Error: If denied, show how to enable later in Settings
  - Validation: Remember decision; non-blocking for other areas
- Screen: Session Lock
  - Loading: none
  - Empty: "Session locked" with Unlock button
  - Error: Re-auth failed → back to Sign In
  - Validation: Return to last route on success

## Navigation
- Guarded route → Sign In (unauthenticated)
- Sign In success → returnUrl or Chat Home (default)
- Any screen → Session Lock (timeout)
- Lock → Last route (successful unlock) or Chat Home

## Components & Tokens
- Components: Button, Input, Alert/Toast, Modal, Skeleton
- Tokens: E-002 design tokens (brand blue/orange, spacing 8 pt, focus ring)

## Accessibility & Responsiveness
- A11y: Labels on inputs/buttons; focus trapped in modal; clear error semantics; keyboard navigable
- Breakpoints: Mobile-first; safe-area aware; Sign In layout centers on small screens; lock screen button large touch target

## Telemetry (optional)
- Events: auth_signin_start/success/fail, session_lock, session_unlock, permission_prompt_shown/granted/denied
