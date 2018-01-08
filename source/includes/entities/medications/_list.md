## Medications - List

```shell
curl -X GET {server_url}/api/v1/patients/{id}/medications
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{id}/medications",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "medications": [
    {
      "id":2,
      "name": "pencillan",
      "dosage": "1",
      "frequency": "Once Daily",
      "quantity":1,
      "source": "Call Center",
      "current":false
    }
  ]
}
```

To retrieve the list of patient's current active medications, make a request to:


### HTTP Request

`GET {server_url}/api/v1/patients/{id}/medications`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer example.jwttoken


### Response codes

HTTP Status Code | Reason
---------------- | ------
200              | Successful operation
422              | Not authorized or invalid token data
