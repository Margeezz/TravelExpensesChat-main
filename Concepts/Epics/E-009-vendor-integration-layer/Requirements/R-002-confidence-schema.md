# R-002 Confidence Schema

## Why
Capture OCR/extraction reliability uniformly across our OCR and vendor OCR fallback systems to provide transparency and enable informed decision-making.

## Behavior
- **OCR Strategy**: Our OCR primary, vendor OCR as fallback only
- **Confidence Scoring**: Display confidence levels with clear thresholds and explanations
- **Source Attribution**: Clearly distinguish between our OCR and vendor OCR results
- **Fallback Logic**: Automatic fallback when our OCR confidence falls below threshold
- **User Transparency**: Show confidence scores and source in user interface

## Business Rules
- **Confidence Thresholds**: High (90%+), Medium (80-89%), Low (70-79%), Insufficient (<70%)
- **Fallback Trigger**: Automatic fallback when our OCR confidence <70%
- **Source Marking**: All results must clearly indicate OCR source (internal vs vendor)
- **Confidence Display**: Show confidence scores in user interface with tooltips
- **Audit Requirements**: Track all OCR source changes and confidence scores

## Scenarios (BDD)
Scenario: High confidence from our OCR
Given our OCR processes a receipt with 85% confidence
When storing the extraction result
Then confidence fields and raw text are stored together
And source is marked as "internal_ocr"
And the confidence level is displayed as "Medium"
And users can see the confidence score in the interface

Scenario: Fallback to vendor OCR
Given our OCR confidence is below 70%
When processing a receipt
Then vendor OCR is automatically triggered
And confidence reflects fallback usage with source marking
And users are informed that vendor OCR was used
And the confidence score is clearly labeled as vendor-sourced

Scenario: Confidence comparison across vendors
Given receipts from different vendors
When comparing confidence scores
Then scores are normalized to the same scale
And source attribution is clearly visible
And users can understand which OCR system provided each result
And confidence levels are consistently displayed

Scenario: Low confidence handling
Given a receipt has 65% confidence from vendor OCR
When displaying the result to users
Then a clear warning about low confidence is shown
And users are advised to review the extraction carefully
And manual correction options are prominently displayed
And the low confidence is noted in the audit trail

Scenario: Confidence score explanation
Given a user sees a confidence score
When they hover over or click on the score
Then a detailed explanation of what the score means is displayed
And factors contributing to the score are explained
And guidance on how to interpret the result is provided
