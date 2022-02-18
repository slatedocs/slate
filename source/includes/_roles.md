# Roles

## Viewing your roles

```shell
curl https://api.handshq.com/v1/company_roles \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
  {
    "data": [
      {
        "id": "1234",
        "type": "companyRole",
        "attributes": {
          "position": "Engineer"
        }
      },
        {
        "id": "1235",
        "type": "companyRole",
        "attributes": {
          "position": "Technician"
        }
      }
    ]
  }
```

This endpoint allows you to view the roles that belong to the account registered to the API token you provide.

### Request

`GET https://api.handshq.com/v1/company_roles`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
position  | String | No       | Only roles with a matching position will be returned

### Response

Successful requests will return a json payload of that account's roles and a `200` status code.
Results in `data` are [paginated](#pagination)

## Viewing one role

```shell
curl https://api.handshq.com/v1/company_role/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
{
    "data": {
      "id": "1234",
      "type": "companyRole",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```

This endpoint allows you to view a role by providing the id.

### Request

### Response

## Creating a role

```shell
curl https://api.handshq.com/v1/company_role/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
{
    "data": {
      "id": "1234",
      "type": "companyRole",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```

This endpoint allows you to view a role by providing the id.

### Request

### Response

## Updating a role

```shell
curl https://api.handshq.com/v1/company_role/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
{
    "data": {
      "id": "1234",
      "type": "companyRole",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```

This endpoint allows you to view a role by providing the id.

### Request

### Response

## Deleting a role

```shell
curl https://api.handshq.com/v1/company_role/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
{
    "data": {
      "id": "1234",
      "type": "companyRole",
      "attributes": {
        "position": "Engineer"
      }
    }
  }
```

This endpoint allows you to view a role by providing the id.

### Request

### Response
