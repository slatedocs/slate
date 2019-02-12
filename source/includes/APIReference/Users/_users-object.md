## The User Object
> **Example**: User Object

```json
{
  "id": 317044,
  "first_name": "Bob",
  "last_name": "Jones",
  "group_id": 6908,
  "active": true,
  "employee_number": 10,
  "salaried": false,
  "exempt": false,
  "username": "bjones",
  "email": "bob_jones@anymail.com",
  "email_verified": false,
  "payroll_id": "SC010",
  "mobile_number": "2085551234",
  "hire_date": "2018-07-02",
  "term_date": "0000-00-00",
  "last_modified": "2019-02-09T17:59:06+00:00",
  "last_active": "2019-02-09T18:45:39+00:00",
  "created": "2018-10-04T02:25:38+00:00",
  "client_url": "spudsfunpark",
  "company_name": "Spuds Fun Park",
  "profile_image_url": "https://www.gravatar.com/avatar/6be49c2065c016dcdfcd26d1da111e9f",
  "pto_balances": {
    "2913946": 0,
    "2913948": 0,
    "2913950": 0
  },
  "submitted_to": "2000-01-01",
  "approved_to": "2000-01-01",
  "manager_of_group_ids": [],
  "require_password_change": false,
  "pay_rate": 8.26,
  "pay_interval": "hour",
  "permissions": {
    "admin": false,
    "mobile": true,
    "status_box": false,
    "reports": false,
    "manage_timesheets": false,
    "manage_authorization": false,
    "manage_users": false,
    "manage_my_timesheets": false,
    "manage_jobcodes": false,
    "pin_login": true,
    "approve_timesheets": false,
    "manage_schedules": false,
    "external_access": false,
    "manage_my_schedule": false,
    "manage_company_schedules": false,
    "view_company_schedules": false,
    "view_group_schedules": false,
    "manage_no_schedules": false,
    "view_my_schedules": false
  },
  "customfields": ""
}
```
### Read-Only Properties
_The following properties are returned in the response to a User Retreive operation but are **not** allowed to be set in User Create and Update operations._

Name | Type | Format | Description
---- | ---- | ------ | -----------
`id` | _Int_ | | Unique identifier of this user.
`last_modified` | _String_ | ISO8601 | Date/time when this user was last modified.
`last_active` | _String_ | ISO8601 | Date/time when this user last performed any action within TSheets.
`created` | _String_ | ISO8601 | Date/time when this user was created.
`client_url` | _String_ |  | Client account url identifier associated with this user.
`company_name` | _String_ | | Client account name identifier associated with the user.
`profile_image_url` | _String_ | URL | Url identifier associated with this user's profile image.
`pto_balances` | _Object_ | Map: String -> Int |  List of jobcode identifiers and their respective PTO balances for this user (in seconds). Jobcode information for PTO Jobcodes will be supplied in `supplemental_data`.
`manager_of_group_ids` | _Int Array_ | | The group ids that this user manages.
`pay_rate` | _Float_ | | The rate of pay associated with this user.
`pay_interval` | _String Enum_ | 'hour' or 'year' | The timeframe to which this user's pay rate applies.

### Write-Only Properties
_The following properties are allowed to be set in User Create and Update operations but are **not** returned in the response to a User Retrieve operation._

Name |  Type | Format | Description
---- |  ---- | ------ | -----------
`password` | _String_ | | May only be set when editing the currently authenticated user (i.e. you may only edit your own password).
`login_pin` | _Int_ | 4 digits | Used for logging into a Kiosk or similar.

### Read-Write Properties
_The following properties are allowed to be set in User Create and Update operations and are returned in the response to a User Retrieve operation._

