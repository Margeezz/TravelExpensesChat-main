# R-002 Multi‑Upload

## Why
Speed up bulk capture.

## Behavior
- Select multiple files in one action from the chat composer attach
- Show per‑file status inline in the chat thread (Uploading → Processed)
- Allow cancel/retry per file directly in-thread

## Scenarios (BDD)
Scenario: Select multiple files in chat
Given the user selects 3 files via the chat attach menu
When uploading begins
Then 3 items appear with individual progress indicators in the thread
And each item supports cancel/retry
