# Recurring

Recurring handles all types of recurring plans.

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "customer": {
      "custID": "tokenex-0010",
      "name": "CMS Test"
    },
    "paymentDetails": {
      "payID": 51,
      "method": "card",
      "lastfour": "XXXXXXXXXXXX2223",
      "token": "6e7c016b-ce56-4c2b-8151-f7a12ec4b670",
      "cardType": "visa",
      "source": "tokenex"
    },
    "recurring": {
      "id": 83,
      "status": "ongoing",
      "type": "subscription",
      "scheme": "monthly",
      "amount": "5.33",
      "total": "0.00",
      "duration": 0,
      "startDate": "2016-12-10",
      "completedDate": "",
      "nextDueDate": "2016-12-10",
      "paidCount": 0
    },
    "info": {
      "gatewayID": 1,
      "name": "usaepay",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 18,
      "userKey": "slicelocal",
      "proccessTime": 0,
      "tranToken": null
    }
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
      "customer": {
        "custID": "tokenex-0016",
        "name": "CMS Test"
      },
      "paymentDetails": {
        "payID": 79,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2224",
        "token": "1m7q-46i2-qr7k-lstu",
        "cardType": "visa",
        "source": "usaepay"
      },
      "recurring": {
        "id": 539,
        "status": "ongoing",
        "type": "payplan",
        "scheme": "monthly",
        "amount": "0.17",
        "total": "1.00",
        "duration": 6,
        "startDate": "2017-02-17",
        "completedDate": "",
        "nextDueDate": "2017-02-17",
        "paidCount": 0
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0,
        "tranToken": null
      }
    },
    {
      "customer": {
        "custID": "tokenex-0016",
        "name": "CMS Test"
      },
      "paymentDetails": {
        "payID": 80,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2224",
        "token": "deed1544-84c7-4ba5-8d2a-a24ef5c5407e",
        "cardType": "visa",
        "source": "tokenex"
      },
      "recurring": {
        "id": 538,
        "status": "ongoing",
        "type": "subscription",
        "scheme": "monthly",
        "amount": "1.00",
        "total": "0.00",
        "duration": 0,
        "startDate": "2017-02-14",
        "completedDate": "",
        "nextDueDate": "2017-03-14",
        "paidCount": 1
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0,
        "tranToken": null
      }
    },
    {
      "customer": {
        "custID": "tokenex-0016",
        "name": "CMS Test"
      },
      "paymentDetails": {
        "payID": 79,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2224",
        "token": "1m7q-46i2-qr7k-lstu",
        "cardType": "visa",
        "source": "usaepay"
      },
      "recurring": {
        "id": 520,
        "status": "completed",
        "type": "payplan",
        "scheme": "monthly",
        "amount": "3.12",
        "total": "-2.12",
        "duration": 6,
        "startDate": "2017-02-14",
        "completedDate": {
          "date": "2017-02-14 20:29:09.000000",
          "timezone_type": 3,
          "timezone": "America/Los_Angeles"
        },
        "nextDueDate": "2017-02-14",
        "paidCount": 1
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0,
        "tranToken": null
      }
    }
  ],
  "meta": {
    "pagination": {
      "total": 539,
      "count": 3,
      "per_page": 3,
      "current_page": 1,
      "total_pages": 27,
      "links": {
        "next": "https://sliceapilocal.cmsonline.com/v2/recurring?page=2"
      }
    }
  }
}
```

This endpoint retrieves all recurring plans.

### HTTP Request

`GET recurring`

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
    "customer": {
      "custID": "tokenex-0016",
      "name": "CMS Test"
    },
    "paymentDetails": {
      "payID": 72,
      "method": "card",
      "lastfour": "XXXXXXXXXXXX2224",
      "token": "78631c9b-a28c-4d69-af09-313b439783c7",
      "cardType": "visa",
      "source": "tokenex"
    },
    "recurring": {
      "id": 540,
      "status": "ongoing",
      "type": "payplan",
      "scheme": "monthly",
      "amount": "1.00",
      "total": "1.00",
      "duration": 6,
      "startDate": "2017-03-01",
      "completedDate": "",
      "nextDueDate": "2017-03-01",
      "paidCount": 0
    },
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 32,
      "userKey": "slicelocal_acapture",
      "proccessTime": 0,
      "tranToken": null
    }
  }
}
```

This method lets you create new recurring plan.

### HTTP Request

`POST recurring`

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
    "customer": {
      "custID": "tokenex-0016",
      "name": "CMS Test"
    },
    "paymentDetails": {
      "payID": 72,
      "method": "card",
      "lastfour": "XXXXXXXXXXXX2224",
      "token": "78631c9b-a28c-4d69-af09-313b439783c7",
      "cardType": "visa",
      "source": "tokenex"
    },
    "recurring": {
      "id": 540,
      "status": "ongoing",
      "type": "payplan",
      "scheme": "monthly",
      "amount": "1.00",
      "total": "1.00",
      "duration": 6,
      "startDate": "2017-03-01",
      "completedDate": "",
      "nextDueDate": "2017-03-01",
      "paidCount": 0
    },
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 32,
      "userKey": "slicelocal_acapture",
      "proccessTime": 0,
      "tranToken": null
    }
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

`DELETE recurring/<PLANID>/fees/<SKU>`

#### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.
SKU | Sku id provided.
