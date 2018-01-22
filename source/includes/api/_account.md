## account object

### Basic Attributes

####id

A unique identifier for this account.

####external_id

The external identifier for this account.
    
**NOTE:** This field is only used or returned when external ids are enabled for the site.

####first_name

####last_name

####surname

Currently unused.

####middle_name

Currently unused.

####screen_name

####title

Currently unused.

####address

####address_second

Second address line

####city

####state

Full name of state/province/subdivision.

####zip

Postal code.

####region

Currently unused.

####country

####email

Email address or dummy login email address. If a dummy address or email is being returned from this address, the bad_email attribute will be true.

####bad_email

Boolean; true if the email address is a dummy login email address or email to the email address is being returned.

####home_phone

####mobile_phone

####other_phone

Work/other phone.

####pager

####fax

####url

Web/blog address.

####timezone

Timezone for this account.

####profile_type

profile type identifier for this account.

####org_hold

Boolean. Indicates whether this account is on hold.

####org_pending

Pending code indicating on-boarding status of this account. Site configurable pending code labels default to:

* "*0*" Current

* "*1*" Pending Registration

* "*2*" In-Process

* "*3*" Wait-Listed

* "*4*" Temp/Seasonal Hold

* "*5*" Stop Process

* "*6*" Made Contact/Msg

* "*7*" Awaiting Reregistration

System-defined pending codes are:

* "*1001*" Expired Certification

### Extended Attributes

(not all attributes are available for all organizations)

####external_id

External ID for this account, if this organization uses external IDs.

####notification_preference

Notification preference for this account. Valid values:

* "*0*" None

* "*1*" Email

####get_reminders

Boolean. Enables receiving of reminder messages.

####get_confirmations

Boolean. Enables receiving of confirmation messages.

####digest_type

Type of notification digest for this account. Valid values:

* "*0*" Send Immediately (no digest)

* "*1*" Send Daily

* "*2*" Send Weekly

####level

User level in the organization

* "*2*" member

* "*3*" coordinator

* "*4*" manager

####user_type

Will be `admin` if a super-user, `user` otherwise.

####overtime_exempt

Boolean.

####pay_rate

####flat_rate

####start_date

####paycode

Paycode identifier

####pay_rate_overrides

Boolean. If false, indicates that for this account, pay_rate does not override the rate associated with the account's paycode.

####seniority

Boolean.

####seniority_rank

Seniority rank from 1 to 999999999, 1 being the highest rank.

####seniority_date

Seniority date.

####profile_updated

Time profile information for this account was last updated

####updated

Time non-profile information for this account was last updated

### account.create

<script>tryit('account.create')</script>

Creates a new account record.

Required Parameters: first_name, last_name, and either email or the bad_email flag set true.

Optional Parameters: Other attributes of a account object may be specified. In addition, the following attributes may be specified:

####exists_ok

If the specified email address is already in use for an account on Shiftboard for some other Organization, the specified account attributes are not allowed to overwrite the existing account information. Normally, an error is returned indicating that the email address was already in use. If `exists_ok` is true, the existing account is added to the current organization's accounts instead. In this case, only email and per-organization attributes (`external_id` and `profile_type`) and options (`add_default_workgroups` and `account.sendWelcomeLetter`) are used; any other attributes specified will be discarded (including `temp_password` and `openid`).

####add_default_workgroups

If true, the new account will be added to any workgroups marked as organization default workgroups.

####temp_password

Normally, a random password is generated for the new account which is only revealed to the new user in the welcome email. If specified, temp_password is used instead.

####openid

An openid url that will allow authentication to this account via

https://www.shiftboard.com/login/openid?http...

where http... is the designated url, URI-escaped. E.g. for openid http://www.example.com/, use the login link

https://www.shiftboard.com/login/openid?http%3A%2F%2Fwww.example.com%2F

If this openid is already in use for any account in Shiftboard, an error will be returned.

Response: On success, an `id` attribute will provide the identifier for the new account. If `exists_ok` was specified, an `existed` boolean attribute is returned indicating whether the email address was already in use for an account on Shiftboard.

### account.delete

<script>tryit('account.delete')</script>

Deletes an account record.

Required parameters:  `id` or `external_id`

Optional boolean parameter: `notify` (defaults to false) to indicate a notification email should be sent to the owner of the deleted account.

