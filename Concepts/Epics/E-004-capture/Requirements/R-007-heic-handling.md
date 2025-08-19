# R-007 HEIC Handling

## Why
Ensure compatibility across devices and browsers.

## Behavior
- HEIC uploads are converted seamlessly to a widely compatible format
- Maintain consistent output quality and size targets
- Indicate conversion in audit metadata

## Scenarios (BDD)
Scenario: Unsupported browser uses server fallback
Given the user uploads a HEIC file on an unsupported browser
When the upload starts
Then the server performs conversion
And the resulting JPEG is processed
