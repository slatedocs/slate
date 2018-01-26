## Primary Care Physician Questions - Retrieve Questions

```shell
curl -X GET {server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "pcp_questions": [
    {
      "name": "primary_care_physician",
      "question": "Do you have a Primary Care Physician?",
      "value": false
    },
    {
      "name": "pcp_correct_information",
      "question": "Is your Primary Care Physician information correct?",
      "value": true
    },
    {
      "name": "pcp_visit_information",
      "question": "Would you like the visit information to be sent to your PCP?",
      "value": false
    }
  ]
}
```

While scheduling an appointment, you can capture information about a patient's primary care physician (PCP).  MDLIVE will send information to the patient's PCP if the patient confirms their PCP's contact information and opts to have their information sent.

To retrieve a list of PCP related questions, make a request to:

### HTTP Request

`GET {server}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions `

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter    | Default
------------ | -------
Content-type | application/json
Accept       | application/json
Authorization| Bearer {jwttoken}

### URL Parameter
Parameter  | Required | Description
---------- | -------  | -----------
patient_id | true     | MDLIVE ID for patient