Response: On success, empty results will be returned.

### account.deleteDocument

<script>tryit('account.deleteDocument')</script> 

Deletes an account document for a given account.

Required parameters:  `id` or `external_id` and `document_number`

Response: On success, empty results will be returned.

### account.deleteImage

<script>tryit('account.deleteImage')</script> 

Deletes the user image for a given account.

Required parameters:  `id` or `external_id`

Response: On success, empty results will be returned.

### account.deleteResume

<script>tryit('account.deleteResume')</script>

Deletes the resume for a given account.'

Required parameters:  `id` or `external_id`

Response: On success, empty results will be returned.

### account.get

<script>tryit('account.get')</script> 

Returns information about a single account.

Required parameters:  `id` or `external_id`

Optional parameters

####extended

Boolean; if specified and true or user_actions is true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned.

####image

Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the account's user image or null if no image is available.

####image_expiration

Specifies the valid lifetime of the returned URL in seconds; default 300, maximum 604800 (1 week).

####qrcode

Boolean; if specified and true, the results returned will include a qrcode attribute giving the data for generating the account's qrcode.

####timeclock_status

Boolean; if specified and true, the results returned will include a clocked_in attribute indicating that the account is currently clocked in and a can_clock_in_out attribute indicating whether there is authorization to clock this account in or out.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions should be presented to the user to be performed on this account:

####add_availability

####delete_availability

####show_availability

Attributes may not be returned for applications that are not enabled for this user/organization.

The response results will be an account object containing basic or basic and extended account fields.

### account.getDocument

<script>tryit('account.getDocument')</script> 

Returns an account document for a single account.

Required parameters:  `id` or `external_id` and `document_number`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account document.

### account.getImage

<script>tryit('account.getImage')</script> 

Returns image information about a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account image.

### account.getResume

<script>tryit('account.getResume')</script> 

Returns resume information about a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account resume.

### account.list

<script>tryit('account.list')</script> 

Returns information about accounts. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####select

An object specifying selection criteria for this request. Allowed criteria are:

####account

A single account identifier or an array of identifiers to select.

####email

A single email address or an array of them to select.

####external_id

A single external_id or an array of them to select, if used by the site.

####profile_type

A profile type identifier for which to select accounts.

####org_hold

Hold status (boolean)

####org_pending

On-boarding status

####search

A generic search string; select accounts containing this string in any of: first_name, last_name, first and last names combined, screen name, or, if used by the site, external_id.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each account.

####image

Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the account's user image or null if no image is available.

####image_expiration

Specifies the valid lifetime of the returned URL in seconds; default 300, maximum 604800 (1 week).

####qrcode

Boolean; if specified and true, the results returned will include a qrcode attribute giving the data for generating the account's qrcode.

####sort

A single sort criterion or an array of criteria in order from major to minor. Each criterion is either an attribute name (one of `first_name`, `last_name`, or `id`) or an object with two attributes, `name` (one of the supported sort attribute names) and `direction` (`asc` or `desc`).

####timeclock_status

Boolean; if specified and true, the results returned will include a clocked_in attribute indicating that the account is currently clocked in and a can_clock_in_out attribute indicating whether there is authorization to clock this account in or out.

The response results `accounts` attribute will be an array of the current page of accounts. Each element of the array will be an account object containing basic or basic and extended account fields.

### account.listByWorkgroup

<script>tryit('account.listByWorkgroup')</script> 

