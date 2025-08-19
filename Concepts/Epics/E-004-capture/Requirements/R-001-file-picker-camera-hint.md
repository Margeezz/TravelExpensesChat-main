# R-001 File Picker + Camera Hint

## Why
Guide users to capture receipts quickly and reliably directly from the chat composer with clear file requirements and validation.

## Behavior
- **File Support**: Chat composer attach supports images (JPG, PNG, HEIC) and PDF files
- **Camera Integration**: Mobile shows camera option with permission rationale in attach menu
- **File Validation**: Show supported file types and size limits inline in composer
- **User Guidance**: Provide clear feedback on file requirements and capture tips
- **Permission Handling**: Graceful handling of camera permission denial

## Business Rules
- **File Types**: Accept JPG, PNG, HEIC, PDF formats
- **File Size**: Maximum 10MB per file before compression
- **Image Quality**: Minimum 800x600 pixels for OCR processing
- **Permission Flow**: Request camera permission with clear business justification
- **Fallback Options**: Provide alternative capture methods if camera unavailable

## Scenarios (BDD)
Scenario: Mobile device shows camera hint in chat
Given a mobile device
When opening the chat attach menu
Then a camera option is displayed with clear label
And selecting it opens the camera with permission rationale
And the rationale explains why camera access is needed

Scenario: File type validation with clear feedback
Given a user selects an unsupported file type
When they attempt to attach the file
Then clear feedback is provided on supported formats
And alternative file options are suggested
And the user can select a different file

Scenario: File size validation and compression hint
Given a user selects a file larger than 10MB
When they attempt to attach the file
Then a size limit message is displayed
And compression options are suggested
And the user can choose to compress or select a smaller file

Scenario: Camera permission denied handling
Given a user denies camera permission
When they try to use the camera option
Then a clear message explains the impact
And alternative capture methods are provided
And guidance is given on how to enable camera access

Scenario: HEIC file handling on unsupported browsers
Given a user uploads a HEIC file on an unsupported browser
When the file is processed
Then the system automatically converts it to JPG
And the user is informed of the conversion
And the original file format is noted in the audit
