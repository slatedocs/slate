Sharing API
===========

Once you have become partners, you may share resources to your partner organization. Shared resources are represented by **share resources**. Currently there are two types of shares:

 + **Room shares**
   * [Outgoing room share][]
   * [Incoming room share][]
 + **Team shares**
   * [Outgoing team share][]
   * [Incoming team share][]

Additionally, each type of share are represented as either outgoing or incoming share, depending on whether you are the sharing or the receiving party.

## Outgoing shares

Each **outgoing share** resource has the following attributes, regardless of the type of resource that is being shared.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`receiver_organization_id` | [ID][] | **required** | ID of the partner organization to whom the resource is shared. **Must be an existing partner. Cannot be changed after creation.**
`receiver_organization` | object | read-only | The [organization][] object to whom the resource was shared
`share_name` | string | **optional** | Name that is shown to the receiver as a display name for this resource. If `null`, the original name is displayed. This may be updated later.
`sharer_organization_id` | [ID][] | read-only | ID of the organization who shared the resource
`sharer_organization` | object | read-only | The [organization][] object who shared the resource, with all of its attributes.
`created_at` | [date/time][] | read-only | When the resource was shared
`created_by_user_id` | [ID][] | read-only | ID of the user who shared the resource
`created_by_user` | object | read-only | The [user][] resource who shared the resource, with all of the available attributes

By default, resources are shared with their original names. However, these are usually for your organization's internal use, and you may want to display the resource with more descriptive name to your partners. In this case, you may want to define the `share_name` attribute.

### Outgoing room shares

Your organization may share rooms to their partners by creating outgoing room share resources that extend [outgoing share][] resources. Additionally, an outgoing room share object has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`room_id` | [ID][] | **required** | ID of the room to be shared. **Cannot be changed after creation.**
`room` | object | read-only | The [room][] resource that has been shared

### Outgoing team shares

Your organization may share teams to their partners by creating outgoing team share resources that extend [outgoing share][] resources. Additionally, an outgoing team share object has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`team_id` | [ID][] | **required** | ID of the team to be shared. **Cannot be changed after creation.**
`team` | object | read-only | The [team][] resource that has been shared

### Share a resource
You may share a resource to one of your partners by making a `POST` request.

`POST https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>`

The `<resource_type>` must be either `rooms` or `teams`. You may only share resources that you own or are being shared to your organization. You need to provide the required attributes of an [outgoing room share][] or an [outgoing team share][] as well as desired optional attributes as a payload.

The API returns an [outgoing room share][] or an [outgoing team share][] as a response.

### Retrieve outgoing share details
Returns an [outgoing room share][] or an [outgoing team share][] resource by the given ID.

`GET https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>/<resource_id>`

The `<resource_type>` must be either `rooms` or `teams`. Results in 404 response if you have no access to the share.

### Unshare a resource
You may decide not to share a resource any more to the specific partner. In this case, you may delete the [outgoing share][] resource.

`DELETE https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>/<resource_id>`

### Get a collection of outgoing shares
You may get a [paginated collection][] of all the [outgoing room share][] or [outgoing team share][] resources that your organization has created.

`GET https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>`

The `<resource_type>` must be either `rooms` or `teams`. This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options: `created_at`
`receiver_organization_id` | [ID][] | (none) | Filter the results by a receiving partner organization ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 200

### Update an outgoing share
Once a resource share is created, you cannot change its resource, partnership or other relations. If you shared a wrong resource or to a wrong partner, you need to delete the share and create a new one. You may still update a resource share resource, specifically its `share_name`, by making a `PUT` or `PATCH` request:

`PUT https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>/<resource_id>`

`PATCH https://service.giosg.com/api/v5/orgs/<sharer_organization_id>/outgoing_shares/<resource_type>/<resource_id>`

The `<resource_type>` must be either `rooms` or `teams`.

## Incoming shares

Each **incoming share** resource has the following attributes, regardless of the type of resource that is being shared.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`created_at` | [date/time][] | read-only | When the resource was shared
`sharer_organization_id` | [ID][] | read-only | ID of the organization who shared the resource
`sharer_organization` | object | read-only | The [organization][] object who shared the resource, with all of its attributes.
`receiver_organization_id` | [ID][] | read-only | ID of the organization to whom the resource was shared
`receiver_organization` | object | read-only | The [organization][] object to whon the resource was shared

### Incoming room shares

If you are a receiving party of a shared room, then you use the room share objects as **incoming room shares** that extend the [incoming share][] resource. Additionally, an incoming room share has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`room_id` | [ID][] | read-only | ID of the shared room
`room` | object | read-only | The [room][] resource that has been shared

### Incoming team shares

If you are a receiving party of a shared team, then you use the team share objects as **incoming team shares** that extend the [incoming share][] resource. Additionally, an incoming team share has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`team_id` | [ID][] | read-only | ID of the shared team
`team` | object | read-only | The [team][] resource that has been shared

### Get a collection of incoming shares
You may get a [paginated collection][] of all the [incoming room share][] or [incoming team share][] resources that are shared to your organization.

`GET https://service.giosg.com/api/v5/orgs/<receiver_organization_id>/incoming_shares/<resource_type>`

The `<resource_type>` must be either `rooms` or `teams`. This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at`
`sharer_organization_id` | [ID][] | (none) | Filter the results by a receiving partner organization ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 200

### Retrieve incoming share details
Returns an [incoming room share][] or [incoming team share][] resource by the given ID.

`GET https://service.giosg.com/api/v5/orgs/<receiver_organization_id>/incoming_shares/<resource_type>/<resource_id>`

The `<resource_type>` must be either `rooms` or `teams`.
