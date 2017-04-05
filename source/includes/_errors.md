# Errors

## Get all protections
```shell
curl "http://example.com/api/v1/employees"
  -H "Authorization: Your API key"
```

> Example error response when the quote protections are not valid:

```json
{
  "data":[
    {
      "type":"errors",
      "entity":"quote_protection",
      "attributes":{
        "protection_id": "25",
        "months":"Not enough on the protection",
        "start_date":"Wrong Format",
        "start_mileage":"Could not be determined"
      }
    }
  ]
}
```

> Example error response when the customer data was invalid:

```json
{
  "data":[
    {
      "type":"errors",
      "entity":"customer",
      "attributes":{
        "first_name": "Not present",
        "state":"Not valid",
        "email":"Wrong Format"
      }
    }
  ]
}
```

The Line5 API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- It's Bad
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The action requested is out of limits
404 | Not Found -- The specified route was not found
422 | Unprocessable Entity -- The data to create the object was invalid
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.


