# R-004 Privacy & Consent

## Why
Comply with data protection and inform users exactly which data is collected, for what purpose, how long it is retained, and with whom it is shared.

## Behavior
- Display a data usage notice that lists: data categories collected (e.g., images, metadata, device info), purpose (capture, OCR, QA), retention period, and sharing (none/processor only). Include a link to the full policy.
- Minimal client storage (only session token and consent flags; no images cached after upload completes).
- Consent prompts for camera/files with a rationale that names the feature (Capture) and purpose (scan and extract receipt data).

## Scenarios (BDD)
Scenario: Camera permission request shows rationale
Given a user starts capture
When camera access is requested
Then a rationale is displayed
And the user can Allow or Deny
