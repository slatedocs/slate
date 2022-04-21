# Personnel Roles

## Adding a role to a personnel

```shell
curl https://api.handshq.com/v1/personnel_roles \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example payload.

```json
  {
    "personnel_role": {
      "personnel_id": "123",
      "role_id": "321"
    }
  }
```

This endpoint allows you to add a role to a personnel using the ID of the personnel and the ID of the role.

### Request

`POST https://api.handshq.com/v1/personnel_roles`

### Response

Successful requests will return a json payload of the newly created personnel role and a `201` status code

> 201

```json
  {
    "data": {
      "id": "345",
      "type": "personnelRole",
      "relationships": {
        "personnel": {
          "data": {
            "id":"123",
            "type":"personnel"
          }
        },
        "role": {
          "data": {
            "id": "321",
            "type": "role"
          }
        }
      }
    }
  }
```

## Removing a role from a personnel

```shell
curl https://api.handshq.com/v1/personnel_roles/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request DELETE
```

> 204

This endpoint allows you to delete a personnel.

### Request

`DELETE https://api.handshq.com/v1/personnel_roles/[id]`

### Response

Successful requests will return a `204` status code


