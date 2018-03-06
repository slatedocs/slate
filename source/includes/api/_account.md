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
* "*1002*" Documents Missing
* "*1003*" Documents Verified

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

> Request example:

```JSON
{
   "bad_email" : 1,
   "temp_password" : "test_password",
   "first_name" : "Joe",
   "last_name" : "Tester"
}
```

> Response example:

```JSON
{
   "seconds" : "0.482992",
   "jsonrpc" : "2.0",
   "id" : "30",
   "result" : {
      "id" : 952
   }
}
```

<span class="tryit" id="account-create-tryit"></span>
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

> Request example:

```JSON
{
   "id" : "947"
}
```

> Response example:

```JSON
{
   "seconds" : "0.173293",
   "jsonrpc" : "2.0",
   "id" : "49",
   "result" : {}
}
```

<span class="tryit" id="account-delete-tryit"></span>
Deletes an account record.

#### Required parameters:  `id` or `external_id`

#### Optional parameters:

##### `unconfirm_future_shifts`: Specify true if, when `org_hold` is being changed to true and/or `org_pending` is being changed to a non-0 value, shifts on or after today for this account should be unconfirmed.

##### `unpublish_future_shifts`: Specify true if shifts being unconfirmed should also be unpublished.

##### `notify`: Defaults to false. Specify true to indicate a notification email should be sent to the owner of the deleted account.

Response: On success, empty results will be returned.

### account.deleteDocument

<span class="tryit" id="account-deletedocument-tryit"></span>
Deletes an account document for a given account.

Required parameters:  `id` or `external_id` and `document_number`

Response: On success, empty results will be returned.

### account.deleteImage

<span class="tryit" id="account-deleteimage-tryit"></span>
Deletes the user image for a given account.

Required parameters:  `id` or `external_id`

Response: On success, empty results will be returned.

### account.deleteResume

<span class="tryit" id="account-deleteresume-tryit"></span>
Deletes the resume for a given account.'

Required parameters:  `id` or `external_id`

Response: On success, empty results will be returned.

### account.get

> Request example:

```JSON
{
   "id" : 911
}
```

> Response example:

```JSON
{
   "seconds" : "0.057072",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "home_phone" : "",
      "bad_email" : false,
      "state" : "",
      "last_name" : "Tester",
      "email" : "test911@93.julian.example.com",
      "city" : "",
      "fax" : "",
      "url" : "",
      "address" : "",
      "id" : "911",
      "country" : "",
      "org_hold" : false,
      "timezone" : "",
      "middle_name" : "",
      "region" : "",
      "surname" : "",
      "profile_type" : "1",
      "other_phone" : "",
      "zip" : "",
      "org_pending" : "0",
      "pager" : "",
      "mobile_phone" : "",
      "title" : "",
      "first_name" : "Joe"
   }
}
```

<span class="tryit" id="account-get-tryit"></span>
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

<span class="tryit" id="account-getdocument-tryit"></span>
Returns an account document for a single account.

Required parameters:  `id` or `external_id` and `document_number`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account document.

### account.getImage

> Request example:

```JSON
{
   "expiration" : 600,
   "id" : 911
}
```

> Response example:

```JSON
{
   "seconds" : "0.057072",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "url" : "https://www.shiftboard.com/servola/fetch.cgi?ss=269071;id=269119;expires=1355314332;signature=k_dWIcZ9Mk3HPSzkHgWvtOghFj8"
   }
}
```

<span class="tryit" id="account-getimage-tryit"></span>
Returns image information about a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account image.

### account.getResume

<span class="tryit" id="account-getresume-tryit"></span>
Returns resume information about a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account resume.

