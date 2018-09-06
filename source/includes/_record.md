# Records

## Convert History

```shell
curl "http://example.com/api/record/convert"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": [
    {
      "id": 1,
      "reference_number": "#43h2kd",
      "convertion_type": "XON",
      "from": 100,
      "to": 100,
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    },
    {
      "id": 2,
      "reference_number": "#98dcx6",
      "convertion_type": "XONIO",
      "from": 50,
      "to": 50,
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    }
  ]
}
```

This endpoint retrieves the list of convertions made.

### HTTP Request

`GET http://example.com/api/record/convert`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Exchange History

```shell
curl "http://example.com/api/record/exchange"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": [
    {
      "id": 1,
      "reference_number": "#43h2kd",
      "exchange_type": "RECEIVE",
      "credit": 100,
      "address": "0x9hjk235678dsv789ioqxt3n",
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    },
    {
      "id": 2,
      "reference_number": "#98dcx6",
      "exchange_type": "SEND",
      "credit": 100,
      "address": "0x9hjk235678dsv789ioqxt3n",
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    }
  ]
}
```

This endpoint retrieves the list of exchanges made.

### HTTP Request

`GET http://example.com/api/record/exchange`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Shop History

```shell
curl "http://example.com/api/record/shop"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": [
    {
      "id": 1,
      "title": "Black Panther",
      "reference_number": "#43h2kd",
      "code": "CODE1234",
      "credit": 125,
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    },
    {
      "id": 2,
      "title": "Steam Credits",
      "reference_number": "#43g2h9",
      "code": "STEAM1234",
      "credit": 200,
      "date": "@D:2015-12-10T12:34:56",
      "timestamp": 19267343928,
    }
  ]
}
```

This endpoint retrieves the list of shop purchases made.

### HTTP Request

`GET http://example.com/api/record/shop`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>