Name |  Type | Format | Description
---- |  ---- | ------ | -----------
`first_name` | _String_ | | First name of the user.
`last_name` | _String_ | | Last name of the user.
`group_id` | _Int_ | | Id of the group this user belongs to.
`active` | _Boolean_ | | If false, this user is considered archived.
`employee_number` | _Int_ | | Unique number associated with this user, for external use.
`salaried` | _Boolean_ | | Indicates whether or not the user is salaried.
`exempt` | _Boolean_ | | Indicates whether or not the user is eligible for overtime pay.
`username` | _String_ | | Username associated with this user.
`email` | _String_ | | Email address associated with this user.
`email_verified` | _Boolean_ | | Indicates whether or not the email address has been confirmed by the user.
`payroll_id` | _String_ | | Unique company wide string associated with this user. Usually used for linking with external systems.
`hire_date` | _String_ | YYYY-MM-DD | Date on which this user was hired.
`term_date` |  _String_ | YYYY-MM-DD | Date on which this user was terminated.
`mobile_number` |  _String_ | | Mobile phone number associated with this user.
`submitted_to` | _String_ | YYYY-MM-DD | The latest date this user has submitted timesheets up to (if approvals addon is installed).
`approved_to` |  _String_ | YYYY-MM-DD | The latest date this user has had timesheets approved to (if approvals addon is installed). 
`require_password_change` | _Boolean_ | | If true, this user will be required to change their password on their next login.
`permissions` | _Object_ | Map: String -> Boolean | The [permission settings](#user-permissions) that apply to this user.
`custom_fields` | _Object_ | Map: String -> String | [Customfield](#the-custom-field-object) items that are associated with the user.

### User Permissions
The rights assignable to an individual user. All properties are of type _**Boolean**_.

Name | Default | Description
---- | ------- | -----------
`admin` | false | Administrator, can perform any changes on the account.
`mobile` | true | Allowed to use mobile devices to record time.
`status_box` | false | Able to view the list of users currently working for the company.
`reports` | false | Able to run/view all reports for the company.
`manage_timesheets` | false | Able to create/edit/delete timesheets for anyone in the company.
`manage_authorization` | false | Able to manage computer authorization for the company.
`manage_users` | false | Able to create/edit/delete users, groups, and managers for the entire company.
`manage_my_timesheets` | false | Able to completely manage own timesheets.
`manage_jobcodes` | false | Able to create/edit/delete jobcodes and custom field items for the entire company.
`pin_login` | false | Able to login to apps via PIN.
`approve_timesheets` | false | Able to run approval reports and approve time for all employees.
`manage_schedules` | false | Able to create/edit/delete events within the schedule for the groups that the user can manage.
`manage_my_schedule` | false | Able to create/edit/delete events within the schedule for only themselves.
`manage_company_schedules` | false | Able to create/edit/delete events within the schedule for any user in the company.
`manage_no_schedule` | false | Not able to create/edit/delete events within the schedule for any user.
`view_company_schedules` | false | Able to view published events within the schedule for any user in the company.
`view_group_schedules` | false | Able to view published events within the schedule for the groups that the user is a member of.
`view_my_schedules` | false | Able to view published events within the schedule for themselves.

 <aside class="notice">
The <code>submitted_to</code> property is <i><b>read only</b></i> unless the account setting <i>approvals->settings->employee_approval = 1</i>. See <a href="#effective-settings">Effective Settings</a> documentation for details.
</aside>

 <aside class="notice">
When updating the <code>approved_to</code> date, if the value is greater than the <code>submitted_to</code> date for this user, both properties will be updated. This is the equivalent of a manager/admin submitting time on a user's behalf.
</aside>

 <aside class="notice">
The following fields are considered <i>private</i> and are exposed only to managers and admins:
  <code>employee_number</code>, <code>salaried</code>, <code>exempt</code>, <code>username</code>, <code>payroll_id</code>, <code>hire_date</code>,
  <code>term_date</code>, <code>mobile_number</code>, <code>submitted_to</code>, <code>approved_to</code>, <code>permissions</code> & <code>customfields</code>
</aside>

 <aside class="warning">
 The following fields are <i><b>deprecated</b></i> for User Create and Update operations:
 <code>require_password_change</code> & <code>password</code>
 </aside>

