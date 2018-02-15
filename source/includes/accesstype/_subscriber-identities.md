# Subscriber Identities

A subscriber is identified by a pair of a provider and an identity (such as [email,dev@quintype.com], or [facebook, fb-id]). A subscriber can have many identities. A provider is an external system. It can be one of [email, quintype, facebook, twitter].

Most APIs will accept the primary identity via URL parameters, and will also accept query parameters `alternate_provider` and `alternate_identitiy`, which will be used in case the user is not found at the primary identity.

## LIST Subscriber Identities for a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_identities.json
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
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_identities.json -d '{
  "subscriber_identity:" {
    "provider": "email",
    "value": "asim2@gmail.com"
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
