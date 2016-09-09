# Cards

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 126,
    "method": "credit",
    "reference": "XXXX-XXXX-XXXX-llm6",
    "number": "XXXX-XXXX-XXXX-2220",
    "type": "Visa"
  }
}
```

This endpoint retrieves specific customer's credit method details.

### HTTP Request

`GET customers/<CUSTID>/cards/<METHODID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Method ID.

## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 126,
      "method": "credit",
      "reference": "XXXX-XXXX-XXXX-llm6",
      "number": "XXXX-XXXX-XXXX-2220",
      "type": "Visa"
    },
    {
      "id": 128,
      "method": "credit",
      "reference": "XXXX-XXXX-XXXX-1jfp",
      "number": "XXXX-XXXX-XXXX-2222",
      "type": "Visa"
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

This endpoint retrieves all customer's cards.

### HTTP Request

`GET customers/<CUSTID>/cards`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.


## Delete

> Returns `true` on successful

This method lets you remove saved credit.

### HTTP Request

`DELETE customers/<CUSTID>/cards/<METHODID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
METHODID | Payment method ID.
