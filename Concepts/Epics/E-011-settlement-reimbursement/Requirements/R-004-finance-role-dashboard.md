# R-004 Finance Role Dashboard

## Why
Provide Finance team with comprehensive overview of pending payments, statistics, and export capabilities in a dedicated dashboard.

## Behavior
- **User Role**: Finance role with dedicated dashboard access
- **Dashboard Features**: Payment overview by employee, currency breakdown, due dates, urgency indicators
- **Export Capabilities**: CSV export for bank upload, PDF payment summary generation
- **Statistics Display**: Payment trends, processing metrics, compliance rates, employee summaries
- **Access Control**: Finance role permission required for all dashboard functions
- **Real-time Data**: Current payment status and amounts updated in real-time

## Technical Requirements
- **Dashboard Layout**: Clean, organized view with intuitive navigation
- **Data Visualization**: Charts and metrics for payment analysis
- **Export Functions**: CSV and PDF generation with proper formatting
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Permission System**: Finance role access control with audit logging
- **Performance**: Dashboard loads in <2 seconds with real-time updates

## Dashboard Sections

### Payment Overview
- Employee list with pending payment amounts
- Currency breakdown (EUR vs. other currencies)
- Payment due dates and urgency indicators
- Status tracking (approved, pending, processing)

### Export Functions
- CSV export for bank upload systems
- PDF payment summary for records
- Bulk export capabilities for multiple payment cycles
- Export history and audit trail

### Statistics & Analytics
- Monthly payment trends and patterns
- Average reimbursement amounts by employee
- Processing time metrics and bottlenecks
- Policy compliance rates and violations
- Cost analysis and budget tracking

### Employee Management
- Per-employee payment summaries
- Receipt count and categorization
- Approval status and manager sign-off
- Payment history and audit trail

## Visibility & Navigation
- Visible only to users with Finance role. When activeRole=Finance, Finance appears as a top-level tab (replaces Chat) for the session; otherwise, reachable under Settings → Finance.
- Deep link handling: If a user with Finance role opens a Finance URL while another role is active, show 403 card with CTA to switch to Finance.

## Scenarios (BDD)
Scenario: Finance user accesses comprehensive dashboard
Given a Finance role user logs into the system
When they navigate to the Finance dashboard
Then they see payment overview, statistics, and export options
And all data is current and accurate

Scenario: Generate payment exports from dashboard
Given a Finance user is on the dashboard
When they request CSV export or PDF summary
Then the appropriate file is generated with all payment data
And includes proper formatting for bank systems

Scenario: View payment statistics and trends
Given a Finance user accesses the dashboard
When they review the statistics section
Then they see comprehensive payment trends and metrics
And can identify areas for process improvement

Scenario: Role-based access control
Given a non-Finance user tries to access the dashboard
When they attempt to navigate to Finance features
Then access is denied with appropriate error message
And the attempt is logged in the audit trail

## Scenarios (BDD) — visibility
Scenario: Deep link offers Finance role switch
Given a user has Finance role but active role is Traveler
When they open `/finance/dashboard`
Then a 403 card is shown with CTA "Switch to Finance"
And selecting it switches role and opens the dashboard
