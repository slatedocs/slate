## Getting a Provider's Profile

```shell
curl {server_url}/api/v2/providers/{id}/profile
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/providers/{id}/profile}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "provider_details": {
    "id": 4,
    "fullname": "Travis Stork",
    "gender": "Male",
    "city": "MIAMI BEACH",
    "state_abbrev": "FL",
    "phone": "3057997818",
    "photo_url": "/users/4/photo",
  },
  "availability_details": {
    "available_hours": [
      {
        "timeslot": "2018-01-10T15:00:00.000-05:00",
        "phys_availability_id": 6096481,
        "availability_type": [
          "video"
        ]
      },
      {
        "timeslot": "2018-01-10T15:30:00.000-05:00",
        "phys_availability_id": 6097008,
        "availability_type": [
          "phone"
        ]
      }
    ],
    "is_visit_now_available": false,
    "can_request_appointment": true,
    "appointment_date": "2018-01-15",
    "patient_appointment_types": [
      "video",
      "phone"
    ]
  }
}
```

After [searching for available providers for a patient](#searching-for-providers), the profile details for any provider
selected by the patient are available. The profile will include details about the provider as well as the provider's latest
scheduling availability information as it relates to the patient's preferred appointment.

This request must include a valid JWT token, please see our [documentation](#api-tokens)

### HTTP Request

`GET {server_url}/api/v2/providers/{id}/profile`

### Header Parameter

Parameter     | Default          | Description
---------     | -------          | -------
Content-type  | application/json | Expected content type, currently only JSON is supported
Authorization | Bearer {TOKEN}   | Auth Token, should be the string "Bearer {TOKEN}"

### URL Parameter
Attribute | Required | Description
--------- | ------- | -----------
provider_id | true| MDLIVE ID for provider

### Query String Parameters

Attribute     | Required  | Description
---------     |---------       | --------  | -----------
patient_id   | false      | MDLIVE ID for patient scheduling a visit, use to specify patient only if the token provided is an [API token](#api-tokens) instead of a [User token](#user-tokens)
availability_type| false   | Can be either 'phone' or 'video', use to specify the preferred type of appointment for the patient
provider_type  | false     | Provider Type ID, from the [provider types list](#provider-types) (or the endpoint response). Use to specify the preferred doctor type for an appointment.
specific_date  | false     | Date in YYYY-mm-dd format, use to specify a preferred date for an appointment. Default is today.
state_abbrev  | false     | Abbreviation of U.S. [state](#states), use to specify the preferred state for the appointment. Default is the patient's MDLIVE address.