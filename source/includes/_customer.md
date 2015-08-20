Customer API
============

<aside class="success">
This is the new, recommended version (v4) of the customer API!
</aside>

**You should use this new v4 API instead of the [deprecated v3 version](https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api:customer-api).**

## Companies

A company represents any organization account on giosg system. A company consists of a number of users with their own user accounts. A user always belongs to exactly one company.

Please note that despite its name a "company" in this context means any organization or group. It can even consists of only one person.

A company object contains the following attributes. Note that the contact information is public.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | integer | read-only | Unique identifier for this company
`name` | string | **required?** | The name of the company. Required, if your company is using Network features.
`email` | string | **optional** | Contact email address, or `null`
`phone` | string | **optional** | Contact phone number, or `null`
`street` | string | **optional** | Contact street address, or `null`
`postal_code` | string | **optional** | Contact address postal code, or `null`
`city` | string | **optional** | Contact address city, or `null`
`country` | string | **optional** | Country as a two-letter, lowercase ISO 3166-1 code, or `null`
`business_id` | string | **optional** | Business ID of the company, if any, or `null`
`created_at` | [date/time][] | read-only | When this company account was created. **Visible only for your own company.**
`modified_at` | [date/time][] | read-only | When company details were changed last time. **Visible only for your own company.**
`billing_street` | string | **optional** | Billing street address, or `null`. **Visible only for your own company**
`billing_postal_code` | string | **optional** | Billing postal code, or `null`. **Visible only for your own company**
`billing_city` | string | **optional** | Billing city, or `null`. **Visible only for your own company**
`billing_country` | string | **optional** | Billing country as a two-letter ISO 3166-1 code, or `null`. **Visible only for your own company**

### Retrieve company details
Get a single [company][] object by its ID.

`GET /api/v4/customer/companies/[company_id]`

### Update company details
You may update some of the attributes a company, if you have permissions to do so.

`PUT /api/v4/customer/companies/[company_id]`

`PATCH /api/v4/customer/companies/[company_id]`

When using `PUT` you need to provide an object as a request payload that contains the changed attributes the [company][]. When using `PATCH`, you may omit those attributes that you do not want to change.

## Persons
A person represents a giosg user account. A person resource has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | integer | read-only | Unique identifier
`email` | string | read-only | Email address
`company_id` | integer | read-only | ID of the company to which the person belongs to
`company` | object | read-only | The [company][] resource to which the person belongs to
`first_name` | string | **optional** | First name
`last_name`| string | **optional** | Last name
`is_manager` | boolean | **required** | Whether the person is a manager. You cannot change this for yourself. You may change the value for the other members of your company, if you are a manager.
`alias` | string | **optional** | Display name, used when chatting. May be `null`
`gender` | integer | **optional** | Gender with three options: `1`= male, `2`= female, `null`= unknown
`birthday` | [date][] | **optional** | Date of birth in format `YYYY-MM-DD`, e.g. `1980-06-19`
`phone` | string | **optional** | Contact phone number
`title` | title | **optional** | Title of the person
`created_at` | [date/time][] | read-only | When the person resource was created
`modified_at` | [date/time][] | read-only | When the person resource was modified last time
`avatar` | object | read-only | The avatar of the person as an object. It contains attributes `id`and `url`. This is `null` if the person has no avatar.
`is_online` | boolean | read-only | Whether the person is currently in online status as an operator, based on the most recent information about the user.
`is_signed_in` | boolean | read-only | Whether the person is currenlty logged in to the service, based on the most recent information about the user.
`current_chat_count` | integer | read-only | The number of chats the person has currently, based on the most recent information about the user.
`is_deleted` | boolean | read-only | Whether this person exists no more. If `true`, the resource exists only for historical purposes and cannot be used in any other context!
`team_memberships` | array of objects | read-only | The [team membership][] resources, listing the teams this person belongs to. Each object in the array has the attributes `id`, `team_id`, `team`, `is_admin`

### Retrieve person details
Get a single [person][] object by its ID.

`GET /api/v4/customer/persons/[person_id]`
Alternatively, you may get **your own** user account details by replacing the ID with the word `me`.

`GET /api/v4/customer/persons/me`

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`include_deleted` | boolean | false | If `true`, does not return 404 for deleted resources.

If you try to get a person that has been deleted, the endpoint results in 404 response by default. You may access the removed persons of your company for historical purposes by adding `include_deleted=true` to the GET parameters.

### Update person details
You may update some of the attributes of a user account.

`PUT /api/v4/customer/persons/[person_id]`

`PATCH /api/v4/customer/persons/[person_id]`

Once again, you may replace the person ID with word `me` in order to update your own account details.

When using `PUT` you need to provide an object as a request payload that contains all the changed attributes of the [person][]. When using `PATCH`, you may omit those attributes that you do not want to change.

