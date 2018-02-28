## Primary Care Physician - Delete a Primary Care Physician

```shell
curl -X DELETE {server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician/{id}
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => "{server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician/{id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  }
).execute
```

> The above command will return a `204` status code with no content in the body.

This endpoint deletes the primary care physician associated with a patient.

### HTTP Request

`DELETE {server}/api/v2/patients/{patient_id}/evr_primary_care_physician/{id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Accept       | application/json
Authorization| Bearer {jwttoken}


### URL Parameter
Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient
id         | true | The ID of the PCP to delete
