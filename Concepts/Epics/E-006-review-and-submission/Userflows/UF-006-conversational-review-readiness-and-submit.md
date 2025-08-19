# UF-006 Conversational Review, Readiness & Submit (Chat)

## Scope
- Epic: `E-006-review-and-submission`
- Goal: Let users understand status, fix missing items, and submit a trip entirely within chat.
- Entry: User opens Chat and types a question (e.g., "What’s missing for the Berlin trip?") or "Submit the Berlin trip".
- Exit: Missing items resolved and trip submitted; audit link posted in chat.

## Personas & Context
- Traveler; Manager (read-only explanations via chat).

## Flow (numbered)
1) User asks "What’s missing for Trip Berlin?"
   - System: Returns a readiness checklist (destination/date/purpose/receipts) with quick-fix chips.
2) User taps "Set destination" → picks Berlin
   - System: Applies change; re-checks readiness; updates checklist.
3) User asks about totals/policy
   - System: Replies with totals and policy flags; offers "Explain" links.
4) User says "Submit trip"
   - System: Validates readiness; if missing items remain, shows blockers; else asks for confirmation.
5) User confirms "Yes"
   - System: Submits trip; posts confirmation with policy score and a link to the flow task; offers Undo window if supported.
6) Errors (validation/API)
   - System: Post inline error with reference code; provide safe retry.

## Screens & States
- Screen: Chat Home (Review context)
  - Loading: Skeleton bubbles
  - Empty: Suggest prompts for review (Readiness, Totals, Submit)
  - Error: Inline error bubble with retry
  - Validation: Confirmation required before submission

## Navigation
- Chat (Review context) → Trip Detail (optional) via "Open Trip" chip

## Components & Tokens
- Components: LLMChatBubble, Checklist, InlineActionChips, SubmitBar (inline), PolicyBadge
- Tokens: E-002 tokens; high-contrast for warn/block; 8pt spacing; Roboto

## Accessibility & Responsiveness
- A11y: aria-live for checklist updates; chips keyboard operable; confirmations focus management
- Breakpoints: Mobile bottom sheet for pickers; desktop side panel context

## Telemetry (optional)
- Events: chat_readiness_requested, chat_quickfix_applied(field), chat_submit_requested, chat_submit_confirmed, chat_submit_blocked(reason)