### account.list

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.015316",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "accounts" : [
         {
            "home_phone" : "18007467531",
            "bad_email" : false,
            "state" : "Washington",
            "last_name" : "Testing 2",
            "email" : "132997@servola.org",
            "city" : "Seattle",
            "fax" : "",
            "url" : "",
            "address" : "720 3rd Ave, Suite 2200",
            "id" : "2",
            "country" : "United States",
            "org_hold" : false,
            "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
            "region" : "",
            "middle_name" : "",
            "profile_type" : "1",
            "surname" : "",
            "other_phone" : "",
            "zip" : "98104",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Auto"
         }
      ]
   }
}
```

<span class="tryit" id="account-list-tryit"></span>
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

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226094"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.045885",
   "jsonrpc" : "2.0",
   "id" : "35",
   "result" : {
      "members" : [
         {
            "home_phone" : "18007467531",
            "bad_email" : false,
            "state" : "Washington",
            "last_name" : "Testing 1",
            "email" : "132995@servola.org",
            "city" : "Seattle",
            "fax" : "",
            "url" : "",
            "address" : "720 3rd Ave, Suite 2200",
            "id" : "2",
            "country" : "United States",
            "org_hold" : false,
            "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
            "region" : "",
            "middle_name" : "",
            "profile_type" : "1",
            "surname" : "",
            "other_phone" : "",
            "zip" : "98104",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Auto"
         },
         {
            "home_phone" : "",
            "bad_email" : false,
            "state" : "",
            "last_name" : "Tester",
            "email" : "test949@69.julian.example.com",
            "city" : "",
            "fax" : "",
            "url" : "",
            "address" : "",
            "id" : "949",
            "country" : "",
            "org_hold" : false,
            "timezone" : "",
            "middle_name" : "",
            "region" : "",
            "surname" : "",
            "profile_type" : "1",
            "other_phone" : "",
            "zip" : "",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Joe"
         },
         {
            "home_phone" : "",
            "bad_email" : false,
            "state" : "",
            "last_name" : "Tester",
            "email" : "test950@69.julian.example.com",
            "city" : "",
            "fax" : "",
            "url" : "",
            "address" : "",
            "id" : "950",
            "country" : "",
            "org_hold" : false,
            "timezone" : "",
            "middle_name" : "",
            "region" : "",
            "surname" : "",
            "profile_type" : "1",
            "other_phone" : "",
            "zip" : "",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Joe"
         },
         {
            "home_phone" : "",
            "bad_email" : false,
            "state" : "",
            "last_name" : "Tester",
            "email" : "test951@69.julian.example.com",
            "city" : "",
            "fax" : "",
            "url" : "",
            "address" : "",
            "id" : "951",
            "country" : "",
            "org_hold" : false,
            "timezone" : "",
            "middle_name" : "",
            "region" : "",
            "surname" : "",
            "profile_type" : "1",
            "other_phone" : "",
            "zip" : "",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Joe"
         }
      ],
      "count" : "4",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="account-listbyworkgroup-tryit"></span>
Returns information about accounts with membership in a workgroup. Uses [pagination](#pagination).

Required parameters: `select` object with a `workgroup` attribute identifying the workgroup whose members should be returned. E.g. `{select:{workgroup:12345}}`.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each account.

The response results `members` attribute will be an array of the current page of members. Each element of the array will be a member object.

Currently, this method only returns members with `org_hold` false and org_pending code "0" (Current).

### account.listMemberships

> Request example:

```JSON
{
   "select" : {
      "member" : 950
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.058298",
   "jsonrpc" : "2.0",
   "id" : "36",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "workgroups" : [
         {
            "zip" : "60616",
            "name" : "Test Workgroup 226094",
            "id" : "226094",
            "code" : "A001"
         }
      ]
   }
}
```

<span class="tryit" id="account-listmemberships-tryit"></span>
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

> Request example:

```JSON
{
   "account" : 918
}
```

> Response example:

```JSON
{
   "seconds" : "0.050461",
   "jsonrpc" : "2.0",
   "id" : "44",
   "result" : {
      "count" : 1,
      "account_openids" : [
         {
            "openid" : "http://openid4.example.com/",
            "id" : "785"
         }
      ]
   }
}
```

<span class="tryit" id="account-listopenids-tryit"></span>
Returns information about account_openid objects for a given account.

Required parameters:  `account` or `external_account`

The response results `account_openids` attribute will be an array of the account_openid objects for the designated account.

### account.listUpdated

> Request example:

```JSON
{
   "select" : {
      "updated_since" : 1284655937
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.057788",
   "jsonrpc" : "2.0",
   "id" : "19",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "accounts" : [
         {
            "home_phone" : "",
            "bad_email" : false,
            "state" : "",
            "last_name" : "Tester",
            "email" : "test913@93.julian.example.com",
            "city" : "",
            "fax" : "",
            "url" : "",
            "address" : "",
            "id" : "913",
            "country" : "",
            "org_hold" : false,
            "timezone" : "",
            "middle_name" : "",
            "region" : "",
            "surname" : "",
            "profile_type" : "1",
            "other_phone" : "",
            "zip" : "",
            "org_pending" : "0",
            "pager" : "",
            "mobile_phone" : "",
            "title" : "",
            "first_name" : "Updated"
         }
      ]
   }
}
```

<span class="tryit" id="account-listupdated-tryit"></span>
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

> Request example:

```JSON
{
   "account" : 945
}
```

> Response example:

```JSON
{
   "seconds" : "0.060454",
   "jsonrpc" : "2.0",
   "id" : "6",
   "result" : {}
}
```

<span class="tryit" id="account-resetpassword-tryit"></span>
Resets the password for an account to a randomly chosen value and sends the new password to the account's email address. If the account has no email address or is not receiving email, no error will result and the password will be changed.

Required parameters: `account` or `external_account`, a single account identifier or an array of identifiers of accounts for which to reset the password.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

Note that this method may be deprecated in the future and replaced with a method to initiate a user-controlled password reset process.

### account.self

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.04608",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {
      "home_phone" : "18007467531",
      "bad_email" : false,
      "state" : "Washington",
      "last_name" : "Testing 1",
      "email" : "132995@servola.org",
      "city" : "Seattle",
      "fax" : "",
      "url" : "",
      "address" : "720 3rd Ave, Suite 2200",
      "id" : "2",
      "country" : "United States",
      "org_hold" : false,
      "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
      "region" : "",
      "middle_name" : "",
      "profile_type" : "1",
      "surname" : "",
      "other_phone" : "",
      "zip" : "98104",
      "org_pending" : "0",
      "pager" : "",
      "mobile_phone" : "",
      "title" : "",
      "first_name" : "Auto"
   }
}
```

