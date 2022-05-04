# Roles

## Viewing your roles

```shell
curl https://api.handshq.com/v1/roles \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
  {
    "data": [
      {
        "id": "1234",
        "type": "role",
        "attributes": {
          "position": "Engineer"
        }
      },
      {
        "id": "1235",
        "type": "role",
        "attributes": {
          "position": "Technician"
        }
      }
    ],
    "meta": {
      "pagination": {
          "requested_page": 1,
          "total_pages": 1
      }
    }
  }
```

This endpoint allows you to view the roles that belong to the account registered to the API token you provide.

### Request

`GET https://api.handshq.com/v1/roles`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
search    | String | No       | Search roles by position name

### Response

Successful requests will return a json payload of that account's roles and a `200` status code.
Results in `data` are [paginated](#pagination)

## Viewing one role

```shell
curl https://api.handshq.com/v1/roles/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
  {
    "data": {
      "id": "1234",
      "type": "role",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```

This endpoint allows you to view a role by providing the id.

### Request

`GET https://api.handshq.com/v1/roles/[id]`

### Response

Successful requests will return a json payload of that role and a `200` status code

## Creating a role

```shell
curl https://api.handshq.com/v1/roles \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Role creation payload.

```json
  {
    "role": {
      "position": "Engineer",
      "course_ids": ["123", "321"]
    }
  }
```

This endpoint allows you to create a role. Roles are account wide, so the role will be created for the account of the company that the API key belongs to.

### Request

`POST https://api.handshq.com/v1/roles`

### Allowed Role Parameters for create
All parameters must be nested within `role`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
position | String | Yes | The position name of the role
course_ids | Association IDs | No | IDs of courses that exist in the training register, that the role should be associated to. For more information see [Associations](#associations)

### Response

Successful requests will return a json payload of the newly created role and a `201` status code

> 201

```json
  {
    "data": {
      "id": "123",
      "type": "role",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```


## Updating a role

```shell
curl https://api.handshq.com/v1/roles/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --requst PATCH
  -d '[json_payload]'
```

> Example Role update payload.

```json
  {
    "role": {
      "position": "Engineer",
      "course_ids": ["123", "321"]
    }
  }
```

This endpoint allows you to update the `position` attribute of a role belonging to your account

### Request

`PATCH https://api.handshq.com/v1/roles/[id]`


### Allowed Role Parameters for update
All parameters must be nested within `role`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
position | String | No | The position name of the role
course_ids | Association IDs | No | IDs of courses that exist in the training register, that the role should be associated to. For more information see [Associations](#associations)

### Response

Successful requests will return a json payload of the updated role and a `200` status code

> 200

```json
  {
    "data": {
      "id": "123",
      "type": "role",
      "attributes": {
        "position": "Engineer Manager"
      }
    }
  }
```

## Deleting a role

```shell
curl https://api.handshq.com/v1/roles/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request DELETE
```

> 204

This endpoint allows you to delete a role belonging to your account.

### Request

`DELETE https://api.handshq.com/v1/roles/[id]`

### Response

Successful requests will return a `204` status code
