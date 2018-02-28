## Customer Documents - Create

```shell
curl -v -X POST {server_url}/api/v2/patients/{patient_id}/documents \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{
    "doc": {
      "document_name": "INSERT_DOCUMENT_NAME_WITH_EXTENSION_HERE",
      "data": "INSERT_BASE64_ENCODED_DATA_HERE",
      "mime_type": "INSERT_MIME_TYPE_HERE",
      "record_type": "Patient Record"
    }
  }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => '{server_url}/api/v2/patients/{patient_id}/documents',
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type'  => 'application/json',
    'Accept'  => 'application/json',
  },
  :payload => {
    :doc => {
      :document_name => 'INSERT_DOCUMENT_NAME_WITH_EXTENSION_HERE',
      :data          => 'INSERT_BASE64_ENCODED_DATA_HERE',
      :mime_type     => 'INSERT_MIME_TYPE_HERE',
      :record_type   => 'Patient Record'
    }
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "doc":{
    "id":1,
    "mime_type":"image/png",
    "record_type":"Patient Record",
    "upload_date":"2018-01-16T20:51:06+00:00",
    "document_name":"DOGE.png",
    "upload_by":"test patient",
    "extension":"png"
  }
}
```

An example of a customer document is a photo of a symptom that a patient takes before an appointment. Please store the id that gets returned. You'll be able to use it when you create the appointment.

### HTTP Request

To create a customer document, make a request to:

`POST {server_url}/api/v2/patients/{patient_id}/documents`

### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Accept        | application/json
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute  | Required | Description
-----------|----------|----------------------
patient_id | true     | MDLIVE ID for patient

### Request Body Parameters

The following parameters need to be included in the body of the request:

Attribute            | Required | Description
---------------------|----------|--------------------
doc                  | true     | Parent attribute for customer documents
↳&nbsp;document_name | true     | Desired filename
↳&nbsp;data          | true     | Base64 encoded file data
↳&nbsp;mime_type     | true     | Mime type, e.g. image/png
↳&nbsp;record_type   | true     | One of the following values:<ul><li>Behavioral</li><li>Exam-Face2Face</li><li>Patient Record</li><li>Test Result</li><li>Wellness Panel Results</li></ul>
