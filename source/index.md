---
title: Slyce API Documentation



toc_footers:
  - <a href='https://cmsonline.com'>Documentation Powered by CMS</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Slyce API!

# Authentication

> To authorize, use this code:

```php
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "X-Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Slyce uses API keys to allow access to the API. You can get you own Slyce API key by contacting our support.

Slyce expects for the API key to be included in all API requests to the server in a header that looks like the following:

`X-Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your own API key.
</aside>

# Payplans

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 2,
    "customer": "001",
    "method": {
      "id": 213,
      "method": "cc",
      "reference": "XXXX-XXXX-XXXX-o079",
      "number": "XXXX-XXXX-XXXX-2226",
      "type": "Visa"
    },
    "type": "subscription",
    "scheme": "monthly",
    "balance": "10.00",
    "total": "0.00",
    "start_date": "2015-11-13",
    "next_due": {
      "date": "2015-11-13",
      "amount": "10.00",
      "fees": []
    },
    "paid_count": 0,
    "status": "ongoing",
    "status_code": 1,
    "completed": false,
    "created": 1447467989,
    "updated": 1447467989,
    "config": {
      "initial_fee": "0.00",
      "duration": 0,
      "options": null,
      "payload": null,
      "callback_url": "http://localhost/index.php"
    }
  }
}
```

This endpoint retrieves a specific payplan.

### HTTP Request

`GET https://api.slycepay.com/v1/payplans/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the payplan to retrieve.

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
        "callback_url": "http://localhost"
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
        "callback_url": "http://localhost/index.php"
      }
    }
  ],
  "meta": {
    "pagination": {
      "total": 22,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 11,
      "links": {
        "next": "https://sliceapilocal.cmsonline.com/v1/payplans/?limit=2&page=2"
      }
    }
  }
}
```

This endpoint retrieves all payplans.

### HTTP Request

`GET https://api.slycepay.com/v1/payplans`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
customer |  | If set, the result will include only paylans associated with specific customer.
status |  | If set, the result will include only payplans with specific status. Possible values are "ongoing", "cancelled", and "completed".
type |  | If set, the result will include only payplans with specific type. Possible values are "subscription" and "payplan".
limit | 20 | Returned items limit.
page | 1 | Page number.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 24,
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
    "created": 1447997128,
    "updated": 1447997128,
    "config": {
      "initial_fee": "65.00",
      "duration": 2,
      "options": null,
      "payload": null,
      "callback_url": "http://localhost"
    }
  }
}
```

This method lets you create new payplan.

### HTTP Request

`POST https://api.slycepay.com/v1/payplans`

### Query Parameters

Parameter | Description
--------- | -----------
customer* | The customer ID.
method* | The payment method ID to use.
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
    "id": 5,
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
    "created": 1447307030,
    "updated": 1447307030,
    "config": {
      "initial_fee": "0.00",
      "duration": 0,
      "options": null,
      "payload": null,
      "callback_url": "http:\/\/localhost.com"
    }
  }
}
```

This method lets you update existing payplan.

### HTTP Request

`PUT https://api.slycepay.com/v1/payplans/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the payplan to retrieve.

### Query Parameters

Parameter | Description
--------- | -----------
method | The payment method ID to use.
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
    },
    {
      "refnum": "100095584",
      "date": "2016-01-11",
      "balance": "54.00",
      "total_fees": "91.00",
      "total": "145.00",
      "error": false,
      "reason": "",
      "created": 1447301838,
      "updated": 1447301838
    }
  ],
  "meta": {
    "pagination": {
      "total": 3,
      "count": 3,
      "per_page": 20,
      "current_page": 1,
      "total_pages": 1,
      "links": []
    }
  }
}
```

This method lets view all logs in a specific plan.

### HTTP Request

`GET https://api.slycepay.com/v1/payplans/<ID>/logs`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the payplan to retrieve logs.




