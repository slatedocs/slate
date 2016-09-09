# Recurring

Recurring handles all types of recurring plans.

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "customer": "123456",
    "method": {
      "id": 10,
      "method": "cc",
      "reference": "XXXX-XXXX-XXXX-b8wn",
      "number": "XXXX-XXXX-XXXX-2224",
      "type": "Visa"
    },
    "type": "subscription",
    "scheme": "monthly",
    "balance": "54.00",
    "total": "0.00",
    "start_date": "2015-11-11",
    "next_due": {
      "date": "2016-02-11",
      "amount": "54.00",
      "fees": [
        {
          "id": 5,
          "payplan_id": 1,
          "sku": "",
          "amount": "67.00",
          "description": "Another sample fee",
          "completed": 0
        },
        {
          "id": 6,
          "payplan_id": 1,
          "sku": "332",
          "amount": "14.00",
          "description": "",
          "completed": 0
        }
      ]
    },
    "paid_count": 3,
    "status": "ongoing",
    "status_code": 1,
    "completed": false,
    "created": 1447299415,
    "updated": 1447301838,
    "config": {
      "initial_fee": "65.00",
      "duration": 2,
      "options": null,
      "payload": null,
      "callback_url": "http://www.sample.com/webhook.php"
    },
    "logs": [
      {
        "id": 5,
        "payplan_id": 1,
        "sku": "",
        "amount": "67.00",
        "description": "Another sample fee",
        "completed": 0
      },
    ]
  }
}
```

This endpoint retrieves a specific recurring.

### HTTP Request

`GET recurring/<PLANID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve.

## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 1,
      "customer": "123456",
      "method": {
        "id": 10,
        "method": "cc",
        "reference": "XXXX-XXXX-XXXX-b8wn",
        "number": "XXXX-XXXX-XXXX-2224",
        "type": "Visa"
      },
      "type": "subscription",
      "scheme": "monthly",
      "balance": "54.00",
      "total": "0.00",
      "start_date": "2015-11-11",
      "next_due": {
        "date": "2016-02-11",
        "amount": "54.00",
        "fees": [
          {
            "id": 5,
            "payplan_id": 1,
            "sku": "",
            "amount": "67.00",
            "description": "Another sample fee",
            "completed": 0
          },
          {
            "id": 6,
            "payplan_id": 1,
            "sku": "332",
            "amount": "14.00",
            "description": "",
            "completed": 0
          }
        ]
      },
      "paid_count": 3,
      "status": "ongoing",
      "status_code": 1,
      "completed": false,
      "created": 1447299415,
      "updated": 1447301838,
      "config": {
        "initial_fee": "65.00",
        "duration": 2,
        "options": null,
        "payload": null,
        "callback_url": "http://www.sample.com/webhook.php"
      },
      "logs": [
        {
          "id": 5,
          "payplan_id": 1,
          "sku": "",
          "amount": "67.00",
          "description": "Another sample fee",
          "completed": 0
        },
      ]
    },
    {
      "id": 2,
      "customer": "2015-001",
      "method": {
        "id": 111,
        "method": "cc",
        "reference": "XXXX-XXXX-XXXX-bd5p",
        "number": "XXXX-XXXX-XXXX-2222",
        "type": "Visa"
      },
      "type": "subscription",
      "scheme": "monthly",
      "balance": "10.00",
      "total": "0.00",
      "start_date": "2015-11-11",
      "next_due": {
        "date": "2015-11-11",
        "amount": "10.00",
        "fees": []
      },
      "paid_count": 0,
      "status": "ongoing",
      "status_code": 1,
      "completed": false,
      "created": 1447306716,
      "updated": 1447306716,
      "config": {
        "initial_fee": "0.00",
        "duration": 0,
        "options": null,
        "payload": null,
        "callback_url": "http://www.sample.com/webhook.php"
      },
      "logs": [
        {
          "id": 5,
          "payplan_id": 1,
          "sku": "",
          "amount": "67.00",
          "description": "Another sample fee",
          "completed": 0
        },
      ]     
    }
  ],
  "meta": {
    "pagination": {
      "total": 23,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 12,
      "links": {
        "next": "https://www.sample.com/v1/recurring/?limit=2&page=2"
      }
    }
  }
}
```

This endpoint retrieves all recurring plans.

### HTTP Request

`GET recurring plans`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
customer |  | If set, the result will include only recurring plans associated with specific customer.
status |  | If set, the result will include only recurring plans with specific status. Possible values are "ongoing", "cancelled", and "completed".
type |  | If set, the result will include only recurring plans with specific type. Possible values are "subscription" and "payplan".
limit | 20 | Number of items to show per page.
page | 1 | Page number.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 25,
    "customer": "123456",
    "method": {
      "id": 22,
      "method": "cc",
      "reference": "XXXX-XXXX-XXXX-dr2e",
      "number": "XXXX-XXXX-XXXX-2224",
      "type": "Visa"
    },
    "type": "subscription",
    "scheme": "monthly",
    "balance": "54.00",
    "total": "0.00",
    "start_date": "2015-11-21",
    "next_due": {
      "date": "2015-11-21",
      "amount": "54.00",
      "fees": []
    },
    "paid_count": 0,
    "status": "ongoing",
    "status_code": 1,
    "completed": false,
    "created": 1448004054,
    "updated": 1448004054,
    "config": {
      "initial_fee": "65.00",
      "duration": 2,
      "options": null,
      "payload": null,
      "callback_url": "http://www.sample.com/webhook.php"
    },
    "logs": [
      {
        "id": 5,
        "payplan_id": 1,
        "sku": "",
        "amount": "67.00",
        "description": "Another sample fee",
        "completed": 0
      },
    ]
  }
}
```

