# R-009 Chat-based Receipt Reassignment & Edits

## Why
Enable natural-language commands in chat to move or edit receipts quickly.

## Behavior
- Supported intents: move receipt between trips/days, change category/amount/date, add note.
- Disambiguation: the assistant asks for clarifying details if multiple matches exist.
- Confirmation: the assistant summarizes the change and asks to confirm before applying.
- Audit: chat message links to the receipt and logs who confirmed the change and when.

## Scenarios (BDD)
Scenario: Move a receipt to another trip via chat
Given a receipt assigned to Trip A
When the user says "Move the taxi receipt from Berlin to Trip B"
Then the assistant asks to confirm the specific receipt if ambiguous
And upon confirmation, the receipt is assigned to Trip B
And a confirmation with an audit link is posted in the thread
