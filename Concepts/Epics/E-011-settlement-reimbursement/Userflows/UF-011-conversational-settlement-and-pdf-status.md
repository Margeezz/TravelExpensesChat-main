# UF-011 Conversational Settlement: PDF, Export & Payout Status (Chat)

## Scope
- Epic: `E-011-settlement-reimbursement`
- Goal: Let users request PDFs, check payout status, and trigger finance actions (role-gated) via chat.
- Entry: User opens Chat and asks "Send me the PDF", "What’s the payout status?", or Finance asks to export/SEPA.
- Exit: PDF delivered or status shown; finance actions queued or executed with confirmation.

## Personas & Context
- Traveler (PDF, status); Finance (exports, SEPA); Manager (read-only status).

## Flow (numbered)
1) Traveler: "Send me the PDF for Berlin trip"
   - System: Generates PDF; posts a download link and optional email/share buttons; logs audit reference.
2) Traveler: "Email the PDF to my manager"
   - System: Confirms target recipient; sends email; posts confirmation with message ID.
3) Traveler: "What’s the payout status?"
   - System: Returns status (e.g., Pending Finance, Exported, In SEPA batch, Paid on YYYY‑MM‑DD) with reference IDs.
4) Finance: "Export DATEV for approved items"
   - System: Checks role; asks for date range/filters; confirms action; triggers export job; posts job started message with progress updates.
5) Finance: "Generate SEPA for batch 2025‑W32"
   - System: Checks role; validates IBAN/amounts; asks for confirmation; generates SEPA; posts result and file link.
6) Errors
   - System: Inline error with reference code; retries allowed; idempotency to avoid duplicate exports.

## Screens & States
- Screen: Chat Home (Settlement context)
  - Loading: Skeleton bubbles for job updates
  - Empty: Prompt suggestions: "Send me the PDF", "Payout status?"
  - Error: Inline error bubble; retry
  - Validation: Role/permission checks for Finance actions; confirmations before irreversible actions
- Screen: Export Job Panel (optional)
  - Loading: Job progress (queued/running/completed)
  - Empty: No jobs yet
  - Error: Job failure details; link to logs

## Navigation
- Chat → PDF preview/download (new tab or in-app viewer)
- Chat → Export Job Panel for progress; back returns to chat

## Components & Tokens
- Components: LLMChatBubble, Button, StatusBadge, ProgressBar, Link, Toast
- Tokens: E-002 tokens; status colors; clear affordances

## Accessibility & Responsiveness
- A11y: Links and buttons have descriptive labels; job updates announced via aria-live; role errors include guidance
- Breakpoints: Mobile-friendly file link actions; desktop shows side panel for job details

## Telemetry (optional)
- Events: chat_pdf_requested, chat_pdf_emailed, chat_payout_status_requested, chat_export_job_started, chat_export_job_completed, chat_sepa_generated, chat_settlement_error
