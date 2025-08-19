# R-004 Responsive Rules

## Why
Deliver a mobile‑first experience that scales to desktop.

## Behavior
- Define breakpoints and layout rules for mobile/tablet/desktop
- Use list virtualization for long lists
- Provide safe areas and hit‑targets on mobile

## Scenarios (BDD)
Scenario: Mobile tabs fit within safe area
Given a device with a notch
When viewing the tabs
Then tabs are not obstructed and remain tappable
