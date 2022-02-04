# Whoami

The Whoami API gives the user metadata about the user's authentication and Affinity instance information, including the instance subdomain. This can be used for linking back to the user's Affinity instance.

## The Whoami Resource

Querying the Whoami endpoint will give information about the user, Affinity instance, and authentication method.

> Example Response

```json
{
    "tenant": {
        "id": 1,
        "name": "Affinity",
        "subdomain": "affinity"
    },
    "user": {
        "id": 2,
        "firstName": "John",
        "lastName": "Doe",
        "email": "john@affinity.co"
    },
    "grant": {
        "type": "api_key",
        "scope": "external_api",
        "createdAt": "2020-12-14T09:00:00.000-05:00"
    }
}
```
| Attribute     | Type     | Description                                                           |
| ------------- | -------- | --------------------------------------------------------------------- |
| tenant        | object   | Information about the Affinity instance the user belongs to.      |
| user          | object   | Data about the user whose api key was used for the endpoint.          |
| grant         | object   | Data about the type of authentication and metadata about the api key. |

## Get Whoami

> Example Request

```shell
curl "https://api.affinity.co/auth/whoami" -u :$API_KEY
```

> Example Response

```json
{
    "tenant": {
        "id": 1,
        "name": "Affinity",
        "subdomain": "affinity"
    },
    "user": {
        "id": 2,
        "firstName": "John",
        "lastName": "Doe",
        "email": "john@affinity.co"
    },
    "grant": {
        "type": "api_key",
        "scope": "external_api",
        "createdAt": "2020-12-14T09:00:00.000-05:00"
    }
}
```

`GET /auth/whoami`

Gets information about the user sending the request, and their affiliate company.

There are no query or path parameters for this method. The information needed is contained within the API key.

### Returns

JSON body of data including tenant, user, and grant information.