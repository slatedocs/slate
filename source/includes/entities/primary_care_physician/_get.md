## Primary Care Physician - Retrieve a Primary Care Physician

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician",
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
  "pcp": {
    "id": 1
    "full_name": "PCP Physician",
    "first_name": "PCP",
    "last_name": "Physician",
    "middle_name": "",
    "practice": "Doc Medical Practice",
    "email": "doctor@example.com",
    "address1": "123 Main St",
    "address2": "",
    "city": "FORT LAUDERDALE",
    "state_abbrev": "FL",
    "country_code": "US",
    "zip": "33301",
    "phone": "(954) 555-1111",
    "cell": "(954) 555-1111",
    "fax": "(954) 552-1234",
  }
}
```

> When a patient does not have a primary care physician, the above command will return the following JSON:

```json
{ "pcp" : null }
```

MDLIVE allows patients to add their primary care physician.  This endpoint retrives information for a patient's primary care physician.

### HTTP Request

`GET {server}/api/v1/patients/{patient_id}/evr_primary_care_physician`

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
