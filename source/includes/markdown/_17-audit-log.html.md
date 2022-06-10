<hr class="full-line">
<section class="full-section">
 
# Audit Log Events
 
Asana’s Audit Log API allows you to monitor and act upon critical events in your organization's Asana instance.
 
Only [Service Accounts](https://asana.com/guide/help/premium/service-accounts) in [Enterprise Domains](https://asana.com/enterprise) can access Audit Log API endpoints. Authentication with a Service Account's [Personal Access Token](/docs/personal-access-token) is required.

To get started with the Audit Log API, visit the [API Reference](/docs/audit-log-api). 
 
## Supported AuditLogEvents
 
The following tables list our currently supported [AuditLogEvent](/docs/audit-log-event) `event_type`s, organized by `event_category`. Audit log events are retained for 90 days from the date of capture. If an event that you're looking to monitor isn't listed below, please [send us your feedback](https://form.asana.com/?hash=c439d6062b165442b3d40383ab2f95cac08176b5b8ced11cf47817743a704728&id=1137609721785458).
 
### Logins
 
All login events operate on the _User_ resource type.
 
| Event Type | Description |
|------------|---------------|
| user_login_succeeded | A user successfully logged in to their Asana account. |
| user_login_failed | A user failed to log in to their Asana account. |
| user_logged_out | A user logged out of their Asana account. |
 
### User Updates
 
All user events operate on the _User_ resource type.
 
| Event Type | Description |
|------------|---------------|
| user_invited | A new user was invited to or auto-joined the workspace. |
| user_deprovisioned | A user was removed from the workspace. |
| user_reprovisioned | A deprovisioned user was added back to the workspace. |
| user_forgot_password_started | A user requested a forgot password link. |
| user_password_reset | A user's password was reset. |
| user_password_changed | A user changed their password. |
| user_two_factor_auth_enabled | A user’s two factor authentication was enabled. |
| user_two_factor_auth_disabled | A user’s two factor authentication was disabled. |
 
### Admin Settings
All admin settings events operate on the _Workspace_ resource type except for `workspace_announcement_created` and `workspace_announcement_removed` that operate on the _Workspace Announcement_ resource type.

| Event Type | Description |
|------------|---------------|
| workspace_google_sso_settings_changed                | The workspace's Google SSO settings were changed. |
| workspace_saml_settings_changed                      | The workspace's SAML settings were changed. |
| workspace_saml_url_changed                           | The workspace's SAML url was changed. |
| workspace_password_requirements_changed              | The workspace's password strength requirements were changed. |
| workspace_force_password_reset                       | All users in the workspace were forced to reset their password. |
| workspace_guest_invite_permissions_changed           | The workspace’s guest invite permissions were changed. |
| workspace_file_attachment_options_changed            | File attachment options were enabled or disabled for the workspace. |
| workspace_default_team_privacy_settings_changed      | The workspace's default team privacy settings were changed. |
| workspace_wide_reporting_enabled                     | Workspace wide reporting was enabled. |
| workspace_wide_reporting_disabled                    | Workspace wide reporting was disabled. |
| workspace_associated_email_domain_added              | An email domain was added to the workspace. |
| workspace_associated_email_domain_removed            | An email domain was removed from the workspace. |
| workspace_require_two_factor_auth_enabled            | Two factor authentication was set as required for the workspace. |
| workspace_require_two_factor_auth_disabled           | Two factor authentication was set as not required for the workspace. |
| workspace_view_links_enabled                         | Read-only link sharing was enabled for the workspace. |
| workspace_view_links_disabled                        | Read-only link sharing was disabled for the workspace. |
| workspace_default_session_duration_changed           | The workspace's default session duration was changed. |
| workspace_announcement_created                       | An announcement was created and published in the workspace. |
| workspace_announcement_removed                       | An announcement was removed from the workspace. |
| workspace_form_link_authentication_required_enabled  | For this workspace, form link authentication was set as required, so all viewers need to authenticate with Asana in order to open forms links. |
| workspace_form_link_authentication_required_disabled | For this workspace, form link authentication was set as not required, however authentication may still be required for individual links. Some viewers may not need to authenticate with Asana in order to open forms links. |
| workspace_personal_access_token_enabled              | The workspace's global personal access token setting was enabled.  |
| workspace_personal_access_token_disabled             | The workspace's global personal access token setting was disabled. |
| workspace_app_admin_approval_setting_changed         | The workspace's specific app approval setting was changed.     |
| workspace_require_app_approvals_of_type_changed      | The workspace's global app approval setting was changed. |
| workspace_form_is_embeddable_forms_enabled           | Embeddable forms is enabled in admin |
| workspace_form_is_embeddable_forms_disabled          | Embeddable forms is disabled in admin |
### Roles
 
All role events operate on the _User_ resource type.
 
| Event Type | Description |
|------------|---------------|
| user_workspace_admin_role_changed | A user’s workspace admin role was changed. |
| user_division_admin_role_changed  | A user’s division admin role was changed. |
 
### Content Export
 
| Event Type | Resource Type | Description |
|------------|---------------|-------------|
| workspace_export_started | Workspace | An [organization export](https://asana.com/guide/help/premium/admin-console#gl-domain) was started. |
| search_report_export_started   | Search | A search report CSV export was started. |
| workspace_teams_export_started | Workspace | A team CSV export for the workspace was started. |
| division_teams_export_started  | Division | A team CSV export for the division was started. |
| workspace_members_export_started | Workspace | A member CSV export was started for the workspace. |
| project_csv_export_started | Project | A project CSV export was started. |
| attachment_downloaded | Attachment | An attachment was downloaded. |
 
 
### Access Control
 
| Event Type | Resource Type | Description |
|------------|---------------|-------------|
| project_share_link_enabled    | Project | A link allowing workspace members and auto-join users to join a project was enabled. |
| project_share_link_disabled   | Project | A link allowing workspace members and auto-join users to join a project was disabled. |
| project_view_link_enabled     | Project | A read-only link for a project was enabled. |
| project_view_link_disabled    | Project | A read-only link for a project was disabled. |
| team_privacy_settings_changed | Team | A team’s privacy settings were changed. |
| team_member_added             | Team | A user was added to a team. |
| team_member_removed           | Team | A user was removed from a team. |
| project_member_added          | Project | A user was added to a project. |
| project_member_removed        | Project | A user was removed from a project. |
| project_privacy_settings_changed | Project | A project’s privacy settings were changed. |
 
 
### Apps
 
| Event Type | Resource Type | Description |
|------------|---------------|-------------|
| team_harvest_integration_enabled      | Team | The Harvest time tracking integration was enabled for a team. |
| team_harvest_integration_disabled     | Team | The Harvest time tracking integration was disabled for a team. |
| user_app_authorized                   | User | An app was authorized by a user in the workspace. |
| user_app_revoked                      | User | An app was deauthorized by a user in the workspace. |
| user_personal_access_token_authorized | User | A new personal access token was authorized by the user in the workspace. |
| user_personal_access_token_revoked    | User | A personal access token was deauthorized by the user in the workspace. |
| service_account_created               | User | A service account was created or reprovisioned. |
| service_account_deleted               | User | A service account was deleted. |
| service_account_name_changed          | User | A service account’s name was changed. |
 
### Creation
 
| Event Type | Resource Type | Description |
|------------|---------------|-------------|
| team_created | Team | A new team was created. |
| attachment_uploaded | Attachment | An attachment was uploaded. |
 
### Deletion
 
| Event Type | Resource Type | Description |
|------------|---------------|-------------|
| task_deleted             | Task | A task was deleted. |
| task_permanently_deleted | Task | A task was permanently deleted. |
| task_undeleted           | Task | A task was undeleted. |
| project_deleted          | Project | A project was deleted. |
| project_undeleted        | Project | A project was undeleted. |
| portfolio_deleted        | Portfolio | A portfolio was deleted. |
| portfolio_undeleted      | Portfolio | A portfolio was undeleted. |
| goal_deleted             | Goal | A goal was deleted. |
| goal_undeleted           | Goal | A goal was undeleted. |
| custom_field_deleted     | Custom Field | A custom field was deleted. |
| custom_field_undeleted   | Custom Field | A custom field was undeleted. |
| message_deleted          | Message | A message was deleted. |
| message_permanently_deleted        | Message | A message was permanently deleted. |
| message_undeleted        | Message | A message was undeleted. |
| team_deleted             | Team | A team was deleted. |
| team_undeleted           | Team | A team was undeleted. |
| attachment_deleted       | Attachment | An attachment was deleted. |
| attachment_undeleted     | Attachment | An attachment was undeleted. |
| comment_deleted          | Story | A comment was deleted. |
| comment_undeleted        | Story | A comment was undeleted. |
| status_update_deleted        | Status Update | A status update was deleted. |
| status_update_permanently_deleted        | Status Update | A status update was permanently deleted. |
| status_update_undeleted        | Status Update | A status update was undeleted. |
| task_template_deleted    | Task Template | A task template was deleted. |
| task_template_undeleted  | Task Template | A task template was undeleted. |
| project_template_deleted | Project Template | A project template was deleted. |
| project_template_undeleted    | Project Template | A project template was undeleted. |

</section>
