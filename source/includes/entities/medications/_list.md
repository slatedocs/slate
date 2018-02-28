## Medications - List

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/medications \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-type: application/json' \
  -H 'Accept: application/json' \
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/medications",
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "medications": [
    {
      "id":2,
      "name": "penicillin",
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

`GET {server_url}/api/v1/patients/{patient_id}/medications`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}
