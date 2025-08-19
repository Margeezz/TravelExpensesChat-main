# R-001 Payment Summary PDF

## Why
Provide a payment overview PDF showing what needs to be paid to whom for finance team record keeping.

## Behavior
- **MVP Scope**: Only payment summary PDF (no other PDFs needed)
- **Content**: Payment overview showing what needs to be paid to whom
- **Format**: Clean, printable PDF with employee breakdowns
- **Access**: Available to Finance role users
- **Generation**: On-demand generation for payment cycles
- **Performance Target**: PDF generation completes in <15s p95; progress indicator shown

## Technical Requirements
- **PDF Content**: Employee list, amounts, bank details, payment dates
- **Format**: Professional layout suitable for finance records
- **File Size**: Optimized for email and storage (<2MB)
- **Access Control**: Finance role permission required
- **Audit Trail**: Track PDF generation and access
- **File Naming (Privacy)**: Filenames must not contain PII. Use pattern `payment_summary_<yyyymmdd-hhmm>_<digest8>.pdf`
- **Logging (Privacy)**: Mask PII fields in logs; include audit fields: userId, activeRole, action, entityId, timestamp; store file digest/hash

## Scenarios (BDD)
Scenario: Generate payment summary PDF
Given a finance user requests payment summary
When the PDF is generated
Then it shows all pending payments by employee
And includes amounts, bank details, and payment dates

Scenario: Finance role access control
Given a non-finance user tries to access payment PDF
When they attempt to generate the summary
Then access is denied
And an appropriate error message is shown

Scenario: PDF optimization for finance use
Given a payment summary PDF is generated
When the finance team receives it
Then the file size is under 2MB
And the layout is suitable for printing and record keeping

Scenario: PDF performance and privacy
Given a payment cycle with many employees
When the finance user requests PDF generation
Then the PDF completes within 15 seconds p95 with progress shown
And the filename follows `payment_summary_<yyyymmdd-hhmm>_<digest8>.pdf` without PII
And logs mask PII and include audit fields
