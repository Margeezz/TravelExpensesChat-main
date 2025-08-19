# R-004 Chat as Primary Entry (Default Home)

## Why
Make AI chat the main way to work: faster capture, Q&A, and commands, with detail screens as secondary.

## Behavior
- Chat opens by default on mobile and desktop (Option A); last-used view is remembered per user.
- Exception: When activeRole=Finance, Finance is a top-level tab and becomes the default home for the session; Chat remains accessible via navigation and shortcuts.
- Global access: chat is available from tabs/rail and via keyboard shortcut.
- Deep links reopen chat with the relevant context (trip/receipt/approval) and show a context chip.
- Chat supports attaching files (images/PDF) and quick actions (Submit, Assign, Move) inline.
- Accessibility: full keyboard navigation, screen-reader labels on message actions.

## Scenarios (BDD)
Scenario: Open app shows chat home
Given a signed-in user
When the user opens the app
Then the chat view is shown by default
And the user can start typing or attach a file

Scenario: Remember last-used view
Given the user switched from Chat to Review
When the user returns later
Then the Review view opens
And the user can re-open Chat via the rail/tab

Scenario: Deep link reopens chat context
Given a deep link to a specific trip
When the user follows the link
Then the chat opens focused on that trip context
And a context chip shows the trip name

Scenario: Finance role default home is Finance dashboard
Given a signed-in user with Finance role is active
When the user opens the app
Then the Finance dashboard is shown by default
And Chat remains accessible via navigation and shortcuts
