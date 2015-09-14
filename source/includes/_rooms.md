Rooms API
=========

## Rooms and domains

The room resource has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | The unique identifier of this room
`token` | string | read-only | A signed Giosg token, used as a public identifier of this room
`organization_id` | [ID][] | read-only | ID of the organization who owns this room.
`organization`| object | read-only | The [organization][] who owns this room.
`domain` | string | **optional** | A domain hostname if this room is a **domain room**, otherwise `null` if this is a custom room. **Cannot be changed after creation.** You cannot have multiple domain rooms with the same `domain` attribute!
`name` | string | **required** | Name of the room, set by the owner. Must be a non-empty string.
`display_name` | string | read-only | Display name of the room. It may equal to the `name` attribute, unless this room is [shared][outgoing room share] to your organization with a custom `share_name`.
`is_shared` | boolean | read-only | `true` if the room is shared to your organization, `false` if your organization owns the room
`allowed_domains` | array of objects | read-only | List of domain rooms on which this room may be used. Each object in the array contains `id`, `name`, `display_name` and `domain` attributes.
`language_code` | string | **optional** | Language of this room in ISO 639-1 code, or `null` if undefined.
`created_at` | [date/time][] | read-only | When this room was created. **Available only to your own organization.**
`updated_at` | [date/time][] | read-only | When this room was updated last time. **Available only to your own organization.**
`updated_by_user_id` | [ID][] | string | ID of the user who last updated this room, or `null` if unknown. **Available only to your own organization.**
`updated_by_user` | object | read-only | Details of the user who last updated this room, or `null` if unknown. **Available only to your own organization.**
`is_deleted` | boolean | read-only | read-only | Whether this room exists no more. The resource exists only for historical purposes and cannot be used in any other context.

Domain rooms are like any other rooms except that they are linked to exactly one domain (website). You need a domain room in order to use a Giosg services on your website.

### Retrieve room details
Get a single room object that your organization has access to, by its ID. This may be a shared room.

`GET https://service.giosg.com/api/v5/rooms/<room_id>`

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`include_deleted` | boolean | false | If `true`, does not return 404 for deleted resources.

If you try to get a room that has been deleted, the endpoint results in 404 response by default. You may access the removed rooms of your organization for historical purposes by adding `include_deleted=true` to the GET parameters.

### Get a collection of rooms
Return a [paginated collection][] of all the [room][] resources you have access to, including any shared rooms:

`GET https://service.giosg.com/api/v5/rooms`

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `name`, `domain`, `created_at`, `updated_at`
`include_deleted` | boolean | `false` | If `true`, include deleted resources to results. If `false` (default), excludes any deleted resources.
`is_shared` | boolean | (none) | If `true`, return only rooms shared to your organization. If `false`, return only your own organization's rooms.
`organization_id` | [ID][] | (none) | Return only rooms owned by this organization ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

### Creating a room
Create a new custom room or a domain room by making a `POST` request, providing the [room object][room] as a payload. By providing the `domain` attribute with non-null value will create a new domain room.

`POST https://service.giosg.com/api/v5/rooms`

### Update a room
You may update the editable attributes of your own room by making either a `PATCH` (update a subset of attributes) or `POST` request (update all the attributes).

`PUT https://service.giosg.com/api/v5/rooms/<room_id>`

`PATCH https://service.giosg.com/api/v5/rooms/<room_id>`

### Delete a room

<aside class="warning">
Deleting a room will immediately unshare it from your partners! You cannot undo this action, but you can re-create and re-share the room again.
</aside>

You may delete one of your own rooms by making a `DELETE` request.

`DELETE https://service.giosg.com/api/v5/rooms/<room_id>`
