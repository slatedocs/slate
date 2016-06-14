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
