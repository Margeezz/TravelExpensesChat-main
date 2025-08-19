# R-003 Gestures & Shortcuts

## Why
Speed up frequent navigation and actions on mobile and desktop.

## Behavior
- Mobile: swipe left/right to switch tabs; respect system back gesture
- Desktop: keyboard shortcuts for primary actions (e.g., Ctrl+K to command palette/search, C to focus Chat, G then R to go to Review)
- Provide a shortcuts help overlay (e.g., ? key) listing available shortcuts
- When `activeRole=Finance` and Chat is not present in the tab bar, pressing C still opens Chat via the shortcut overlay and focuses the input

## Scenarios (BDD)
Scenario: Swipe between tabs on mobile
Given the user is on the Chat tab on a mobile device
When they swipe left
Then the Review tab becomes active

Scenario: Keyboard shortcut to open search
Given the user is on desktop
When they press Ctrl+K
Then the command palette/search opens

Scenario: Shortcut to focus Chat
Given the user is on desktop
When they press C
Then Chat becomes focused and ready for input

Scenario: Chat shortcut when Finance is active
Given `activeRole=Finance` and Chat is not present in the tab bar
When the user presses C on desktop
Then the shortcut overlay opens Chat and focuses the input

## Accessibility (WCAG)
- Map to WCAG 2.2: 2.4.3 Focus Order; 2.1.1 Keyboard; 4.1.2 Name, Role, Value; 3.3.2 Labels or Instructions
