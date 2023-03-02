# User Management

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

## Accept or Deny Pending User

```shell
curl https://api.simplyprint.io/{id}/users/SetPendingUserState \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/users/SetPendingUserState`

TODO

## Change User Rank

```shell
curl https://api.simplyprint.io/{id}/users/ChangeUserRank \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/users/ChangeUserRank`

TODO

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
    "TODO": "TODO"
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
