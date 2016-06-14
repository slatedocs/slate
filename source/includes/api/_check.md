# ACH/Checks

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1600,
    "method": "check",
    "name": "Test ACH",
    "account": "XXXX-X678-9",
    "routing": "XXXX-X678-9"
  }
}
```

This endpoint retrieves specific customer's check details.

### HTTP Request

`GET customers/<CUSTID>/checks/<METHODID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Method ID.

## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 1600,
      "method": "check",
      "name": "Test ACH",
      "account": "XXXX-X678-9",
      "routing": "XXXX-X678-9"
    },
    {
      "id": 1396,
      "method": "check",
      "name": "ACH_1463644675",
      "account": "XXXX-X678-9",
      "routing": "XXXX-X678-9"
    },
    {
      "id": 1393,
      "method": "check",
      "name": "ACH_1463644619",
      "account": "XXXX-X678-9",
      "routing": "XXXX-X678-9"
    }
  ]
}
```

This endpoint retrieves all customer's saved checks.

### HTTP Request

`GET customers/<CUSTID>/checks`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1603,
    "method": "check",
    "name": "Test ACH",
    "account": "XXXX-X678-9",
    "routing": "XXXX-X678-9"
  }
}
```

This endpoint creates new customer's check.

### HTTP Request

`POST customers/<CUSTID>/checks`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
account* |  | Check account number.
routing* |  | Routing number.
check* |  | Check number.
name* |  | Payment method name.

<aside class="notice">* = Required.</aside>

## Delete

> Returns `true` on successful

This method lets you remove saved checks.

### HTTP Request

`POST customers/<CUSTID>/checks/<METHODID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Payment method ID.