# Customers

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": "0011",
    "firstname": "John",
    "lastname": "Doe",
    "email": "john.doe@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "",
    "street": "Street 1",
    "street2": "",
    "state": "",
    "country": "",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint retrieves specific customer.

### HTTP Request

`GET https://api.slycepay.com/v1/customers/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the customer to retrieve.

## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "0011",
      "firstname": "John",
      "lastname": "Doe",
      "email": "john.doe@mail.com",
      "company": "CMS",
      "phone": "1234-123-1234",
      "fax": "1234-123-1234",
      "city": "",
      "street": "Street 1",
      "street2": "",
      "state": "",
      "country": "",
      "zip": "6000",
      "created": 1418817615,
      "updated": 1446130697
    },
    {
      "id": "0012",
      "firstname": "Jener",
      "lastname": "Hay",
      "email": "jener.hay@mail.com",
      "company": "CMS",
      "phone": "1234-123-1234",
      "fax": "1234-123-1234",
      "city": "",
      "street": "Street 1",
      "street2": "",
      "state": "",
      "country": "",
      "zip": "6000",
      "created": 1418817615,
      "updated": 1446130697
    }
  ],
  "meta": {
    "pagination": {
      "total": 52,
      "count": 2,
      "per_page": 1,
      "current_page": 1,
      "total_pages": 26,
      "links": {
        "next": "http://sliceapilocal.cmsonline.com/v1/customers/?limit=2&page=2"
      }
    }
  }
}
```

This endpoint retrieves all customers.

### HTTP Request

`GET https://api.slycepay.com/v1/customers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
limit | 20 | Returned items limit.
page | 1 | Page number.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": "0012",
    "firstname": "John",
    "lastname": "Doe",
    "email": "john.doe@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "",
    "street": "Street 1",
    "street2": "",
    "state": "",
    "country": "",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint creates new customer.

### HTTP Request

`POST https://api.slycepay.com/v1/customers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
custid* |  | Customer ID.
firstname* |  | First name.
lastname* |  | Last name.
email* |  | The email address.
company |  | Company name if applicable.
phone |  | The phone number.
fax |  | The fax number.
city |  | City address.
street |  | Address.
street2 |  | Alternate address.
state |  | State address.
country |  | Country.
zip |  | Zip/Postal code.

<aside class="notice">* = Required.</aside>

## Update

> Returns JSON structured like this:

```json
{
  "data": {
    "id": "0012",
    "firstname": "John",
    "lastname": "Doe",
    "email": "doe@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "",
    "street": "Street 1",
    "street2": "",
    "state": "",
    "country": "",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint updates existing customer.

### HTTP Request

`PUT https://api.slycepay.com/v1/customers/<ID>`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
firstname |  | First name.
lastname |  | Last name.
email |  | The email address.
company |  | Company name if applicable.
phone |  | The phone number.
fax |  | The fax number.
city |  | City address.
street |  | Address.
street2 |  | Alternate address.
state |  | State address.
country |  | Country.
zip |  | Zip/Postal code.



# Fees

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "payplan_id": 1,
    "sku": "123",
    "amount": "12.00",
    "description": "Test Fee.",
    "completed": true
  }
}
```

This method lets you view specific fee.

### HTTP Request

`GET https://api.slycepay.com/v1/payplans/<PLANID>/fees/<FEEID>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.
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
      "total": 2,
      "count": 2,
      "per_page": 20,
      "current_page": 1,
      "total_pages": 1,
      "links": []
    }
  }
}
```

This method lets you view all fees in a specific plan.

### HTTP Request

`GET https://api.slycepay.com/v1/payplans/<PLANID>/fees`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.



## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "payplan_id": 1,
    "sku": "123",
    "amount": "12.00",
    "description": "Test Fee.",
    "completed": true
  }
}
```

This method lets you create new fee.

### HTTP Request

`POST https://api.slycepay.com/v1/payplans/<PLANID>/fees`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount |  | Fee amount.
sku |  | Tracking id for keeping purposes.
