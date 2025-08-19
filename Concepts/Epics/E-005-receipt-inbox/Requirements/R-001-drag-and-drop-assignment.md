# R-001 Drag‑and‑Drop Assignment

## Why
Speed up classification of unassigned receipts through intuitive visual assignment while maintaining data accuracy and audit trails.

## Behavior
- **Visual Assignment**: Drag receipt to trip/day to assign with clear drop targets
- **Feedback System**: Provide immediate visual feedback and success confirmation
- **Undo Functionality**: Allow undo of last assignment within 10 seconds
- **Batch Operations**: Support multiple receipt assignments in single operation
- **Validation**: Prevent invalid assignments with clear error messages

## Business Rules
- **Assignment Validation**: Only allow assignments to valid trips and dates
- **Undo Timeout**: 10-second window for assignment reversal
- **Audit Trail**: Log all assignment changes with user attribution and timestamp
- **Data Integrity**: Ensure receipt totals update immediately after assignment
- **Permission Check**: Verify user has permission to assign to target trip

## Scenarios (BDD)
Scenario: Successful drag and drop assignment
Given a receipt is in the Inbox
When the user drags it onto Trip A / Day 1
Then the receipt is assigned there with visual confirmation
And the Inbox count decreases by one
And the trip totals update immediately
And an undo option appears for 10 seconds

Scenario: Invalid assignment prevented
Given a user attempts to drag a receipt to an invalid target
When the drop target is not a valid trip or date
Then the assignment is prevented
And a clear error message explains why
And the receipt returns to its original position

Scenario: Undo assignment within timeout
Given a receipt was assigned to Trip A
When the user clicks undo within 10 seconds
Then the assignment is reversed
And the receipt returns to the Inbox
And the trip totals are updated accordingly
And the audit trail records the reversal

Scenario: Batch assignment of multiple receipts
Given multiple receipts are selected in the Inbox
When the user drags the selection to a trip
Then all selected receipts are assigned to that trip
And individual undo options are provided for each
And bulk confirmation is shown

Scenario: Assignment permission validation
Given a user attempts to assign a receipt to Trip B
When the user lacks permission for Trip B
Then the assignment is blocked
And a clear permission error is displayed
And guidance is provided on how to request access
