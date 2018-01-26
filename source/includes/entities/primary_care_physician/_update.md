## Primary Care Physician - Update a Primary Care Physician

```shell
curl -X POST {server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician/{id}
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
  -d '{
       "pcp": {
         "first_name": "PCP",
         "last_name": "Physician",
         "middle_name": "",
         "practice": "PCP Practice",
         "email": "doctor@example.com",
         "address1": "555 Move Street",
         "address2": "",
         "city": "FORT LAUDERDALE",
         "state_abbrev": "FL",
         "country_code": "US",
         "zip": "33301",
         "phone": "(954) 555-5555",
         "cell": "(954) 555-5555",
         "fax": "(954) 552-1234"
       }
     }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician/{id}",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  },
  :payload => {
     pcp: {
       first_name: "PCP",
       last_name: "Physician",
       middle_name: "",
       practice: "PCP Practice",
       email: "doctor@example.com",
       address1: "555 Move St",
       address2: "",
       city: "FORT LAUDERDALE",
       state_abbrev: "FL",
       country_code: "US",
       zip: "33301",
       phone: "(954) 555-1111",
       cell: "(954) 555-1111",
       fax: "(954) 552-1234"
     }
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "pcp": {
    "id": 2
    "full_name": "PCP Physician",
    "first_name": "PCP",
    "last_name": "Physician",
    "middle_name": "",
    "practice": "PCP Practice",
    "email": "doctor@example.com",
    "address1": "555 Move Street",
    "address2": "",
    "city": "FORT LAUDERDALE",
    "state_abbrev": "FL",
    "country_code": "US",
    "zip": "33301",
    "phone": "(954) 555-5555",
    "cell": "(954) 555-5555",
    "fax": "(954) 552-1234",
  }
}
```

A patient can update their primary care physician's (PCP) contact information.

### HTTP Request

`PUT {server}/api/v1/patients/{patient_id}/evr_primary_care_physician/{id}`

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
patient_id | true | MDLIVE ID for patient
id         | true | The ID of the PCP to update

### Request Body Parameters

Parameter            |Type    | Required | Description
-------------------- |--------| -------- | -----------
pcp                  | object |true      | Object containing information about the PCP
↳&nbsp; first_name   | string |false     | PCP first name
↳&nbsp; last_name    | string |false     | PCP last name
↳&nbsp; middle_name  | string |false     | PCP middle name
↳&nbsp; practice     | string |false     | Name of the PCP practice
↳&nbsp; email        | string |false     | PCP work email
↳&nbsp; address1     | string |false     | PCP office address 1
↳&nbsp; address2     | string |false     | PCP office address 2
↳&nbsp; city         | string |false     | PCP office city
↳&nbsp; state_abbrev | string |false     | PCP office state abbreviation
↳&nbsp; country_code | string |false     | PCP office two letter country code
↳&nbsp; zip          | string |false     | PCP office zipcode
↳&nbsp; phone        | string |false     | PCP office number
↳&nbsp; cell         | string |false     | PCP cell number
↳&nbsp; fax          | string |false     | PCP office fax number