Returns information about accounts with membership in a workgroup. Uses [pagination](#pagination).

Required parameters: `select` object with a `workgroup` attribute identifying the workgroup whose members should be returned. E.g. `{select:{workgroup:12345}}`.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each account.

The response results `members` attribute will be an array of the current page of members. Each element of the array will be a member object.

Currently, this method only returns members with `org_hold` false and org_pending code "0" (Current).

### account.listMemberships

<script>tryit('account.listMemberships')</script> 

Returns information about workgroups to which a member belongs. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####select

An object specifying selection criteria for this request:

####member

The member for which to select workgroups; defaults to the current user.

####external_member

The member for which to select workgroups, identified by their `external_id`; defaults to the current user.

####search

A generic search string; select workgroups containing this string in name or code.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroups attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroups.

The response results `workgroups` attribute will be an array of the current page of selected workgroups. Each element of the array will be a workgroup object containing basic workgroup fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroups` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### account.listOpenids

<script>tryit('account.listOpenids')</script> 

Returns information about account_openid objects for a given account.

Required parameters:  `account` or `external_account`

The response results `account_openids` attribute will be an array of the account_openid objects for the designated account.

### account.listUpdated

<script>tryit('account.listUpdated')</script> 

Returns information about accounts created or updated since a given date. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each account.

####select

An object specifying selection criteria for this request. Note that updated_since will have a default value if not specified. The available criteria include all [account.list](#account-list) selection criteria with the addition of:

####updated_since

A system.timestamp previously returned by the [system.timestamp](#system-timestamp) method. Only accounts updated since this date will be selected. Defaults to 24 hours ago. If more than 30 days ago, only accounts updated in the last 30 days will be selected.

####profile_update

If specified and true, report accounts whose profile information has been updated. Otherwise, report only accounts whose non-profile information has been updated.

The response results `accounts` attribute will be an array of the current page of accounts. Each element of the array will be an account object containing basic account fields.

### account.resetPassword

<script>tryit('account.resetPassword')</script> 

Resets the password for an account to a randomly chosen value and sends the new password to the account's email address. If the account has no email address or is not receiving email, no error will result and the password will be changed.

Required parameters: `account` or `external_account`, a single account identifier or an array of identifiers of accounts for which to reset the password.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

Note that this method may be deprecated in the future and replaced with a method to initiate a user-controlled password reset process.

### account.self

<script>tryit('account.self')</script> 

Returns information about the account associated with the API key making the request.

Optional parameters:

####extended

Boolean; if specified and true or user_actions is true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned.

####image

Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the account's user image or null if no image is available.

####image_expiration

Specifies the valid lifetime of the returned URL in seconds; default 300, maximum 604800 (1 week).

####qrcode

Boolean; if specified and true, the results returned will include a qrcode attribute giving the data for generating the account's qrcode.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions should be presented to the user to be performed on this account:

####add_availability

####delete_availability

####show_availability

Attributes may not be returned for applications that are not enabled for this user/organization.

####user_permissions

An array of named permissions to check; if specified, a `user_permissions` object will be returned with the given named permissions as attributes and Boolean values indicating whether each named permission is allowed.

The response results will be an account object containing basic or basic and extended account fields.

If the account is a manager of the organization or one or more workgroups, the additional attribute workgroup_manager will be true. If the account is a coordinator of one or more workgroups, the additional attribute workgroup_coordinator will be true.

If user_actions were requested, a `user_actions` attribute will also be returned.

### account.sendPassword

<script>tryit('account.sendPassword')</script> 

Sends a password reset link for an account to the account's email address. If the account has no email address or is not receiving email, no error will result.

Required parameters: `account` or `external_account`, a single account identifier or an array of identifiers of accounts for which to send the password reset.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

### account.sendWelcomeLetter

<script>tryit('account.sendWelcomeLetter')</script>

Send a welcome email to the account's email address, giving them their password.  If the account has no email address or is not receiving email, no error will result.

Required parameters: `account` or `external_account`, a single account identifier or an array of identifiers of accounts for which to send a welcome letter.

####account

A single account identifier or an array of identifiers to select.
No more than 10000 accounts may be specified in a single request.

####external_account

A single external ID (or an array of them if used by the site).
No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

### account.update

<script>tryit('account.update')</script> 

Updates an account object.

Required parameters:  `id` or `external_id`.

Other account object attributes may be specified.  Updating another account's email address or notification options is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### account.updateDocument

<script>tryit('account.updateDocument')</script> 

Updates an account document for a single account.

Required parameters:  `id` or `external_id` and `document_number`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated document may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateImage

<script>tryit('account.updateImage')</script> 

Updates the user image for a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated user image may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateResume

<script>tryit('account.updateResume')</script> 

Updates the resume for a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated resume may be POSTed.

When posting to the returned url, one of the following content-types should be specified:

* application/vnd.openxmlformats-officedocument.wordprocessingml.document

* application/msword

* text/plain

* text/rtf

* application/pdf

* application/vnd.ms-office

Upon success, the request to the url will return an HTTP 204 status code.

