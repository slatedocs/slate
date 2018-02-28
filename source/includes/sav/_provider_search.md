## Searching for Providers

```shell
curl -X POST {server_url}/api/v2/patients/{patient_id}/providers/search
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-user-token"
  -H "Accept: application/json"
  -d '{ "search": {
           "state_abbrev": "FL",
         }
      }'
```

```ruby
RestClient::Request.new(
  method: :post,
  url: "#{server_url}/api/v2/patients/#{patient_id}/providers/search",
  headers: {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
    "Accept" => "application/json"
  },
  payload: {
    search: {state_abbrev: "FL"}
  }
).execute
```
> The above command returns JSON structured like this:

```json

{
  "providers": [
    {
      "id": 542127369,
      "fullname": "Dr. Keylime Pie",
      "gender": "Female",
      "photo_url": null,
      "specialty": "General Practice",
      "group_name": null,
      "is_visit_now_available": false,
      "status": "Available",
      "next_appt_available_date": "2017-11-09T13:45:00-05:00",
      "availability_type": null
    },
    {
      "id": 542114314,
      "fullname": "Dr. Test Amalie",
      "gender": "Male",
      "photo_url": null,
      "specialty": "General Practice",
      "group_name": null,
      "is_visit_now_available": false,
      "status": "Available",
      "next_appt_available_date": "2017-11-09T13:45:00-05:00",
      "availability_type": null
    },
    {
      "id": 542117784,
      "fullname": "Dr. Andy Available",
      "gender": "Male",
      "photo_url": null,
      "specialty": "General Practice",
      "group_name": null,
      "is_visit_now_available": false,
      "status": "Available",
      "next_appt_available_date": "2017-11-09T13:45:00-05:00",
      "availability_type": null
    }
  ],
  "refine_search_options": {
    "default_provider_types": [
      {
        "id": 3,
        "name": "Family Physician",
        "had_consult_24_hr": false
      },
      {
        "id": 5,
        "name": "Therapist",
        "had_consult_24_hr": false
      },
      {
        "id": 6,
        "name": "Psychiatrist",
        "had_consult_24_hr": false
      },
      {
        "id": 12,
        "name": "Dermatologist",
        "had_consult_24_hr": false
      }
    ],
    "availability_type": [
      "phone",
      "video"
    ]
  }
}

```

For medical appointments, you can schedule a visit with an available provider or see the first available doctor.  To view a paginated list of available providers for a patient, make a request to:

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### HTTP Request

`POST {server_url}/api/v1/patients/{patient_id}/providers/search`

### Header Parameter

Parameter     | Default
---------     | -------
Content-type  | application/json
Accept        | application/json
Authorization | Bearer {jwttoken}

### URL Parameter

Attribute | Required | Description
--------- | ------- | -----------
patient_id | true   | MDLIVE ID for patient
per        | false  | # of providers per page
page       | false  | Page #

<aside class="notice">
  When the <code>page</code> and <code>per</code> parameters are not specified, the api defaults to the first 20 results.
</aside>

### Request Body Parameters

Attribute                | Type             | Required  | Description
-------------------------| -----------------| --------  | -----------
search_params            | object           | true      | Object with specific search filters
↳&nbsp; state_abbrev     | string           | true      | 2 Letter state abbreviated, from the states list
↳&nbsp; availability_type| array of strings | false     | Can be either `['phone']`, `['video']`, or `['phone', 'video']`. Use to specify the preferred type of appointment for the patient
↳&nbsp; gender           | string           | false     | Preferred provider gender (`Male` or `Female`)
↳&nbsp; provider_type_id | integer          | false     | Provider Type ID, from the provider types list (or the endpoint response)
↳&nbsp; specific_date    | string           | false     | Date in YYYY-mm-dd format

<aside class="success">
  <code>is_visit_now_available</code> in provider search response is true when the provider is available for an immediate consultation
</aside>