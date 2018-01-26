## Primary Care Physician Questions - Update Responses to PCP Questions

```shell
curl -X PUT {server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
  -d '{
        "pcp_questions": [
          {
            "name": "primary_care_physician",
            "value": true
          }
        ]
     }'
```

```ruby
RestClient::Request.new(
  :method => :put,
  :url => "{server_url}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  },
  :payload => {
    pcp_questions: {
      name: "primary_care_physician",
      value: true
    }
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
        "value": true
    },
    {
      "name": "pcp_correct_information",
      "question": "Is your Primary Care Physician information correct?",
      "value": false
    },
    {
      "name": "pcp_visit_information",
      "question": "Would you like the visit information to be sent to your PCP?",
      "value": false
    }
  ]
}
```

To update a patient's responses to primary care physician (PCP) related questions, make a request to:

### HTTP Request

`PUT {server}/api/v2/patients/{patient_id}/evr_primary_care_physician_questions `

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

### Request Body Parameters

Parameter      |Type              | Required | Description
-------------- |----------------- | -------- | -----------
pcp_questions  | array of objects | true     | Parent attribute for array of pcp questions
↳&nbsp;name    | string           | true     | Name for [PCP question](#primary-care-physician-questions-retrieve-questions)
↳&nbsp;value   | boolean          | true     | True or False answer to the Primary Care Physician question

