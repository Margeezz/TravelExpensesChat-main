# UF-008 Policy Explain & Ready Validator

## Scope
- Epic: `E-008-policy-per-diem`
- Goal: Make policy evaluation transparent and block submissions until required fields are complete.
- Entry: User reviewing a trip or receipt detail.
- Exit: User understands policy impact; missing fields resolved; submission unblocked.

## Personas & Context
- Traveler; Manager (read-only explain); Finance (read-only).

## Flow (numbered)
1) User opens receipt in Review
   - System: Shows PolicyScore chip (e.g., 0.86) next to amount.
2) User taps PolicyScore chip
   - System: Opens explain tooltip: contributing rules with weights; links to policy.
3) User reads a violated rule (e.g., meal limit exceeded)
   - System: Provides "How to fix" hint if applicable.
4) User attempts to submit trip with missing Purpose
   - System: Ready-fields validator blocks; inline error at Purpose; Submit disabled; checklist highlights missing field.
5) User fills Purpose via quick-fix
   - System: Validator rechecks; errors clear; Submit enabled; Ready badge shown.

## Screens & States
- Screen: Receipt Detail (Policy Explain)
  - Loading: Tooltip content skeleton
  - Empty: n/a
  - Error: If loading policy fails → fallback text; link to policy docs
  - Validation: Tooltip accessible; stays within viewport
- Screen: Trip Review (Ready Validator)
  - Loading: Checklist placeholder
  - Empty: All checks passed → Ready
  - Error: Validation service error → non-blocking banner; allow manual retry
  - Validation: Block submit until all required fields present

## Navigation
- Receipt detail ↔ Review workspace
- Policy link opens policy definition (new tab or modal)

## Components & Tokens
- Components: PolicyScoreChip, Tooltip, Checklist, InlineError, SubmitBar
- Tokens: High-contrast for warn/block; spacing around tooltip; focus ring

## Accessibility & Responsiveness
- A11y: Tooltip opened via keyboard; ESC closes; aria-describedby ties chip to tooltip
- Breakpoints: Tooltip repositions on small screens; checklist stacks items

## Telemetry (optional)
- Events: policy_explain_opened, policy_rule_viewed(id), ready_validator_block(reason), ready_validator_resolved(field)
