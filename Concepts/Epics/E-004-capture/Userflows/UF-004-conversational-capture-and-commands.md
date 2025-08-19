# UF-004 Conversational Capture & Commands (Chat)

## Scope
- Epic: `E-004-capture`
- Goal: Let users upload, classify, and manage receipts fully within chat, using natural-language commands.
- Entry: App opens to Chat (default home) or user navigates to Chat; user attaches a file or types a command.
- Exit: Receipt assigned/edited/merged with confirmation, or command executed (e.g., create trip, submit trip) with audit link.

## Personas & Context
- Traveler: mobile-first, uploads photos/PDFs; wants quick assignment and minimal typing.
- Approver: receives approval cards in chat; can approve/reject with note.
- Finance: monitors errors/duplicates; may resolve via chat actions.

## Flow (numbered)
1) User attaches a receipt (image/PDF) or types a command (e.g., "Create a trip to Berlin next Monday").
2) System posts a message bubble with file thumbnail and status: Uploading → OCR → Classified.
3) System extracts vendor/date/amount/currency/category; proposes assignment (trip/day) and shows confidence.
4) If potential duplicate(s) found, system shows inline choices: Assign, Merge, Dismiss; "View match" opens details.
5) User selects an option or adjusts via quick chips (Change Trip, Change Day, Change Category) or types a correction.
6) System confirms action with a summary (receipt → trip/day/category), posts an Undo for 10 minutes, and logs audit link.
7) For commands:
   - Create Trip: system asks minimal clarifications (destination/dates/purpose) if missing, creates trip, returns chip to "Open Trip".
   - Move Receipt: disambiguates target/receipt if needed, summarizes and asks to Confirm; upon Yes, applies and confirms.
   - Add Note: attaches note to the trip/receipt context with attribution.
   - Submit Trip: validates readiness; if missing items, posts checklist with quick-fix actions; upon fix, confirms submission.
8) Errors (upload fail/OCR fail/API fail): show inline error with retry; provide compression hint for large files. No offline queues.
9) Accessibility: keyboard shortcuts for attach (Ctrl/Cmd+U), quick actions reachable via Tab; screen-reader labels on actions.

## Screens & States
- Screen: Chat Home
  - Loading: skeleton bubbles for recent messages.
  - Empty: prompt suggestions ("Attach a receipt", "Create a trip", "What’s missing for Berlin trip?").
  - Error: inline error bubble with retry and reference code.
  - Validation: disambiguation prompts for ambiguous commands; confirmation required for destructive changes.
- Screen: Receipt Match Details (modal/panel)
  - Loading: skeleton list of matches.
  - Empty: no matches → suggest Assign to a new trip.
  - Error: show fetch error with retry.
  - Validation: single-select required before proceeding.

## Navigation
- From: Chat Home (Attach) → To: Chat Home (Processing → Result)
- From: Chat Home (View match) → To: Receipt Match Details (if user wants to inspect duplicates)
- From: Chat Home (Open Trip) → To: Trip Details

## Components & Tokens
- Components: LLMChatBubble, ReceiptCard (processing/ready/error), PolicyBadge, TripProgressStepper (inline), FlowButton.
- Tokens: brand-blue #005596, orange #ff7d00, 8pt grid, Roboto.

## Accessibility & Responsiveness
- A11y: focus order Chat Input → Attach Button → Last Message Actions; announce status changes (uploading → classified) via aria-live.
- Breakpoints: mobile bottom sheet for details; desktop side panel; chat remains primary on all devices.

## Telemetry (optional)
- Events: chat_upload_started, chat_ocr_completed, chat_duplicate_detected, chat_assign_confirmed, chat_command_executed.
