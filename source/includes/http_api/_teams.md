Teams API
=========

## Teams

A team object contains the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | The unique identifier of this team
`organization_id` | [ID][] | read-only | ID of the organization who owns this team.
`organization` | object | read-only | The [organization][] who owns this team.
`name` | string | **required** | Name of the team. Must be a non-empty string.
`display_name` | string | read-only | Display name of the team. It may equal to the `name` attribute, unless this team is [shared][outgoing team share] to your organization with a custom `share_name`.
`created_at` | [date/time][] | read-only | When the team resource was created
`updated_at` | [date/time][] | read-only | When the team resource was updated last time
`member_count` | integer | read-only | Number of [members][team membership] in this team, including both admins and non-admins. **Available only to your own organization.**
`admin_count` | integer | read-only | Number of [admins][team membership] in this team. **Available only to your own organization.**

### Get a collection of teams
Return a [paginated collection][] of all the [team][] resources of an organization (`<organization_id>`). By default, this also includes any [teams shared to your company][incoming team shares]!

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/teams`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at` or `-created_at`
`is_shared` | boolean | (none) | If `true`, return only teams that are shared to the organization. If `false`, return only the organization's own teams.

Teams are readable by anyone in the same organization. However, they can be created, updated or deleted only by organization managers.

### Retrieve team details
Get a single team object (`<team_id>`) of an organization (`<organization_id>`). This may be a [team shared to the organization][incoming team shares].

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>`

### Creating a team
Create a team for an organization (`<organization_id>`)

`POST https://service.giosg.com/api/v5/orgs/<organization_id>/teams`

### Update a team
You may update the editable attributes of a team (`<team_id>`) that belongs to an organization (`<organization_id>`). You can make either a `PATCH` request (update a subset of attributes) or `POST` request (update all the attributes).

`PUT https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>`

`PATCH https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>`

### Delete a team

<aside class="warning">
Deleting a team will immediately clear all the memberships from the team. It will also unshare it from your partners! You cannot undo this action, but you can re-create and re-share the team and its memberships again.
</aside>

You may delete one of your own teams by making a `DELETE` request.

`DELETE https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>`

## Team memberships

A **team membership** represents a user belonging to a specific team. Team memberships are only visible for teams of your own organization. A team membership resource has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`team_id` | [ID][] | read-only | ID of the team to which this member belongs.
`team`| object | read-only | The [team][] to which this member belongs, with attributes `id`, `name`, `display_name`, and `organization_id`.
`user_id` | [ID][] | read-only | ID of the member user.
`user` | object | read-only | The member [user][] resource. Has all other attributes than `organization`
`is_admin` | boolean | **required** | Whether or not the member is an admin of the team.
`created_at` | [date/time][] | read-only | When the membership resource was created
`updated_at` | [date/time][] | read-only | When the membership resource was updated last time

Team memberships are readable by any member of the same organization. However, they can be created, updated or deleted only by either organization managers or by team admins. Otherwise, the endpoints will return a `403 Forbidden` response.

### Get a collection of team members
Return a [paginated collection][] of all the [team membership][] resources for a specific [team][].

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>/memberships`

Parameter | Type | Default | Description
----------|------|---------|------------
`is_admin` | boolean | (none) | If `true`, return only admin memberships. If `false`, return only non-admin memberships.

### Add a member to a team
You may add a user of your own organization to one of your teams by creating a team membership object.

`POST https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>/memberships/<user_id>`

This returns a `201 Created` response if the user with the given ID was successfully added to the team. If the user was already in the team, this updates the `is_admin` attribute and returns `200 OK` response with the existing membership resource.

### Update a team membership
You may update a team membership, i.e. change the admin status of a member either by attempting to create a new membership with `POST` or updating with `PUT`.

`PUT https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>/memberships/<user_id>`

This returns a `201 Created` response if the user did not belong to team previously but was now added. If the user was already in the team, this updates the attributes and returns `200 OK` response with the existing membership resource.

You may also update a membership with a `PATCH` request, but this will return `404 Not Found` in case the membership did not exist.

### Remove a member from a team
You may remove a user from a team by deleting his/her membership.

`DELETE https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>/memberships/<user_id>`

### Retrieve team membership details
You may get the a user membership resource in a team:

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/teams/<team_id>/memberships/<user_id>`
