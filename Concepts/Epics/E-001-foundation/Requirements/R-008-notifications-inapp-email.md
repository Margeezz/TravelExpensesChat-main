# R-008 Notifications (In‑App/Email)

## Why
Notify users of specific workflow events without relying on web push.

## Behavior
- In‑app notifications center with unread count and per-item status.
- Email notifications for:
  - New approval tasks (recipient: assigned manager)
  - Report submission success/failure (recipient: submitter)
  - Reassignment of receipts (recipient: assignee)
- Each notification must include: title, event type, entity ID, timestamp in ISO‑8601, and a deep link.
- No Web Push used.

## Scenarios (BDD)
Scenario: Manager receives email on new approval task
Given a report is submitted to a manager
When the submission completes
Then an email notification is sent to the manager
