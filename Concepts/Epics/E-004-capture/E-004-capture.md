# E-004 Capture UX

## Intent
Enable fast, reliable receipt capture and upload via chat-only capture (no standalone capture page), without offline queues.

## In-Scope
- File attach in Chat composer with camera hint (mobile)
- Multi‑upload via Chat composer with client compression (200–400 KB target)
- Auto‑rotate/de‑skew; per-item progress & cancel in-thread
- Duplicate check at capture (Assign anyway / Merge / View match) in-thread
- Streaming OCR status and suggestions in chat

## Out-of-Scope (optional)
- Offline/PWA; background sync
- Standalone Capture page/tab
- OS Share integration on mobile (post-MVP)

## Requirements
- See structure and naming in `Workflow/Conventions.md`.
- Reference list (optional):
- R-001 File Picker + Camera Hint (Chat composer attach)
- R-002 Multi‑Upload (Chat composer)
- R-003 Client Compression
- R-004 Auto‑Rotate & De‑skew
- R-005 Progress & Cancel
- R-006 Duplicate Check at Capture
- R-008 Conversational Capture & Upload (Chat)
- R-009 Chat-based Receipt Reassignment & Edits
