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

# Setup

**Base URI**: `https://api.slycepay.com/v1`

**Base URI (dev)**: `http://apidev.slycepay.com/v1`

**Current Version**: `1.0`


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
method | The payment method ID to use.
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


# Customers

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": "0011",
    "firstname": "John",
    "lastname": "Doe",
    "email": "someemail@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "Some City",
    "street": "",
    "street2": "",
    "state": "Some State",
    "country": "Some Country",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint retrieves specific customer.

### HTTP Request

`GET customers/<CUSTID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer to retrieve.

## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "0011",
      "firstname": "John",
      "lastname": "Doe",
      "email": "user@mail.com",
      "company": "CMS",
      "phone": "1234-123-1234",
      "fax": "1234-123-1234",
      "city": "Some City",
      "street": "Some Address",
      "street2": "Some Address 2",
      "state": "Some Street",
      "country": "Some Country",
      "zip": "123456",
      "created": 1418817615,
      "updated": 1446130697
    },
    {
      "id": "0012",
      "firstname": "Jener",
      "lastname": "Hay",
      "email": "jensomeemail@mailer.com",
      "company": "CMS",
      "phone": "1234-123-1234",
      "fax": "1234-123-1234",
      "city": "Some City",
      "street": "Some Address",
      "street2": "Some Address 2",
      "state": "Some Street",
      "country": "Some Country",
      "zip": "123456",
      "created": 1418817615,
      "updated": 1446130697
    }
  ],
  "meta": {
    "pagination": {
      "total": 52,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 26,
      "links": {
        "next": "http://api.slycepay.com/v1/customers/?limit=2&page=1"
      }
    }
  }
}
```

This endpoint retrieves all customers.

### HTTP Request

`GET customers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
limit | 20 | Number of items to show per page.
page | 1 | Page number.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": "0014",
    "firstname": "John",
    "lastname": "Doe",
    "email": "user@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "Some City",
    "street": "",
    "street2": "",
    "state": "Some State",
    "country": "Some Country",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint creates new customer.

### HTTP Request

`POST customers`

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
    "id": "0014",
    "firstname": "John",
    "lastname": "Doe",
    "email": "user@mail.com",
    "company": "CMS",
    "phone": "1234-123-1234",
    "fax": "1234-123-1234",
    "city": "Some City",
    "street": "",
    "street2": "",
    "state": "Some State",
    "country": "Some Country",
    "zip": "6000",
    "created": 1418817615,
    "updated": 1446130697
  }
}
```

This endpoint updates existing customer.

### HTTP Request

`PUT customers/<ID>`

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
    "amount": "123.50",
    "description": "Test fee.",
    "completed": true
  }
}
```

This method lets you view specific fee.

### HTTP Request

`GET payplans/<PLANID>/fees/<FEEID>`

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
      "total": 6,
      "count": 2,
      "per_page": 2,
      "current_page": 1,
      "total_pages": 3,
      "links": {
        "next": "http://api.slycepay.com/v1/payplans/1/fees/?limit=2&page=1"
      }
    }
  }
}
```

This method lets you view all fees in a specific plan.

### HTTP Request

`GET payplans/<PLANID>/fees`

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
    "amount": "12.52",
    "description": "Test fee 2.",
    "completed": true
  }
}
```

This method lets you create new fee.

### HTTP Request

`POST payplans/<PLANID>/fees`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount |  | Fee amount.
sku |  | Tracking id for keeping purposes.


## Delete

> Returns `true` on successful

This method lets you remove the unpaid fees identified by an SKU.

### HTTP Request

`POST payplans/<PLANID>/fees/<SKU>`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.
SKU | Sku id provided.


# Transactions

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 102286438,
    "custid": "123456",
    "accountHolder": "John Doe",
    "checkData": {
      "account": null,
      "routing": null
    },
    "creditCardData": {
      "avsStreet": "",
      "avsZip": "",
      "cardCode": "XXX",
      "cardExpiration": "XXXX",
      "cardNumber": "XXXXXXXXXXXX2227",
      "cardPresent": false,
      "cardType": "V",
      "internalCardAuth": false,
      "magStripe": "",
      "magSupport": "",
      "pares": "",
      "termType": ""
    },
    "datetime": "2015-11-23 18:37:10",
    "timestamp": 1448332630,
    "lineitems": [],
    "details": {
      "amount": 135,
      "clerk": "",
      "currency": "",
      "description": "Recurring Payment",
      "comments": "",
      "discount": 0,
      "invoice": "1448332630",
      "nonTax": false,
      "orderID": "",
      "pONum": "",
      "shipping": 0,
      "subtotal": 0,
      "table": "",
      "tax": 0,
      "terminal": "",
      "tip": 0
    },
    "response": {
      "acsUrl": null,
      "authAmount": 135,
      "authCode": "086595",
      "avsResult": "Address Information not verified for domestic transaction",
      "avsResultCode": "XXU",
      "batchNum": 0,
      "batchRefNum": -2,
      "cardCodeResult": "Match",
      "cardCodeResultCode": "M",
      "cardLevelResult": null,
      "cardLevelResultCode": null,
      "conversionRate": 0,
      "convertedAmount": 0,
      "convertedAmountCurrency": "",
      "custNum": 0,
      "error": "Approved",
      "errorCode": 0,
      "isDuplicate": false,
      "payload": null,
      "refNum": 102286438,
      "result": "Approved",
      "resultCode": "A",
      "status": "Pending",
      "statusCode": "P",
      "vpasResultCode": null
    },
    "serverIP": "125.212.45.130",
    "source": "Slice 1.5 Local",
    "status": "Authorized (Pending Settlement)",
    "transactionType": "Sale",
    "user": "auto"
  }
}
```

This method lets you view specific transaction.

### HTTP Request

`GET transactions/<TRANID>`

### URL Parameters

Parameter | Description
--------- | -----------
TRANID | The reference number of the transaction.


## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 102286438,
      "custid": "123456",
      "accountHolder": "John Doe",
      "checkData": {
        "account": null,
        "routing": null
      },
      "creditCardData": {
        ...
      },
      "datetime": "2015-11-23 18:37:10",
      "timestamp": 1448332630,
      "lineitems": [],
      "details": {
        ...
      },
      "response": {
        ...
      },
      "serverIP": "125.212.45.130",
      "source": "Slice 1.5 Local",
      "status": "Authorized (Pending Settlement)",
      "transactionType": "Sale",
      "user": "auto"
    },
    {
      "id": 102230071,
      "custid": "new01",
      "accountHolder": "Jenner",
      "checkData": {
        "account": "XXXXX3123",
        "routing": "XXXXX3123"
      },
      "creditCardData": {
        ...
      },
      "datetime": "2015-11-19 15:58:01",
      "timestamp": 1447977481,
      "lineitems": [
        {
          "SKU": "32",
          "ProductName": "Prod 1",
          "Description": "Test lineitem",
          "UnitPrice": "3.35",
          "Qty": "4.0000",
          "Taxable": true
        },
        {
          "SKU": "8",
          "ProductName": "Prod 2",
          "Description": "Test lineitem 2",
          "UnitPrice": "1.00",
          "Qty": "4.0000",
          "Taxable": true
        }
      ],
      "details": {
        ...
      },
      "response": {
        ...
      },
      "serverIP": "125.212.45.130",
      "source": "Slice 1.5 Local",
      "status": "Pending",
      "transactionType": "Check (Sale)",
      "user": "auto"
    }
  ]
}
```

This method lets you view all transactions.

### HTTP Request

`GET transactions`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the payplan to retrieve fees.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
start | (today - 1month) | Start date.
end | today | End date.
limit | 20 | Number of items to show per page. 
page | 1 | Page number. 