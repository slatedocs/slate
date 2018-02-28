## Allergies - Delete
```shell
curl -X DELETE {server_url}/api/v1/patients/{patient_id}/allergies/{allergy_id}
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
```
```ruby
RestClient::Request.new(
  :method => :delete,
  :url => "{server_url}/api/v1/patients/{patient_id}/allergies/{allergy_id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  }
).execute
```

To remove an allergy from a patient's list of allergies, make a request to:

### HTTP Request

`DELETE {server_url}/api/v1/patients/{patient_id}/allergies/{allergy_id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

The following parameters are required when removing an allergy.

### URL Parameter
Attribute  | Required | Description
-----------|---------|-------------
patient_id | true    | MDLIVE ID for patient
alergy_id  | true    | ID of patient's allergy


