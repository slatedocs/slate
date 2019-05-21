
# Customers

## Get state of my current customer

```shell
curl "https://platform.tier-services.io/v1/customer"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{}
```


<aside class="notice">
The customer endpoints using JWT for authentication
</aside>


<<<<<<< Updated upstream
### HTTP Request
=======
```json
  "body": {
    "errors": [
      {
        "code": "ValidationError",
        "title": "Enter a valid email address.",
        "status": "400"
      },
      {
        "code": "ValidationError",
        "title": "This field is required.",
        "status": "400"
      }
    ]
  }
}
```

The TIER API can respond with the following customer specific error codes:
>>>>>>> Stashed changes

`GET https://platform.tier-services.io/v1/customer`
