# R-002 PolicyScore with Explain Tooltips

## Why
Provide transparent policy evaluation with explainable tooltips for users and administrators.

## Behavior
- **PolicyScore Calculation**: Compute score per receipt/trip based on policy compliance
- **Explain Tooltips**: Tooltips explain contributing rules, weights, and decisions
- **Admin Integration**: Link to policy definition in admin interface
- **Guided Setup**: Policy configuration through guided admin wizard
- **Audit Trail**: Complete tracking of policy decisions and scoring

## Technical Requirements
- **Scoring Algorithm**: Transparent policy evaluation with clear weights
- **Tooltip System**: Interactive tooltips showing policy details
- **Admin Interface**: Integration with policy configuration UI
- **Policy Linking**: Direct links from tooltips to policy definitions
- **Real-time Updates**: Policy changes immediately reflected in scoring
- **Audit System**: Complete history of policy decisions and changes

## Scenarios (BDD)
Scenario: Tooltip explains low PolicyScore
Given a receipt violates a meal limit policy
When hovering over the PolicyScore
Then a tooltip lists the violated rule and weight
And provides a link to the policy definition

Scenario: Admin configures policy through guided interface
Given a Finance Administrator wants to adjust policy weights
When they use the guided policy configuration wizard
Then policy changes are applied with validation
And PolicyScore calculations immediately reflect the new rules

Scenario: PolicyScore audit trail
Given a policy change affects multiple receipts
When the PolicyScore is recalculated
Then the change history is tracked with user attribution
And users can see when and why scores changed
