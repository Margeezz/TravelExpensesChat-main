# R-007 Chat Q&A, Readiness & Submit

## Why
Allow users to understand and finalize trips without leaving chat.

## Behavior
- Q&A: support questions on totals, policy flags, missing items, per‑diem changes, and duplicate receipts. Responses must include inline quick‑fix actions and reference the affected entity IDs.
- Readiness: “What’s missing?” returns a checklist; users can tap actions (set destination/date/purpose) in-thread.
- Submission: “Submit trip” asks for confirmation and posts the submission result with policy score/context.
- Errors: actionable messages with reference codes and safe retry.

## Scenarios (BDD)
Scenario: Resolve missing items and submit in chat
Given a trip with missing destination
When the user asks "What’s missing?"
Then the assistant shows a checklist with a Set Destination action including the trip ID and a deep link
When the user sets the destination and says "Submit trip"
Then the assistant asks for confirmation
And upon Yes, the trip is submitted and a confirmation is posted
