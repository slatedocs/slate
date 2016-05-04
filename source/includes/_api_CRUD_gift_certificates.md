## Gift Certificate Operations

## List Gift Certificates

Retrieves the gift certificates available. (Default sorting is by gift-certificate id, from lowest to highest.)

`GET /stores/{store_hash}/v2/gift_certificates`

`GET /api/v2/gift_certificates`

### Filters

Filter parameters can be added to the URL query string to select specific gift_certificates in the collection.

| Parameter    | Type   | Example                                        |
| ------------ | ------ | ---------------------------------------------- |
| `min_id`     | int    | `/api/v2/gift_certificates?min_id={value}`     |
| `max_id`     | int    | `/api/v2/gift_certificates?max_id={value}`     |
| `code`       | string | `/api/v2/gift_certificates?code={value}`       |
| `to_name`    | string | `/api/v2/gift_certificates?to_name={value}`    |
| `to_email`   | string | `/api/v2/gift_certificates?to_email={value}`   |
| `from_name`  | string | `/api/v2/gift_certificates?from_name={value}`  |
| `from_email` | string | `/api/v2/gift_certificates?from_email={value}` |

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn't provided, up to 50 gift_certificates are returned by default.

| Parameter | Type | Example                                   |
| --------- | ---- | ----------------------------------------- |
| `page`    | int  | `/api/v2/gift_certificates?page={number}` |
| `limit`   | int  | `/api/v2/gift_certificates?limit={count}` |

```json
    {
      "giftcertificates": {
        "giftcertificate": [
          {
            "id": "24",
            "code": "10R-5E2-BO4-RWT",
            "amount": "1000.0000",
            "status": "active",
            "balance": "500.0000",
            "to_name": "Alyss",
            "order_id": "1281",
            "template": "false",
            "to_email": "test@test.com",
            "from_name": "Noland",
            "from_email": "test1@test.com",
            "customer_id": "0",
            "expiry_date": "0",
            "purchase_date": "1454432829"
          },
          {
            "id": "25",
            "code": "10R-6E3-AO4-RST",
            "amount": "700.0000",
            "status": "active",
            "balance": "700.0000",
            "to_name": "Alyss",
            "order_id": "0",
            "template": "false",
            "to_email": "test@test.com",
            "from_name": "Noland",
            "from_email": "test1@test.com",
            "customer_id": "0",
            "expiry_date": "0",
            "purchase_date": "1454433240"
          },
          {
            "id": "27",
            "code": "15R-6E3-AO4-RST",
            "amount": "50.0000",
            "status": "active",
            "balance": "50.0000",
            "to_name": "Lyss",
            "order_id": "0",
            "template": "false",
            "to_email": "test5@test.com",
            "from_name": "Somethingelse",
            "from_email": "test15@test.com",
            "customer_id": "0",
            "expiry_date": "0",
            "purchase_date": "1454433621"
          }
        ]
      }
    }
```
  
## Get a Gift Certificate

Retrieves a specified gift certificate.

`GET /stores/{store_hash}/v2/gift_certificates/{id}`

`GET /api/v2/gift_certificates/{id}`

```json
    {
      "giftcertificate": {
        "id": "24",
        "code": "10R-5E2-BO4-RWT",
        "amount": "500.0000",
        "status": "active",
        "balance": "500.0000",
        "to_name": "Jane",
        "order_id": "1281",
        "template": "false",
        "to_email": "test@test.com",
        "from_name": "Tarzan",
        "from_email": "test1@test.com",
        "customer_id": "0",
        "expiry_date": "0",
        "purchase_date": "1454432829"
      }
    }
```

## Create a Gift Certificate

Creates a new gift certificate.

`POST /stores/{store_hash}/v2/gift_certificates`

`POST /api/v2/gift_certificates`

### Read-only Properties

The following properties of the gift certificate are read-only. If one or more of these properties are included in the request, it will be rejected.

### Requirements

The following properties of the gift certificate are required. The request won't be fulfilled unless these properties are valid.

* `to_name`
* `to_email`
* `from_name`
* `from_email`
* `amount`

### Notes

When a gift certificate is created through the API, no email notification is triggered to the specified recipient.

The gift certificate's status can be one of the following:

* `pending`
* `active`
* `disabled`
* `expired`

The gift certificate's template can be one of the following:

* `Birthday`
* `Boy`
* `Celebration`
* `Christmas`
* `General`
* `Girl`
* `{blank}`

```curl
    {
      "code": "10R-6E3-AO4-RST",
      "amount": "700.0000",
      "status": "active",
      "to_name": "Jane",
      "to_email": "test@test.com",
      "from_name": "Tarzan",
      "from_email": "test1@test.com"
    }
```

```json
    {
      "giftcertificate": {
        "id": "25",
        "code": "10R-6E3-AO4-RST",
        "amount": "700.0000",
        "status": "active",
        "balance": "700.0000",
        "to_name": "Jane",
        "order_id": "0",
        "template": "false",
        "to_email": "test@test.com",
        "from_name": "Tarzan",
        "from_email": "test1@test.com",
        "customer_id": "0",
        "expiry_date": "0",
        "purchase_date": "1454433240"
      }
    }
```

## Update a Gift Certificate

Updates an existing gift certificate.

`PUT /stores/{store_hash}/v2/gift_certificates`

`PUT /api/v2/gift_certificates`

### Read-only Properties

The following properties of the gift certificate are read-only. If one or more of these properties are included in the request, it will be rejected.

```curl
    {
      "amount": "1000.0000"
    }
```

```json
    {
      "giftcertificate": {
        "id": "24",
        "code": "10R-5E2-BO4-RWT",
        "amount": "1000.0000",
        "status": "active",
        "balance": "500.0000",
        "to_name": "Jane",
        "order_id": "1281",
        "template": "false",
        "to_email": "test@test.com",
        "from_name": "Tarzan",
        "from_email": "test1@test.com",
        "customer_id": "0",
        "expiry_date": "0",
        "purchase_date": "1454432829"
      }
    }
```

## Delete a Gift Certificate

Deletes a specified gift certificate. (If successful, this will typically return a "204 No Content".)

`DELETE /stores/{store_hash}/v2/gift_certificates/{id}`

`DELETE /api/v2/gift_certificates/{id}`

## Delete All Gift Certificates

Deletes all gift certificates associated with the store. (If successful, this will typically return a "204 No Content".)

`DELETE /stores/{store_hash}/v2/gift_certificates`

`DELETE /api/v2/gift_certificates` 
