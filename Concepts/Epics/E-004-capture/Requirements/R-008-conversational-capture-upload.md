# R-008 Conversational Capture & Upload (Chat)

## Why
Let users upload receipts directly in chat and complete assignment without leaving the conversation.

## Behavior
- Attach images/PDF to a chat message; system shows in-thread processing states: uploading → OCR → classified.
- Duplicate detection runs; offer Assign, Merge, or Dismiss choices inline.
- User can assign to trip/day/category within the thread; confirmation message with summary and undo.
- File limits and supported types are shown; large files get client compression hints.
- Errors are presented in-thread with retry guidance; no offline queues.

## Scenarios (BDD)
Scenario: Upload and assign receipt in chat
Given the user is in chat
And attaches a receipt image
When OCR completes
Then the system suggests a trip/day and category
And if a duplicate is detected, the user can choose Assign, Merge, or Dismiss
And upon Assign, a confirmation message is posted with an undo action
