## Medical Conditions - Delete

```shell
curl -X DELETE {server_url}/api/v1/patients/{patient_id}/medical_conditions/{id}
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
```
```ruby
RestClient::Request.new(
  :method => :delete,
  :url => "{server_url}/api/v1/patients/{patient_id}/medical_conditions/{id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  }
).execute
```

To remove a medical condition for a patient, make a request to:

### HTTP Request

`DELETE {server}/api/v1/patients/{patient_id}/medical_conditions/{id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are required when removing a medical condition.

### URL Parameter
 | Attribute | Required | Description
 -|--------- | ------- | -----------
 | patient_id | true| MDLIVE ID for patient
 | id | true | ID of patient's medical condition


