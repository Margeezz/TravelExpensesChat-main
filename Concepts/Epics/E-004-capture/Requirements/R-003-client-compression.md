# R-003 Client Compression

## Why
Reduce upload time and bandwidth.

## Behavior
- Compress images to a configured target that balances speed and legibility
- Maintain EXIF orientation when needed
- Provide before/after size info

## Scenarios (BDD)
Scenario: Compression meets target size
Given a 3 MB image
When compression runs
Then the resulting file is between 200 and 400 KB
