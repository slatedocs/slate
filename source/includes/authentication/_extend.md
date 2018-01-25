## Extending time on User Tokens

```shell
curl -X POST {server_url}/api/v1/sso_auth/auth_extend
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
-d '{
      "org": {
        "ou": "ou"
      },
      "api": {
        "api_key": "my_api_key",
        "password": "my_password"
      }
    }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "#{server_url}/api/v1/sso_auth/auth_extend",
  :headers => {
    "Content-type" => "application/json",
	"Authorization" => "Bearer {jwt_token}"
  },
  :payload => {
    "org": {
      "ou": "ou"
    },
    "api": {
      "api_key": "my_api_key",
      "password": "my_password"
    }
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOjUyLCJ1c2VybmFtZSI6ImRlbW9wYXRpZW50MSIsInByaW1hcnlfYWN0aW5nX2FzX2FnZW50IjpmYWxzZSwiZGV2aWNlX29zIjoiQW5kcm9pZCIsImFwcF9pZCI6Ik1ETElWRSIsImFwcF92ZXJzaW9uIjoiMTA1MSIsImFwaV9jcmVkX2lkIjoxLCJleHAiOjE1MDgzNTM5MTF9.orRpY5qV6f7NVAmOIX9-ZB92U-omf_rVjLZ6IyVxfU0",
  "user": {
    "id": 52,
    "type": "Patient",
    "time_to_live_minutes": 60
  }
}
```

The time to live for a JWT token is set at issue time, and returned in the response from [initial User Token request](#user-tokens). If that time to live is insufficient, another token can be requested by passing in a still valid token for that user.

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

To obtain an Extended API JWT Token for a user, use

### HTTP Request

`POST {server_url}/api/v1/sso_auth/auth_extend`

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}


### Request Body

Attribute | Required | Description
--------- | ------- | -----------
org | true | parent attribute for calling organizational information
↳&nbsp;ou | true | Organizational unit identifier assigned by MDLIVE
api | true | parent attribute of api_key and password
↳&nbsp;api_key | true | Unique key assigned to you by your account manager
↳&nbsp;password | true | Unique password assigned to key by your account manager