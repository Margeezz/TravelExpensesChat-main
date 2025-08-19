# R-005 Progress & Cancel

## Why
Provide control and transparency during upload.

## Behavior
- Show per‑file progress %
- Allow cancel per file and for all
- Display final success or error state per file

## Scenarios (BDD)
Scenario: Cancel a single upload
Given 2 files are uploading
When the user cancels file A
Then file A stops and file B continues
