## Shipping package consignments tracked from an order.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Shipments](#list-shipments)
*   [Get a Shipment](#get-a-shipment)
*   [Get a Count of Shipments](#get-a-count-of-shipments)
*   [Get a Count of Shipments per Order](#get-a-count-of-shipments-per-order)
*   [Create a Shipment](#create-a-shipment)
*   [Update a Shipment](#update-a-shipment)
*   [Delete a Shipment](#delete-a-shipment)
*   [Delete Multiple Shipments](#delete-multiple-shipments)

## List Shipments

Gets the shipments associated with an order.

*   [OAuth](#list-shipments-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/shipments`
*   [Basic Auth](#list-shipments-basic)
>`GET /api/v2/orders/{order_id}/shipments`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 shipments are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/orders/{order_id}/shipments?page={number}` |
| `limit` | int | `/api/v2/orders/{order_id}/shipments?limit={count}` |

```json
[
  {
    "id": 1,
    "order_id": 115,
    "customer_id": 0,
    "order_address_id": 16,
    "date_created": "Wed, 19 Dec 2012 17:17:10 +0000",
    "tracking_number": "111222333444",
    "shipping_method": "None",
    "comments": "A sample shipment for order 115",
    "billing_address": {
      "first_name": "Louise",
      "last_name": "Dean",
      "company": "Skiptube",
      "street_1": "147 Meadow Vale Way",
      "street_2": "",
      "city": "Fullerton",
      "state": "Rhode Island",
      "zip": "74674",
      "country": "United States",
      "country_iso2": "US",
      "phone": "7-(086)085-9448",
      "email": ""
    },
    "shipping_address": {
      "first_name": "Louise",
      "last_name": "Dean",
      "company": "Skiptube",
      "street_1": "147 Meadow Vale Way",
      "street_2": "",
      "city": "Fullerton",
      "state": "Rhode Island",
      "zip": "74674",
      "country": "United States",
      "country_iso2": "US",
      "phone": "7-(086)085-9448",
      "email": ""
    },
    "items": [
      {
        "order_product_id": 16,
        "product_id": 0,
        "quantity": 1
      }
    ]
  }
]
```

## Get a Shipment

Gets a shipment associated with an order.

*   [OAuth](#get-a-shipment-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/shipments/{id}`
*   [Basic Auth](#get-a-shipment-basic)
>`GET /api/v2/orders/{order_id}/shipments/{id}`

```json
{
  "id": 12,
  "order_id": 114,
  "customer_id": 0,
  "order_address_id": 15,
  "date_created": "Wed, 19 Dec 2012 18:18:23 +0000",
  "tracking_number": "123-123-123",
  "shipping_method": "None",
  "comments": null,
  "billing_address": {
    "first_name": "Julie",
    "last_name": "Bishop",
    "company": "Yamia",
    "street_1": "988 Comanche Circle",
    "street_2": "",
    "city": "Cypress",
    "state": "Wyoming",
    "zip": "77426-2265",
    "country": "United States",
    "country_iso2": "US",
    "phone": "5-(248)906-2014",
    "email": ""
  },
  "shipping_address": {
    "first_name": "Julie",
    "last_name": "Bishop",
    "company": "Yamia",
    "street_1": "988 Comanche Circle",
    "street_2": "",
    "city": "Cypress",
    "state": "Wyoming",
    "zip": "77426-2265",
    "country": "United States",
    "country_iso2": "US",
    "phone": "5-(248)906-2014",
    "email": ""
  },
  "items": [
    {
      "order_product_id": 15,
      "product_id": 0,
      "quantity": 1
    }
  ]
}
```

## Get a Count of Shipments

Gets a count of the number of orders that have shipped.

*   [OAuth](#get-a-count-of-shipments-oauth)
>`GET /stores/{store_hash}/v2/orders/shipments/count`
*   [Basic Auth](#get-a-count-of-shipments-basic)
>`GET /api/v2/orders/shipments/count`

```json
{
  "count": 6
}
```

## Get a Count of Shipments per Order

Gets a count of the number of shipments that have been made for a single order.

*   [OAuth](#get-a-count-of-shipments-per-order-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/shipments/count`
*   [Basic Auth](#get-a-count-of-shipments-per-order-basic)
>`GET /api/v2/orders/{order_id}/shipments/count`

```json
{
  "count": 6
}
```

## Create a Shipment

Creates a new shipment for an order.

*   [OAuth](#create-a-shipment-oauth)
>`POST /stores/{store_hash}/v2/orders/{order_id}/shipments`
*   [Basic Auth](#create-a-shipment-basic)
>`POST /api/v2/orders/{order_id}/shipments`

### Read-only Properties

The following properties of the shipment are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `order_id`
*   `date_created`
*   `customer_id`
*   `billing_address`
*   `shipping_address`

### Requirements

The following properties of the shipment are required. The request won’t be fulfilled unless these properties are valid.

*   `order_address_id`
*   `items`

```curl
{
  "tracking_number": "EJ958083578US",
  "comments": "Ready to go...",
  "order_address_id": 1,
  "items": [
    {
      "order_product_id": 15,
      "quantity": 2
    }
  ]
}
```

```json
{
  "id": 18,
  "order_id": 113,
  "customer_id": 0,
  "order_address_id": 14,
  "date_created": "Wed, 19 Dec 2012 19:49:15 +0000",
  "tracking_number": "EJ958083578US",
  "shipping_method": "None",
  "comments": "Ready to go...",
  "billing_address": {
    "first_name": "Henry",
    "last_name": "Boyd",
    "company": "Kare",
    "street_1": "009 Corben Pass",
    "street_2": "",
    "city": "Laguna Niguel",
    "state": "New Hampshire",
    "zip": "57762",
    "country": "United States",
    "country_iso2": "US",
    "phone": "0-(245)121-8702",
    "email": ""
  },
  "shipping_address": {
    "first_name": "Henry",
    "last_name": "Boyd",
    "company": "Kare",
    "street_1": "009 Corben Pass",
    "street_2": "",
    "city": "Laguna Niguel",
    "state": "New Hampshire",
    "zip": "57762",
    "country": "United States",
    "country_iso2": "US",
    "phone": "0-(245)121-8702",
    "email": ""
  },
  "items": [
    {
      "order_product_id": 14,
      "product_id": 0,
      "quantity": 1
    }
  ]
}
```

## Update a Shipment

Updates an existing shipment associated with an order.


*   [OAuth](#update-a-shipment-oauth)
>`PUT /stores/{store_hash}/v2/orders/{order_id}/shipments/{id}`
*   [Basic Auth](#update-a-shipment-basic)
>`PUT /api/v2/orders/{order_id}/shipments/{id}`

### Read-only Properties

The following properties of the shipment are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `order_id`
*   `date_created`
*   `customer_id`
*   `items`
*   `billing_address`
*   `shipping_address`

### Requirements

The following properties of the shipment are required. The request won’t be fulfilled unless these properties are valid.

```curl
{
  "tracking_number": "fedex1245",
  "comments": "Notes about the shipment",
  "order_address_id": 1
}
```

```json
{
  "id": 12,
  "order_id": 114,
  "customer_id": 0,
  "order_address_id": 16,
  "date_created": "Wed, 19 Dec 2012 18:18:23 +0000",
  "tracking_number": "fedex1245",
  "shipping_method": "None",
  "comments": "Notes about the shipment",
  "billing_address": {
    "first_name": "Julie",
    "last_name": "Bishop",
    "company": "Yamia",
    "street_1": "988 Comanche Circle",
    "street_2": "",
    "city": "Cypress",
    "state": "Wyoming",
    "zip": "77426-2265",
    "country": "United States",
    "country_iso2": "US",
    "phone": "5-(248)906-2014",
    "email": ""
  },
  "shipping_address": {
    "first_name": "Julie",
    "last_name": "Bishop",
    "company": "Yamia",
    "street_1": "988 Comanche Circle",
    "street_2": "",
    "city": "Cypress",
    "state": "Wyoming",
    "zip": "77426-2265",
    "country": "United States",
    "country_iso2": "US",
    "phone": "5-(248)906-2014",
    "email": ""
  },
  "items": [
    {
      "order_product_id": 15,
      "product_id": 0,
      "quantity": 1
    }
  ]
}
```

## Delete a Shipment

Deletes a shipment associated with an order.

*   [OAuth](#delete-a-shipment-oauth)
>`DELETE /stores/{store_hash}/v2/orders/{order_id}/shipments/{id}`
*   [Basic Auth](#delete-a-shipment-basic)
>`DELETE /api/v2/orders/{order_id}/shipments/{id}`

## Delete Multiple Shipments

Deletes multiple shipments associated with an order.

*   [OAuth](#delete-multiple-shipments-oauth)
>`DELETE /stores/{store_hash}/v2/orders/{order_id}/shipments`
*   [Basic Auth](#delete-multiple-shipments-basic)
>`DELETE /api/v2/orders/{order_id}/shipments`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 shipments are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/orders/{order_id}/shipments?page={number}` |
| `Limit` | int | `/api/v2/orders/{order_id}/shipments?limit={count}` |
