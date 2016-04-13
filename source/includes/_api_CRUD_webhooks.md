## Register and manage webhooks that connect events from a store to external URLs.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `default`

## Operations

*   [List Hooks](#list-hooks)
*   [Get a Hook](#get-a-hook)
*   [Create a Hook](#create-a-hook)
*   [Update a Hook](#update-a-hook)
*   [Delete a Hook](#delete-a-hook)

## List Hooks

Index of registered webhooks.

*   [OAuth](#list-hooks-oauth)
>`GET /stores/{store_hash}/v2/hooks`

```json
[
  {
    "id": 101,
    "store_hash": "5ueh97",
    "client_id": "40c672b9177b5d3a8dbfad24321be15d",
    "scope": "store/order/*",
    "headers": {
      "X-Custom-Auth-Header": "{secret_auth_password}"
    },
    "destination": "https://app.example.com/orders",
    "created_at": "2013-01-17T11:27:50+11:00",
    "updated_at": "2013-01-17T11:27:50+11:00",
    "is_active": true
  },
  {
    "id": 102,
    "store_hash": "5ueh97",
    "client_id": "40c672b9177b5d3a8dbfad24321be15d",
    "scope": "store/product/created",
    "headers": {
      "X-Custom-Auth-Header": "{secret_auth_password}"
    },
    "destination": "https://app.example.com/products",
    "created_at": "2013-01-17T11:27:50+11:00",
    "updated_at": "2013-01-17T11:27:50+11:00",
    "is_active": true
  }
]
```

## Get a Hook

Gets a registered webhook.

*   [OAuth](#get-a-hook-oauth)
>`GET /stores/{store_hash}/v2/hooks/{id}`

```json
{
  "id": 101,
  "store_hash": "5ueh97",
  "client_id": "40c672b9177b5d3a8dbfad24321be15d",
  "scope": "store/order/*",
  "headers": {
    "X-Custom-Auth-Header": "{secret_auth_password}"
  },
  "destination": "https://app.example.com/orders",
  "created_at": "2013-01-17T11:27:50+11:00",
  "updated_at": "2013-01-17T11:27:50+11:00",
  "is_active": true
}
```

## Create a Hook

Register a new webhook.

*   [OAuth](#create-a-hook-oauth)
>`POST /stores/{store_hash}/v2/hooks`

### Requirements

The following properties of the webhooks are required. The request won’t be fulfilled unless these properties are valid.

*   `scope`
*   `destination`

### Notes

Scopes can be specified using wildcard syntax, or the full path to an event.

```curl
{
  "scope": "store/order/*",
  "headers": {
    "X-Custom-Auth-Header": "{secret_auth_password}"
  },
  "destination": "https://app.example.com/orders",
  "is_active": true
}
```

## Update a Hook

Edit the details of a registered webhook.

*   [OAuth](#update-a-hook-oauth)
>`PUT /stores/{store_hash}/v2/hooks/{id}`

```curl
{
  "destination": "https://app.example.com/orders_changed",
  "is_active": true
}
```

```json
{
  "id": 101,
  "store_hash": "5ueh97",
  "client_id": "40c672b9177b5d3a8dbfad24321be15d",
  "scope": "store/order/*",
  "headers": {
    "X-Custom-Auth-Header": "secret_hooks_auth_password"
  },
  "destination": "https://app.example.com/orders_changed",
  "created_at": "2013-01-17T11:27:50+11:00",
  "updated_at": "2013-01-18T11:27:50+11:00",
  "is_active": true
}
```

## Delete a Hook

Deletes a single webhook.

*   [OAuth](#delete-a-hook-oauth)
>`DELETE /stores/{store_hash}/v2/hooks/{id}`
