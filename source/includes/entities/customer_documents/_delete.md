## Customer Documents - Delete

```shell
curl -v -X DELETE {server_url}/api/v1/patients/{patient_id}/documents/{document_id} \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json'
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => '{server_url}/api/v1/patients/{patient_id}/documents/{document_id}',
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json'
  }
).execute
```

### HTTP Request

To remove a customer document, make a request to:

`DELETE {server_url}/api/v1/patients/{patient_id}/documents/{document_id}`

### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute   | Required | Description
------------|----------|----------------------
patient_id  | true     | MDLIVE ID for patient
document_id | true     | MDLIVE ID for patient
