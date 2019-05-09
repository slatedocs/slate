
# Customers

## Get state of my current customer

<aside class="notice">
The customer endpoints is using JWT for authentication
</aside>

```shell
curl "https://platform.tier-services.io/v1/customer"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{}
```

### HTTP Request

`GET https://platform.tier-services.io/v1/customer`


## Customer-Specific error codes

>The command to create a customer

```json
{
  "method": "POST",
  "path": "/api/customer",
  "headers": {
    "Authorization": "Token samson",
    "Content-Type": "application/json"
  },
  "body": {
    "email": "malformed-email",
    "firstName": "John",
    "lastName": "Doe",
    "locale": "es_ES"
  }
}
```

> returns a JSON structured like this if **the email is malformed and the firebaseId is missing**:

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

The Tier API can respond with the following customer specific error codes:

Error Code | Meaning
---------- | -------
400 | Malformed email and missing firebaseId