This method lets you create new recurring plan.

### HTTP Request

`POST recurring plan`

### Query Parameters

Parameter | Description
--------- | -----------
customer* | The customer ID.
method* | The payment method to use. Format: `cc:<id>` for cards. `ach:<id>` for ACH/Check payments. E.g.: `cc:12`.
type* | Plan type. "S" for subscription and "P" for recurring plan.
scheme* | The plan scheme type. "M" for monthly, "Y" for annually/yearly, "W" for weekly, "BW" for bi-weekly, and "Q" for quarterly.
balance* | The due amount.
start* | The date the plan will start in YYYY-MM-DD format. (e.g 2015-10-12).
fee | Initial fee amount.
callback | The URL that will be use by the system when a payment has been made.
duration | The payment count limit. Applies only to payplan.
total | Total amount that will be charge for the entire plan period. Applies only to payplan.

<aside class="notice">* = Required.</aside>

## Update

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 25,
    "customer": "123456",
    "method": {
      "id": 22,
      "method": "cc",
      "reference": "XXXX-XXXX-XXXX-dr2e",
      "number": "XXXX-XXXX-XXXX-2224",
      "type": "Visa"
    },
    "type": "subscription",
    "scheme": "monthly",
    "balance": "54.00",
    "total": "0.00",
    "start_date": "2015-11-21",
    "next_due": {
      "date": "2015-11-21",
      "amount": "54.00",
      "fees": []
    },
    "paid_count": 0,
    "status": "ongoing",
    "status_code": 1,
    "completed": false,
    "created": 1448004054,
    "updated": 1448004054,
    "config": {
      "initial_fee": "65.00",
      "duration": 2,
      "options": null,
      "payload": null,
      "callback_url": "https://someurl.com"
    },
    "logs": [
      {
        "id": 5,
        "payplan_id": 1,
        "sku": "",
        "amount": "67.00",
        "description": "Another sample fee",
        "completed": 0
      },
    ]
  }
}
```

This method lets you update existing recurring plan.

### HTTP Request

`PUT recurring/<PLANID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve.

### Query Parameters

Parameter | Description
--------- | -----------
method | The payment method to use. Format: `cc:<id>` for cards. `ach:<id>` for ACH/Check payments. E.g.: `cc:12`.
scheme | The plan scheme type. "M" for monthly, "Y" for annually/yearly, "W" for weekly, "BW" for bi-weekly, and "Q" for quarterly.
balance | The due amount.
callback | The URL that will be use by the system when a payment has been made.

## Cancel Plan

> Returns `[]` on successful

This method lets you cancel recurring plan

### HTTP Request

`DELETE recurring/<PLANID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to be cancelled.


## Logs

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "refnum": "100095477",
      "date": "2015-11-11",
      "balance": "54.00",
      "total_fees": "65.00",
      "total": "119.00",
      "error": false,
      "reason": "",
      "created": 1447299443,
      "updated": 1447299443
    },
    {
      "refnum": "100095512",
      "date": "2015-12-11",
      "balance": "54.00",
      "total_fees": "12.00",
      "total": "66.00",
      "error": false,
      "reason": "",
      "created": 1447299673,
      "updated": 1447299673
    }
  ],
  "meta": {
    "pagination": {
      "total": 3,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 2,
      "links": {
        "next": "https://api.slycepay.com/v1/recurring/1/logs/?limit=2&page=2"
      }
    }
  }
}
```

This method lets view all logs in a specific plan.

### HTTP Request

`GET recurring/<PLANID>/logs`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve logs.

## Fees

### View

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

#### HTTP Request

`GET recurring/<PLANID>/fees/<FEEID>`

#### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.
FEEID | The ID of the fee.


### View All

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

#### HTTP Request

`GET recurring/<PLANID>/fees`

#### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.



### Create

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

#### HTTP Request

`POST recurring/<PLANID>/fees`

#### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount |  | Fee amount.
sku |  | Tracking id for keeping purposes.


### Delete

> Returns `true` on successful

This method lets you remove the unpaid fees identified by an SKU.

#### HTTP Request

`POST recurring/<PLANID>/fees/<SKU>`

#### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.
SKU | Sku id provided.
