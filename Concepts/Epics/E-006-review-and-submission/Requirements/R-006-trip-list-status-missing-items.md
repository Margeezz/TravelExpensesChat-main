# R-006 Trip List with Status & Missing Items

## Why
Provide a clear entry point to review progress and outstanding tasks without overwhelming the user.

## Behavior
- Show a list of trips with compact cards: title, dates, readiness chip, total amount.
- Display missing items per trip (e.g., destination, dates, purpose, receipts) as a concise inline hint.
- Quick chips per card: What's missing, Open, Submit (disabled until Ready). Submit chip becomes enabled when Ready.
- Search by text (trip name, destination) and simple filters: Ready, In Progress, Draft. Advanced filters live under "More".
- Clicking What's missing opens the checklist in context (same Review surface) and focuses the first blocker.
- Deep links to a specific trip land on Review detail.

## Scenarios (BDD)
Scenario: Trip shows missing purpose
Given a trip without a purpose
When viewing the Review trip list
Then the trip displays a Missing Purpose indicator
And a quick-link navigates to add the purpose

Scenario: Submit chip is disabled until Ready
Given a trip that is not Ready
When viewing its card on the list
Then the Submit chip is disabled
And when the trip becomes Ready
Then the Submit chip becomes enabled

Scenario: Filter trips by Ready status
Given multiple trips with different statuses
When the user applies the Ready filter
Then only Ready trips appear in the list

## Accessibility & Responsiveness
- Cards are fully keyboard operable; chip hit areas ≥ 44 px; list supports screen-reader friendly headings.

## Telemetry (optional)
- Events: review_trip_search_used, review_trip_filter_used, review_trip_submit_chip_clicked, review_trip_missing_clicked
