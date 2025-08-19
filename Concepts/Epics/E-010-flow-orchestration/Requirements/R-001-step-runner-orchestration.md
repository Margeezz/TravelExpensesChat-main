# R-001 Lightweight Step Runner Orchestration

## Why
Coordinate cross‑system flows with clarity using a simplified, lightweight approach for MVP.

## Behavior
- **MVP Scope**: Limited to 3 core flows (Capture→OCR→Inbox, Review→Readiness→Submit, Approvals→Settlement)
- **Orchestration Engine**: Simple step runner (no complex BPMN features in MVP)
- **Flow Definition**: Lightweight flow definitions with brief step notes
- **State Management**: Persist state transitions and history
- **Metrics**: Basic reliability signals and progress counters

## MVP Flow Definitions

### Flow 1: Capture → OCR → Inbox
- File upload → OCR processing → Receipt classification → Inbox assignment
- Error handling: Retry OCR, fallback to vendor OCR, manual review

### Flow 2: Review → Readiness → Submit
- Trip review → Policy validation → Readiness checklist → Submission
- Error handling: Missing items, policy violations, approval routing

### Flow 3: Approvals → Settlement
- Approval decision → Settlement trigger (CSV export generation + PDF payment summary preparation)
- Error handling: Rejection handling, delegation, export generation failures

## Scenarios (BDD)
Scenario: Capture flow executes successfully
Given a receipt is uploaded via chat
When the capture flow executes
Then OCR processing completes and receipt is assigned to inbox
And the transition history includes all steps

Scenario: Flow orchestration with retry logic
Given a step in the flow fails
When retry logic is triggered
Then the system makes repeated attempts with increasing delays
And failure is recorded for follow-up after retries are exhausted

Scenario: Event correlation with chat
Given a flow event is generated
When correlation between events and chat is available
Then the event is linked to the relevant conversation
And users can trace flow progress through the chat interface
