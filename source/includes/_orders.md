# Orders


> The above command returns JSON structured like this:

```json
{
    "Total": "int",
    "Items":
    [
      {

           "Id": "int",
           "Email": "string",
           "EventId": "int",
           "Amount": "decimal allow null",
           "Title": "string",
           "Deleted": "bool",
           "PaymentReceived": "bool"
      }
    ]
}
```

This endpoint retrieves all orders.

### HTTP Request

`GET http://radario.co/backoffice/orders`

### Query Parameters

Parameter | Required | Description
--------- | -------  | -----------
sortfield |   NO     | sort hosts by field. string
sortorder |   NO     | sort order. 1 - ASC, 2 - DESC
take      |   NO     | number of results that should be returned, defaults to 10
skip      |   NO     | number of initial results that should be skipped, defaults to 0

