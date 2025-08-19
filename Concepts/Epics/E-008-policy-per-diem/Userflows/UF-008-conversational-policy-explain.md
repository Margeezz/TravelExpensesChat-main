# UF-008 Conversational Policy Explain & Quick-Fix (Chat)

## Scope
- Epic: `E-008-policy-per-diem`
- Goal: Let users ask "Why over limit?" and apply guided fixes directly in chat.
- Entry: User is in Chat and asks about a policy issue (e.g., "Why is this hotel over limit?"), or taps an Explain link.
- Exit: User understands the policy outcome; optional fix applied; policy score recalculated.

## Personas & Context
- Traveler (asks/explains/fixes); Manager (reads explanations); Finance (reads, may enforce).

## Flow (numbered)
1) Trigger: User asks "Why over limit?" in chat (receipt or trip context)
   - System: Detects context (receipt/trip); fetches policy evaluation; posts an explanation message.
2) Explanation message
   - System: Lists contributing rules with weights and outcomes (e.g., Max hotel €/night = 120; observed = 135; delta = +15).
   - System: Provides Quick-Fix chips if actionable (e.g., "Mark breakfast provided", "Change category", "Request exception").
3) User selects a Quick-Fix (e.g., Mark breakfast provided)
   - System: Applies change; recalculates per‑diem/policy score; posts updated score and effect summary; offers Undo.
4) Exception path
   - User taps "Request exception"
   - System: Asks for short justification; creates exception request; links to approval task; posts confirmation.
5) No-action path
   - User acknowledges explanation without changes; message remains in the thread for audit context.
6) Errors
   - System: Posts inline error with reference code; allows retry; no partial updates without confirmation.

## Screens & States
- Screen: Chat Home (Policy context)
  - Loading: Skeleton bubble for explanation while fetching
  - Empty: Suggest prompt: "Why over limit?", "Explain per‑diem for Day 2"
  - Error: Inline error bubble with retry
  - Validation: Confirmation for exception requests; Undo for applied quick fixes
- Screen: Policy Explain Panel (optional)
  - Loading: Rules list skeleton
  - Empty: n/a
  - Error: Fallback to a compact summary if details fail

## Navigation
- Chat → Policy Explain Panel (optional) → back returns to chat position
- Chat → Trip/Receipt detail via "Open" chip when deeper context needed

## Components & Tokens
- Components: LLMChatBubble, PolicyScoreChip, Tooltip/Panel, QuickFixChips, Button
- Tokens: E-002 tokens; warn/block semantic colors; focus ring

## Accessibility & Responsiveness
- A11y: Explanation content structured with headings/lists; quick-fix chips are buttons with labels; aria-live on score updates
- Breakpoints: Panel becomes bottom sheet on mobile; side panel on desktop

## Telemetry (optional)
- Events: chat_policy_explain_requested, chat_policy_quickfix_applied(type), chat_exception_requested, chat_policy_explain_error
