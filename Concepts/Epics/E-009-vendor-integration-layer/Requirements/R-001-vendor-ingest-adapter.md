# R-001 Vendor Ingest Adapter

## Why
Normalize vendor events from TravelPerk, Rydoo, and Spendesk into our domain model reliably with a pragmatic integration approach.

## Behavior
- **Primary Vendors**: TravelPerk (travel), Rydoo (expenses), Spendesk (cards/spend)
- **Integration Approach**: Prefer near real‑time ingestion with a resilient fallback path
- **Event Ingestion**: Accept vendor event deliveries and reconcile missed events via fallback
- **Event Schema**: Standardized across vendors with vendor-specific extensions
- **System of Record**: Per-diems, policy, approvals, settlement = OUR SYSTEM
- **Vendor Approvals**: DISABLED - route via our flow engine

## Scenarios (BDD)
Scenario: TravelPerk webhook ingested and normalized
Given TravelPerk sends a travel booking event
When the adapter processes it
Then a normalized travel event is published internally
And the event includes vendor-specific travel details

Scenario: Rydoo expense event with OCR fallback
Given Rydoo sends an expense receipt event
When our OCR fails to process the receipt
Then vendor OCR is used as fallback
And confidence scoring reflects fallback usage

Scenario: Delivery issue with resilient fallback
Given a vendor event delivery fails repeatedly
When the resilient fallback is used
Then missed events are reconciled within a reasonable timeframe
And processing continues reliably
