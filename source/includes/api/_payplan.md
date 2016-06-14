# Payplans

Payplan handles all types of recurring plans.

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
    }
  }
}
```

This endpoint retrieves a specific payplan.

### HTTP Request

`GET payplans/<PLANID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve.

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
      }
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
      }
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
        "next": "https://www.sample.com/v1/payplans/?limit=2&page=2"
      }
    }
  }
}
```

This endpoint retrieves all payplans.

### HTTP Request

`GET payplans`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
customer |  | If set, the result will include only paylans associated with specific customer.
status |  | If set, the result will include only payplans with specific status. Possible values are "ongoing", "cancelled", and "completed".
type |  | If set, the result will include only payplans with specific type. Possible values are "subscription" and "payplan".
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
    }
  }
}
```

This method lets you create new payplan.

### HTTP Request

`POST payplans`

### Query Parameters

Parameter | Description
--------- | -----------
customer* | The customer ID.
method* | The payment method to use. Format: `cc:<id>` for cards. `ach:<id>` for ACH/Check payments. E.g.: `cc:12`.
type* | Plan type. "S" for subscription and "P" for payplan.
scheme* | The plan scheme type. "M" for monthly and "Y" for annually/yearly.
balance* | The due amount.
start* | The date the plan will start in YYYY-MM-DD format. (e.g 2015-10-12).
fee | Initial fee amount.
callback | The URL that will be use by the system when a payment has been made.
duration | The payment count limit. Applies only to metered plan.
total | Total amount that will be charge for the entire plan period. Applies only to metered plan.

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
    }
  }
}
```

This method lets you update existing payplan.

### HTTP Request

`PUT payplans/<PLANID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve.

### Query Parameters

Parameter | Description
--------- | -----------
method | The payment method to use. Format: `cc:<id>` for cards. `ach:<id>` for ACH/Check payments. E.g.: `cc:12`.
scheme | The plan scheme type. "M" for monthly and "Y" for annually/yearly.
balance | The due amount.
callback | The URL that will be use by the system when a payment has been made.


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
        "next": "https://api.slycepay.com/v1/payplans/1/logs/?limit=2&page=2"
      }
    }
  }
}
```

This method lets view all logs in a specific plan.

### HTTP Request

`GET payplans/<PLANID>/logs`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve logs.
