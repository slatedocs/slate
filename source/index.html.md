---
title: Shiftboard Web Services API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://github.com/shiftboard/slate'>Shiftboard Documentation Powered by Slate</a>

search: true
---

# Overview

**Shiftdata**, the Shiftboard Application Programming Interface
(API), is designed to allow simple transactions with the Shiftboard
platform.  The Shiftboard platform is evolving quickly and this
documentation is updated frequently.

All requests and responses are encoded using JavaScript Object
Notation ([JSON](http://www.json.org/)) and encrypted using 256-bit
Secure Sockets Layer
([SSL](http://www.mozilla.org/projects/security/pki/nss/ssl/draft302.txt)).
Unencrypted requests are not accepted.  Using JSON, HMAC, and
[Base64](http://tools.ietf.org/rfc/rfc4648.txt) libraries, it should
be easy to create, update, list and delete objects within the
Shiftboard application.  These libraries should be available for
all programming languages (Java, PHP, .NET, Perl, and Ruby/Rails)

Most Shiftboard application, account, authorization, systems
management, and site provisioning data is already accessible or can
be made accessible according to demand.

All requests include your organization's unique Access Key ID and
are digitally signed by computing an HMAC SHA1 signature of the
request with your private (secret) Signature Key.  Your private
Signature Key should NEVER be transmitted or shared with anyone.

Please see the [Requests](#requests) section for details on making
digitally signed requests.

## Scope

For the most part, the Shiftboard API represents features already
available throughout the Web UI.  However, the Shiftboard API may
expose features that are new, beta, or do not have a UI counterpart.

This documentation, the API and the Web UI are revised regularly
as we respond to new customer requirements.  If you have any questions
or new requirements, please contact our Partner program for the
latest information.

The Shiftboard API is currently evolving.  Please ask about any
objects or extended functionality that can help meet the requirements
of your project.

# Getting Set Up

Before you use the Shiftboard Web Services API, you must register
with Shiftboard and obtain:

* an Access Key ID (a 36 character sequence)

    * For example: 135fc788-762b-46a6-a80f-3491c14ad26f

* a secret Signature Key (a 40-character sequence)

    * For example: bkvqNVSokbDZVHvt+RzqsrVzI0w7fhcU/jo/eUcY

<aside class="notice">
Caution: Your Signature Key is a secret, which only you and Shiftboard
should know.  It is important to keep it confidential to protect
your account.  Store it securely in a safe place.  Never include
it in your requests to Shiftboard, and never e-mail it to anyone.
Do not share it outside your organization, even if an inquiry appears
to come from Shiftboard.  No one who legitimately represents
Shiftboard will ever ask you for your secret Signature Key.
</aside>

The Access Key ID is associated with an API Account which will be
added to your organization's Shiftboard.  You include the Access
Key ID in all requests to the Shiftboard Web Services API to identify
yourself as the sender of the request, and the associated API Account
is used to authorize the requested action.

The Access Key ID is not a secret.  To provide proof that you truly
are the sender of the request, you also include a digital signature
calculated using your secret Signature Key.

# Requests and Responses

Shiftboard Web Services are based on the [JSON-RPC 2.0
specification](http://jsonrpc.org/spec.html), with some extensions.
At this time, only GET requests are accepted, with formatting based
on the [JSON-RPC Over HTTP specification's GET
request](http://jsonrpc.org/historical/json-rpc-over-http.html#get).

## Pagination

Methods that return paginated results optionally take a page
attribute.  The value of this attribute is an object with `batch`
and `start` attributes.  `batch` specifies the number of records
to be returned with each request and must be between 1 and 1000.
If not specified, the default is 10.  `start` specifies the record
number with which results should start.  If not specified, the
default is 1.

The response results may include a `count` attribute giving the
total number of records matching the selection criteria, if available.

If records were found, it will include a `page` attribute giving a
pagination object (in the format used by the page request attribute)
for `this` page, the `next` page, and/or the `prev` page, as
applicable.

For example, to perform an initial request with a page size of 25,
include a `page` attribute in your request:

`page: {batch:25}`

If there is more than one page of results available, the response
will include a page attribute like this:

`page: {next: {batch:"25",start:26}, this: {batch:"25",start:1}}`

Use the value of the `next` attribute as the `page` attribute to get another page:

`page: {batch:"25",start:26}`

and you will get a response including this:

`
page: {next: {batch:"25",start:51},
prev: {batch:"25",start:1},
this: {batch:"25",start:26}
`

(The `next` attribute will only be present if in fact there is yet
another page of data available.)

## Selection Criteria

Methods that may apply selection criteria take a `select` attribute.
The value of this attribute is an object with method-dependent
attributes.  The `select` attribute is optional for some methods
and required for others.  Default values may apply for some methods.

## Request Batches

```JSON
location.add
{
 workgroup:1,
 name:"General Electric",
 zip:"12345",
 batch:true
}

location.add
{
 workgroup:1,
 name:"White House",
 address:"1600 Pennsylvania Ave NW",
 city:"Washington",
 state:"District of Columbia",
 batch:true
}

system.endBatch
{}
```

If a large number of non-interdependent requests will be sent, a
batch attribute can be specified to enable them to be processed
more quickly, with a system.endBatch request sent at the end to
perform necessary operations that were deferred.  Example:

This mode should not be used when processing interdependent requests,
for example, adding locations and also adding shifts that use those
locations or adding workgroup relationships to those locations.

## Requests

### Request Format

A Shiftboard Web Services API request is issued via an HTTP GET
request to https://api.shiftdata.com.  Each request may have the
following components:

####id

An integer or string.  Not used except in that a response should
return the same value as passed in the request.  This field can be
used by the client to correlate a response with its request.

####jsonrpc

Version of the JSON-RPC specification for this request. Should always be the string "2.0".

####method

A string giving the name of the procedure to be invoked.

####params

A object ([RFC 4627](http://www.ietf.org/rfc/rfc4627.txt)) that
holds the actual parameter values for the invocation of the procedure.
All Shiftboard Web Services API methods require params, minimally
an empty object (`{}`).  See [individual object
documentation](#individual-object-documentation) and Common Attributes.

####access_key_id

A 36 character string identifying the client to the Shiftboard Web
Services API.  May be provided either in the GET request query
string or in a cookie.

####signature

A 28 character digital signature authenticating the source of this
request, computed as described below.  May be provided either in
the GET request query string or in a cookie.

Those components that may contain characters other than alphanumerics,
'-', '.', '_', or '~' should be URI encoded ([RFC
3986](http://www.ietf.org/rfc/rfc3986.txt)), as is normal for an
HTTP GET request query string.

### Request Signature

Each request is digitally signed by taking components of the request
and computing an HMAC SHA1 signature for them using a secret Signature
Key (which itself should never be transmitted).  The calculated
signature is then base64 encoded.  The HMAC SHA1 algorithm is
described in [RFC 2104](http://www.ietf.org/rfc/rfc2104.txt).

The data to be signed is composed of four parts concatenated with no separator:

* The 6 character string `method`
* The name of the method being called
* The 6 character string `params`
* The text being passed as params, prior to any base64 or URI encoding

Example: given the method name `echo`, the params "{ }", the data
to be signed is "methodechoparams{ }".  Given a signature key
"*Xuzh+MDxcW9/CLPD1Z2wiSX51LVrQrStEZPQWk0P*", the resulting
base64-encoded HMAC SHA1 signature is "*gJ5Oy1E5W4u9XpjWyMoJytlScU8=*".
Given an API access key of "*g57a67b3b-34e4-4c07-a8ca-e7ecb77a7f33*",
a complete request would be

`https://api.shiftdata.com/?id=885&jsonrpc=2.0&method=echo&params=eyB9&signature=gJ5Oy1E5W4u9XpjWyMoJytlScU8%3D&access_key_id=57a67b3b-34e4-4c07-a8ca-e7ecb77a7f33`

## Responses

### Response Format

The response to a Shiftboard Web Services API request is a object
([RFC 4627](http://www.ietf.org/rfc/rfc4627.txt)) with the following
attributes:

####id

The id provided in the request. If an error prevented the request from being parsed, this attribute may be null.

####jsonrpc

Version of the JSON-RPC specification for this response. Should always be the string "*2.0*".

####result

A object providing the results of the request. Only present when the request was successful. Contents are method-dependent: see [individual object documentation](#individual-object-documentation) and Common Attributes.

####error

A object providing error information. Only present when the request failed.

####seconds

If provided, number of seconds spent processing the request and formatting a response.

### Successful Responses

The attributes returned in response results vary; see [individual object documentation](#individual-object-documentation).

### Error Responses

A properly formatted and authorized request should not result in an error; please contact Shiftboard Support for assistance.

# Individual Object Documentation

## account object

account objects have the following basic attributes:

####id

A unique identifier for this account.

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

account objects may have the following extended attributes (not all attributes are available for all organizations):

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

Creates a new account record.

Required Parameters: first_name, last_name, and either email or the bad_email flag set true.

Optional Parameters: Other attributes of a account object may be specified. In addition, the following attributes may be specified:

####exists_ok

If the specified email address is already in use for an account on Shiftboard for some other Organization, the specified account attributes are not allowed to overwrite the existing account information. Normally, an error is returned indicating that the email address was already in use. If `exists_ok` is true, the existing account is added to the current organization's accounts instead. In this case, only email and per-organization attributes (`external_id` and `profile_type`) and options (`add_default_workgroups` and `account.sendWelcomeLetter`) are used; any other attributes specified will be discarded (including `temp_password` and `openid`).

####add_default_workgroups

If true, the new account will be added to any workgroups marked as organization default workgroups.

### account.sendWelcomeLetter

If true, a welcome email is sent to the new account's email address, giving them their password.

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

Deletes an account record.

Required parameter: `id`.

Optional boolean parameter: `notify` (defaults to false) to indicate a notification email should be sent to the owner of the deleted account.

Response: On success, empty results will be returned.

### account.deleteDocument 

Deletes an account document for a given account.

Required parameters: `id` and `document_number`.

Response: On success, empty results will be returned.

### account.deleteImage 

Deletes the user image for a given account.

Required parameter: `id`

Response: On success, empty results will be returned.

### account.deleteResume

Deletes the resume for a given account.

Required parameter: `id`

Response: On success, empty results will be returned.

### account.get 

Returns information about a single account.

Required parameter: `id`

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

Returns an account document for a single account.

Required parameters: `id` and `document_number`.

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account document.

### account.getImage 

Returns image information about a single account.

Required parameter: `id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account image.

### account.getResume 

Returns resume information about a single account.

Required parameter: `id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 604800 (1 week).

The response results will have an attribute `url` whose value can be used to fetch the account resume.

### account.list 

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

Returns information about accounts with membership in a workgroup. Uses [pagination](#pagination).

Required parameters: `select` object with a `workgroup` attribute identifying the workgroup whose members should be returned. E.g. `{select:{workgroup:12345}}`.

The response results `members` attribute will be an array of the current page of members. Each element of the array will be a member object.

Currently, this method only returns members with `org_hold` false and org_pending code "0" (Current).

### account.listMemberships 

Returns information about workgroups to which a member belongs. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####select

An object specifying selection criteria for this request:

####member

The member for which to select workgroups; defaults to the current user.

####search

A generic search string; select workgroups containing this string in name or code.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroups attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroups.

The response results `workgroups` attribute will be an array of the current page of selected workgroups. Each element of the array will be a workgroup object containing basic workgroup fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroups` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### account.listOpenids 

Returns information about account_openid objects for a given account.

Required Parameter: `account`.

The response results `account_openids` attribute will be an array of the account_openid objects for the designated account.

### account.listUpdated 

Returns information about accounts created or updated since a given date. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each account.

####select

An object specifying selection criteria for this request. Note that updated_since will have a default value if not specified. The available criteria include all [account.list](#heading=h.pr9gtag9yl1z) selection criteria with the addition of:

####updated_since

A system.timestamp previously returned by the [system.timestamp](#heading=h.59hbqqcwd5tr) method. Only accounts updated since this date will be selected. Defaults to 24 hours ago. If more than 30 days ago, only accounts updated in the last 30 days will be selected.

####profile_update

If specified and true, report accounts whose profile information has been updated. Otherwise, report only accounts whose non-profile information has been updated.

The response results `accounts` attribute will be an array of the current page of accounts. Each element of the array will be an account object containing basic account fields.

### account.resetPassword 

Resets the password for an account to a randomly chosen value and sends the new password to the account's email address. If the account has no email address or is not receiving email, no error will result and the password will be changed.

Required parameter: account, a single account identifier or an array of identifiers of accounts for which to reset the password.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

Note that this method may be deprecated in the future and replaced with a method to initiate a user-controlled password reset process.

### account.self 

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

Sends a password reset link for an account to the account's email address. If the account has no email address or is not receiving email, no error will result.

Required parameter: account, a single account identifier or an array of identifiers of accounts for which to send the password reset.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

### account.sendWelcomeLetter 

Sends a welcome letter to an account's email address. If the account has no email address or is not receiving email, no error will result.

Required parameter: account, a single account identifier or an array of identifiers of accounts for which to send a welcome letter.

No more than 10000 accounts may be specified in a single request.

Response: On success, empty results will be returned.

### account.update 

Updates an account object.

Required parameter: `id`. Other account object attributes may be specified. Updating another account's email address or notification options is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### account.updateDocument 

Updates an account document for a single account.

Required parameters: `id` and `document_number`.

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated document may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateImage 

Updates the user image for a single account.

Required parameter: `id`

Optional parameter: `expiration` (defaults to 300) to specify valid lifetime of the returned URL in seconds. Maximum 3600 (1 hour).

The response results will have an attribute `url` to which the new/updated user image may be POSTed.

Upon success, the request to the url will return an HTTP 204 status code.

### account.updateResume 

Updates the resume for a single account.

Required parameter: `id`

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

## availability object

availability objects have the following attributes:

####id

Unique identifier for this availability.

####account

Account identifier for this availability.

####busy

false if the availability record indicates availability; true if it indicates unavailability.

####start_date

Date at which this availability starts; null if availability extends indefinitely into the past.

####end_date

Date at which this availability ends; null if availability extends indefinitely into the future.

####start_time

Start time for each date of this availability, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00"), or null if the availability extends from the beginning of the day. 

**note:** It is not possible to specify the seconds for *start_time*. This value should always be set to: "00"

####end_time

End time for each date of this availability, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00"), or null if the availability extends to the end of the day.

**note:** It is not possible to specify the seconds for *end_time*. This value should always be set to: "00"

####workgroup

Workgroup identifier for this availability or null if no workgroup

####sunday

####monday

####tuesday

####wednesday

####thursday

####friday

####saturday

true for all days of the week (within the date range, if specified) to which this availability applies.

### availability.create

Creates a new availability record.

Required Parameters:

####account

account identifier or array of account identifiers

**NOTE:** If you are calling this method with the account parameter, external_account will be ignored (if included).

####external_account

external account identifier or array of external account identifiers

**NOTE:** If you are calling this method with the external_account parameter, account will be ignored (if included).

####busy

false if the availability record indicates availability; true if it indicates unavailability.

Any availability object attributes may be specified. If no day of week attributes are specified, all applicable (i.e. within the date range, if specified) days of the week will default to true; otherwise, at least one applicable day of week attribute must be true.

Additionally, if start_date and end_date are not specified, a date attribute may be specified with a single date or array of dates for which to create availability records.

Response: On success, if either the account or date parameters is an array, an empty object is returned; otherwise, an `id` attribute will provide the identifier for the new availability record.

### availability.delete

#### Request example:

`{
     id: "2753"
 }`

#### Response example:

`{

     seconds: "0.058344", 

     jsonrpc: "2.0", 

     id: "67", 

     result: {}

 } `

Deletes an availability record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### availability.get

Returns information about an availability record.

Parameters:

####id

Required. id of the availability record for which to return information.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the availability attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned availability record.

The response results `availability` attribute will be the selected availability object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `availability` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### availability.list 

#### Request example:

 `{

     select: {

         account`: 1

     }
 }`

#### Response example:

`{

    seconds`: "0.089939", 

     jsonrpc: "2.0", 

     id: "10", 

    result: {

        count: "5", 

        availability: [

             {

                 account: "1", 

                 busy: true, 

                 start_time: "11:00:00", 


                 end_date: null, 

                 monday: true, 

                 tuesday: true, 

                 friday: true, 

                 wednesday: true, 

                 thursday: true, 

                 saturday: false, 

                 sunday: false, 

                 end_time: "12:00:00", 

                 id: "236471", 

                start_date: "2013-04-01"

             }, 

             {

                 account: "1", 

                 busy: false, 

                start_time: "05:00:00", 

                 end_date: null, 

                monday: false, 

                tuesday: false, 

               friday: false, 

               wednesday: false, 

                thursday: false, 

                 saturday: true, 

                sunday: false, 

                 end_time: "11:00:00", 

                 id: "237006", 

                start_date: null

             }

         ], 

         page: {

            this: {

                 start: 1, 

                 batch: 10

            }

         }

    }

 }

Returns information about account availability data. Uses select criteria. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination).

Parameters:

####select

An object specifying selection criteria for this request. The available criteria include:

####account

The account identifier or array of account identifiers for which to return availability.

####external_account

The external account identifier or array of external account identifiers for which to return availability.

####start_date

####end_date

The date range for which to return availability (including any availability that extends before and/or after the given date range); either or both dates may be null to indicate a date range extending indefinitely into the past or future, respectively. start_date defaults to today, end_date to null.

####start_time

####end_time

Start and end time in RFC 3339 partial time format (e.g. 13:45:00). Return only availability records that encompass this time range; if either is specified, both must be.

####workgroup

Workgroup identifier if only availability specific to a given workgroup should be returned, or null if only availability not specific to any workgroup should be returned.

####busy

True if only Busy availability should be returned; false if only Available availability should be returned.

####sunday

####monday

####tuesday

####wednesday

####thursday

####friday

####saturday

Booleans; return only availability for the given days of the week.

####any_selected_day

Boolean, default false. If true, return availability for any of the selected days; if false, return availability records that are for all of the selected days.

####org_hold

Boolean account hold status.

####org_pending

Account onboarding status.

####scope

A value of 'by_account' requests availability for a specific account (defaulting to the user's account if no account criterion is provided). A value of 'siteadmin' requests all availability for the entire site and is only allowed for site administrators. A value of 'managed_workgroups' requests availability for members of the workgroups managed by the user and is only allowed for workgroup managers. 'siteadmin' is the default for site administrators, 'managed_workgroups' is the default for managers, and 'by_account' is the default for others.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the availability attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned availability records.

The response results `availability` attribute will be an array of the current page of availability. Each element of the array will be an availability object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `availability` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### availability.update *(not currently available)*

Please let us know if you would like access to this method.

## client object

client objects have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client. Maximum length 128 characters.

####business_name

Business name. Maximum length 100 characters.

####address

Address line (e.g. "*123 Main St*"). Maximum length 100 characters.

####address_second

Second address line. Maximum length 100 characters.

####city

City. Maximum length 100 characters.

####state

Abbreviation or full name of state/province/subdivision. Maximum length 64 characters.

####zip

Postal code. Maximum length 12 characters.

####country

Country. Maximum length 24 characters.

####contact_first_name

First name of contact person. Maximum length 100 characters.

####contact_last_name

Last name of contact person. Maximum length 100 characters.

####contact_phone

Phone number of contact person. Maximum length 100 characters.

####contact_email

Email address of contact person. Maximum length 255 characters.

Notes

####special_instructions

### client.create 

Creates a new client record.

Parameters: Any attributes of a client object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this client. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this client.

Response: On success, an `id` attribute will provide the identifier for the new client.

### client.delete 

Deletes a client.

Required parameter: `id`.

On success, empty results will be returned.

### client.get 

Returns information about a single client.

Required parameter: `id`

The response results will be a client object.

### client.list 

Returns information about clients. Uses [pagination](#pagination).

Optional parameters: `select` object with a `client` attribute identifying a single client or array of clients to be returned. E.g. `{select:{client:12345}}.`

The response results `clients` attribute will be an array of the current page of clients. Each element of the array may have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client.

### client.update 

Updates a client object.

Required parameter: `id`. Any other client object attributes may be specified.

Response: On success, empty results will be returned.

## calendar object

calendar objects have the following attributes:

####start_date

The starting date for querying the calendar object.

####end_date

The ending date for querying the calendar object.

### Calendar.summary

Request example:
`
{
    "include_timeOff": true, 
    end_date: "2017-02-28", 
    include_shifts: true, 
    tradeboard: {
        trade_complete: true
    }, 
    workgroups: [], 
    shifts: {
        coverage_type: [
            mine, 
            available, 
            confirmed
        ]
    }, 
    include_tradeboard: true, 
    start_date: "2017-02-01", 
    "timeOffRequests": {
        status: 0, 
        member: 1
    }
}`
####Response example:
`{
    seconds: "0.391969", 
    jsonrpc: "2.0", 
    id: "3", 
    result: {
        summaries: [
            {
                available: true, 
                confirmed: true, 
                trades: false, 
                mine: true, 
                date: "2017-04-01", 
                "timeOffRequest": false
            }, 
            {
                available: true, 
                confirmed: true, 
                trades: true, 
                mine: true, 
                date: "2017-04-02", 
                "timeOffRequest": true
            }, 
            {
                available: true, 
                confirmed: true, 
                trades: true, 
                mine: true, 
                date: "2017-04-03", 
                "timeOffRequest": true
            }
        ]
    }
}
`
Get a summarized list of data for a given date range.

Required parameters:

####start_date

####end_date

Optional parameters:

####workgroups

Selects only the included workgroups, if and only if array contains elements

####include_shifts

Include shift information. If not defined, this property is set to true

####shifts

Additional configuration for what shift information to display. Options are as follows:

* coverage_type

* Coverage type array with possible values of mine, `available`, and `confirmed`

include_timeOff

Include time off information. If not defined, this property is set to true

timeOffRequests

Additional configuration for what time off information to display. Options are as follows:

* status

* Accepts any valid timeOffRequest status

* member

* Accepts a member ID

####include_tradeboard

Include tradeboard information. If not defined, this property is set to true

####tradeboard

Additional configuration for what tradeboard information to display. Options are as follows:

* trade_complete

* Accepts Tradeboard's trade_complete

Response: On success, an array of summaries will be returned.

On error, one of the following error codes may be returned:

####invalid_params

Start or end date are invalid or missing

## department object

department objects have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department. Maximum length 128 characters.

### department.create 

Creates a new department record.

Parameters: Any attributes of a department object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this department. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this department.

Response: On success, an `id` attribute will provide the identifier for the new department.

### department.delete 

Deletes a department.

Required parameter: `id`.

On success, empty results will be returned.

### department.get 

Returns information about departments. Uses [pagination](#pagination).

Optional parameters: `select` object with a `department` attribute identifying a single department or array of departments to be returned. E.g.`{select:{department:12345}}`

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

### department.list 

Returns information about departments. Uses [pagination](#pagination).

Optional parameters: `select` object with a `department` attribute identifying a single department or array of departments to be returned. E.g. `{select:{department:12345}}`

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

### department.update 

Updates a department object.

Required parameter: `id`. Any other department object attributes may be specified.

Response: On success, empty results will be returned.

## location object

location objects have the following attributes:

####id

A unique identifier for this location.

####name

The name of this location. Maximum length 96 characters.

####address

Address line (e.g. "*123 Main St*"). Maximum length 100 characters.

####address_second

Second address line. Maximum length 100 characters.

####city

City. Maximum length 100 characters.

####state

Abbreviation or full name of state/province/subdivision. Maximum length 64 characters.

####zip

Postal code. Maximum length 12 characters.

####country

Country. Maximum length 24 characters.

####contact_first_name

First name of contact person. Maximum length 100 characters.

####contact_last_name

Last name of contact person. Maximum length 100 characters.

####contact_phone

Phone number of contact person. Maximum length 100 characters.

####contact_email

Email address of contact person. Maximum length 255 characters.

####notes

####special_instructions

####latlon

Optional latitude/longitude for more precise map location, e.g. "*34.015137,-118.791438*".

### location.create 

Creates a new location record.

Parameters: Any attributes of a location object (except `id`) may be specified. A unique `name` parameter and either a `zip` parameter or all of `address`, `city`, and `state` must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this location. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this location.

Response: On success, an `id` attribute will provide the identifier for the new location.

### location.delete 

Deletes a location record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### location.list 

Returns information about locations. Uses [pagination](#pagination).

Optional parameters: `select` object with a `location` attribute identifying a single location or an array of locations to be returned. E.g.`{select:{location:12345}}`

The response results `locations` attribute will be an array of the current page of locations. Each element of the array may have the following attributes:

####id

A unique identifier for this location.

####name

The name of this location.

####address

Address line (e.g. "*123 Main St*").

####address_second

Second address line.

####city

####state

Full name of state/province/subdivision.

####zip

Postal code.

####country

####contact_first_name

####contact_last_name

####contact_phone

####notes

####special_instructions

####latlon

### location.update 

Updates a location object.

Required parameter: `id`. Any other location object attributes may be specified.

Response: On success, empty results will be returned.

## managerNote object

managerNote objects have the following minimal attributes:

####id

A unique identifier for this managerNote.

####account

Identifier of the account to which this managerNote is assigned.

####workgroup

Workgroup identifier for this managerNote or null if no workgroup

####shift

Shift identifier for this managerNote or null if no shift

####score

Score (1-12) for this managerNote or null if no score

####admin_only

Boolean; indicates this managerNote is accessible only to site administrators

####type

managerNoteType identifier or null if no type

####activity_date

Date of activity in RFC 3339 full date format (e.g. "2009-01-01") or null if no activity_date

managerNote objects have the following extended attributes:

####notes

Notes

####created

UTC time managerNote was created

####updated

UTC time managerNote was updated

Not all fields will be configured to be used for all organizations or set for all managerNotes.

## managerNoteType object

managerNoteType objects have the following attributes:

####id

A unique identifier for this managerNoteType.

####name

Name of this managerNoteType.

## membership object

membership objects have the following attributes:

####member

The account identifier for this membership.

####workgroup

The workgroup identifier for this membership.

####level

Level for this membership:

2

####member

3

####coordinator

4

####manager

### membership.create 

Creates new workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to create memberships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create memberships for each specified account. Currently, only a single workgroup may be specified.

####level

User level for which to create memberships.

No more than 10000 memberships may be specified in one request.

If one or more of the specified memberships already exist, the remaining memberships (if any) will be created and no error will be returned. Existing user levels will remain unchanged.

Response: On success, empty results will be returned.

### membership.delete 

Deletes workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to delete memberships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete memberships for each specified account. Currently, only a single workgroup may be specified.

If one or more of the specified memberships doesn't exist, the remaining memberships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### membership.list 

Returns information about workgroup/account memberships. Uses [pagination](#pagination). Uses select criteria.

Required parameters:

####select

An object specifying selection criteria for this request. Either `member` or `workgroup` must be specified. The available criteria include:

####member

A single account identifier or an array of account identifiers indicating accounts for whom to return memberships.

####workgroup

A single workgroup identifier or an array of workgroup identifiers indicating workgroup for which to return memberships.

####level

User level of memberships to return.

####org_hold

Boolean; if specified and true, indicates that accounts on hold should be included in the returned results.

####org_pending

Boolean; if specified and true, indicates that accounts with pending status should be included in the returned results.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the memberships attribute, the results should include a referenced_objects attribute giving information about the accounts and workgroups referred to by the returned memberships.

The response results `memberships` attribute will be an array of the current page of memberships. Each element of the array will be a membership object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `memberships` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####workgroup

id and name attributes are provided.

### membership.update 

Updates user levels for workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to update memberships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to update memberships for each specified account. Currently, only a single workgroup may be specified.

####level

User level to which to update memberships.

If one or more of the specified memberships doesn't exist, the remaining memberships (if any) will be updated and no error will be returned.

Response: On success, empty results will be returned.

## news object

### news.get 

#### Request example:

`{}`

#### Response example:

 {

     seconds: "0.065741", 

    jsonrpc: "2.0", 

    id: "7", 

     result: {

         news: {

             member: "Member news goes here", 

             manager: "Manager news goes here", 

            team: {

                 "Example": {

                     news: "This is the news section for my Workgroup"

                 }

             }

         }

     }

 }

Returns the news for managers, teams, and members.

Optional parameters:

####org_id

## openid object

openid objects have the following attributes:

####id

A unique identifier for this openid object.

####account

####openid

### openid.create 

Adds an openid to an existing account.

Required Parameters:

####account

####openid

An openid url that will allow authentication to this account via

https://www.shiftboard.com/login/openid?http...

where http... is the designated url, URI-escaped. E.g. for openid http://www.example.com/, use the login link

https://www.shiftboard.com/login/openid?http%3A%2F%2Fwww.example.com%2F

If this openid is already in use for any account in Shiftboard, an error will be returned.

Response: On success, an `id` attribute will provide the identifier for the new account_openid.

### openid.delete 

Deletes an account_openid object.

Required Parameter: `id`. Deleting an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### openid.update 

Updates an account_openid object.

Required Parameter: `id`. Any other account_openid object attributes may be specified. If openid is updated and the new openid is already in use for any account in Shiftboard, an error will be returned. Updating an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

## paycode object

paycode objects have the following attributes:

####id

A unique identifier for this paycode.

####name

The name of this paycode. Maximum length 64 characters.

####description

A description for this paycode.

####pay_rate

Pay rate (e.g. "10.00")

### paycode.create 

Creates a new paycode record.

Parameters: Any attributes of a paycode object (except `id`) may be specified. A unique `name` parameter must be specified.

Response: On success, an `id` attribute will provide the identifier for the new paycode.

### paycode.delete 

Deletes a paycode.

Required parameter: `id`.

On success, empty results will be returned.

### paycode.get 

Returns information about a single paycode.

Required parameter: `id`.

The response results will be a paycode object.

### paycode.list 

Returns information about paycodes. Uses [pagination](#pagination).

Optional parameters: `select` object with a `paycode` attribute identifying a single paycode or array of paycodes to be returned. E.g.`{select:{paycode:12345}}`

The response results `paycodes` attribute will be an array of paycode objects for the current page of paycodes.

### paycode.update 

Updates a paycode object.

Required parameter: `id`. Any other paycode object attributes may be specified.

Response: On success, empty results will be returned.

## profileConfiguration object

profileConfiguration objects have the following attributes:

####id

####profile_option

integer identifying the system profile item for which this is the configuration; such profile items may be used at most once per profile type

####profile_type

####page

####label

####type

####read_authorization

####write_authorization

####constraint_list

Only used for some types; format varies by type

####form_name

Internally used string unique to each profile_option

### profileConfiguration.list 

Returns information about profile configuration. Uses select criteria.

Parameters:

####select

An object specifying selection criteria for this request. The available criteria include:

####profile_type

The profileType identifier for which to return profile configuration

####profile_option

The profile option for which to return configurations

####page

The page within the profile_type for which to return configurations

####form_name

A form_name string or array of such strings for which to return configurations

The response results `profile_configuration` attribute will be an array of profileConfiguration objects.

## profileData object

profileData objects have the following attributes:

####account

####external_account

####profile_option

integer identifying the profile item for which this is the data

####value

value of this profile item, or if the profile item has more than one value, an array of values.

### profileData.list 

#### Request example:
`
 {

     select: {

         account: 1

     }

 }
`
#### Response example:
`
 {

     seconds: "0.105116", 

     jsonrpc: "2.0", 

     id: "", 

     result: {

         count: 4, 

         page: {

             this: {

                 start: 1, 

                 batch: 10

             }

         }, 

         profile_data: [

             {

                 account: "1", 

                value: "(encrypted)", 

                 profile_option: "620"

             }, 

             {

                 account: "1", 

                 value: "206-555-1234", 

                 profile_option: "16"

             }, 

             {

                 account: "1", 

                value: "Brother", 

                profile_option: "186"

            }, 

             {

                 account: "1", 

                 value: [

                     "Data Entry", 

                     "Driver"

                 ], 

                 profile_option: "37"

             }

         ]

     }

 }
`
Returns information about account profile data. Uses select criteria. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination).

Parameters:

####select

An object specifying selection criteria for this request. Minimally either account or profile_type must be specified. The available criteria include:

####account

The account identifier or array of account identifiers for which to return profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the external_account parameter, account is not required.

####external_account

The external account identifier or array of external account identifiers for which to return profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####profile_type

The profileType identifier for which to return profile data; defaults to the profile type of the first account specified.

####workgroup

If specified, only select data for accounts which are members of this workgroup.

####profile_option

The profile option for which to return data.

The response results `profile_data` attribute will be an array of the current page of profile data. Each element of the array will be a profileData object.

### profileData.update 

#### Request example:
`
 {

     account: 1, 

     profile_data: [

         {

             value: "Sister", 

             profile_option: 186

         }, 

         {

             value: "206-555-4321", 

             profile_option: 16

         }

     ]

 }
`
#### Response example:
`
 {

     seconds: "0.204804", 

     jsonrpc: "2.0", 

     id: "", 

     result: {}

 }
`
Updates multiple profileData objects for a given account.

Required parameters:

####account

The account identifier or array of account identifiers for which to update profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the external_account parameter, account is not required.

####external_account

The external account identifier or array of external account identifiers for which to update profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####profile_data

Array of objects with `profile_option` and `value` attributes designating which profile options are to be updated and their new values.

Response: On success, empty results will be returned.

## profileType object

profileType objects have the following attributes:

####id

A unique identifier for this profile type.

####name

The name of this profile type.

### profileType.list 

Returns information about profile types. Uses [pagination](#pagination).

Optional parameters: `select` object with a `profile_type` attribute identifying a single profile type to be returned. E.g. `{select:{profile_type:12345}}`

The response results `profile_types` attribute will be an array of the current page of profile_types. Each element of the array will be a profile_type object.

## registration object

registration objects have the following attributes:

####id

A unique identifier for this registration.

####profile_type

profileType identifier for this registration.

####data

An array of objects, each of which has a `form_name` and a `value` attribute.

### registration.create 

Creates a new registration record.

Parameters: `profile_type` must be specified. `data` must be specified and must include any required registration form fields.

User pictures and resumes are not yet supported.

date, month/day, or month/year types should be given in two or three separate fields (e.g. birthdate_day, birthdate_month, birthdate_year) with integer values.

Response: On success, an `id` attribute will provide the identifier for the new registration.

## role object

role objects have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role. Maximum length 48 characters.

### role.create 

#### Request example:
`
 {

     workgroup: "226086", 

     name: "Test Role 0.699796458722442"

 }

#### Response example:

 {

     seconds: "0.319621", 

     jsonrpc: "2.0", 

     id: "51", 

     result: {

         id: "2282"

     }

 }

Creates a new role record.

Parameters: Any attributes of a role object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this role. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this role.

Response: On success, an `id` attribute will provide the identifier for the new role.

### role.delete

Deletes a role.

Required parameter: `id`.

On success, empty results will be returned.

### role.get

#### Request example:

 {

     id: "2281"

}

#### Response example:

 {

     seconds: "0.115639", 

     jsonrpc: "2.0", 

     id: "4", 

    result: {

        name: "role 813", 

        id: "2281"

    }

 }

Returns information about roles. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination).

Optional parameters: `select` object with a `role` attribute identifying a single role or array of roles to be returned. E.g. `{select:{role:12345}}`

The response results `roles` attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.assign 

#### Request example:
`
 {

     account: 12345, 

     role: [

         1, 

         2, 

         3

     ], 

     workgroup: 56789

 }
`
#### Response example:
`
 {

     seconds: "0.115639", 

     jsonrpc: "2.0", 

     id: "4", 

     result: {}

 }
`
Assigns a role or multiple roles to a member of a given workgroup. This method can be used to assign or unassign roles.

Required Parameters:

####account

account to be updated

####workgroup

workgroup the member belongs to

####role

One or more role ids to be assigned to the workgroup member.

### role.list
#### Request example:
`
 {

    select: {

         role: "2281"

     }

 }
`
#### Response example:
`
 {

     seconds: "0.115639", 

     jsonrpc: "2.0", 

     id: "4", 

     result: {

         count: "1", 

         page: {

             this: {

                 start: 1, 

                 batch: 25

             }

         }, 

         roles: [

             {

                 name: "role 813", 

                 id: "2281"

             }

         ]

     }

 }
`
Returns information about roles. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination).

Optional parameters: `select` object with a `role` attribute identifying a single role or array of roles to be returned. E.g. `{select:{role:12345}}`

The response results `roles` attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.update 

#### Request example:

`{

    id: "2282", 

     workgroup: "226086", 

    name: "Test Role 2282"

 }
`
#### Response example:
`
 {

     seconds: "0.141744", 

     jsonrpc: "2.0", 

    id: "52", 

     result: {}

 }
`
Updates a role object.

Required parameter: `id`. Any other role object attributes may be specified.

Response: On success, empty results will be returned.

## shift object

shift objects have the following basic attributes:

####id

A unique identifier for this shift.

####count

The number of positions represented by this shift record.

####qty

The total number of positions represented by this and associated records.

####start_date

The date or date and time on which this shift begins. For an all-day shift, this is date in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Otherwise, this is a datetime (e.g. "2009-04-01T13:00:00").

####end_date

The date and time on which this shift ends, (e.g. "2009-04-01T17:00:00"). Not specified for all-day or open-ended shifts.

####timezone

The timezone for which the shift is scheduled.

####workgroup

The shift's workgroup.

####subject

The shift's subject. Maximum length 100 characters.

####location

The location id for the shift, if specified.

####role

The role id for the shift, if specified.

####client

The client id for the shift, if specified.

####department

The department id for the shift, if specified.

####covered

true if the shift is covered.

####published

true if the shift is published.

####tentative

true if the shift is tentatively covered.

####urgent

true if the shift is critical to have covered.

####covering_member

If the shift is covered by a member, the id of the member's account.

####external_covering_member

If the shift is covered by a member, the external id of the member's account.

####covering_workgroup

If the shift is covered by a workgroup, the workgroup id (currently, never different from the shift's workgroup)

shift objects have the following extended attributes:

####details

Additional details about the shift.

####no_pick_up

Boolean

####signup_list

Boolean

####no_trade

Boolean

####reference_id

####work_status_type

The workStatusType id for the shift, if specified.

####linktitle

####linkurl

####room_floor

####zipcode

####pay_rate

####base_rate

####no_credit

####extra_credit

custom_text_1

custom_text_2

custom_text_3

####custom_multipick

Array of custom_multipick identifiers for the shift

####acknowledged

Boolean; shift has been acknowledged or declined.

####acknowledged_at

Date/time of acknowledgement or most recent modification to the acknowledgement.

####acknowledge_decline_reason

Decline reason identifier; present only if declined.

####acknowledged_notes

####resource

Array of resource identifiers for this shift

custom_dropdown_1

custom_dropdown_2

custom_dropdown_3

####custom_textarea

####created

UTC time shift was created

####status_updated

UTC time shift was published, unpublished, assigned, confirmed, or unconfirmed

####updated

UTC time shift was otherwise updated

####breaks

Array of breaks for the shift; each break has the following attributes:

####name

####start_time

The time in which a shift break starts, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01").

####display_time

####duration_minutes

####paid

Boolean.

Not all fields will be configured to be used for all organizations or set for all shifts.

### shift.acknowledge 

#### Request example:
`
 {

    id: 2753501

 }
`
#### Response example:

`{

     seconds: "0.280633", 

     jsonrpc: "2.0", 

    id: "3", 

    result: {

        message: "You have acknowledged this position:\n\nWednesday, May 20, 2015, 9:55am to 11:55am\nFront Desk"

    }

}
`
Acknowledges a shift.

Required parameter: `id`.

Optional parameters:

####acknowledge_decline_reason

acknowledge decline reason identifier, if the acknowledgement is to decline.

####acknowledged_notes

Response: On success, a `message` attribute will provide a brief notification message.

### shift.confirm 

#### Request example:
`
 {

     id: 2753501

 }

#### Response example:
`
 {

     seconds: "0.443989", 

    jsonrpc: "2.0", 

     id: "2", 

     result: {

         message: "You have accepted this position:\n\nWednesday, May 20, 2015, 9:55am to 11:55am\nFront Desk"

     }

 }
`
Confirms a shift.

Required parameter: `id`.

Response: On success, a `message` attribute will provide a brief notification message. If the shift had a count > 1, a new shift object will have been created and the id of the new shift will also be returned.

### shift.create 

#### Request example:
`
 {

     department: "949", 

     start_date: "2010-09-17T12:00:00", 

     role: "2282", 

     workgroup: "226085", 

    location: "29118"

 }
`
#### Response example:
`
 {

    seconds: "1.007354", 

    jsonrpc: "2.0", 

    id: "57", 

    result: {

        id: 2753502

     }

 }
`
Creates a new shift record.

Parameters: Most attributes of a shift object except `id` may be specified. Minimally, `workgroup` and `start_date` parameters must be specified. `timezone` will default to the organization's timezone. `location` will default to the workgroup's default location, if set. "external_covering_member/covering_member" and `covering_workgroup` are mutually exclusive, and may only be specified if the shift is covered. `tentative` may only true if the shift is covered, and `covered` may only be true if the shift is published. Start and end dates may only fall on even five minute times. Either `count` or `qty` may be specified and both will be set for the new shift, defaulting to 1; if both are specified, they must be equal. `count` must be 1 for a covered shift.

Response: On success, an `id` attribute will provide the identifier for the new shift.

### shift.delete 

#### Request example:
`
 {

     id: "2753500"

 }
`
#### Response example:
`
{

    seconds: "0.058344", 

     jsonrpc: "2.0", 

     id: "67", 

    result: {}

 }
`
Deletes a shift record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### shift.deleteSignup 

Deletes a member from a shift's signup list.

Parameters:

####id

Required. id of the shift for which to remove a sign up.

####member

id of the account to remove from the sign up list (defaults to the current user)

**NOTE:** If you are calling this method with the member parameter, external_member will be ignored (if included).

####external_member

external id of the account to remove from the sign up list (defaults to the current user)

**NOTE:** If you are calling this method with the external_member parameter, member will be ignored (if included).

Response: On success, empty results will be returned.

### shift.get 

#### Request example:
`
{

    id: 2753499

 }
`
#### Response example:
`
 {

    seconds: "0.062897", 

    jsonrpc: "2.0", 

    id: "25", 

     result: {

         shift: {

            count: "1", 

             linktitle: "", 

            signup_list: false, 
            details: "", 

            room_floor: "", 

             qty: "1", 

             zipcode: "60616", 
             
            start_date: "2010-09-17T12:00:00", 

            urgent: false, 

            workgroup: "226081", 
            
             reference_id: "", 

           published: false, 

            covered: false, 

             timezone: "Pacific Time (US/Can) (GMT-08:00)", 

             subject: "", 

           linkurl: "", 

             id: "2753499", 

             no_pick_up: false, 

             work_status_type: "0"

        }

     }

 }
`
Returns information about a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####extended

Boolean; if not specified or true or user_actions is true, the results returned will be an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions (e.g. cover, uncover, assign, delete, acknowledge) may be presented to the user.

####display_time

Boolean; if specified and true, the returned shift will include a `display_time` attribute giving a string presentation of when the shift is scheduled.

####denormalize

denormalize is deprecated; where possible, the results `referenced_objects` attribute should be used instead.

Boolean; if specified and true, all identifiers (except the shift `id` itself) in the returned shift object will be replaced with corresponding names, etc. suitable for display, and the following attributes may be added:

####location_details

An object providing one or more of the following attributes, when available: `zipcode`, `address`, `city`, `state`, `country`, `latitude`, `longitude`.

####display_date

The start date of the shift, formatted for display (including weekday name).

####display_time

The time range of the shift, formatted for display.

####referenced_objects

Boolean, defaults to true unless denormalize is true. Indicates that, in addition to the shift attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned shift.

The response results `shift` attribute will be the selected shift object.

If user_actions were requested, a `user_actions` attribute will also be returned.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shift` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

acknowledgeDeclineReason

id and label attributes are provided.

####custom_multipick

id and name attributes are provided.

custom_dropdown_1

id and name attributes are provided.

custom_dropdown_2

id and name attributes are provided.

custom_dropdown_3

id and name attributes are provided.

####resource

id, name, and label attributes are provided.

### shift.getAssignmentList 

#### Request example:
`
 {

     shift: {

        id: 123456789
        
     }, 

    workgroup: 12345

 }
`
#### Response example:
`
 {

    seconds: "0.058344", 

    jsonrpc: "2.0", 

    id: "67", 

     result: {

        assignable: {

            "1": "Bob Doe", 
            
            "2": "Jane Doe"

        }, 

        unassignable: {

            "5": "John Smith - Has Conflicts (My Team)"

       }

    }

}
`
Returns availability information as to who is and is not assignable to a shift. The shift in this case could be one that currently exists, or a shift to be created later.

Required parameters:

####workgroup

The id for the workgroup.

Optional parameters:

####shift

Object. The shift object allows for the following optional parameters:

####id

####start_date

####start_time

####end_date

####end_time

####timezone

Timezone defualts to the site's timezone if one is not provided in the request.

####role

Role is required for role restriction.

####unpaid_mins

Required for overtime checking.

####location

Location id of shift (venue).

####reference_id

If specified, requests only shifts with the given reference IDs (case insensitive) (either a single reference ID or an array of reference IDs).

####covering_member

If specified, requests only shifts covered by the workgroup member.

####limit

Maximum number of results to return; default site dropdown list limit.

####use_time

Needed if open ended or all day should do overtime/conflict/availability/timeoff checkinng.

####include_holds

Boolean; default false (members on hold not included).

####conflicts_ok

Boolean; default false (conficts checked, if date/times specified).

####daily_overtime_ok

Boolean; default false (conficts checked, if date/times specified).

####weekly_overtime_ok

Boolean; default false (conficts checked, if date/times specified).

####is_available

Boolean; default false (availability not checked).

####timeoff_ok

Boolean; default true (timeoff not checked).

####seniority_required

Boolean; default false, ignored unless sorting by_seniority.

####single_shift_per_day

Boolean; default false.

####is_autoassignable

Boolean; default false.

####standby

Boolean; default false, standby signups only

####role_restriction

Boolean; default false; apply role restrictions, if there is a role and the team uses restrictions.

####min_level

Default 1, maximum level to exclude (e.g. 3 to exclude non-manager, 2 to exclude members).

####max_level

Maximum level to include (e.g. 2 to exclude coordinators/managers).

####phrase

Match in first name, last name, fullname

####coverage_signup_list_eid

Exclude members already signed up for this eid (start_date must also be specified).

####accounts

Array ref of accounts to limit results to.

####exclude_accounts

Array ref of accounts to exclude from results to.

####profile_type

Only members with this profile type.

####extended_filter

specification to filter on profile options (profile_type must be specified).

####range

Range of accounts in miles from venue zipcode.

####min_score

Minimum score.

####no_score

Include members with no score (min_score must be specified).

####by_seniority

Order by those with seniority by seniority date or rank, then with seniority and no date/rank, then no seniority (random within those).

####randomize

Return results in random order.

####mandatory_days_off

Mandatory days off settings (hash).

####tier

The user's tier.

####tier_ge

The user's minimum tier.

####lang

The user's language (or if user has not set one, the site's default).

####consecutive_days

Allow shifts on N consecutive days if beta feature is enabled (boolean).

####short_turnaround

Allow shifts that have a short (N hours) turnaround if beta feature is enabled (boolean).

### shift.getOfferedTrade 

#### Request example:
`
 {

    extended: true, 

    id: "56789012"

}
`
#### Response example:
`
{

    seconds: "0.128193", 

    jsonrpc: "2.0", 

    id: "15", 

    result: {

         tradeboard: {

            traded_by: "39", 

            shift: "56789012", 

            notes: "Need to see the dentist; please take this trade", 

            traded_to: "47", 

            trade_completed: "2014-01-21T20:40:38Z", 

             id: "12345", 

            trade_complete: true

         }, 

         referenced_objects: {

             account: [

                 {

                     first_name: "Joanie", 

                     last_name: "Foster", 

                     id: "39", 

                     screen_name: null

                 }, 

                 {

                     first_name: "Stan", 

                     last_name: "Wilson", 

                     screen_name: "Stan Wilson", 

                     profile_type: "3", 

                     seniority_order: "19999-12-31 23:59:59", 

                     id: "47"

                 }

             ], 

             workgroup: [

                 {

                     name: "Help Desk", 

                     id: "412345"

                 }

             ], 

             shift: [

               {

                     display_date: "January 29, 2014", 

                    qty: "1", 

                     urgent: false, 

                    no_trade: false, 

                    timezone: "Pacific Time (US/Can) (GMT-08:00)", 

                    room_floor: "room/floor", 

                     id: "56789012", 

                    subject: "", 

                    signup_list: false, 

                    work_status_type: "5", 

                    linkurl: "", 

                    zipcode: "94132", 

                    location: "92580", 

                    department: "9942", 

                    covered: true, 

                    covering_member: "47", 

                    start_date: "2014-01-29T13:00:00", 

                    details: "details!", 

                    display_time: "1pm to 2pm", 

                     workgroup: "412345", 

                     end_date: "2014-01-29T14:00:00", 

                    reference_id: "", 

                    linktitle: "", 

                    no_pick_up: false, 

                     count: "1", 

                    no_credit: false, 

                    published: true

               }

            ], 

            location: [

                {

                    name: "Training / Meetings", 

                    id: "92580"

                }

            ], 

            department: [

                {

                    label: "Distribution", 

                     id: "9942", 

                    name: "Distribution"

                }

            ], 

            timezone: [

                 {

                    name: "Pacific Time (US/Can) (GMT-08:00)", 

                    olson_timezone: "America/Los_Angeles"

                }

            ], 

            "workStatusType": [

                {

                    name: "Salary/Exempt", 

                     id: "5"

                }

            ]

        }

    }

 }
`
Returns information about a tradeboard posting for a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard posting.

The response results `tradeboard` attribute will be the selected tradeboard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####shift

All basic shift attributes will be provided. If the `extended` parameter is true, extended shift attributes will also be provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### shift.list 

#### Request example:
`
 {

     select: {

         workgroup: "226084"

     }

 }
`
#### Response example:
`
 {

     seconds: "0.081433", 

     jsonrpc: "2.0", 

     id: "44", 

     result: {

         count: "1", 

         shifts: [

             {

                 count: "1", 

                 covering_workgroup: "226084", 

                 workgroup: "226084", 

                 end_date: "2010-09-17T14:30:00", 

                 id: "2753501", 

                 qty: "1", 

                 published: true, 

                 covered: true, 

                 timezone: "Greenwich Mean Time : Dublin, Lisbon, London (GMT)", 

                 start_date: "2010-09-17T14:00:00", 

                 subject: updated

             }

         ], 

         page: {

             this: {

                 start: 1, 

                 batch: 25

             }

         }

     }

 }
`
Returns information about coverage shifts. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the shifts attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned shifts.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of when the shift is scheduled.

####aggregation_mode

If specified, aggregated results are returned. Options are:

####similar

Shifts with the same start_date, end_date, timezone, workgroup, covering_workgroup/covering_member, tentative, covered, published, location, role, and urgent attributes are aggregated.

####similar_subject

Shifts with the same start_date, end_date, timezone, subject, covering_workgroup/covering_member, tentative, covered, published, location, role, and urgent attributes are aggregated.

####date

Shifts with the same start_date, workgroup, covered, published, tentative, and urgent attributes are aggregated.

####date_subject

Shifts with the same start_date, subject, covered, published, tentative, and urgent attributes are aggregated.

Each result element will have an aggregate_count attribute indicating how many elements were aggregated. count and qty will be summed for the aggregated elements; other fields that are not aggregated over will be omitted from results that aggregate more than one element.

####image

Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the shift's covering_member's user image or null if no image is available.

####image_expiration

Specifies the valid lifetime of the returned URL in seconds; default 300, maximum 604800 (1 week).

####timeclock_status

Boolean; if specified and true, the results returned will include a clocked_in attribute indicating that the shift's covering_member is currently clocked in (though not necessarily for this shift) and a can_clock_in_out attribute indicating whether there is authorization to clock that covering member in or out.

####no_location

Boolean; if specified and true, the results returned will include shifts that do not have an assigned location (in addition to the locations specified in select), false excludes shifts without locations.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 7 days after the start_date.

####display_start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). This should be used instead of start_date when selecting shifts that include workers across multiple timezones.

####display_end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. This should be used instead of end_date when selecting shifts that include workers across multiple timezones.

####published

If specified, true requests only published shifts, false requests only unpublished shifts.

####covered

If specified, true requests only covered shifts, false requests only uncovered shifts.

####urgent

If specified, true requests only urgent shifts, false requests only non-urgent shifts.

####no_pick_up

If specified, true requests only "No Pick-Up" shifts, false requests only non-"No Pick-Up" shifts.

####signup_list

If specified, true requests only Signup List shifts, false requests only non-Signup List shifts.

####location

If specified, requests only shifts with the given locations (either a single location id or an array of ids). Use 0 for shifts with no location.

####role

If specified, requests only shifts with the given roles (either a single role id or an array of ids). Use 0 for shifts with no role.

####client

If specified, and the site is configured to use client for schedule items, requests only shifts with the given roles (either a single client id or an array of ids). Use 0 for shifts with no client.

####department

If specified, and the site is configured to use department for schedule items, requests only shifts with the given departments (either a single department id or an array of ids). Use 0 for shifts with no department.

####start_time

If specified, requests only shifts with the given starting times (either a single time or an array of times), in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00").

####workgroup

If specified, requests only shifts for the given workgroups. May be a single workgroup or an array of workgroups.

####scope

If specified, a value of 'my_calendar' requests shifts normally shown to a user on the calendar, that is, shifts for workgroups for which the user is a coordinator or manager, shifts covered by the user, or approved, open shifts for workgroups for which the user is a member. A value of 'siteadmin' requests all shifts for the entire site and is only allowed for site administrators. A value of 'managed_workgroups' requests shifts for the workgroups managed by the user and is only allowed for workgroup managers. A value of 'report' is like 'siteadmin' for site administrators and like 'managed_workgroups' for others. 'siteadmin' is the default for site administrators while 'my_calendar' is the default for all others.

####reference_id

If specified, requests only shifts with the given reference IDs (case insensitive) (either a single reference ID or an array of reference IDs).

####subject

If specified, only shifts with the matching subject will be selected.

####covering_member

If specified, requests only shifts covered by the workgroup members. May be a single account id or an array.

**NOTE:** If you are calling this method with the external_covering_member parameter, covering_member will be ignored, and is not required.

####external_covering_member

If specified, requests only shifts covered by the workgroup members. May be a single account id or an array.

**NOTE:** If you are calling this method with the covering_member parameter, external_covering_member will be ignored, and is not required.

####covering_workgroup

If specified, requests only shifts covered by the given workgroup.

####exclude_covering_member

If specified, excludes shifts covered by the workgroup members. May be a single account id or an array.

####only_deleted_workgroups

If specified and true, only shifts for deleted workgroups will be selected; if specified and false, shifts for both deleted and non-deleted workgroups will be selected. Otherwise (the default), only shifts for non-deleted workgroups will be selected.

####profile_type

If specified, only shifts with covering members with this profile type identifier will be selected.

####acknowledged

If specified and true, only shifts that have been acknowledged (including being declined) will be selected.

####custom_multipick

If specified, only shifts with the given custom_multipick identifier (and possibly other custom_multipick identifiers) will be selected.

####resource

If specified, only shifts with the given resource identifier (and possibly other resource identifiers) will be selected.

####attendee_filled

If specified and false, only shifts for which additional attendees may be added will be selected; if specified and true, only shifts which have attendees but for which no additional attendees may be added will be selected.

####no_show

If specified and true, only shifts that have been marked "No Show" will be selected; if specified and false, only shifts that have not been marked "No Show" will be selected.

####workgroup_or_covering

If true, select shifts where the workgroup OR covering_member/covering_workgroup filter applies. Otherwise, select shifts for which both filters (if specified) apply.

custom_dropdown_1

If specified, only shifts with the given custom_dropdown_1 identifiers will be selected. May be a single identifier or an array of identifiers.

custom_dropdown_2

If specified, only shifts with the given custom_dropdown_2 identifiers will be selected. May be a single identifier or an array of identifiers.

custom_dropdown_3

If specified, only shifts with the given custom_dropdown_3 identifiers will be selected. May be a single identifier or an array of identifiers.

####coverage_type

One of or an array of the following (if an array, any shifts that meet at least one of the criteria are selected):

####mine

Select only shifts published and assigned to the current user.

####confirmed

Select only shifts published and assigned to someone other than the current user.

####available

Select only shifts published and not assigned.

####is_a_trade

If tradeboard is enabled, this will return a boolean value if a shift is available to trade.

####room_floor

If specified, only shifts with the given room_floor (case insensitive) will be selected. May be a single value or an array of values.

custom_text_1

custom_text_2

custom_text_3

If specified, only shifts with the given custom text value (case insensitive) will be selected. May be a single value or an array of values. Ignored unless the user is a site administrator or, if the custom text field is readable by managers, you have specified a scope of `report` or `managed_workgroups` (see `scope` above) and the user is a manager.

The response results `shifts` attribute will be an array of the current page of selected shifts. Each element of the array will be an shift object containing basic or basic and extended shift fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shifts` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

####acknowledge_decline_reason

id and label attributes are provided.

####custom_multipick

id and name attributes are provided.

custom_dropdown_1

id and name attributes are provided.

custom_dropdown_2

id and name attributes are provided.

custom_dropdown_3

id and name attributes are provided.

####resource

id, name, and label attributes are provided.

### shift.listUpdated

#### Request example:
`
 {

     select: {

         updated_since: 1284656001

     }

 }
`
#### Response example:
`
 {

     seconds: "0.056182", 

     jsonrpc: "2.0", 

     id: "36", 

     result: {

         count: "1", 

         shifts: [

             {

                 count: "1", 

                 workgroup: "226082", 

                 id: "2753500", 

                 qty: "1", 

                 published: false, 

                 covered: false, 

                 timezone: "Pacific Time (US/Can) (GMT-08:00)", 

                 start_date: "2010-09-17T12:00:00", 

                 subject: updated

             }

         ], 

         page: {

             this: {

                 start: 1, 

                 batch: 25

             }

         }

     }

 }
`
Returns information about coverage shifts created or updated since a given date. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####select

An object specifying selection criteria for this request. Note that updated_since will have a default value if not specified. The available criteria include all [shift.list](https://api.shiftboard.com/api-documentation/objects/shift.html#shift.list) selection criteria with the addition of:

####updated_since

A system.timestamp previously returned by the [system.timestamp](https://api.shiftboard.com/api-documentation/objects/system.html#system.timestamp) method. Only shifts updated since this date will be selected. Defaults to 24 hours ago. If more than 30 days ago, only shifts updated in the last 30 days will be selected.

####status_update

If specified and true, report only shifts whose status has been updated. Confirm, unconfirm, assign, reassign, publish, and unpublish actions are considered status changes. Otherwise, report only shifts whose other data has been updated.

The response results `shifts` attribute will be an array of the current page of selected shifts. Each element of the array will be a shift object.

### shift.notification 

Returns notification information about a coverage shift. This method is experimental and subject to change without notice.

Parameters:

####id

Required. id of the shift for which to return information.

The response results `shift` attribute will be an object with selected attributes of the shift object.

The response results `accounts` attribute will be an array of objects with selected attributes of accounts that should be notified.

### shift.signup 
Signs up a member to a shift's signup list.

Parameters:

####id

Required. id of the shift for which to sign up.

####member

id of the account to sign up (defaults to the current user)

**NOTE:** If you are calling this method with the member parameter, external_member will be ignored (if included).

####external_member

external id of the account to sign up (defaults to the current user)

**NOTE:** If you are calling this method with the external_member parameter, member will be ignored (if included).

####message

optional message

Response: On success, empty results will be returned.

### shift.signupList 

Returns information about signups for a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####referenced_objects

Boolean, defaults to true. Indicates that the results should include a referenced_objects attribute giving information about objects referred to in the returned signups.

Upon success, the returned object will have the following attributes:

####already_signed_up

Boolean. The user is already signed up for this signup list.

####can_manage_list

Boolean. The user can add/remove/process/message signup list members.

####can_remove_signup

Boolean. The user can remove their signup for this signup list.

####can_signup

Boolean. The user can sign up for this signup list.

####signups

An array of signups the user is authorized to see for the selected shift. Each signup object will have the following attributes:

####member

account identifier

####message

optional message provided at time of signup

####processed

Boolean.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shift` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### shift.summary 

## This method is experimental and subject to change.

#### Request example:
`
 {

     aggregate: start_date, 

     exists: {

         available: {

             urgent: false, 

             covered: false, 

             published: true

         }, 

         confirmed: {

             exclude_covering_member: 123, 

             covered: true, 

             published: true

         }, 

         critical: {

             urgent: true, 

             covered: false, 

             published: true

         }, 

         mine: {

             covered: true, 

             published: true, 

             covering_member: 123

         }, 

         unpublished: {

             published: false

         }

     }, 

     select: {

         workgroup: [

             123456, 

             234567

         ], 

         end_date: "2015-06-30", 

         start_date: "2015-06-01"

     }

 }
`
#### Response example:
`
 {

     seconds: "0.362897", 

     jsonrpc: "2.0", 

     id: "25", 

     result: {

         referenced_objects: {}, 

         summary: [

             {

                 available: false, 

                 confirmed: false, 

                 unpublished: false, 

                 mine: true, 

                 critical: false, 

                 start_date: "2015-06-03"

             }, 

             {

                 available: true, 

                 confirmed: false, 

                 unpublished: false, 

                 mine: true, 

                 critical: true, 

                 start_date: "2015-06-08"

             }, 

             {

                 available: true, 

                 confirmed: false, 

                 unpublished: true, 

                 mine: false, 

                 critical: false, 

                 start_date: "2015-06-12"

             }

         ]

     }

 }
`
## This method is experimental and subject to change.

Returns summary information about selected shifts.

Parameters:

####select

Selection criteria. For defaults and allowed criteria, refer to [shift.list](https://api.shiftboard.com/api-documentation/objects/shift.html#shift.list).

####aggregate

Shift attribute name or array of names by which to summarize; defaults to `start_date`. Currently supported values: `start_date`.

####exists

Object with arbitrarily named attributes with selection criteria objects as values.

####referenced_objects

Boolean, defaults to true. For future use. Indicates that, in addition to the summary attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned summary data.

The response results `summary` attribute will provide an array containing an element for each distinct set of values found of the specified `aggregate` attributes. Each element will be an object with an attribute for each of the specified `aggregate` attributes giving the value found, and additional attributes for each named set of additional criteria specified in `exists` giving a Boolean value to indicate whether shifts with those additional criteria were found with the given aggregate attribute values.

### shift.unconfirm 

#### Request example:
`
 {

     id: 2753501

 }
`
#### Response example:
`
 {

     seconds: "0.123864", 

     jsonrpc: "2.0", 

     id: "46", 

     result: {}

 }
`
Confirms a shift.

Required parameter: `id`.

Response: On success, empty results will be returned. Note that if the shift had a quantity, the particular shift that was unconfirmed may have been merged with other unconfirmed shifts and deleted.

### shift.update 

#### Request example:
`
 {

     count: 1, 

     covering_workgroup: "226084", 

     workgroup: "226084", 

     end_date: "2010-09-17T14:30:00", 

     qty: 1, 

     start_date: "2010-09-17T14:00:00", 

     published: true, 

     covered: true, 

     timezone: "Greenwich Mean Time : Dublin, Lisbon, London (GMT)", 

     id: 2753501, 

     subject: updated

 }
`
#### Response example:
`
 {

     seconds: "0.178901", 

     jsonrpc: "2.0", 

     id: "43", 

     result: {}

 }
`
Updates a shift object.

Required parameter: `id`. Most other shift object attributes may be specified.

The `count` of a shift is the number of positions available for that specific shift, whereas the `qty` is the total positions for all related shifts. Counts may not be directly modified: to increase or decrease available counts, modify the `qty` field, which will update the `qty` for all related shifts, increasing or decreasing the `count` only for the related uncovered shift. Therefore, `qty` cannot be decreased below the total `count` for all related covered shifts. If `qty` is set to the total `count` for all related covered shifts, the uncovered shift, now with `count` 0, is deleted.

Response: On success, if the shift was updated, empty results will be returned. If the shift had a `count` > 1 and the update was only applied to a portion of the count, a new shift object will have been created and the `id` of the new shift will be returned. If `qty` is modified on a covered shift, the `id` of the modified uncovered shift will be returned.

## system object

### system.echo

#### Request example:
`
 {

     true: true, 

     null: null, 

     false: false

 }
`
#### Response example:
`
 {

     seconds: "0.040819", 

     jsonrpc: "2.0", 

     id: "3", 

     result: {

         true: true, 

         null: null, 

         false: false

     }

 }
`
For use in client testing only. Returns the object passed as params as its result.

### system.endBatch 

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "0.273929", 

     jsonrpc: "2.0", 

     id: "41", 

     result: {}

 }
`
Ends a batch of requests.

[Request Batches](https://api.shiftboard.com/api-documentation/req_resp.html#batch)

### system.timestamp 

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "0.039812", 

     jsonrpc: "2.0", 

     id: "2", 

     result: {

         timezone: "America/Los_Angeles", 

         timestamp: 1410988108, 

         "24_hour_clock": true, 

         localtime: "2014-09-17T14:08:28-0700"

     }

 }
`
Returns the current time. The `timestamp` attribute is epoch seconds, for later use as the `updated_since` select criterion by some methods. The `localtime` attribute is the RFC 3339 date-time for the current time in the organization's timezone. The "24_hour_clock" attribute is true if the organization is configured to display time in a 24-hour format. The `timezone` attribute is the organization's selected time zone.

### system.whoami 

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "0.04893", 

     jsonrpc: "2.0", 

     id: "1", 

     result: {

         account: "2"

     }

 }
`
Returns account, the account id for the registered API used.

## teamCategory object

teamCategory objects have the following attributes:

####id

A unique identifier for this category.

####category

The numeric identifier for the workgroup category to which this team category belongs.

####label

The label for this team category.

### teamCategory.list

Lists all current team categories.

### teamCategory.create 

Creates a new team category.

Only five (5) team categories are allowed.

Required parameters:

####category

The numeric identifier for the category.

####label

The label for this category.

Response: On success, the created teamCategory will be returned.

### teamCategory.update 

Updates the label on a team category.

Required parameters:

####id

The unique identifier for the category.

####label

The new label for this category.

Response: On success, the updated teamCategory will be returned

### teamCategory.delete 

Deletes a team category.

Required parameters:

####id

The unique identifier for the category.

Response: On success, an empty results will be returned

## teamCategoryItem object

teamCategoryItem objects have the following attributes:

####id

A unique identifier for this category item.

####category

The numeric identifier for the category of this item.

####name

The name for this category item.

### teamCategoryItem.list 

Lists all items associated with a team category. Uses [pagination](#pagination).

Optional parameters: `select` object with a `category` attribute identifying a single numerical category of items to be returned. E.g. `
{select:{category:3}}`

### teamCategoryItem.add 

Creates a new item under a team category.

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the created teamCategoryItem will be returned.

### teamCategoryItem.update 

Updates the name of an item within a team category.

Required parameters:

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the updated teamCategoryItem will be returned

### teamCategoryItem.delete 

Deletes an item within a team category.

Required parameters:

####id

The unique identifier for the category item.

Response: On success, an empty results will be returned

## timecard object

timecard objects have the following basic attributes:

####id

A unique identifier for this timecard

####workgroup

Workgroup identifier

####account

Account identifier

####external_account

External account identifier. Can be used in lieu of account if external identifiers are enabled for the site.

**NOTE:** If both account and external_account are included, the external_account value will be ignored.

####shift

Shift identifier or null if there is no shift associated with this timecard object

####approved

true if the timecard is approved

####processed

true if the timecard is processed

####start_date

Start date in RFC 3339 full-date format (e.g. "2009-04-01")

####start_time

Start time in RFC 3339 partial-time format (e.g. "23:55:00") or null if no start time was provided

####duration

Duration in HHH:MM:SS format (e.g. "1:05:00" or "120:00:00")

timecard objects have the following extended attributes:

####work_status_type

The workStatusType id for the timecard

####location

The location id for the timecard, if specified

####role

The role id for the timecard, if specified

####client

The client id for the timecard, if specified

####department

The department id for the timecard, if specified

####mileage

Mileage for the timecard, if specified

####expense_notes

Expense notes, if specified

####notes

Notes, if specified

####manager_notes

Manager notes, if specified

Not all fields will be exposed to all users.

Not all fields will be configured to be used for all organizations or set for all timecards.

### timecard.create 

Creates a new timecard record.

Parameters: Any attributes of a timecard object (except `id`) may be specified.

Response: On success, an `id` attribute will provide the identifier for the new timecard.

### timecard.delete 

#### Request example:
`
 {

     id: "226089"

 }
`
#### Response example:
`
 {

     seconds: "0.052778", 

     jsonrpc: "2.0", 

     id: "48", 

     result: {}

 }
`
Deletes a timecard record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### timecard.exportTRAXPayroll 

Initiates a TRAXPayroll timecard export.

Parameters:

####inline_content

If true, report data will be directly returned; if false, a one-time url for fetching the report data will be returned.

####select

Selection criteria (optional):

####start_date

Earliest timecard start date to select; defaults to 30 days ago. If overtime is enabled, the day of week must match the configured workweek start day.

####end_date

Latest timecard start date to select; defaults to today. If overtime is enabled, the day of week must match the weekday before the configured workweek start day (i.e. the end of the workweek).

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

####use_workweek_start_time

Boolean; if specified and true, modifies the selection to be from the configured workweek start time on the specified start_date to the configured workweek start time on the day following the specified end_date; if weekly overtime is enabled and the configured workweek start time is not midnight, this must be specified as true.

Response: If `inline_content` is true, a `content` attribute will provide an array of the requested data; otherwise, a `url` attribute giving a link that may be used one time only, within 5 minutes of the API request, to generate the requested report.

### timecard.get 

Returns information about a timecard object.

Parameters:

####id

Required. id of the timecard object for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timecard.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timecard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timecard.

####editable_fields

Boolean; if specified and true, the results returned will include a list of timecard fields that are editable by the caller (based on auth level).

The response results `timecard` attribute will be the selected timecard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timecard` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### timecard.list 

Returns information about timecard objects. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timecard object.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timecards attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timecard objects.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

Earliest timecard start date to select; defaults to 30 days ago

####end_date

Latest timecard start date to select; defaults to today

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

The response results `timecards` attribute will be an array of the current page of selected timecard objects. Each element of the array will be an timecard object containing basic or basic and extended timecard fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timecards` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### timecard.report 

Generates a pre-authorized link to download a timecard report.

Parameters:

####report_type

One of: `basic` (default), `extended`, `adherence`

####format

One of: `csv` (default), `xls`

####select

Selection criteria (optional):

####start_date

Earliest timecard start date to select; defaults to 30 days ago.

####end_date

Latest timecard start date to select; defaults to today.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

Response: A `url` attribute giving a link that may be used one time only, within 5 minutes of the API request, to generate the requested report.

### timecard.update 

Updates a timecard object.

Required parameter: `id`. Any other timecard object attributes may be specified.

Response: On success, empty results will be returned.

### timecard.customDropdownList 

Returns information about custom dropdown list objects.

## timeclock object

timeclock objects have the following basic attributes:

####id

A unique identifier for this timeclock object

####workgroup

A workgroup identifier or null if not clocked in

####account

Account identifier

####external_account

External account identifier

####clocked_in

Time that the user clocked in

####clocked_out

Time that the user clocked out or null if not clocked out

####shift

shift identifier or null if there is no shift associated with this timeclock object

timeclock objects have the following extended attributes:

####clocked_in_local

Time that the user clocked in, in the organization's timezone

####clocked_out_local

Time that the user clocked out, in the organization's timezone, or null if not clocked out

####timezone

The organization's timezone

####clockin_notes

(if specified)

####clockout_notes

(if specified)

####clockin_ipaddr

(if specified)

####clockout_ipaddr

(if specified)

####clockin_phone

(if specified)

####clockout_phone

(if specified)

####clockin_location

####clockout_location

Location of clockin/clockout, if known. An object with the following attributes:

####latitude

####longitude

####time

####accuracy

meters of 68% confidence of latitude/longitude

####clockin_device_id

(if specified)

####clockout_device_id

(if specified)

### timeclock.clockIn

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "2.903725", 

     jsonrpc: "2.0", 

     id: "37", 

     result: {

         id: 62064

     }

 }
`
Clocks in a given account.

Parameters:

####account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####workgroup

optional, defaults to clocking in to the organization

####shift

the shift to associate with this clock in; optional or required depending on organization settings

####clocked_in

optional, the time to record the user as having clocked in

####phone

optional, phone number used to clock in (for IVR systems)

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix. 

**note:** location_time must be defined when including *latitude*, *longitude*, and/or *location_accuracy*, otherwise these parameters will be ignored.

####device_id

optional, arbitrary string identifying timeclock device

####ip_address

IP address that originated this clock in (defaults to address issuing this api request)

####notes

optional, arbitrary text

Response: On success, returns `id` of the newly created timeclock object.

### timeclock.clockOut 

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "2.944529", 

     jsonrpc: "2.0", 

     id: "43", 

     result: {

         timecard: 111673

     }

 }
`
Clocks out a given account and creates a timecard for the clock in.

Parameters:

####account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####workgroup

optional, defaults to the organization; must match the workgroup to which the account is clocked in

####approve

boolean, default false; indicates whether the timecard object created for this clock in should be approved

####clocked_out

optional, the time to record the user as having clocked out

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix.

**note:** location_time must be defined when including *latitude*, *longitude*, and/or *location_accuracy*, otherwise these parameters will be ignored.

####device_id

optional, arbitrary string identifying timeclock device

####ip_address

IP address that originated this clock out (defaults to address issuing this api request)

####notes

optional, arbitrary text

Response: On success, returns `timecard`, the id of the newly created timecard object.

### timeclock.get

Returns information about a timeclock object.

Parameters:

####id

Required. id of the timeclock object for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timeclock.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeclock attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timeclock.

The response results `timeclock` attribute will be the selected timeclock object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timeclocks` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeclock.list 

Returns information about timeclock objects. Uses [pagination](https://api.shiftboard.com/api-documentation/req_resp.html#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timeclock object.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeclocks attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timeclock objects.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

Earliest clock in date to select

####end_date

Latest clock in date to select

####clocked_out

Boolean; true to include only already clocked out timeclock records, false to include only not yet clocked out timeclock records. Omit to include all records.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

The response results `timeclocks` attribute will be an array of the current page of selected timeclock objects. Each element of the array will be an timeclock object containing basic or basic and extended timeclock fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timeclocks` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeclock.report 

#### Request example:
`
 {

     select: {

         start_date: "2012-10-01"

     }, 

     report_type: total_hour, 

     format: xls

 }
`
#### Response example:
`
 {

     seconds: "2.811506", 

     jsonrpc: "2.0", 

     id: "21", 

     result: {

         url: "https://www.shiftboard.com/servola/fetch.cgi?ss=14;type=report;key=5085a260feff2760;signature=kRMtQqcLl0SULDYifhdg3OH4uIU;format=excel"

     }

 }
`
Generates a pre-authorized link to download a timeclock report.

Parameters:

####report_type

Required. One of: `basic`, `extended`, `total_hour`

####format

One of: `csv` (default), `xls`

####select

Selection criteria (optional):

####start_date

Earliest clock in date to report (or, for total_hour report, earliest date during which someone was clocked in)

####end_date

Latest clock in date to report (or, for total_hour report, latest date during which someone was clocked in)

####clocked_out

Boolean; true to include only already clocked out timeclock records, false to include only not yet clocked out timeclock records. Omit to include all records.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

Response: A `url` attribute giving a link that may be used one time only, within 5 minutes of the API request, to generate the requested report.

### timeclock.status 

#### Request example:
`
 {}
`
#### Response example:
`
 {

     seconds: "2.811506", 

     jsonrpc: "2.0", 

     id: "21", 

     result: {

         shift: null, 

         account: "4826", 

         clocked_out: null, 

         workgroup: null, 

         clocked_in: null

     }

 }
`
Reports clocked in/out status of an account.

Parameters: `account` (optional, defaults to current user).

Response: On success, returns basic timeclock attributes. If the account is clocked in, they will reflect that timeclock object; otherwise, timeclock attributes other than `account` will be null.

If not clocked in and shifts can be associated to timeclock entries, an additional boolean `shift_required` attribute will be present and indicate whether an associated shift is required and a `shifts_available` attribute will provide an array of possible shifts to associate (with those shifts most likely to be intended first), each element of the array providing the following attributes:

####category

A string with the value `current`, `next`, or `previous`, indicating whether the shift is scheduled for now, in the future, or in the past.

####shift

The shift identifier to specify when clocking in.

####workgroup

The workgroup identifier to specify when clocking in.

####description

A string describing when and for what team the shift is scheduled.

The `shifts_available` array entries will be sorted as follows:

* First sort by category: `current`, followed by `next`, then `previous`

* If `current`, sort by "most recently started," then "longest shift"

* If `next`, sort by "next to start," then "longest shift"

* If `previous`, sort by "most recently ended," then "longest shift"

The response will provide an additional `org_level` attribute, indicating the account's [level](https://api.shiftboard.com/api-documentation/objects/account.html#level) in the organization (2, 3, or 4), as well as `screen_name`, `first_name`, and `last_name` account attributes.

## timeOffRequest object

timeOffRequest objects have the following basic attributes:

####id

A unique identifier for this timeOffRequest.

####start_date

The date or date and time on which this timeOffRequest begins. For an all-day timeOffRequest, this is date in RFC 3339 full date format (e.g. "2009-04-01"). Otherwise, this is a datetime (e.g. "2009-04-01T13:00:00").

####end_date

The date and time on which this timeOffRequest ends, (e.g. "2009-04-01T17:00:00"). Not specified for all-day or open-ended timeOffRequests.

####timezone

####workgroup

The timeOffRequest's workgroup or null if no workgroup

####member

The account for which this is a request

####summary

Summary information about this request

####status

One of the following

0

New

2

Approved

3

Denied

####paid

Boolean; indicates whether this time off is paid or unpaid

####category

Category for this time off request, or null if the request has no category.

timeOffRequest objects have the following extended attributes:

####details

Additional details for this request

####admin_notes

(site administrators only)

####status_reason

Reason for approval or denial of request

####last_status_update

Datetime of last status update for this request

####status_update_by

account that last updated this request's status

### timeOffRequest.approve 

Approves a time off request.

Required parameter: `id`.

Optional parameter: `status_reason`. If not specified, status_reason will remain unchanged.

Response: On success, empty results will be returned.

### timeOffRequest.create 

Creates a new timeOffRequest record.

Parameters: Any attributes of a timeOffRequest object except `id`, `last_status_update`, or `status_update_by` may be specified. Minimally, `start_date` and `member` must be specified. `timezone` defaults to the organization's timezone. `status` defaults to "0" (New). `paid` defaults to false. Start and end dates may only fall on even five minute times.

Response: On success, an `id` attribute will provide the identifier for the new timeOffRequest.

### timeOffRequest.delete 

Deletes a timeOffRequest record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### timeOffRequest.deny 

Denies a time off request.

Required parameter: `id`.

Optional parameter: `status_reason`. If not specified, status_reason will remain unchanged.

Response: On success, empty results will be returned.

### timeOffRequest.get 

Returns information about a timeOffRequest.

Parameters:

####id

Required. id of the timeOffRequest for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timeOffRequest.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions (e.g. delete, update) may be presented to the user.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeOffRequest attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned time off request.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of what time range the time off is requested.

The response results "timeOffRequest" attribute will be the selected timeOffRequest object.

If user_actions were requested, a `user_actions` attribute will also be returned.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the "timeOffRequest" results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeOffRequest.list 

Returns information about timeOffRequests. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timeOffRequest.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned for each timeOffRequest with attributes indicating what actions (e.g. delete, update, approve) may be presented to the user.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeOffRequests attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned time off request.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of what time range the time off is requested.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 7 days after the start_date.

####status

If specified, requests only timeOffRequests with the status.

####member

If specified, requests only timeOffRequests for the given account.

The response results "timeOffRequests" attribute will be an array of the current page of selected timeOffRequests. Each element of the array will be an timeOffRequest object containing basic or basic and extended timeOffRequest fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the "timeOffRequest" results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeOffRequest.update 

Updates a timeOffRequest object.

Required parameter: `id`. Any timeOffRequest object attributes other than `last_status_update` and `status_update_by` may be specified.

Response: On success, if the timeOffRequest was updated, empty results will be returned.

## timezone object

timezone objects have the following minimal attributes:

####name

A unique displayable name used to identify this timezone. Currently, one of the following strings:

* "International Date Line West (GMT-12:00)"

* "Midway Island, Samoa (GMT-11:00)"

* "Hawaii (GMT-10:00)"

* "Alaska (GMT-09:00)"

* "Pacific Time (US/Can) (GMT-08:00)"

* "Arizona (GMT-07:00)"

* "Mountain Time (US/Can) (GMT-07:00)"

* "Chihuahua, La Paz, Mazatlan (GMT-07:00)"

* "Saskatchewan (GMT-06:00)"

* "Central Time (US/Can) (GMT-06:00)"

* "Guadalajara, Mexico City, Monterrey (GMT-06:00)"

* "Indiana (East) (GMT-05:00)"

* "Bogota, Lima, Quito (GMT-05:00)"

* "Eastern Time (US/Can) (GMT-05:00)"

* "Caracas, La Paz (GMT-04:30)"

* "Atlantic Time (Can) (GMT-04:00)"

* "Santiago (GMT-04:00)"

* "Newfoundland (GMT-03:30)"

* "Buenos Aires, Georgetown (GMT-03:00)"

* "Mid-Atlantic (GMT-02:00)"

* "Cape Verde Is. (GMT-01:00)"

* "Azores (GMT-01:00)"

* "Casablanca, Monrovia (GMT)"

* "Greenwich Mean Time : Dublin, Lisbon, London (GMT)"

* "Brussels, Copenhagen, Madrid, Paris (GMT+01:00)"

* "Belgrade, Bratislava, Budapest, Prague (GMT+01:00)"

* "Amsterdam, Berlin, Bern, Rome, Vienna (GMT+01:00)"

* "Sarajevo, Skopje, Warsaw, Zagreb (GMT+01:00)"

* "Harare, Pretoria (GMT+02:00)"

* "Cairo (GMT+02:00)"

* "Jerusalem (GMT+02:00)"

* "Athens, Beirut, Istanbul, Minsk (GMT+02:00)"

* "Bucharest (GMT+02:00)"

* "Helsinki, Kyiv, Riga, Sofia, Vilnius (GMT+02:00)"

* "Nairobi (GMT+03:00)"

* "Kuwait, Riyadh (GMT+03:00)"

* "Moscow, St. Petersburg, Volgograd (GMT+03:00)"

* "Baghdad (GMT+03:00)"

* "Tehran (GMT+03:30)"

* "Abu Dhabi, Muscat (GMT+04:00)"

* "Baku, Tbilisi, Yerevan (GMT+04:00)"

* "Kabul (GMT+04:30)"

* "Islamabad, Karachi, Tashkent (GMT+05:00)"

* "Chennai, Kolkata, Mumbai, New Delhi (GMT+05:30)"

* "Kathmandu (GMT+05:45)"

* "Astana, Dhaka (GMT+06:00)"

* "Almaty, Novosibirsk (GMT+06:00)"

* "Rangoon (GMT+06:30)"

* "Bangkok, Hanoi, Jakarta (GMT+07:00)"

* "Krasnoyarsk (GMT+07:00)"

* "Beijing, Chongqing, Hong Kong, Urumqi (GMT+08:00)"

* "Kuala Lumpur, Singapore (GMT+08:00)"

* "Taipei (GMT+08:00)"

* "Perth (GMT+08:00)"

* "Irkutsk, Ulaan Bataar (GMT+08:00)"

* "Seoul (GMT+09:00)"

* "Osaka, Sapporo, Tokyo (GMT+09:00)"

* "Yakutsk (GMT+09:00)"

* "Darwin (GMT+09:30)"

* "Adelaide (GMT+09:30)"

* "Brisbane (GMT+10:00)"

* "Guam, Port Moresby (GMT+10:00)"

* "Vladivostok (GMT+10:00)"

* "Hobart (GMT+10:00)"

* "Canberra, Melbourne, Sydney (GMT+10:00)"

* "Magadan, Solomon Is., New Caledonia (GMT+11:00)"

* "Fiji, Kamchatka, Marshall Is. (GMT+12:00)"

* "Auckland, Wellington (GMT+12:00)"

* "Nuku'alofa (GMT+13:00)"

####olson_timezone

The Olson timezone name for this timezone (e.g. *America/Los_Angeles*).

timezone objects have the following additional basic attributes:

####standard_offset

The offset from UTC when DST is not being observed (e.g. *-08:00*).

####abbreviations

The standard abbreviation(s) for this timezone (e.g. *PST/PDT*).

### timezone.get 

Returns information about a timezone.

Parameters:

####name

Required. The unique display name of the timezone for which to return information.

The response results `timezone` attribute will be the selected timezone object.

### timezone.list 

Returns information about timezones. Uses [pagination](#pagination).

Parameters: None

The response results `timezones` attribute will be an array of the current page of selected timezones. Each element of the array will be an timezone object containing basic timezone attributes.

## tradeboard object

tradeboard objects have the following basic attributes:

####id

A unique identifier for this tradeboard.

####shift

shift identifier for this trade.

####traded_by

account identifier originally assigned this shift.

####traded_to

account identifier that accepted this trade, or null if the trade is not completed.

####trade_complete

Boolean.

####status

One of:

####pending

Pending - Trade is awaiting permission to be offered

####offered

Offered - Trade is offered

####unapproved

Unapproved - Trade is awaiting approval of completion

####complete

Complete - Trade is completed

tradeboard objects have the following extended attributes:

####notes

####trade_completed

time at which this trade was completed.

### tradeboard.accept 

Takes a shift offered on the tradeboard.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.create 

Creates a new tradeboard posting.

Required Parameter:

####shift

shift identifier for this trade.

Optional Parameters:

####notes

Response: On success, an `id` attribute will provide the identifier for the new tradeboard posting.

### tradeboard.delete 

Deletes a tradeboard posting.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.get 

Returns information about a tradeboard posting.

Parameters:

####id

Required. id of the tradeboard posting for which to return information.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard posting.

The response results `tradeboard` attribute will be the selected tradeboard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####shift

All basic shift attributes will be provided. If the `extended` parameter is true, extended shift attributes will also be provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### tradeboard.list 

Returns information about tradeboard postings. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard postings.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 14 days after the start_date.

####trade_complete

If specified, true requests only completed trades, false requests only uncompleted trades.

The response results `tradeboard` attribute will be an array of the current page of selected tradeboard postings. Each element of the array will be a tradeboard object containing basic or basic and extended tradeboard fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or their associated shifts, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####shift

id and workgroup attributes are provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####workgroup

id and name attributes are provided.

### tradeboard.update 

Updates a tradeboard posting's notes.

Required parameter: `id`.

Optional parameter: `notes`.

Response: On success, empty results will be returned.

## voucher object

voucher objects have the following minimal attributes:

####id

A unique identifier for this voucher.

####account

Identifier of the account to which this voucher is assigned.

####cancelled

Boolean.

####credit_earned

Numeric, two decimal places

####credit_used

Numeric, two decimal places

####expiration_date

Date credit expires/expired (UTC)

####earned_date

Date credit was earned (UTC)

### voucher.balance 

Checks the user's voucher balance of available credit.

Parameters:

####org_id

optional, organization for which to return voucher products; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns a `balance` attribute and a `voucher_product` attribute giving an array of available product objects with `id`, `name`, and `credits` attributes.

### voucher.refund 

Refunds credit to the user's voucher balance.

Parameters:

####voucher_transaction_id

id of transaction to refund

####receipt

receipt attribute previously returned by voucher.use

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix

####device_id

optional, arbitrary string identifying issuing device

####device_name

optional, arbitrary string with a displayable name for device

####org_id

optional, organization for which to update the voucher transaction; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns empty results.

### voucher.use 

Uses credit from the user's voucher balance.

Parameters:

####credit

amount of credit to use.

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix

####device_id

optional, arbitrary string identifying issuing device

####device_name

optional, arbitrary string with a displayable name for device

####voucher_product

optional, the particular product for which credits are being redeemed

####org_id

optional, organization for which to record the voucher transaction; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns a `voucher_transaction_id` attribute and a string `receipt` attribute.

## workStatusType object

workStatusType objects have the following minimal attributes:

####id

A unique identifier for this workStatusType.

####name

A displayable name used to identify this workStatusType.

### workStatusType.get 

Returns information about a workStatusType.

Parameters:

####id

Required. The unique identifier of the workStatusType for which to return information.

The response results "workStatusType" attribute will be the selected workStatusType object.

### workStatusType.list 

Returns information about workStatusTypes. Uses [pagination](#pagination).

Parameters: None

The response results "workStatusTypes" attribute will be an array of the current page of selected workStatusTypes. Each element of the array will be an workStatusType object containing basic workStatusType attributes.

## workgroup object

workgroup objects have the following basic attributes:

####id

A unique identifier for this workgroup.

####name

The name of this workgroup.

####zip

The postal code for this workgroup.

####code

The nickname or code for this workgroup.

####contact_account

The account identifier of the primary contact for this workgroup.

Extended workgroup objects may also have these attributes:

####org_default

Boolean; true if new organization accounts by default get membership in this workgroup.

####description

Workgroup description shown to current members.

####auto_add

Boolean; true if members may add themselves to this workgroup; false if add requests require manager approval.

####view_public

Boolean; true if recruiting new members within the organization.

####view_public_non_org

Boolean; true if recruiting new members from outside the organization.

####public_email

Email address to include in recruiting information.

####public_phone

Phone number to include in recruiting information.

####public_code

Summary description of workgroup to include in recruiting information.

####public_info

Long description of workgroup to include in recruiting information.

####self_remove

Boolean; true if members can remove themselves from membership in this workgroup.

####allow_shared

Boolean; true shifts for this workgroup are shown in the shared schedule view.

####show_confirmed

Boolean; true if the count of covered shifts by date for this workgroup is visible to all workgroup members.

####member_add_shift

Boolean; true if workgroup members are allowed to add their own covered shifts to the schedule.

####show_open

Boolean; true if the count of open shifts by date for this workgroup is shown to all workgroup members.

####cancel_period

Number of days prior to a shift within which a workgroup member may cancel.

####allowed_conflict_mins

Number of minutes of overlap between shifts with the same location and workgroup to consider not a conflict.

####timezone

####location

Default location identifier for this workgroup's shifts.

####contact_account

Member identifier for this workgroup's contact person.

####url

Workgroup website.

####address

Mailing address address line.

####city

Mailing address city.

####state

Full name of mailing address state/province/subdivision.

####country

Full name of mailing address country.

####office_phone

####mobile_phone

####other_phone

####fax

####pager

(Not all attributes will be provided to all users.)

### workgroup.create_clients 

Creates new workgroup/client relationships.

Required parameters:

####client

A single client identifier or an array of identifiers of clients for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create client relationships for each specified client.

No more than 10000 workgroup client relationships may be specified in one request.

If one or more of the specified workgroup client relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addDepartments 

Creates new workgroup/department relationships.

Required parameters:

####department

A single department identifier or an array of identifiers of departments for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create department relationships for each specified department.

No more than 10000 workgroup department relationships may be specified in one request.

If one or more of the specified workgroup department relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addLocations 

Creates new workgroup/location relationships.

Required parameters:

####location

A single location identifier or an array of identifiers of locations for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create location relationships for each specified location.

No more than 10000 workgroup location relationships may be specified in one request.

If one or more of the specified workgroup location relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addRoles 

Creates new workgroup/role relationships.

Required parameters:

####role

A single role identifier or an array of identifiers of roles for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create role relationships for each specified role.

No more than 10000 workgroup role relationships may be specified in one request.

If one or more of the specified workgroup role relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.create 

Creates a new workgroup record.

Parameters: Any attributes of a workgroup object (except `id`) may be specified. A unique `name` parameter must be specified. Some workgroup attributes will default from organization values or configuration settings if not specified or invalid.

Response: On success, an `id` attribute will provide the identifier for the new workgroup.

### workgroup.delete 

Deletes a workgroup record.

### workgroup.deleteClients 

Required parameter: `id`.

Response: On success, empty results will be returned.

Deletes workgroup/client relationships.

Required parameters:

####client

A single client identifier or an array of identifiers of clients for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete client relationships for each specified client.

No more than 10000 workgroup client relationships may be specified in one request.

If one or more of the specified workgroup client relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteDepartments 

Deletes workgroup/department relationships.

Required parameters:

####department

A single department identifier or an array of identifiers of departments for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete department relationships for each specified department.

No more than 10000 workgroup department relationships may be specified in one request.

If one or more of the specified workgroup department relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteLocations 

Deletes workgroup/location relationships.

Required parameters:

####location

A single location identifier or an array of identifiers of locations for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete location relationships for each specified location.

No more than 10000 workgroup location relationships may be specified in one request.

If one or more of the specified workgroup location relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteRoles 

Deletes workgroup/role relationships.

Required parameters:

####role

A single role identifier or an array of identifiers of roles for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete role relationships for each specified role.

No more than 10000 workgroup role relationships may be specified in one request.

If one or more of the specified workgroup role relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.get 

Returns information about a workgroup.

Parameters:

####id

Required. id of the workgroup for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each shift.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroup attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroup.

The response results `workgroup` attribute will be the selected workgroup object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroup` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### workgroup.list 

Returns information about workgroups. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####select

An object specifying selection criteria for this request. May specify selected workgroup object attributes and values to select. The following additional criteria may be specified:

####deleted

true if deleted workgroups should be returned.

####search

A generic search string; select workgroups containing this string in name or code.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each workgroup.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroups attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroups.

The response results `workgroups` attribute will be an array of the current page of selected workgroups. Each element of the array will be a workgroup object containing basic or basic and extended workgroup fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroups` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### workgroup.listClients 

Returns information about workgroup/client relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####client

A single client identifier or an array of identifiers of clients for which to look up workgroup relationships. By default, all clients will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up client relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_clients` attribute will be an array of the current page of workgroup client relationships. Each element of the array may have the following attributes:

####client

A client identifier.

####workgroup

A workgroup identifier.

### workgroup.listDepartments 

Returns information about workgroup/department relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####department

A single department identifier or an array of identifiers of departments for which to look up workgroup relationships. By default, all departments will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up department relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_departments` attribute will be an array of the current page of workgroup department relationships. Each element of the array may have the following attributes:

####department

A department identifier.

####workgroup

A workgroup identifier.

### workgroup.listLocations 

Returns information about workgroup/location relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####location

A single location identifier or an array of identifiers of locations for which to look up workgroup relationships. By default, all locations will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up location relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_locations` attribute will be an array of the current page of workgroup location relationships. Each element of the array may have the following attributes:

####location

A location identifier.

####workgroup

A workgroup identifier.

### workgroup.listRoles 

Returns information about workgroup/role relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####role

A single role identifier or an array of identifiers of roles for which to look up workgroup relationships. By default, all roles will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up role relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_roles` attribute will be an array of the current page of workgroup role relationships. Each element of the array may have the following attributes:

####role

A role identifier.

####workgroup

A workgroup identifier.

### workgroup.update 

Updates a workgroup record.

Required parameter: `id`. Any other workgroup object attributes may be specified.

Response: On success, empty results will be returned.

