## Medical Conditions - List
```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/medical_conditions
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/medical_conditions",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "medical_conditions": [
    {
      "patient_id": 111,
      "medical_condition": {
        "id": 123,
        "condition":"Anemia - Aplastic",
        "source":"Self Reported",
        "concept_id": "526",
        "snomed": "306058006",
        "icd10": "D61.9",
        "date_reported": "2017-11-18T12:45:28.000-05:00",
        "last_updated_date": "2017-11-18T12:45:28.000-05:00",
        "active": true
      }
    },
    {
      "patient_id": 111,
      "medical_condition":{
        "id":12345,
        "condition":"Asthma",
        "source":"Dr Jane Doe",
        "concept_id": "3488",
        "snomed": "195967001",
        "icd10": "J45.909",
        "date_reported": "2017-11-13T15:47:40.000-05:00",
        "last_updated_date": "2017-11-13T15:47:40.000-05:00",
        "active": true
      }
    }
  ]
}
```
To retrieve the list of a patient's current list of medical conditions, make a request to:

### HTTP Request

`GET {server_url}/api/v1/patients/{patient_id}/medical_conditions`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

The following parameters are required to retrieve the list of patient's medical conditions.

### URL Parameter

Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient
