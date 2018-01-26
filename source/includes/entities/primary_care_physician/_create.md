## Primary Care Physician - Create a Primary Care Physician

```shell
curl -X POST {server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
  -d '{
       "pcp": {
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
         "fax": "(954) 552-1234"
       }
     }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{patient_id}/evr_primary_care_physician",
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
       practice: "Doc Medical Practice",
       email: "doctor@example.com",
       address1: "123 Main St",
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
    "id": 3
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

To create a primary care physician (PCP) for a patient, make a request to:


### HTTP Request

`POST {server}/api/v1/patients/{patient_id}/evr_primary_care_physician`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Accept       | application/json
Authorization| Bearer {jwttoken}

### URL Parameter
Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient

### Request Body Parameters

Parameter            |Type    | Required | Description
---------------------|--------| -------- | -----------
pcp                  | object |true      | Object containing contact information about the PCP
↳&nbsp; first_name   | string |true      | PCP first name
↳&nbsp; last_name    | string |true      | PCP last name
↳&nbsp; middle_name  | string |false     | PCP middle name
↳&nbsp; practice     | string |true      | Name of the PCP practice
↳&nbsp; email        | string |false     | PCP work email
↳&nbsp; address1     | string |false     | PCP office address 1
↳&nbsp; address2     | string |false     | PCP office address 2
↳&nbsp; city         | string |true      | PCP office city
↳&nbsp; state_abbrev | string |true      | PCP office state abbreviation
↳&nbsp; country_code | string |true      | PCP office two letter country code
↳&nbsp; zip          | string |false     | PCP office zipcode
↳&nbsp; phone        | string |true      | PCP office number
↳&nbsp; cell         | string |false     | PCP cell number
↳&nbsp; fax          | string |true      | PCP office fax number
