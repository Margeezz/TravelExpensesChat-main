# AI-first Chat Capture Notes

Summary of the new direction (from user input):

- Mobile application with chat-first UX to upload/scan documents (like WhatsApp).
- Users send photos/PDFs of invoices/receipts; the system “takes care of it”.
- Automatically read dates and create “Travels” in the background.
- No upfront planning; just commit/upload what exists during/after travel.
- When back in the office, users can review these Travels, edit, and submit them to approval.
- From uploads, infer where the user went and what was done; detect countries and applicable per-diem rates.
- If unclear, ask questions in a conversational way (chat), minimizing user effort to reach submission.

Implications for scope:
- Replace planning wizard with chat capture, OCR, auto-aggregation, inference, per-diem, chat clarifications.
- Approval flow is final-only (no plan approval).
- Add a dedicated Review & Submission step for office time.
