# UF-004 Capture & Upload

> Note: Out-of-Scope for MVP. Capture is chat-only. This flow is retained as a future optional page pattern. For MVP, see `UF-004-conversational-capture-and-commands.md`.

## Scope
- Epic: `E-004-capture`
- Goal: Fast, reliable capture/upload with dedupe and clear status.
- Entry: (Future) User opens an Upload Queue screen from navigation; in MVP, users attach in Chat (see conversational flow).
- Exit: Files uploaded/processed or duplicates resolved.

## Personas & Context
- Traveler on mobile; also desktop drag/drop.

## Flow (numbered)
1) User taps "+ Add receipts" (or comes from Chat after attaching files)
   - System: Opens file picker (accept images/PDF); shows camera hint on mobile. From Chat, preselects attached files.
2) User selects multiple files (e.g., 3)
   - System: Enqueues items; shows per-file rows (Queued → Uploading).
3) Client compression runs
   - System: Compresses images to 200–400 KB; preserves EXIF orientation; shows before/after size.
4) Auto-rotate & de-skew
   - System: Applies corrections; preview updates.
5) Progress & cancel
   - System: Per-file percent; Cancel buttons per row and All; errors inline with Retry.
6) Duplicate check triggers on file 2
   - System: Shows duplicate warning (Assign anyway / Merge / View match); user picks Merge.
7) HEIC upload on unsupported browser
   - System: Falls back to server conversion; indicates in audit metadata.
8) Completion
   - System: Success state per file; Ready to assign or review.

## Screens & States
- Screen: Capture – Upload Queue
  - Loading: Skeleton of rows <100 ms
  - Empty: "No receipts yet" + primary CTA to add
  - Error: Per-file error with code; Retry; global error banner if needed
  - Validation: Accept types; size limits; cancel behavior confirmed
- Screen: Duplicate Resolution Modal
  - Loading: Matching preview
  - Empty: n/a
  - Error: If merge fails → keep both + note
  - Validation: Record resolution and actor in audit

## Navigation
- Capture queue → Review (after uploads) or stay in Capture
- View match → opens existing receipt detail; back returns to queue

## Components & Tokens
- Components: FilePicker, UploadRow, ProgressBar, Button, Modal, Toast, Preview
- Tokens: E-002 tokens; focus rings; color for states (success/warn/error)

## Accessibility & Responsiveness
- A11y: Announce upload start/complete; buttons keyboard accessible; modal focus trap
- Breakpoints: List virtualization on large queues; mobile-first layout with large tap targets

## Telemetry (optional)
- Events: capture_files_selected(count), upload_start, upload_error(code), duplicate_detected, duplicate_resolved(action), heic_fallback_used
