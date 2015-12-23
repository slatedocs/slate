Customer API
============

## Organizations

An organization represents any organization account on giosg system. An organization consists of a number of users with their own user accounts. A user always belongs to exactly one organization.

Please note that despite its name a "organization" in this context means any organization or group. It can even consists of only one user.

An organization object contains the following attributes. Note that the contact information is public.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | [ID][] | read-only | Unique identifier for this organization
`name` | string | **required?** | The name of the organization. Required, if your organization is using Network features, such as [partnerships](#partnership-api) or [sharing](#sharing-api).
`email` | string | **optional** | Contact email address, or `null`
`phone` | string | **optional** | Contact phone number, or `null`
`street` | string | **optional** | Contact street address, or `null`
`postal_code` | string | **optional** | Contact address postal code, or `null`
`city` | string | **optional** | Contact address city, or `null`
`country` | string | **optional** | Country as a two-letter, lowercase ISO 3166-1 code, or `null`
`business_id` | string | **optional** | Business ID of the organization, if any, or `null`
`created_at` | [date/time][] | read-only | When this organization account was created. **Available only for your own organization.**
`updated_at` | [date/time][] | read-only | When organization details were changed last time. **Available only for your own organization.**

### Retrieve organization details
Get a single [organization][] object by its ID.

`GET https://service.giosg.com/api/v5/orgs/<organization_id>`

### Update organization details
You may update some of the attributes a organization, if you have permissions to do so.

`PUT https://service.giosg.com/api/v5/orgs/<organization_id>`

`PATCH https://service.giosg.com/api/v5/orgs/<organization_id>`

When using `PUT` you need to provide an object as a request payload that contains the changed attributes the [organization][]. When using `PATCH`, you may omit those attributes that you do not want to change.

## Users
A user represents a giosg user account. A user resource has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | [ID][] | read-only | Unique identifier
`email` | string | read-only | Email address
`organization_id` | [ID][] | read-only | ID of the organization to which the user belongs to
`organization` | object | read-only | The [organization][] resource to which the user belongs to
`first_name` | string | **optional** | First name
`last_name`| string | **optional** | Last name
`is_manager` | boolean | **required** | Whether the user is a manager. You cannot change this for yourself. You may change the value for the other members of your organization, if you are a manager.
`alias` | string | **optional** | Display name, used when chatting. May be `null`
`gender` | integer | **optional** | Gender with three options: `1`= male, `2`= female, `null`= unknown
`birthday` | [date][] | **optional** | Date of birth in format `YYYY-MM-DD`, e.g. `1980-06-19`
`phone` | string | **optional** | Contact phone number
`title` | title | **optional** | Title of the user
`created_at` | [date/time][] | read-only | When the user resource was created
`updated_at` | [date/time][] | read-only | When the user resource was updated last time
`avatar` | object | read-only | The avatar of the user as an object. It contains attributes `id`and `url`. This is `null` if the user has no avatar.
`is_online` | boolean | read-only | Whether the user is currently in online status as an operator, based on the most recent information about the user.
`is_signed_in` | boolean | read-only | Whether the user is currenlty logged in to the service, based on the most recent information about the user.
`current_chat_count` | integer | read-only | The number of chats the user has currently, based on the most recent information about the user.
`is_deleted` | boolean | read-only | Whether this user exists no more. If `true`, the resource exists only for historical purposes and cannot be used in any other context!
`team_memberships` | array of objects | read-only | The [team membership][] resources, listing the teams this user belongs to. Each object in the array has the attributes `id`, `team_id`, `team`, `is_admin`

### Get your own user

<aside class="success">
It is a common use case to first find out your own user or your organization's information, and then perform further actions on it.
</aside>

There is a special API endpoint that returns the [user][] resource depending on who is [authenticated][authentication].

`GET https://service.giosg.com/api/v5/users/me`

To find out your organization's ID, just use the `organization_id` attribute of the returned resource. Alternatively you can use the nested [organization][] resource for more details).

This API endpoint returns a 401 response if you are not being currently authenticated. It returns a 403 response if your authentication token is not directly related to one specific user.

### Get a collection of organization members

Get a [paginated collection][] of users who belong to a given organization (`<organization_id>`)

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/users`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at` or `email` (with or without `-`)
`include_deleted` | boolean | false | If `true`, include deleted users to results. If `false` (default), excludes any deleted users.
`is_manager` | boolean | (none) | If `true`, only include managers. If `false`, exclude all managers.

### Retrieve details of an organization member
Get a single [user][] object by its ID (`<user_id>`) that belongs to an organization (`<organization_id>`)

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/users/<user_id>`

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`include_deleted` | boolean | false | If `true`, does not return 404 for deleted resources.

If you try to get a user that has been deleted, the endpoint results in 404 response by default. You may access the removed users of your organization for historical purposes by adding `include_deleted=true` to the GET parameters.

This endpoint returns a 403 response if you do not have permissions for this organization. It returns a 404 response if the user does not exists **or** they doesn't belong to the organization.

### Update details of an organization member
You may update some of the attributes of a user (`<user_id>`) that belongs to an organization (`<organization_id>`)

`PUT https://service.giosg.com/api/v5/orgs/<organization_id>/users/<user_id>`

`PATCH https://service.giosg.com/api/v5/orgs/<organization_id>/users/<user_id>`

When using `PUT` you need to provide an object as a request payload that contains all the changed attributes of the [user][]. When using `PATCH`, you may omit those attributes that you do not want to change.

<aside class="warning">
You are allowed to update your own details. You may only change other users' details if you have management rights for the organization. Otherwise this endpoint will result in a 403 response.
</aside>
