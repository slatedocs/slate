## Surgeries/Procedures - Patient's List
```shell
curl -X GET {server_url}/api/v2/patients/{patient_id}/surgeries
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/patients/{patient_id}/surgeries",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "surgeries": [
    {
      "id": 7,
      "name": "Ankle",
      "surgery_year": 1985
    },
    {
      "id": 11,
      "name": "Appendectomy",
      "surgery_year": 1990
    }
  ]
}
```
To retrieve the list of a patient's current list of surgeries and procedures, make a request to:

### HTTP Request

`GET {server_url}/api/v2/patients/{patient_id}/surgeries`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

The following parameters are required to retrieve the list of patient's surgeries and procedures.

### URL Parameter

Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient
