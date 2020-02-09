# Authentication

## Get an API Key

```shell
curl -X POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/users/get_token \
  --data 'email=${EMAIL}' \
  --data 'password=${PASSWORD}'
```

```ruby
require 'rest-client'

payload = {
  'email': ${EMAIL},
  'password': ${PASSWORD}
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/users/get_token'

RestClient.post(url, payload, headers={})
```

> The above command returns JSON structured like this:

```json
{
    "auth_token": "${API_KEY}"
}
```

Fetch an API Key with a POST request to the endpoint.

#### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/users/get_token`

#### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
EMAIL | String | Email of the user account
PASSWORD | String | Password of the user account

## Authenticating your Requests

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -u ${API_KEY}:
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways'

RestClient.get(url, headers: headers)
```

> Make sure to replace `${API_KEY}` with your API key.

Weaver uses API keys to allow access to the API. You can retrieve your Weaver API key via [the User Token endpoint below](#create-user-token).

Weaver expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: ${API_KEY}`

<aside class="notice">
You must replace <code>${API_KEY}</code> with your personal API key.
</aside>
