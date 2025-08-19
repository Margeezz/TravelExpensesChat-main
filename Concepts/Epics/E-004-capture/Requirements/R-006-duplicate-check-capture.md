# R-006 Duplicate Check at Capture

## Why
Prevent duplicate receipts from being processed while giving users control over how to handle potential duplicates.

## Behavior
- **Automatic Detection**: System automatically checks for duplicates during upload
- **User Choice**: Present clear options: Assign Anyway, Merge, or View Match
- **Confidence Display**: Show duplicate confidence level with supporting evidence
- **Quick Resolution**: Allow users to resolve duplicates inline without leaving chat
- **Audit Trail**: Track all duplicate resolution decisions for compliance

## Business Rules
- **Duplicate Threshold**: Flag receipts with >80% similarity as potential duplicates
- **Confidence Levels**: Display confidence as High (90%+), Medium (80-89%), Low (70-79%)
- **Resolution Options**: Always provide Assign Anyway, Merge, and View Match choices
- **Audit Requirements**: Log all duplicate decisions with user attribution and timestamp
- **Data Preservation**: Ensure no data loss during merge operations

## Scenarios (BDD)
Scenario: High confidence duplicate detected
Given a receipt is uploaded
When the system detects a 95% similarity match
Then a high confidence duplicate warning is displayed
And the user sees clear evidence of the match
And all resolution options are presented

Scenario: User chooses to merge duplicates
Given a duplicate is detected with 85% confidence
When the user selects Merge option
Then the system combines the receipts intelligently
And the user is shown a summary of the merge
And the original receipt is marked as merged

Scenario: User assigns duplicate anyway
Given a duplicate is detected
When the user selects Assign Anyway
Then the receipt is processed normally
And a note is added about the duplicate decision
And the audit trail records the user's choice

Scenario: User views duplicate match details
Given a duplicate is detected
When the user selects View Match
Then detailed comparison is shown
And the user can see exact matching fields
And they can make an informed decision

Scenario: Low confidence duplicate handling
Given a receipt has 75% similarity to existing receipts
When the duplicate check runs
Then a low confidence warning is shown
And the user is advised to review carefully
And all resolution options remain available
