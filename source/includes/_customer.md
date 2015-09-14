Customer API
============

<aside class="success">
This is the new, recommended version (v5) of the customer API!
</aside>

**You should use this new API instead of the [deprecated v3 version](https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api:customer-api).**

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
`billing_street` | string | **optional** | Billing street address, or `null`. **Available only for your own organization**
`billing_postal_code` | string | **optional** | Billing postal code, or `null`. **Available only for your own organization**
`billing_city` | string | **optional** | Billing city, or `null`. **Available only for your own organization**
`billing_country` | string | **optional** | Billing country as a two-letter ISO 3166-1 code, or `null`. **Available only for your own organization**

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

### Retrieve user details
Get a single [user][] object by its ID.

`GET https://service.giosg.com/api/v5/users/<user_id>`

Alternatively, you may get **your own** user account details by replacing the ID with the word `me`.

`GET https://service.giosg.com/api/v5/users/me`

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`include_deleted` | boolean | false | If `true`, does not return 404 for deleted resources.

If you try to get a user that has been deleted, the endpoint results in 404 response by default. You may access the removed users of your organization for historical purposes by adding `include_deleted=true` to the GET parameters.

### Update user details
You may update some of the attributes of a user account.

`PUT https://service.giosg.com/api/v5/users/<user_id>`

`PATCH https://service.giosg.com/api/v5/users/<user_id>`

Once again, you may replace the user ID with word `me` in order to update your own account details.

When using `PUT` you need to provide an object as a request payload that contains all the changed attributes of the [user][]. When using `PATCH`, you may omit those attributes that you do not want to change.

### Get a collection of users
Get a [paginated collection][] of users that you are allowed to list.

`GET https://service.giosg.com/api/v5/users/`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `last_name`, `first_name`, `email`, `alias`, `created_at`, `updated_at`
`include_deleted` | boolean | false | If `true`, include deleted resources to results. If `false` (default), excludes any deleted resources.
`is_manager` | boolean | (none) | If `true`, only include managers. If `false`, exclude all managers.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

## Teams

A team object contains the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | The unique identifier of this team
`organization_id` | [ID][] | read-only | ID of the organization who owns this team.
`organization` | object | read-only | The [organization][] who owns this team.
`name` | string | **required** | Name of the team. Must be a non-empty string.
`display_name` | string | read-only | Display name of the team. It may equal to the `name` attribute, unless this team is [shared][outgoing team share] to your organization with a custom `share_name`.
`is_shared` | boolean | read-only | `true` if the team is shared to your organization, `false` if your organization owns the team
`member_count` | integer | read-only | Number of [members][team membership] in this team, including both admins and non-admins. **Available only to your own organization.**
`admin_count` | integer | read-only | Number of [admins][team membership] in this team. **Available only to your own organization.**

### Retrieve team details
Get a single team object that your organization has access to, by its ID. This may be a shared team.

`GET https://service.giosg.com/api/v5/teams/<team_id>`

### Get a collection of teams
Return a [paginated collection][] of all the [team][] resources you have access to, including any shared teams:

`GET https://service.giosg.com/api/v5/teams`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `id`, `name`, `organization_id`
`is_shared` | boolean | (none) | If `true`, return only teams shared to your organization. If `false`, return only your own organization's teams.
`organization_id` | [ID][] | (none) | Return only rooms owned by this organization ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

Teams are readable by anyone in the same organization. However, they can be created, updated or deleted only by organization managers.

### Creating a team
Create a team to your own organization:

`POST https://service.giosg.com/api/v5/teams`

### Update a team
You may update the editable attributes of your own team by making either a `PATCH` (update a subset of attributes) or `POST` request (update all the attributes).

`PUT https://service.giosg.com/api/v5/team/<team_id>`

`PATCH https://service.giosg.com/api/v5/team/<team_id>`

### Delete a team

<aside class="warning">
Deleting a team will immediately clear all the memberships from the team. It will also unshare it from your partners! You cannot undo this action, but you can re-create and re-share the team and its memberships again.
</aside>

You may delete one of your own teams by making a `DELETE` request.

`DELETE https://service.giosg.com/api/v5/teams/<team_id>`

## Team memberships

A **team membership** represents a user belonging to a specific team. Team memberships are only visible for teams of your own organization. A team membership resource has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`team_id` | [ID][] | read-only | ID of the team to which this member belongs.
`team`| object | read-only | The [team][] to which this member belongs, with attributes `id`, `name`, `display_name`, and `organization_id`.
`user_id` | [ID][] | read-only | ID of the member user.
`user` | object | read-only | The member [user][] resource. Has all other attributes than `organization`
`is_admin` | boolean | **required** | Whether or not the member is an admin of the team.

Team memberships are readable by any member of the same organization. However, they can be created, updated or deleted only by either organization managers or by team admins. Otherwise, the endpoints will return a `403 Forbidden` response.

### Get a collection of team members
Return a [paginated collection][] of all the [team membership][] resources for a specific [team][].

`GET https://service.giosg.com/api/v5/teams/<team_id>/memberships`

Parameter | Type | Default | Description
----------|------|---------|------------
`is_admin` | boolean | (none) | If `true`, return only admin memberships. If `false`, return only non-admin memberships.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

### Add a member to a team
You may add a user of your own organization to one of your teams by creating a team membership object.

`POST https://service.giosg.com/api/v5/teams/<team_id>/memberships/<user_id>`

This returns a `201 Created` response if the user with the given ID was successfully added to the team. If the user was already in the team, this updates the `is_admin` attribute and returns `200 OK` response with the existing membership resource.

### Update a team membership
You may update a team membership, i.e. change the admin status of a member either by attempting to create a new membership with `POST` or updating with `PUT`.

`PUT https://service.giosg.com/api/v5/teams/<team_id>/memberships/<user_id>`

This returns a `201 Created` response if the user did not belong to team previously but was now added. If the user was already in the team, this updates the attributes and returns `200 OK` response with the existing membership resource.

You may also update a membership with a `PATCH` request, but this will return `404 Not Found` in case the membership did not exist.

### Remove a member from a team
You may remove a user from a team by deleting his/her membership.

`DELETE https://service.giosg.com/api/v5/teams/<team_id>/memberships/<user_id>`

### Retrieve team membership details
You may get the a user membership resource in a team:

`GET https://service.giosg.com/api/v5/teams/<team_id>/memberships/<user_id>`
