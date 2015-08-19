Sharing API
===========

Once you have become partners, you may share resources to your partner company. Shared resources are represented by **share resources**. Currently there are two types of shares:

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
`id` | integer | read-only | Unique identifier for the share
`created_at` | [date/time][] | read-only | When the resource was shared
`creator_person_id` | integer | read-only | ID of the person who shared the resource
`creator_person` | object | read-only | The [person][] resource who shared the resource, with all of the available attributes
`share_name` | string | **optional** | Name that is shown to the receiver as a display name for this resource. If `null`, the original name is displayed. This may be updated later.
`partnership_id` | integer | **required** | ID of the [partnership][] of the partner to whom the resource is shared. **Cannot be changed after creation.**
`original_share_id` | integer | **required (?)** | ID of the incoming share if the resource is being re-shared, or `null` otherwise. Required if you are sharing forward a resource that has been shared to you. **Cannot be changed after creation.**
`original_share` | object | read-only | The incoming share resource if the room is being re-shared, or `null` otherwise. Its `id` equals to `original_share_id`.
`sharer_company_id` | integer | read-only | ID of the company who shared the resource
`sharer_company` | object | read-only | The [company][] object who shared the resource, with all of its attributes.
`receiver_company_id` | object | read-only | ID of the company to whom the resource was shared
`receiver_company` | object | read-only | The [company][] object to whon the resource was shared

If you are re-sharing a resource that is shared to your company, then you must set the attribute `original_share_id` to the ID of the corresponding [incoming share][] resource that shares the resource to **your** company. If you own the shared room, this should always be `null`.

By default, resources are shared with their original names. However, these are usually for your company's internal use, and you may want to display the resource with more descriptive name to your partners. In this case, you may want to define the `share_name` attribute.

### Outgoing room shares

Your company may share rooms to their partners by creating outgoing room share resources that extend [outgoing share][] resources. Additionally, an outgoing room share object has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`room_id` | integer | **required** | ID of the room to be shared. **Cannot be changed after creation.**
`room` | object | read-only | The [room][] resource that has been shared

### Outgoing team shares

Your company may share teams to their partners by creating outgoing team share resources that extend [outgoing share][] resources. Additionally, an outgoing team share object has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`team_id` | integer | **required** | ID of the team to be shared. **Cannot be changed after creation.**
`team` | object | read-only | The [team][] resource that has been shared

### Share a resource
You may share a resource to one of your partners by making a `POST` request.

`POST /api/v3/network/shares/outgoing/[resource_type]/`

The `[resource_type]` must be either `rooms` or `teams`. You may only share resources that you own or are being shared to your company. You need to provide the required attributes of an [outgoing room share][] or an [outgoing team share][] as well as desired optional attributes as a payload.

The API returns an [outgoing room share][] or an [outgoing team share][] as a response.

### Retrieve outgoing share details
Returns an [outgoing room share][] or an [outgoing team share][] resource by the given ID.

`GET /api/v3/network/shares/outgoing/[resource_type]/[share_id]`

The `[resource_type]` must be either `rooms` or `teams`. Results in 404 response if you have no access to the share.

### Unshare a resource
You may decide not to share a resource any more to the specific partner. In this case, you may delete the [outgoing share][] resource.

`DELETE /api/v3/network/shares/outgoing/[resource_type]/[share_id]`

### Get a collection of outgoing shares
You may get a [paginated collection][] of all the [outgoing room share][] or [outgoing team share][] resources that your company has created.

`GET /api/v3/network/shares/outgoing/[resource_type]/`

The `[resource_type]` must be either `rooms` or `teams`. This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at`, `partnership_id`
`partnership_id` | integer | (none) | Filter the results by a partnership ID
`receiver_company_id` | integer | (none) | Filter the results by a receiving partner company ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 200

### Update an outgoing share
Once a resource share is created, you cannot change its resource, partnership or other relations. If you shared a wrong resource or to a wrong partner, you need to delete the share and create a new one. You may still update a resource share resource, specifically its `share_name`, by making a `PUT` or `PATCH` request:

`PUT /api/v3/network/shares/outgoing/[resource_type]/[resourceshare_id]`

`PATCH /api/v3/network/shares/outgoing/[resource_type]/[resourceshare_id]`

The `[resource_type]` must be either `rooms` or `teams`.

## Incoming shares

Each **incoming share** resource has the following attributes, regardless of the type of resource that is being shared.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | integer | read-only | Unique identifier for the share
`created_at` | [date/time][] | read-only | When the resource was shared
`partnership_id` | integer | read-only | ID of the [partnership][] of the partner to whom the resource is shared.
`sharer_company_id` | integer | read-only | ID of the company who shared the resource
`sharer_company` | object | read-only | The [company][] object who shared the resource, with all of its attributes.
`receiver_company_id` | integer | read-only | ID of the company to whom the resource was shared
`receiver_company` | object | read-only | The [company][] object to whon the resource was shared

## Incoming room shares

If you are a receiving party of a shared room, then you use the room share objects as **incoming room shares** that extend the [incoming share][] resource. Additionally, an incoming room share has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`room_id` | integer | read-only | ID of the shared room
`room` | object | read-only | The [room][] resource that has been shared

## Incoming team shares

If you are a receiving party of a shared team, then you use the team share objects as **incoming team shares** that extend the [incoming share][] resource. Additionally, an incoming team share has the following attributes.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`team_id` | integer | read-only | ID of the shared team
`team` | object | read-only | The [team][] resource that has been shared

### Get a collection of incoming shares
You may get a [paginated collection][] of all the [incoming room share][] or [incoming team share][] resources that are shared to your company.

`GET /api/v3/network/shares/incoming/[resource_type]/`

The `[resource_type]` must be either `rooms` or `teams`. This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at`, `partnership_id`
`partnership_id` | integer | (none) | Filter the results by a partnership ID
`sharer_company_id` | integer | (none) | Filter the results by a receiving partner company ID
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 200

### Retrieve incoming share details
Returns an [incoming room share][] or [incoming team share][] resource by the given ID.

`GET /api/v3/network/shares/incoming/[resource_type]/[share_id]`

The `[resource_type]` must be either `rooms` or `teams`.