<span class="tryit" id="account-self-tryit"></span>
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

> Request example:

```JSON
{
   "account" : 944
}
```

> Response example:

```JSON
{
   "seconds" : "0.075872",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {}
}
```

<span class="tryit" id="account-sendpassword-tryit"></span>
Sends a password reset link for an account to the account's email address. If the account has no email address or is not receiving email, no error will result.

Required parameters: `account` or `external_account`, a single account identifier or an array of identifiers of accounts for which to send the password reset.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

### account.sendWelcomeLetter

> Request example:

```JSON
{
   "account" : 917
}
```

> Response example:

```JSON
{
   "seconds" : "0.081154",
   "jsonrpc" : "2.0",
   "id" : "40",
   "result" : {}
}
```

<span class="tryit" id="account-sendwelcomeletter-tryit"></span>
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

> Request example:

```JSON
{
   "email" : "test952@69.julian.example.com",
   "bad_email" : 0,
   "notification_preference" : 1,
   "id" : 952
}
```

> Response example:

```JSON
{
   "seconds" : "0.157625",
   "jsonrpc" : "2.0",
   "id" : "31",
   "result" : {}
}
```

<span class="tryit" id="account-update-tryit"></span>
Updates an account object.

#### Required parameters:  `id` or `external_id`.

#### Optional parameters:

##### `unconfirm_future_shifts`: Specify true if, when `org_hold` is being changed to true and/or `org_pending` is being changed to a non-0 value, shifts on or after today for this account should be unconfirmed.

##### `unpublish_future_shifts`: Specify true if shifts being unconfirmed should also be unpublished.

Other account object attributes may be specified.

**NOTE:** Updating another account's email address or notification options is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### account.updateDocument

<span class="tryit" id="account-updatedocument-tryit"></span>
Updates an account document for a single account.

Required parameters:  `id` or `external_id` and `document_number`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated document may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateImage

<span class="tryit" id="account-updateimage-tryit"></span>
Updates the user image for a single account.

Required parameters:  `id` or `external_id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated user image may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateResume

<span class="tryit" id="account-updateresume-tryit"></span>
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

