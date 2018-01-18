## Health Conditions - List

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/health_conditions \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/health_conditions",
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
      "id": 9,
      "user_id": 52,
      "current_condition": null,
      "past_condition": null,
      "start_date": "2018-01-18",
      "stop_date": null,
      "condition": "Head Pain (Headache)",
      "ICD9": null,
      "active": true,
      "created_at": "2018-01-18T16:24:46.000-05:00",
      "updated_at": "2018-01-18T16:24:46.000-05:00",
      "origin": null,
      "notes": null,
      "status": null,
      "stop_reason": null,
      "cui": null,
      "session_guid": null,
      "deleted": "N",
      "source": "Self Reported",
      "updated_by": null,
      "evr_medical_condition_name_id": null,
      "ICD10": "R51",
      "snomed": "25064002",
      "concept_id": "128"
    },
    {
      "id": 8,
      "user_id": 52,
      "current_condition": "Y",
      "past_condition": null,
      "start_date": "2017-11-13",
      "stop_date": null,
      "condition": "Alcohol Dependence",
      "ICD9": null,
      "active": true,
      "created_at": "2017-11-13T15:47:40.000-05:00",
      "updated_at": "2017-11-13T15:47:40.000-05:00",
      "origin": null,
      "notes": null,
      "status": null,
      "stop_reason": null,
      "cui": null,
      "session_guid": null,
      "deleted": "N",
      "source": "Call Center",
      "updated_by": 27,
      "evr_medical_condition_name_id": null,
      "ICD10": "F10.20",
      "snomed": null,
      "concept_id": null
    },
    {
      "id": 1,
      "user_id": 52,
      "current_condition": null,
      "past_condition": null,
      "start_date": "2016-07-08",
      "stop_date": null,
      "condition": "High Blood Pressure",
      "ICD9": null,
      "active": true,
      "created_at": "2016-07-08T09:00:01.000-04:00",
      "updated_at": "2016-07-08T09:00:01.000-04:00",
      "origin": null,
      "notes": null,
      "status": null,
      "stop_reason": null,
      "cui": null,
      "session_guid": null,
      "deleted": "N",
      "source": "Self Reported",
      "updated_by": null,
      "evr_medical_condition_name_id": null,
      "ICD10": null,
      "snomed": null,
      "concept_id": null
    }
  ],
  "personal_info": {
    "id": 1,
    "user_id": 52,
    "access_code": "DTC 949D38 76",
    "blood_type": null,
    "organ_donor": null,
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
    "birth_weight": null,
    "is_pregnant": false,
    "is_breast_feeding": false,
    "systolic_bp": null,
    "diastolic_P": null,
    "head_circumference": null,
    "updated_by": 52,
    "menstrual_cycle": null,
    "alternate_visit_option": null,
    "do_you_have_primary_care_physician": null,
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
      "id": 7,
      "user_id": 52,
      "name": "Acetaminophen W\/Butalbital 650 mg-50 mg capsule",
      "dosage": "",
      "start_date": null,
      "ndc": null,
      "prescriber": null,
      "stop_date": null,
      "prescription_date": null,
      "form": null,
      "dose": null,
      "route": null,
      "frequency": "Once Hourly",
      "active": true,
      "created_at": "2018-01-18T16:22:41.000-05:00",
      "updated_at": "2018-01-18T16:22:41.000-05:00",
      "origin": null,
      "notes": null,
      "cui": null,
      "session_guid": null,
      "deleted": "N",
      "source": "Self Reported",
      "current_condition": null,
      "updated_by": null,
      "new_crop_medication_id": 436383,
      "prescription_id": null,
      "quantity": 1,
      "status": "Active",
      "dc_reason": null,
      "discontinued_date": null
    }
  ],
  "allergies": [
    {
      "id": 1,
      "user_id": 52,
      "evr_allergy_type_id": null,
      "name": "penicillin",
      "severity": "Mild",
      "start_date": null,
      "end_date": null,
      "active": null,
      "created_at": "2016-07-08T09:01:00.000-04:00",
      "updated_at": "2016-07-08T09:01:00.000-04:00",
      "origin": null,
      "notes": null,
      "reaction": "rashes",
      "treatment": null,
      "allergen_code": null,
      "is_treatment_successful": null,
      "cui": null,
      "session_guid": null,
      "first_observed": null,
      "deleted": "N",
      "source": "Self Reported",
      "current_condition": null,
      "updated_by": null,
      "is_newcrop_record": true,
      "new_crop_allergy_id": 19099,
      "free_text": null
    }
  ],
  "source_for_ccd": "DTC Physician Visit",
  "is_taking_medication?": "Yes",
  "has_allergies?": "Yes",
  "surgery_names": [
    {
      "id": 0,
      "name": "Ankle",
      "description": "Ankle",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Appendectomy",
      "description": "Appendectomy",
      "checked": ""
    },
    {
      "id": 0,
      "name": "CABG (Bypass surgery)",
      "description": "CABG (Bypass surgery)",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Colon resection",
      "description": "Colon resection",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Craniotomy",
      "description": "Craniotomy",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Ear Tubes",
      "description": "Ear Tubes",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Gall bladder",
      "description": "Gall bladder",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Head or neck",
      "description": "Head or neck",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Hip replacement",
      "description": "Hip replacement",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Knee",
      "description": "Knee",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Lung resection",
      "description": "Lung resection",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Pacemaker",
      "description": "Pacemaker",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Plastic Surgery",
      "description": "Plastic Surgery",
      "checked": ""
    },
    {
      "id": 0,
      "name": "Wrist",
      "description": "Wrist",
      "checked": ""
    }
  ],
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
  "skip_health_history": null
}
```

Returns an aggregate health conditions report for a given patient.

### HTTP Request

`GET {server}/api/v1/patients/{patient_id}/health_conditions`

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
