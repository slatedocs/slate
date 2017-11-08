# Subscriber Identities

## LIST Subscriber Identities for a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriber_identiites.json
{
  "subscriber_identities": [
    {
      "provider": "email",
      "value": "deepak@gmail.com"
    },
    {
      "provider": "quintype",
      "value": "8759"
    }
  ]
}
```

This API will list out all the identities for a user.

## POST Create a Subscriber Identity for a user

```shell
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriber_identities.json -d '{
  subscriber_identity: {
    provider: "email",
    value: "asim2@gmail.com"
  }
}'

{
"subscriber_identities":[{
    "provider":"email",
    "value":"asim2@gmail.com"
  },
  {
    "provider":"email",
    "value":"asim@quintype.com"
  }]
}
```

This API can be used to add an Identity for an existing subscriber
