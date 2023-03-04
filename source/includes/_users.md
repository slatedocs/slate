# User Management

## Get Company Users

```shell
curl https://api.simplyprint.io/{id}/users/GetPaginatedUsers \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "page": 1,
    "page_size": 10,
    "approved": true,
    "search": "John Doe",
    "sort_id": 1,
    "sort_dir": "asc"
}
```

> Success response

```json
{
    "status": true,
    "message": null,
    "data": [
        {
            "id": 1234,
            "relation_id": 4321,
            "name": "John Doe",
            "email_confirmed": true,
            "email": "johndoe@example.com",
            "phone": "",
            "relation_created_at": "2022-07-28 23:30:14",
            "last_online": "2023-03-02 15:44:44",
            "approved_at": "2022-07-29 11:14:52",
            "org_account": false,
            "total_prints": 68,
            "rank": 185
        }
    ],
    "page_amount": 1
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `VIEW_USERS` |

### Request

`POST /{id}/users/GetPaginatedUsers`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | integer | yes | The page number to retrieve. |
| `page_size` | integer | yes | The number of users to retrieve per page. |
| `approved` | boolean | no | If true, only approved users will be returned. If false, only pending users will be returned.<br>**Defaults to true** |
| `search` | string | no | A search string to filter the users by. Searches for name, email and phone number. |
| `sort_id` | integer | no | Which field to sort by. See [Sort IDs](#sort-ids). |
| `sort_dir` | string | no | The sort direction. Either `asc` or `desc`. |

#### Sort IDs

| ID | Field |
|----|-------|
| 0 | Name |
| 1 | Email |
| 2 | Rank id |
| 3 | Last online |
| 4 | Join date |
| 5 | Amount of prints |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `data` | array | An array of users. |
| `data[].id` | integer | The id of the user. |
| `data[].relation_id` | integer | The id of the user-company relation. |
| `data[].name` | string | The name of the user. |
| `data[].email_confirmed` | boolean | True if the user has confirmed their email address. |
| `data[].email` | string | The email address of the user. |
| `data[].phone` | string | The phone number of the user. |
| `data[].relation_created_at` | string | The date and time the user joined the company. |
| `data[].last_online` | string | The date and time the user was last online. Only present if user is approved |
| `data[].approved_at` | string | The date and time the user was approved. Only present if user is approved |
| `data[].org_account` | boolean | True if the user is an organization account. Only present if user is approved |
| `data[].total_prints` | integer | The total number of prints the user has made on this company. Only present if user is approved |
| `data[].rank` | integer | The id of the rank of the user. Only present if user is approved |
| `page_amount` | integer | The total number of pages. |

## Create Invitation Link

```shell
curl https://api.simplyprint.io/{id}/users/CreateInvitationLink \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "maxUses": 10
}
```

> Success response

```json
{
    "status": true,
    "message": null,
    "link": "https://simplyprint.io/accept_invitation/b3d9b5a0-5b5b-11e9-8d7c-2d3b9e84aafd"
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `INVITE_USERS` |

This endpoint creates an invitation link that can be used to invite new users to the company.
Please note that links with unlimited uses expire at the end of the day.

### Request

`POST /{id}/users/CreateInvitationLink`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `maxUses` | integer | no | The maximum number of times the link can be used. Specify 0 for unlimited uses. |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `link` | string | The invitation link. |

## Invite Users By Email

```shell
curl https://api.simplyprint.io/{id}/users/InviteSpecificUser \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "emails": [
        "test@example.com",
        "test2@example.com"
    ],
    "rank": 192,
    "lang": "en"
}
```

> Success response

```json
{
    "status": true,
    "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `INVITE_USERS` |

This endpoint invites one or more users to the company by email.

### Request

`POST /{id}/users/InviteSpecificUser`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `emails` | string[] | yes | The emails of the users to invite. |
| `rank` | integer | no | The rank id that the users should be assigned. |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Accept or Deny Pending User

```shell
curl https://api.simplyprint.io/{id}/users/SetPendingUserState \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "relation_id": 1234,
    "approve": true,
    "notify": true
}
```

> Success response

```json
{
    "status": true,
    "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `INVITE_USERS` |

### Request

`POST /{id}/users/SetPendingUserState`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `relation_id` | integer | yes | The id of the pending user-company relation. |
| `approve` | boolean | yes | True to approve the user, false to deny. |
| `notify` | boolean | yes | True to notify the user of the decision. Will send an email if the user has an email address. |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Change User Rank

```shell
curl https://api.simplyprint.io/{id}/users/ChangeUserRank \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "relation_id": 1234,
    "rank_id": 192
}
```

> Success response

```json
{
    "status": true,
    "message": null
}
```

### Request

`POST /{id}/users/ChangeUserRank`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `relation_id` | integer | yes | The id of the user-company relation. |
| `rank_id` | integer | yes | The id of the rank to assign to the user. |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Delete User

```shell
curl https://api.simplyprint.io/{id}/users/DeleteUser \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "user_id": 1234
}
```

> Success response

```json
{
    "status": true,
    "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `DELETE_USER` |

This endpoint deletes a user from the company. Use this endpoint with caution.

### Request

`POST /{id}/users/DeleteUser`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_id` | integer | yes | The id of the user to delete. |

### Response

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
