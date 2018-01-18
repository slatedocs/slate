## Customer Documents - Delete

```shell
curl -v -X DELETE https://INSERT_SERVER_HOSTNAME_HERE/api/v1/patients/INSERT_PATIENT_ID_HERE/documents/INSERT_DOCUMENT_ID_HERE \
  -H 'Authorization: Bearer INSERT_JWT_TOKEN_HERE' \
  -H 'Content-Type: application/json'
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => 'https://INSERT_SERVER_HOSTNAME_HERE/api/v1/patients/INSERT_PATIENT_ID_HERE/documents/INSERT_DOCUMENT_ID_HERE',
  :headers => {
    'Authorization' => 'Bearer INSERT_JWT_TOKEN_HERE',
    'Content-type' => 'application/json'
  }
).execute
```

### HTTP Request

To remove a customer document, make a request to:

`DELETE https://INSERT_SERVER_HOSTNAME_HERE/api/v1/patients/INSERT_PATIENT_ID_HERE/documents/INSERT_DOCUMENT_ID_HERE`

### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer INSERT_JWT_TOKEN_HERE
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute   | Required | Description
------------|----------|----------------------
patient id  | true     | MDLIVE ID for patient
document id | true     | MDLIVE ID for patient
