# R-006 Chat Privacy, Session & PII Redaction

## Why
Protect sensitive data in conversational workflows while keeping the chat usable and reliable.

## Behavior
- PII sanitizer runs on all chat uploads; redacts IBANs, card numbers, emails, and faces where required.
- Logs/telemetry store redacted content only; raw files are stored securely with access control.
- Session handling: inactivity lock applies to chat; on resume, sensitive previews are hidden until re-auth.
- In-thread error & retry model: transient failures provide clear retry actions; no offline queues.

## Scenarios (BDD)
Scenario: PII redaction on receipt upload
Given a receipt image containing an IBAN
When the user uploads it in chat
Then the stored chat preview is redacted
And the original file is stored securely with restricted access

Scenario: Session lock hides sensitive content
Given the user was inactive and the session locked
When the user returns to chat
Then sensitive message previews are hidden
And re-authentication reveals them
