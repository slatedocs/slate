## Patients - Retrieve a patient

```shell
curl {server_url}/api/v2/patients/{patient_id}
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/patients/{patient_id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "patient_profile": {
    "id": 42,
    "fullname": "John Doe",
    "email": "johndoe@md.com",
    "gender": "Male",
    "age": 32,
    "birthdate": "1985-09-15",
    "affiliation_id": 96,
    "security_id": null,
    "primary_care_physician": null,
    "unpaid_balance": 0,
    "user_status_id": 1,
    "username": "johndoe",
    "first_name": "John",
    "last_name": "Doe",
    "address1": "1 ST NW 1",
    "address2": null,
    "city": "Sunrise",
    "state_id": 10,
    "zip": "33324",
    "phone": "7866665555",
    "cell": null,
    "emergency_contact_number": null,
    "us_time_zone_id": 1,
    "language_id": null,
    "registered_date": null,
    "eligible_members": [
    ],
    "parent_id": null,
    "magellan": false,
    "plan_id": 158,
    "therapy_enabled": false,
    "email_confirmed": true,
    "can_add_family_members": true,
    "assist_phone_number": "1-800-400-MDLIVE",
    "parent_authorized": false,
    "is_primary": true,
    "provider_types": [
      [
        3,
        "Family Physician"
      ],
      [
        5,
        "Therapist"
      ],
      [
        6,
        "Psychiatrist"
      ],
      [
        12,
        "Dermatologist"
      ]
    ],
    "unread_message_count": 0,
    "primary_name": null,
    "customer_insurance_parent_detail": null,
    "chat_history_count": 0,
    "user_status": {
      "id": 1,
      "name": "Active",
      "updated_at": "2017-12-15 08:27:33 -0500",
      "created_at": "2017-12-15 08:27:33 -0500"
    },
    "user_vip_flag": null,
    "customer_insurance_detail": null,
    "customer_detail": null,
    "customer_benefit_overuse": null,
    "affiliation": {
      "description": "DTC",
      "id": 96,
      "video_only": false,
      "is_ccp": false,
      "epic_enabled": false,
      "affiliated_doctors_only": false,
      "disallow_membership_card": true,
      "activation_date": null,
      "deactivated_date": null,
      "dependent_registration_disabled": [
      ],
      "affiliated_providers_only_for_agents": false,
      "verify_eligibility": false,
      "name": "DTC",
      "pharmacy_disabled": false,
      "allow_add_family_members": true,
      "request_appointment_enabled": true,
      "phone_only": false,
      "breakthrough_enabled": false,
      "insurance_payer": null
    },
    "state": {
      "name": "FLORIDA",
      "id": 10
    },
    "pharmacy": {
      "id": 1,
      "name": "CVS/pharmacy #7900",
      "city": "SUNRISE",
      "address1": "10000 W COMMERCIAL BLVD",
      "address2": "",
      "state": "FL",
      "zipcode": "33351",
      "phone": "9547486377",
      "fax": "9547486435",
      "latitude": 26.1935,
      "longitude": -80.2846,
      "twenty_four_hour_flag": false
    },
    "recent_notes": [
    ],
    "family_members": [
      {
        "id": 3,
        "fullname": "John Doe",
        "email": "johndoe@md.com",
        "gender": "Male",
        "age": 32,
        "birthdate": "1987-09-15",
        "user_status_id": 1,
        "parent_id": null,
        "username": "johndoe",
        "first_name": "John",
        "last_name": "Doe",
        "address1": "1 ST NW 1",
        "address2": null,
        "city": "Sunrise",
        "state_id": 10,
        "zip": "33324",
        "phone": "7866665555",
        "cell": null,
        "emergency_contact_number": null,
        "us_time_zone_id": 1,
        "language_id": null,
        "is_authorized": false,
        "is_active": true,
        "email_confirmed": true,
        "image_url": ""
      }
    ],
    "recent_activity_histories": [
    ],
    "chat_histories": [
    ],
    "upcoming_appointments": [
    ]
  }
}
```

Retrieve the details of an existing patient. You need only supply the unique
patient identifier that was returned upon patient registration.

### HTTP Request

`GET {server_url}/api/v2/patients/{patient_id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

### Request Body

The following parameters are required to retrieve a patient.

Attribute  | Required | Description
-----------|----------|------------
patient_id | true     | ID of the patient to be retrieved
