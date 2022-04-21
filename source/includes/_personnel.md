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
        "firstName": "John",
        "lastName": "Smith",
        "email": "john.smith@email.com",
        "archivedAt": null,
        "type": "employee"
      },
      "relationships": {
        "lineManager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "companyRoles": {
          "data": [
            {
              "id": "123",
              "type": "companyRole"
            },
            {
              "id": "321",
              "type": "companyRole"
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

This endpoint allows you to view the personnel that belong to the company registered to the API token you provide. If the company is the primary company for that account, all personnel across the account will be returned. If not, only the personnel of that company will be returned. By default the personnel index returns personnel that have not been archived.

### Request

`GET https://api.handshq.com/v1/personnel`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
search    | String | No       | Provide a search field to search the first name, last name or email address of personnel
archived  | String | No       | Provide a param of true to fetch only archived personnel

### Response

Successful requests will return a json payload of personnel and a `200` status code.
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
        "firstName": "John",
        "lastName": "Smith",
        "email": "john.smith@email.com",
        "archivedAt": null,
        "type": "employee"
      },
      "relationships": {
        "lineManager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "companyRoles": {
          "data": [
            {
              "id": "123",
              "type": "companyRole"
            },
            {
              "id": "321",
              "type": "companyRole"
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
    "first_name": "Sandra",
    "last_name": "Smith",
    "email":"sandra.smith@email.com",
    "line_manager_id": "66062",
    "role_ids": ["17235", "17236"]
  }
```

This endpoint allows you to create a personnel. Personnel are company specific, so the personnel will belong to the company that the API key belongs to. You can set the first name, last name and email of the personnel through this endpoint. You can also assign the personnel a line manager using the ID of another personnel, and assign roles to the personnel using the IDs of roles that exist in the account.

### Request

`POST https://api.handshq.com/v1/personnel`

### Response

Successful requests will return a json payload of the newly created personnel and a `201` status code

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
    "first_name": "Sandra",
    "last_name": "Smith",
    "email":"sandra.smith@email.com",
    "line_manager_id": "66062",
    "role_ids": ["17235", "17236"]
  }
```

This endpoint allows you to update the first name, last name, email address, line manager and roles of an existing personnel.

### Request

`PATCH https://api.handshq.com/v1/personnel/[id]`

### Response

Successful requests will return a json payload of the updated personnel and a `200` status code

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


## Unarchiving a personnel

```shell
curl https://api.handshq.com/v1/personnel/[id]/unarchive \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
  --request DELETE
```

> 200

This endpoint allows you to unarchive an archived personnel.

### Request

`PATCH https://api.handshq.com/v1/personnel/[id]/unarchive`

### Response

Successful requests will return a json payload of the archived personnel and a `200` status code
