Partnership API
===============

## Outgoing partnership invitations

You may build your giosg NETWORK by inviting them. This is done with invitation objects. When sending and managing invitations from your company account to your partners, we use **outgoing invitations**. An outgoing invitation object has the following attributes:

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | integer | read-only | Unique identifier of this invitation
`status` | integer | read-only | Status of the invitation, with the following possible values: `0`= Pending, `1`= Accepted by the received, `2`= Rejected by the received
`email` | string | **required** | A valid email address to which the invitation will be sent. Must be set on creation and cannot be changed later.
`message` | string | **optional** | Message to be sent with the invitation to your partner. May only be set on creation.
`partner_display_name` | string | **optional** | A display name that will be set to the new partner when they accept the invitation and the partnership is created. The display name is visible to your organization members. May be `null`, in which case the partner will be shown with their original name.
`partner_visible_to_everyone` | boolean | **required** | If `true`, the new partner will become visible to your company members. If `false`, it will be shown only on company management.
`room_shares` | array of objects | **optional** | You may **share rooms** to your partner when they accept your invitation. This should be an array of objects similar to [outgoing room share][] objects. On creation, the objects may contain attributes `room_id` and `share_name`. In responses these objects contain the attributes `room_id`, `room`, and `share_name`.
`team_shares` | array of objects | **optional** | You may **share teams** to your partner when they accept your invitation. This should be an array of objects similar to [outgoing team share][] objects. On creation, the objects may contain attributes `team_id` and `share_name`. In responses these objects contain the attributes `team_id`, `team`, and `share_name`.
`created_at` | [date/time][] | read-only | When this invitation was sent
`creator_company_id` | integer | read-only | ID of the company who sent this invitation
`creator_company` | object | read-only | The [company][] resource who sent this invitation, with all of its attributes.
`creator_person_id` | integer | read-only | ID of the person who sent this invitation
`creator_person` | object | read-only | The [person][] resource who sent this invitation, with all other attributes except `company` and `company_id`
`resolved_at` | [date/time][] | read-only | When this invitation was accepted or rejected, `null` if still pending
`resolver_company_id` | integer | read-only | ID of the company who accepted/rejected this invitation, or `null` if still pending
`resolver_company` | object | read-only | The [company][] resource who accepted/rejected this invitation, or `null` if still pending
`resolver_person_id` | integer | read-only | ID of the person who accepted/rejected this invitation, or `null` if still pending
`resolver_person` | object | read-only | The [person][] who accepted/rejected this invitation, or `null` if still pending
`partnership_id` | integer | read-only | ID of the [partnership][] of the partner who accepted this invitation, or `null` if not accepted
`created_new_partnership` | boolean | read-only | This is `true` if the invitation was accepted by a new partner, `false` if it was accepted by an existing partner, or `null` if not yet accepted.

If your invitation is accepted by an existing partner, then any shared teams or rooms are added to that partner. No existing shares are removed in this case.

### Send an invitation
You may send an invitation to your partner's email address by creating a new [outgoing invitation][] object.
```
POST /api/v3/network/invitations/outgoing/
```

### Cancel an outgoing invitation
You may cancel a partnership invitation before it is accepted or rejected, by a given ID.
```
DELETE /api/v3/network/invitations/outgoing/[invitation_id]
```
The endpoint returns a 404 status code if the invitation is not found or if you are not authenticated as the sender of this invitation or if the invitation has already been cancelled.

The endpoint returns a 403 status code if the invitation has already been accepted or rejected.

### Retrieve outgoing invitation details
Get a single [outgoing invitation][] object sent by your company, by a given ID.
```
GET /api/v3/network/invitations/outgoing/[invitation_id]
```

### Get a collection of outgoing invitations
Get a [paginated collection][] of all sent [outgoing invitation][] objects.
```
GET /api/v3/network/invitations/outgoing/
```

This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `status`, `email`, `created_at`, `resolved_at`
`status` | integer | (none) | Filter the results by the `status` attribute
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

## Incoming partnership invitations

When you are a receiving party of a partnership invitation then you handle the invitation objects as **incoming partnership invitations**. An incoming invitation has the following attributes:

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`key` | string | read-only | Unique key for this invitation. You need to use this to identify *incoming* invitations.
`id` | integer | read-only | Unique identifier of this invitation
`status` | integer | read-only | Status of the invitation, with the following possible values: `0`= Pending, `1`= Accepted by the received, `2`= Rejected by the received
`email` | string | read-only | The email address to which this invitation was sent
`message` | string | read-only | Message to be sent with the invitation to your partner.
`room_shares` | array of objects | read-only | The rooms that will be shared when the invitation is accepted. An array where each item has the following attributes of an [incoming room share][] objects: `room_id` and `room`
`team_shares` | array of objects | read-only | The teams that will be shared when the invitation is accepted. An array where each item has the following attributes of an [incoming team share][] object: `team_id` and `team`
`created_at` | [date/time][] | read-only | When this invitation sent
`creator_company_id` | integer | read-only | ID of the company who sent this invitation
`creator_company` | object | read-only | The [company][] who sent this invitation, with all of its attributes.
`creator_person_id` | integer | read-only | ID of the person who sent this invitation
`creator_person` | object | read-only | The [person][] who sent this invitation, with all other attributes except `company` and `company_id`
`resolved_at` | [date/time][] | read-only | When this invitation was accepted or rejected, `null` if still pending
`resolver_company_id` | integer | read-only | ID of the company who accepted/rejected this invitation, or `null` if still pending
`resolver_company` | object | read-only | The [company][] resource who accepted/rejected this invitation, or `null` if still pending
`resolver_person_id` | integer | read-only | ID of the person who accepted/rejected this invitation, or `null` if still pending
`resolver_person` | object | read-only | The [person][] who accepted/rejected this invitation, or `null` if still pending
`partnership_id` | integer | read-only | ID of the [partnership][] of the partner whose invitation was accepted, or `null` if not accepted
`created_new_partnership` | boolean | read-only | This is `true` if the invitation was accepted by a new partner, `false` if it was accepted by an existing partner, or `null` if not yet accepted.

