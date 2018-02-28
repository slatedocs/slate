## Medications - Delete

```shell
curl -X DELETE {server_url}/api/v1/patients/{patient_id}/medications/{medication_id} \
  -H "Content-type: application/json" \
  -H "Authorization: Bearer {jwt_token}"
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => "{server_url}/api/v1/patients/{patient_id}/medications/{medication_id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  }
).execute
```

To remove a medication from a patient's list of medications, make a request to:

### HTTP Request

`DELETE {server_url}/api/v1/patients/{patient_id}/medications/{medication_id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}
