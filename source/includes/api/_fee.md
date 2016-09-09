# Fees

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "payplan_id": 1,
    "sku": "123",
    "amount": "123.50",
    "description": "Test fee.",
    "completed": true
  }
}
```

This method lets you view specific fee.

### HTTP Request

`GET recurring/<PLANID>/fees/<FEEID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.
FEEID | The ID of the fee.


## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 1,
      "payplan_id": 1,
      "sku": "123",
      "amount": "12.00",
      "description": "Test Fee.",
      "completed": true
    },
    {
      "id": 2,
      "payplan_id": 1,
      "sku": "",
      "amount": "10.00",
      "description": "",
      "completed": true
    }
  ],
  "meta": {
    "pagination": {
      "total": 6,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 3,
      "links": {
        "next": "http://api.slycepay.com/v1/recurring/1/fees/?limit=2&page=1"
      }
    }
  }
}
```

This method lets you view all fees in a specific plan.

### HTTP Request

`GET recurring/<PLANID>/fees`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.



## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "payplan_id": 1,
    "sku": "123",
    "amount": "12.52",
    "description": "Test fee 2.",
    "completed": true
  }
}
```

This method lets you create new fee.

### HTTP Request

`POST recurring/<PLANID>/fees`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount |  | Fee amount.
sku |  | Tracking id for keeping purposes.


## Delete

> Returns `true` on successful

This method lets you remove the unpaid fees identified by an SKU.

### HTTP Request

`POST recurring/<PLANID>/fees/<SKU>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.
SKU | Sku id provided.
