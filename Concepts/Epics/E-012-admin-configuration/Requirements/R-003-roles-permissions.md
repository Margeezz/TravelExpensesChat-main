# R-003 Roles & Permissions

## Why
Control access to administrative features based on user roles and responsibilities while maintaining security and audit compliance.

## Behavior
- **User Personas**: Three distinct admin roles with specific permissions and access levels
- **Role Management**: Define roles and assign permissions to actions with clear boundaries
- **Permission Enforcement**: Enforce permissions across admin UI and functions consistently
- **Audit Trail**: Complete audit of role changes and permission updates with user attribution
- **Setup Time**: Target <30 minutes for new admin configuration

## Admin User Personas & Permissions

### Finance Administrator
- **Permissions**: Per-diem management, policy configuration, approval workflows, finance dashboard access
- **Access**: Finance dashboard, payment exports, policy editor, per-diem tables
- **Skill Level**: Medium-High technical skill
- **Business Scope**: Financial policies, rates, and payment processing

### IT Administrator
- **Permissions**: User management, system configuration, monitoring, security settings
- **Access**: User roles, system settings, performance metrics, security logs
- **Skill Level**: High technical skill
- **Business Scope**: System administration and user access management

## Business Rules
- **Role Hierarchy**: IT Administrator > Finance Administrator
- **Permission Inheritance**: Higher roles inherit permissions from lower roles
- **Access Validation**: Verify user permissions on each function access
- **Change Approval**: Significant permission changes require approval workflow
- **Audit Requirements**: All permission changes logged with business justification

## MVP Simplification
- Application roles emphasized for MVP: Traveler, Manager, Finance, IT Administrator.
- Admin personas for MVP: IT Administrator and Finance Administrator only (Department Manager removed).
- Finance Administrator capabilities limited to Finance role surfaces (dashboard, exports) in MVP; IT Administrator owns user/role management.

## Scenarios (BDD)
Scenario: Finance Administrator accesses per-diem management
Given a user with Finance Administrator role
When they navigate to the admin section
Then they see per-diem and policy management options
And can access finance dashboard features
And are restricted from IT administration functions
And their access is logged in the audit trail

Scenario: Permission prevents unauthorized access
Given a user without Admin role
When visiting the Admin page
Then access is denied with a clear message
And appropriate error handling is shown
And the access attempt is logged for security review
And guidance is provided on how to request access

Scenario: Role-based UI customization
Given different admin users log in
When they access the admin interface
Then they see only relevant features for their role
And navigation is customized to their permissions
And role-specific help and guidance is displayed
And their access level is clearly indicated

Scenario: Permission change with approval workflow
Given an admin requests elevated permissions
When the change is significant
Then an approval workflow is triggered
And the request is reviewed by appropriate stakeholders
And the change is logged with business justification
And the user is notified of the approval decision

Scenario: Role delegation and backup
Given a primary admin is unavailable
When backup admin access is needed
Then temporary role delegation can be granted
And the delegation is time-limited and audited
And the primary admin is notified of the delegation
And normal access is restored when the primary admin returns

## Scenarios (BDD) — MVP roles
Scenario: Only IT Administrator can manage users/roles
Given a Finance user without IT Administrator role
When they open Settings → Admin
Then access is denied with a clear message
And guidance is provided on how to request access
