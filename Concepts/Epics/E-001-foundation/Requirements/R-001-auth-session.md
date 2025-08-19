# R-001 Auth & Session

## Why
Protect user data and ensure secure access with minimal friction while maintaining enterprise security standards.

## Behavior
- **SSO Sign-in**: Enterprise IdP integration with automatic user provisioning
- **Session Management**: Auto-lock after inactivity threshold with configurable timeout
- **Security Controls**: Explicit sign-out and forced logout on server revocation
- **User Experience**: Seamless authentication with minimal login prompts
- **Access Control**: Role-based access based on enterprise directory

## Business Rules
- **Inactivity Threshold**: Configurable per organization (default: 15 minutes)
- **Session Security**: Lock session on browser close or inactivity
- **Force Logout**: Immediate logout on security policy changes
- **Access Validation**: Verify user permissions on each session refresh

## Scenarios (BDD)
Scenario: Successful SSO authentication
Given a user accesses the application
When they authenticate through enterprise SSO
Then they are automatically logged in with appropriate role permissions
And their session is established with the configured timeout

Scenario: Session locks after inactivity
Given the user is signed in
And the inactivity threshold is 15 minutes
When no interaction occurs for 15 minutes
Then the session is automatically locked
And the user is prompted to re-authenticate
And any unsaved work is preserved

Scenario: Forced logout on security policy change
Given a user has an active session
When security policies are updated by IT
Then the user is immediately logged out
And they must re-authenticate to continue
And a clear message explains the security update

Scenario: Role-based access validation
Given a user with Finance role accesses the system
When they navigate to different sections
Then they see only Finance-appropriate features
And access to other roles' functions is denied with clear messaging

Scenario: Session timeout warning
Given a user's session is approaching timeout
When they have 2 minutes remaining
Then they receive a clear warning about session expiration
And can extend their session with a simple action

## Role-based Access & Active Role (MVP)
- Role claims are issued by the IdP/back end (e.g., roles=["Traveler","Manager","Finance","IT Administrator"]).
- The client maintains an `activeRole` in session; state-changing requests include header `X-Active-Role: <role>` for audit.
- If a user navigates to a route not permitted by the current `activeRole`, show a 403 card with a CTA to switch to a permitted role (if available) and then continue.
- All privileged actions must validate both authentication and role authorization on the server; client-side checks are UX only.

## Scenarios (BDD) — Active Role & RBAC
Scenario: 403 with switch suggestion on unauthorized route
Given a signed-in user with roles Traveler and Manager
And their active role is Traveler
When they open a deep link to an approval `/approvals/:id`
Then a 403 card is shown with CTA "Switch to Manager to access"
And clicking the CTA switches active role to Manager and opens the approval

Scenario: Audit header on privileged action
Given a user with Finance role performs a CSV export
When the request is sent to the server
Then the request contains header `X-Active-Role: Finance`
And the server records an audit entry with userId, activeRole, action, entityId, and timestamp
