## Health Conditions - List

```shell
curl -X GET {server_url}/api/v2/patients/{patient_id}/health_conditions \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/patients/{patient_id}/health_conditions",
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "health_conditions": [
    {
      "patient_id": 52,
      "medical_condition": {
        "id": 19,
        "condition": "Headaches",
        "source": "Self Reported",
        "concept_id": "128",
        "snomed": "25064002",
        "icd10": "R51",
        "date_reported": "2017-01-26T09:45:28.000-05:00",
        "last_updated_date": "2017-01-26T09:45:28.000-05:00",
        "active": true
      }
    },
    {
      "patient_id": 52,
      "medical_condition": {
        "id": 28,
        "condition": "Alcohol Dependence",
        "source": "Call Center",
        "concept_id": null,
        "snomed": null,
        "icd10": "F10.20",
        "date_reported": "2017-11-13T15:47:40.000-05:00",
        "last_updated_date": "2017-11-13T15:47:40.000-05:00",
        "active": true
      }
    }
  ],
  "personal_info": {
    "id": 1,
    "user_id": 52,
    "access_code": "DTC 949D38 76",
    "blood_type": "A+",
    "organ_donor": false,
    "photo_file_name": "Screen_Shot_2016-06-28_at_5.07.36_PM.png",
    "photo_content_type": "image\/png",
    "photo_file_size": 270649,
    "height_feet": 6,
    "height_inches": 11,
    "weight": 195,
    "updated_at": "2018-01-18T16:23:44.000-05:00",
    "created_at": "2016-07-06T16:36:04.000-04:00",
    "status": null,
    "birth_height": null,
    "birth_weight": 12.1,
    "is_pregnant": false,
    "is_breast_feeding": false,
    "systolic_bp": null,
    "diastolic_bp": null,
    "head_circumference": null,
    "updated_by": 52,
    "menstrual_cycle": "two weeks",
    "alternate_visit_option": "Seen my provider in person",
    "do_you_have_primary_care_physician": false,
    "photo": {
      "url": "\/system\/photos\/1\/original\/Screen_Shot_2016-06-28_at_5.07.36_PM.png",
      "medium": {
        "url": "\/system\/photos\/1\/medium\/Screen_Shot_2016-06-28_at_5.07.36_PM.png"
      },
      "small": {
        "url": "\/system\/photos\/1\/small\/Screen_Shot_2016-06-28_at_5.07.36_PM.png"
      },
      "thumb": {
        "url": "\/system\/photos\/1\/thumb\/Screen_Shot_2016-06-28_at_5.07.36_PM.png"
      }
    }
  },
  "evr_medications": [
    {
      "id": 2,
      "name": "Vitamin C",
      "dosage": "",
      "frequency": "Once Daily",
      "quantity": 1,
      "source": "Self Reported",
      "current": false
    },
    {
      "id": 1,
      "name": "Aspirin",
      "dosage": "",
      "frequency": "Once Daily",
      "quantity": 1,
      "source": "Self Reported",
      "current": false
    }
  ],
  "allergies": [
    {
      "id": 1,
      "name": "penicillin",
      "severity": "Mild",
      "active": null,
      "reaction": "rashes",
      "source": "Self Reported",
      "current": null
    }
  ],
  "source_for_ccd": "DTC Physician Visit",
  "is_taking_medication?": "Yes",
  "has_allergies?": "Yes",
  "external_reported_surgeries": [
  ],
  "surgeries_taken": [
    {
      "id": 1,
      "name": "Appendectomy",
      "year": "2013"
    }
  ],
  "had_surgeries?": "Yes",
  "has_medical_conditions?": "Yes",
  "pediatric_profile": {
  },
  "pediatric_profile_completed?": true,
  "skip_health_history": false
}
```

Returns an aggregate health conditions report for a given patient.

### HTTP Request

`GET {server_url}/api/v2/patients/{patient_id}/health_conditions`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)


### Header Parameters

Parameter     | Default
------------- | -------
Authorization | Bearer {jwt_token}
Content-type  | application/json
Accept        | application/json


### URL Parameters

Parameter  | Required | Description
---------- | -------- | -----------
patient_id | true     | MDLIVE ID for patient
