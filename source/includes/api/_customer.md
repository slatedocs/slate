# Customers

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "customer": {
      "id": "tokenex-0016",
      "firstname": "CMS Test",
      "lastname": "last name",
      "email": "test@yahoo.com",
      "company": "Zylun PH",
      "phone": "123-1234-123",
      "fax": "123-1234-123",
      "city": "Cebu",
      "street": "Andresasdfsdfsd Abellana St.",
      "street2": "Andres Abellana St.",
      "state": "Cebu",
      "country": "Philippines",
      "zip": "6000",
      "custom_fields": [],
      "created": 1486093551,
      "updated": 1486093551
    },
    "paymentDetails": [
      {
        "payID": 72,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2224",
        "token": "78631c9b-a28c-4d69-af09-313b439783c7",
        "cardType": "visa",
        "source": "tokenex"
      },
      {
        "payID": 73,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2224",
        "token": "7b11f685-8aa9-46ba-b7fc-6629457f2e4e",
        "cardType": "visa",
        "source": "tokenex"
      }      
    ]
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
      "customer": {
        "id": "CUST-199x",
        "firstname": "Kimmy Inc.",
        "lastname": "Bond",
        "email": "wilsone@zylun.com",
        "company": "Zylun PH",
        "phone": "123-1234-123",
        "fax": "123-1234-123",
        "city": "Cebu",
        "street": "Andres Abellana St.",
        "street2": "Andres Abellana St.",
        "state": "Cebu",
        "country": "Philippines",
        "zip": "6000",
        "custom_fields": [],
        "created": 1458284184,
        "updated": 1458284184
      },
      "paymentDetails": [
        {
          "payID": 2,
          "method": "card",
          "lastfour": "XXXXXXXXXXXX2220",
          "token": "y6zf-cmq0-s4jk-eabo",
          "cardType": "Visa",
          "source": "usaepay"
        },
        {
          "id": 1,
          "method": "ach",
          "number": "123",
          "account": "XXXX-X678-9",
          "routing": "XXXX-X678-9",
          "type": "checking",
          "active": true
        }
      ]
    },
    {
      "customer": {
        "id": "test-235",
        "firstname": "CMS Test",
        "lastname": "Bond",
        "email": "wilsone@zylun.com",
        "company": "Zylun PH",
        "phone": "123-1234-123",
        "fax": "123-1234-123",
        "city": "Cebu",
        "street": "Compostela",
        "street2": "Compostela",
        "state": "Cebu",
        "country": "Philippines",
        "zip": "6003",
        "custom_fields": [],
        "created": 1477455361,
        "updated": 1477455361
      },
      "paymentDetails": []
    },
    {
      "customer": {
        "id": "TESTAGAIN",
        "firstname": "Vault Test",
        "lastname": "Bond",
        "email": "wilsone@zylun.com",
        "company": "Zylun PH",
        "phone": "123-1234-123",
        "fax": "123-1234-123",
        "city": "Cebu",
        "street": "Compostela",
        "street2": "Compostela",
        "state": "Cebu",
        "country": "Philippines",
        "zip": "6003",
        "custom_fields": [],
        "created": 1477458149,
        "updated": 1477458149
      },
      "paymentDetails": []
    },
    ],
    "meta": {
        "pagination": {
          "total": 27,
          "count": 20,
          "per_page": 20,
          "current_page": 1,
          "total_pages": 2,
          "links": {
            "next": "http://sliceapilocal.cmsonline.com/v2/customers?page=2"
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
    "customer": {
      "id": "cust-212",
      "firstname": "erwin",
      "lastname": "zylun",
      "email": "erwins@zylun.com",
      "company": "CMS",
      "phone": "1234-1234-1234",
      "fax": "1234-1234-1234",
      "city": "Cebu",
      "street": "it park",
      "street2": "it park",
      "state": "cebu",
      "country": "Philippines",
      "zip": "6000",
      "custom_fields": [],
      "created": 1489733229,
      "updated": 1489733229
    },
    "paymentDetails": []
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
    "customer": {
      "id": "cust-212",
      "firstname": "marlonx7",
      "lastname": "gallego",
      "email": "suicoerw@gmail.com",
      "company": "Zylun PH",
      "phone": "123-1234-123",
      "fax": "123-1234-123",
      "city": "mandaue2",
      "street": "upper tabok, pc suico st.",
      "street2": "it park",
      "state": "cebu",
      "country": "philippines",
      "zip": "6014",
      "custom_fields": [],
      "created": 1489733229,
      "updated": 1489733272
    },
    "paymentDetails": []
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


## Cards

### Add Card

> Returns JSON structured like this:

```json
{
  "data": {
    "customer": {
      "custID": "cust-212",
      "name": "marlonx7"
    },
    "paymentDetails": {
      "payID": 95,
      "method": "card",
      "lastfour": "XXXXXXXXXXXX2228",
      "token": "102931293810294012983109238",
      "cardType": "visa",
      "source": "tokenex"
    },
    "info": {
      "gatewayID": 5,
      "name": "nmi",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 84,
      "userKey": "slicelocal_nmi",
      "proccessTime": 0
    }
  }
}
```

This method lets you add card for a customer

#### HTTP Request

`POST customers/<CUSTID>/cards`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
lastfour* |  | Card number.
reference* |  | Card reference numer.
type* |  | Type of card (Visa, Mastercard, etc., ) .
name |  | Name of the card.

### View

> Returns JSON structured like this:

```json
{
  "data": {
    "paymentDetails": {
      "payID": 95,
      "method": "card",
      "lastfour": "XXXXXXXXXXXX2228",
      "token": "102931293810294012983109238",
      "cardType": "visa",
      "source": "tokenex"
    }
  }
}
```

This endpoint retrieves specific customer's credit method details.

#### HTTP Request

`GET customers/<CUSTID>/cards/<METHODID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Method ID.

### View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "paymentDetails": {
        "payID": 95,
        "method": "card",
        "lastfour": "XXXXXXXXXXXX2228",
        "token": "102931293810294012983109238",
        "cardType": "visa",
        "source": "tokenex"
      }
    }
  ],
  "meta": {
    "pagination": {
      "total": 1,
      "count": 1,
      "per_page": 20,
      "current_page": 1,
      "total_pages": 1,
      "links": []
    }
  }
}
```

This endpoint retrieves all customer's cards.

#### HTTP Request

`GET customers/<CUSTID>/cards`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.


### Delete

> Returns `true` on successful

This method lets you remove saved credit.

#### HTTP Request

`DELETE customers/<CUSTID>/cards/<METHODID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Payment method ID.

## Checks

### View

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

#### HTTP Request

`GET customers/<CUSTID>/checks/<METHODID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Method ID.

### View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "customer": {
        "custID": "cust-212",
        "name": "marlonx7"
      },
      "paymentDetails": {
        "id": 7,
        "method": "ach",
        "number": "123456789",
        "account": "XXXX-X678-9",
        "routing": "XXXX-X678-9",
        "type": "checking",
        "active": true
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0
      }
    },
    {
      "customer": {
        "custID": "cust-212",
        "name": "marlonx7"
      },
      "paymentDetails": {
        "id": 8,
        "method": "ach",
        "number": "123456789",
        "account": "XXXX-X678-9",
        "routing": "XXXX-X678-9",
        "type": "checking",
        "active": true
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0
      }
    },
    {
      "customer": {
        "custID": "cust-212",
        "name": "marlonx7"
      },
      "paymentDetails": {
        "id": 9,
        "method": "ach",
        "number": "123456789",
        "account": "XXXX-X678-9",
        "routing": "XXXX-X678-9",
        "type": "checking",
        "active": true
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0
      }
    },
    {
      "customer": {
        "custID": "cust-212",
        "name": "marlonx7"
      },
      "paymentDetails": {
        "id": 10,
        "method": "ach",
        "number": "123456789",
        "account": "XXXX-X678-9",
        "routing": "XXXX-X678-9",
        "type": "checking",
        "active": true
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0
      }
    },
    {
      "customer": {
        "custID": "cust-212",
        "name": "marlonx7"
      },
      "paymentDetails": {
        "id": 11,
        "method": "ach",
        "number": "123456789",
        "account": "XXXX-X678-9",
        "routing": "XXXX-X678-9",
        "type": "checking",
        "active": true
      },
      "info": {
        "gatewayID": 1,
        "name": "usaepay",
        "referrer": null,
        "clientIP": "127.0.0.1",
        "mid": "513485000208199",
        "userID": 18,
        "userKey": "slicelocal",
        "proccessTime": 0
      }
    }
  ]
}
```

This endpoint retrieves all customer's saved checks.

#### HTTP Request

`GET customers/<CUSTID>/checks`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

### Create

> Returns JSON structured like this:

```json
{
  "data": {
    "customer": {
      "custID": "cust-212",
      "name": "marlonx7"
    },
    "paymentDetails": {
      "id": 11,
      "method": "ach",
      "number": "123456789",
      "account": "XXXX-X678-9",
      "routing": "XXXX-X678-9",
      "type": "checking",
      "active": true
    },
    "info": {
      "gatewayID": 5,
      "name": "nmi",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 84,
      "userKey": "slicelocal_nmi",
      "proccessTime": 0
    }
  }
}
```

This endpoint creates new customer's check.

#### HTTP Request

`POST customers/<CUSTID>/checks`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
account* |  | Check account number.
routing* |  | Routing number.
check* |  | Check number.
name* |  | Payment method name.

<aside class="notice">* = Required.</aside>

### Delete

> Returns `true` on successful

This method lets you remove saved checks.

#### HTTP Request

`DELETE customers/<CUSTID>/checks/<METHODID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Payment method ID.


