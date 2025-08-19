# R-004 Intent → Flow Action Mapping (Chat Commands)

## Why
Reliably translate conversational commands into flow actions with safety and traceability.

## Behavior
- Deterministic mapping from intents (submit trip, assign receipt, move receipt, approve/reject) to flow actions
- Safe re-execution: repeated commands do not create duplicate actions
- Retries/backoff for transient failures without duplicate side‑effects
- Audit linking: conversation context references the created/updated actions
- Ambiguous commands trigger clarification prompts before execution

## Scenarios (BDD)
Scenario: Submit trip via chat intent
Given a ready trip "Berlin May"
When the user says "Submit the Berlin trip"
Then a submission action is triggered exactly once
And the result is linked back to the conversation context

Scenario: Duplicate command is ignored safely
Given the user already submitted the trip
When the user repeats "Submit the Berlin trip"
Then no additional submission action is created
And the assistant replies that the trip is already submitted with a link to the audit