### Get a collection of persons
Get a [paginated collection][] of persons that you are allowed to list.

`GET /api/v4/customer/persons/`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `id`, `last_name`, `first_name`, `email`, `alias`, `created_at`, `modified_at`
`include_deleted` | boolean | false | If `true`, include deleted resources to results. If `false` (default), excludes any deleted resources.
`is_manager` | boolean | (none) | If `true`, only include managers. If `false`, exclude all managers.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

## Rooms

A room object contains the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | integer | The unique identifier of this room
`token` | string | A signed Giosg token, used as a public identifier of this room
`company_id`| integer | ID of the company who owns this room.
`company`| object | The [company][] who owns this room.
`domain` | string | A domain hostname if this room is a domain room, otherwise `null`
`name` | string | Name of the room, set by the owner
`display_name` | string | Display name of the room. It may equal to the `name` attribute, unless this room is [shared][outgoing room share] to your company with a custom `share_name`.
`is_shared` | boolean | `true` if the room is shared to your company, `false` if your company owns the room
`allowed_domains` | array of objects | List of domain rooms on which this room may be used. Each object in the array contains `id`, `name`, `display_name` and `domain` attributes.
`language_code` | string | Language of this room in ISO 639-1 code, or `null` if undefined.
`created_at` | [date/time][] | When this room was created. **Visible only to your own company.**
`modified_at` | [date/time][] | When this room was modified last time. **Visible only to your own company.**
`last_modifier_id` | integer | ID of the person who last modified this room, or `null` if unknown. **Visible only to your own company.**
`last_modifier` | object | Details of the person who last modified this room, or `null` if unknown. **Visible only to your own company.**
`is_deleted` | boolean | read-only | Whether this room exists no more. The resource exists only for historical purposes and cannot be used in any other context.

### Retrieve room details
Get a single room object that your company has access to, by its ID. This may be a shared room.

`GET /api/v4/customer/rooms/[room_id]`

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`include_deleted` | boolean | false | If `true`, does not return 404 for deleted resources.

If you try to get a room that has been deleted, the endpoint results in 404 response by default. You may access the removed rooms of your company for historical purposes by adding `include_deleted=true` to the GET parameters.

### Get a collection of rooms
Return a [paginated collection][] of all the [room][] resources you have access to, including any shared rooms:

`GET /api/v4/customer/rooms`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `id`, `name`, `domain`, `created_at`, `modified_at`, `company_id`
`include_deleted` | boolean | `false` | If `true`, include deleted resources to results. If `false` (default), excludes any deleted resources.
`is_shared` | boolean | (none) | If `true`, return only rooms shared to your company. If `false`, return only your own company's rooms.
`company_id` | integer | (none) | Return only rooms owned by this company ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

## Teams

A team object contains the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | integer | The unique identifier of this team
`company_id` | integer | ID of the company who owns this room.
`company` | object | The [company][] who owns this room.
`name` | string | Name of the team, set by the owner
`display_name` | string | Display name of the team. It may equal to the `name` attribute, unless this team is [shared][outgoing team share] to your company with a custom `share_name`.
`is_shared` | boolean | `true` if the room is shared to your company, `false` if your company owns the room
`member_count` | integer | Number of [members][team membership] in this team, including both admins and non-admins. **Visible only to your own company.**
`admin_count` | integer | Number of [admins][team membership] in this team. **Visible only to your own company.**

### Retrieve team details
Get a single team object that your company has access to, by its ID. This may be a shared team.

`GET /api/v4/customer/teams/[team_id]`

### Get a collection of teams
Return a [paginated collection][] of all the [team][] resources you have access to, including any shared teams:

`GET /api/v4/customer/teams`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `id`, `name`, `company_id`
`is_shared` | boolean | (none) | If `true`, return only teams shared to your company. If `false`, return only your own company's teams.
`company_id` | integer | (none) | Return only rooms owned by this company ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

## Team memberships

A **team membership** represents a person belonging to a specific team. Team memberships are only visible for teams of your own company. A team membership resource has the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | integer | The unique identifier of this team
`team_id`| integer | ID of the team to which this member belongs.
`team`| object | The [team][] to which this member belongs, with attributes `id`, `name`, `display_name`, and `company_id`.
`person_id` | integer | ID of the member person.
`person` | object | The member [person][] resource. Has all other attributes than `company`
`is_admin` | boolean | Whether or not the member is the admin of the team.

### Get a collection of team memberships for a team
Return a [paginated collection][] of all the [team membership][] resources for a specific [team][].

`GET /api/v4/customer/teams/[team_id]/memberships`

Parameter | Type | Default | Description
----------|------|---------|------------
`is_admin` | boolean | (none) | If `true`, return only admin memberships. If `false`, return only non-admin memberships.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200
