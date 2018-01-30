## Medications - Create

```shell
curl -X POST {server_url}/api/v2/patients/{patient_id}/medications \
  -H "Content-type: application/json" \
  -H "Authorization: Bearer {jwt_token}" \
  -H 'Accept: application/json' \
  -d '{
    "medication": {
      "name": "Hydrocortisone Ace (Topical)",
      "current": true,
      "dosage": "Aerosol",
      "frequency": "twice daily"
    }
  }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v2/patients/{patient_id}/medications",
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept'  => 'application/json'
  },
  :payload => {
    medication: {
      name: "Hydrocortisone Ace (Topical)",
      current: true,
      dosage: "Aerosol",
      frequency: "twice daily"
    }
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "medication": {
    "id": 29,
    "name": "Hydrocortisone Ace (Topical)",
    "dosage": "Aerosol",
    "frequency": "twice daily",
    "quantity": 1,
    "source": "Self Reported",
    "current": true
  }
}
```

To add a medication to a patient, make a request to:


### HTTP Request

`POST {server_url}/api/v1/patients/{patient_id}/medications`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are required when creating a medication. To search for the medication and retrieve needed parameter values, reference [medications - search](#medications-search).


### URL Parameters

Attribute   | Required | Description
------------|----------|----------------------
patient_id  | true     | MDLIVE ID for patient


### Request Body

Attribute        | Required | Description
---------------- | -------- | -----------
medication       | true     | Parent attribute for medication
↳&nbsp;name      | true     | Name of the medication (string)
↳&nbsp;current   | false    | Permitted values are true, false
↳&nbsp;dosage    | false    | Dosage of the medication (string)
↳&nbsp;frequency | false    | Frequency of the medication (string)
↳&nbsp;med_id    | false    | Unique ID of the medication