### Retrieve incoming invitation details
Retrieve a [incoming invitation][] resource by its **invitation key**. Incoming invitations are identified by their automatically generated, random key strings, instead of integer IDs.
```
GET /api/v3/network/invitations/incoming/[invitation_key]
```

### Get a collection of incoming invitations
Get a [paginated collection][] of all received [incoming invitation][] objects. This endpoint returns invitations accepted or rejected by your company. It also returns those invitations that are sent to one of your company's email address. **NOTE** that the company who sends the invitation does not know if this email address actually exists in giosg system.

```
GET /api/v3/network/invitations/incoming/
```
This endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `status`, `email`, `created_at`, `resolved_at`
`status` | integer | (none) | Filter the results by the `status` attribute
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 200

### Accept an incoming invitation
You need to accept an invitation to become partners with the sender. In order to accept the invitation, you need the invitation key.
```
POST /api/v3/network/invitations/incoming/[invitation_key]/accept
```
As soon as you accept the invitation, the partnership will be created. Also, any shared rooms and teams will become available to your company.

You should send an object as a payload with the following attributes, matching the attributes on a [partnership][] resource. They may be omitted, see below.

Attribute | Type | Editable | Description
----------|------|----------|------------
`display_name` | string | **optional** | A display name that will be set to the newly created partner. The display name is visible to your organization members. May be `null`, in which case the partner will be shown with their original name.
`visible_to_everyone` | boolean | **required** | If `true`, the new partner will become visible to your company members. If `false`, it will be shown only on company management.

It is possible to accept an invitation from an existing partner. In this case, no new partnership is created. The `display_name` and `visible_to_everyone` will overwrite the corresponding attributes of the existing [partnership][] resource, **unless they are omitted**, in which case the old values are preserved.

If you are accepting the invitation with [shared rooms][incoming room share] or [teams][incoming team share] from an existing partner, then the rooms and teams will become available to you.

After accepting an invitation, its status will become `1`.

The request will result in 404 response if the invitation was not found, has been cancelled, or has already been accepted/rejected by some other company. The request will result in 403 response if the invitation has already been accepted or rejected by your company, or if you are not allowed to accept/reject the invitation, e.g. you are the original creator of this invitation.

A successful response will result in the updated [incoming invitation][] resource.

### Reject an invitation
You may reject an invitation by its invitation key.
```
POST /api/v3/network/invitations/incoming/[invitation_key]/reject
```
No request payload is required. After rejecting an invitation, its status will become `2`.

The request will result in 404 response if the invitation was not found, has been cancelled, or has already been accepted/rejected by some other company. The request will result in 403 response if the invitation has already been accepted or rejected by your company, or if you are not allowed to accept/reject the invitation, e.g. you are the original creator of this invitation.

A successful response will result in the updated [incoming invitation][] resource.

## Partnerships

A partnership object describes a connection between your company and one of your partner companies. Partnerships can only be created with [partnership invitation][outgoing invitation] resources.

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | integer | read-only | Unique identifier for this partnership. **Note** that your partner will see the partnership with a different identifier.
`created_at` | [date/time][] | read-only | When you became partners
`partner_company_id` | integer | read-only | ID of the partner company
`partner_company` | object | read-only | The partner [company][] resource, with all of its available attributes
`company_id` | integer | read-only | ID of your company, for convenience
`company` | object | read-only | Your [company][] resource, for convenience
`dislay_name` | string | **optional** | Name that is shown to your company members for this partner. May be `null`, in which case the original name is shown
`visible_to_everyone` | boolean | **required** | If `true`, the new partner will become visible to your company members. If `false`, it will be shown only on company management.
`incoming_invitation_id` | integer | ID of the incoming invitation that resulted in creation of this partnership, or `null`.
`incoming_invitation` | object | The [incoming invitation][] resource that resulted in creation of this partnership, or `null`.
`outgoing_invitation_id` | integer | ID of the outgoing invitation that resulted in creation of this partnership, or `null`.
`outgoing_invitation` | object | The [outgoing invitation][] resource that resulted in creation of this partnership, or `null`.

### Get a collection of partnerships
Get a [paginated collection] of all the known partnerships.
```
GET /api/v3/network/partnerships/
```

This end-point accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `partner_company_name`, `created_at`
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 100

### Retrieve partnership details
Retrieve a single [partnership][] resource by the partnership ID (not partner company's ID).
```
GET /api/v3/network/partnerships/[partnership_id]
```

### Remove a partnership

<aside class="warning">
<strong>WARNING!</strong>
This will immediately remove the company from your partners and remove your partner's access to your shared resources. You cannot undo this action! You need to invite your partner again and re-share all your rooms/teams and re-set any permissions.
</aside>

Being aware of this, you may remove another company from your partners.
```
DELETE /api/v3/network/partnerships/[partnership_id]
```

### Update a partnership
You may update the editable attributes of a partnership.
```
PUT /api/v3/network/partnerships/[partnership_id]
```
```
PATCH /api/v3/network/partnerships/[partnership_id]
```

When using `PUT` you need to provide an object as a request payload that contains the changed attributes of the [partnership][]. When using `PATCH`, you may omit those attributes that you do not want to change.
