# Rate Limit

The rate limit endpoint allows you to see your monthly account-level and per minute user-level API limits and usage.
The monthly account-level call limit resets at the end of each calendar month.

## The Rate Limit Resource

The rate limit resource includes information about account (AKA organization)-level and API key-level rate limits and usage.

> Example Response

```json
{
    "rate": {
        "org_monthly": {
            "limit": 40000,
            "remaining": 39993,
            "reset": 2124845,
            "used": 7
        },
        "api_key_per_minute": {
            "limit": 900,
            "remaining": 900,
            "reset": 0,
            "used": 0
        }
    }
}
```
| Attribute          | Type    | Description                                  |
| ------------------ | ------- | -------------------------------------------  |
| rate               | object  | Type of rate limit.                          |
| org_monthly        | object  | Monthly rate limit per organization.         |
| api_key_per_minute | object  | Per minute rate limit per API key.           |
| limit              | integer | The maximum number of calls for each period. |
| remaining          | integer | The number of calls remaining before reset.  |
| reset              | integer | Time in seconds until call count resets.     |
| used               | integer | The number of calls that have been used.     |

<aside class="notice">
  <h6>Note</h6>
  <ul>
    <li><code>/rate-limit</code> and <code>/auth/whoami</code> endpoints are exempt from organization-level monthly rate limits.</li>
  </ul>
</aside>

## Get Rate Limit Information

> Example Request

```shell
curl "https://api.affinity.co/rate-limit" -u :$API_KEY
```

> Example Response

```json
{
    "rate": {
        "org_monthly": {
            "limit": 40000,
            "remaining": 39993,
            "reset": 2124845,
            "used": 7
        },
        "api_key_per_minute": {
            "limit": 900,
            "remaining": 900,
            "reset": 0,
            "used": 0
        }
    }
}
```

`GET /rate-limit`

Querying the rate limit endpoint will yield information about account (AKA organization)-level and API key-level rate limits and usage.

### Returns

The rate limit resource, a JSON body of data including limits, calls remaining, seconds until reset and call count.
