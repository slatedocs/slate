# Security And Authorization

All calls to the PokitDok API are encrypted over HTTPS. Access to the API is controlled via OAuth2 (for more 
information, reference "OAuth 2.0 Authorization Framework" [here](http://tools.ietf.org/html/rfc6749). If you've already 
signed up and received your client id and client secret, you’ll be able to start calling APIs. Here's a quick example 
using Python and the requests library to demonstrate how to authenticate as your application and access some information 
about an ongoing activity.

```python
import requests
from base64 import urlsafe_b64encode

client_id = YOUR_APP_CLIENT_ID
client_secret = YOUR_APP_CLIENT_SECRET
access_token = requests.post('https://platform.pokitdok.com/oauth2/token',
headers={'Authorization': 'Basic ' +
urlsafe_b64encode(client_id + ':' + client_secret)},
data={'grant_type':'client_credentials'}).json()['access_token']

activity = requests.get('https://platform.pokitdok.com/api/v4/activities/53187d2027a27620f2ec7537',
headers={'Authorization': 'Bearer ' + access_token}).json()
```

```shell
CLIENT_ID=YOUR_APP_CLIENT_ID
CLIENT_SECRET=YOUR_APP_CLIENT_SECRET
BASIC_HEADER=`echo "$CLIENT_ID:$CLIENT_SECRET" | base64`

# On some operating systems, base64 may include extra
# whitespace that needs to be removed
BASIC_HEADER=$(echo $BASIC_HEADER | sed 's/\r//g')
BASIC_HEADER=$(echo $BASIC_HEADER | sed 's/ *//g')

curl -i -XPOST -H "Authorization: Basic $BASIC_HEADER" -d "grant_type=client_credentials"
https://platform.pokitdok.com/oauth2/token
HTTP/1.1 200 OK
Server: nginx
Date: Thu, 06 Mar 2014 04:20:43 GMT
Content-Type: application/json;charset=UTF-8
Content-Length: 127
Connection: keep-alive
Pragma: no-cache
Cache-Control: no-store
{
    "access_token": "s8KYRJGTO0rWMy0zz1CCSCwsSesDyDlbNdZoRqVR",
    "token_type": "bearer",
    "expires": 1393350569,
    "expires_in": 3600
}

ACCESS_TOKEN='s8KYRJGTO0rWMy0zz1CCSCwsSesDyDlbNdZoRqVR'
curl -i -H "Authorization: Bearer $ACCESS_TOKEN"
https://platform.pokitdok.com/api/v4/activities/5317f51527a27620f2ec7533
```

## Errors
Error information may be returned to an API client. Common error scenarios include:

* the data that was provided is invalid
* required information is missing
* rate limits have been exceeded
* an API access token is not valid or no longer valid
* insufficient credits are available for billable resources

Some examples of these are included below.

### Unauthorized access

This may be encountered when an invalid or no longer valid access token is supplied. Access tokens expire one hour after 
being acquired. Applications should handle 401s properly and request a new access token when this is encountered.

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN"
https://platform.pokitdok.com/api/v4/activities/5317f51527a27620f2ec7533
HTTP/1.1 401 UNAUTHORIZED
Server: nginx
Date: Thu, 06 Mar 2014 16:44:07 GMT
Content-Type: application/json
Content-Length: 31
{
    "message": "Unauthorized"
}
```

### Insufficient credits

This may be encountered when credits are not available to an application for a billable resource requested in the API 
call. If this is encountered, the application owner will need to load more credits on their application or change their 
billing tier.

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/providers/?limit=20
HTTP/1.0 402 PAYMENT REQUIRED
Server: nginx
Date: Tue, 25 Feb 2014 16:15:31 GMT
Content-Type: application/json
Content-Length: 35
{
    "message": "Payment Required"
}
```

### Rate limit exceeded

This may be encountered when too many API calls are made within a period of time for a rate limited resource. Rate 
limits are currently enforced on an hourly basis. If your application receives a 403, you can wait for the rate limit 
period to renew and then make the API call again.

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN"
https://platform.pokitdok.com/api/v4/activities/5317f51527a27620f2ec7533
HTTP/1.0 403 FORBIDDEN
Server: nginx
Date: Tue, 25 Feb 2014 16:04:50 GMT
Content-Type: application/json
Content-Length: 28
{
    "message": "Forbidden"
}
```

### Required information missing or invalid

You may encounter errors like this when required information is omitted from an API call. Simply supply the appropriate 
information on the next API call to resolve.

```shell
curl -i -H "Content-Type: application/json" -H "Authorization: Bearer $ACCESS_TOKEN" -d "{}"
https://platform.pokitdok.com/api/v4/eligibility/
HTTP/1.1 422 UNPROCESSABLE ENTITY
Server: nginx
Date: Thu, 06 Mar 2014 19:50:17 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 510
Connection: keep-alive
mimetype: application/json
charset: utf-8
{
    "meta": {
        "activity_id": "53d9506356c02c67c4070096",
        "application_mode": "production",
        "credits_billed": 1,
        "credits_remaining": 995,
        "processing_time": 3,
        "rate_limit_amount": 2,
        "rate_limit_cap": 1000,
        "rate_limit_reset": 1394138991
    },
    "data": {
        "errors": {
            "validation": {
                "member": [
                    "This field is required."
                ],
                "provider": [
                    "This field is required."
                ],
                "trading_partner_id": [
                    "This field is required."
                ]
            }
        }
    }
}
```