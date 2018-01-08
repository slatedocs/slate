## Medications - Delete

```shell
curl -X DELETE {server_url}/api/v1/patients/{id}/medications/{medication_id}
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => "{server_url}/api/v1/patients/{id}/medications/{medication_id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  }
).execute
```

To remove a medication from a patient's list of medications, make a request to:

### HTTP Request

`DELETE {server_url}/api/v1/patients/{id}/medications/{medication_id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer example.jwttoken


### Response codes

HTTP Status Code | Reason
---------------- | ------
204              | Successful operation
401              | Not authorized or invalid token data
422              | Patient or medication not found
