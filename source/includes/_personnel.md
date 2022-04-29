# Personnel

## Viewing your personnel

```shell
curl https://api.handshq.com/v1/personnel \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
{
  "data": [
    {
      "id": "1234",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee",
        "training_status": {
          "status": "missing",
          "description": "missing training"
        }
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    }
  ],
  "meta": {
    "pagination": {
      "requested_page": 1,
      "total_pages": 1
    },
    "is_archived_set": false
  }
}
```

This endpoint allows you to view the personnel that belong to the division registered to the API token you provide. If the division is the primary division for that account, all personnel across the account will be returned. If not, only the personnel of that division will be returned. By default the personnel index returns personnel that have not been archived.

### Request

`GET https://api.handshq.com/v1/personnel`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
search    | String | No       | Provide a search field to search the first name, last name or email address of personnel
archived  | String | No       | Provide a param of true to fetch only archived personnel

### Response

Successful requests will return a collection of personnel and a `200` status code.
Results in `data` are [paginated](#pagination)

## Viewing one personnel

```shell
curl https://api.handshq.com/v1/personnel/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
  {
    "data": {
      "id": "1234",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee",
        "training_status": {
          "status": "missing",
          "description": "missing training"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    }
  }
```

This endpoint allows you to view a personnel by providing the id.

### Request

`GET https://api.handshq.com/v1/personnel/[id]`

### Response

Successful requests will return a json payload of that personnel and a `200` status code

## Creating a personnel

```shell
curl https://api.handshq.com/v1/personnel \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Personnel creation payload.

```json
  {
    "personnel": {
      "first_name": "Sandra",
      "last_name": "Smith",
      "email":"sandra.smith@email.com",
      "line_manager_id": "456",
      "role_ids": ["987", "765"]
    }
  }
```

This endpoint allows you to create a personnel. Personnel are division specific, so the personnel will belong to the division that the API key belongs to. You can set the first name, last name and email of the personnel through this endpoint. You can also assign the personnel a line manager using the ID of another personnel, and assign roles to the personnel using the IDs of roles that exist in the account.

### Request

`POST https://api.handshq.com/v1/personnel`

### Response

Successful requests will return a json payload of the newly created personnel and a `201` status code

> 201

```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "Sandra",
        "last_name": "Smith",
        "email": "sandra.smith@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "456",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "987",
              "type": "role"
            },
            {
              "id": "765",
              "type": "role"
            }
          ]
        }
      }
    }
  }
```

## Updating a personnel

```shell
curl https://api.handshq.com/v1/personnel/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --requst PATCH
  -d '[json_payload]'
```

> Example Personnel update payload.

```json
  {
    "personnel": {
      "first_name": "Sally",
      "last_name": "Smith-West",
      "email":"sally-sw@email.com",
      "line_manager_id": "567",
      "role_ids": ["345"]
    }
  }
```

This endpoint allows you to update the first name, last name, email address, line manager and roles of an existing personnel.

### Request

`PATCH https://api.handshq.com/v1/personnel/[id]`

### Response

Successful requests will return a json payload of the updated personnel and a `200` status code

> 200

```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "Sally",
        "last_name": "Smith-West",
        "email": "sally-sw@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "567",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "345",
              "type": "role"
            }
          ]
        }
      }
    }
  }

```

## Deleting a personnel

```shell
curl https://api.handshq.com/v1/personnel/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request DELETE
```

> 204

This endpoint allows you to delete a personnel.

### Request

`DELETE https://api.handshq.com/v1/personnel/[id]`

### Response

Successful requests will return a `204` status code

## Archiving a personnel

```shell
curl https://api.handshq.com/v1/personnel/[id]/archive \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request PATCH
```

> 200

This endpoint allows you to archive a personnel.

### Request

`PATCH https://api.handshq.com/v1/personnel/[id]/archive`

### Response

Successful requests will return a json payload of the archived personnel and a `200` status code

> 200

```json
   {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "Sally",
        "last_name": "Smith-West",
        "email": "sally-sw@email.com",
        "archived_at": "2022-04-27T17:30:18.835+01:00",
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "567",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "345",
              "type": "role"
            }
          ]
        }
      }
    }
  }
```


## Unarchiving a personnel

```shell
curl https://api.handshq.com/v1/personnel/[id]/unarchive \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request PATCH
```

> 200

This endpoint allows you to unarchive an archived personnel.

> 200

```json
   {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "Sally",
        "last_name": "Smith-West",
        "email": "sally-sw@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "567",
            "type": "line_manager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "345",
              "type": "role"
            }
          ]
        }
      }
    }
  }
```

### Request

`PATCH https://api.handshq.com/v1/personnel/[id]/unarchive`

### Response

Successful requests will return a json payload of the archived personnel and a `200` status code
