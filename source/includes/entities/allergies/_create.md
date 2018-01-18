## Allergies - Create
```shell
curl -X POST {server_url}/api/v2/patients/{patient_id}/allergies
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
-d '{
      "allergy": {
        "name": "Mold",
        "severity": "Severe",
        "reaction": "Rashes and Hot Flashes"
      }
    }'
```
```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v2/patients/{patient_id}/allergies",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  },
  :payload => {
                 "allergy"=> {
                   "name"=> "Mold",
                   "severity"=> "Severe",
                   "reaction"=> "Rashes and Hot Flashes"
                 }
               }
).execute
```
> The above command returns JSON structured like this:

```json
{
  "allergy": {
    "id": 110751,
    "name": "Mold",
    "severity": "Severe",
    "active": true,
    "reaction": "Rashes and Hot Flashes",
    "source": "Self Reported",
    "current": null
  }
}
```

To create an allergy for a patient, make a request to:

### HTTP Request

`POST {server}/api/v2/patients/{patient_id}/allergies`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

The following parameters are required when creating an allergy. To search for the allergy and retrieve needed parameter values, reference [allergies - search](#allergies-search).

### URL Parameter
 | Attribute | Required | Description
 -|--------- | ------- | -----------
 | patient_id | true| MDLIVE ID for patient

### Request Body Parameters

Attribute         | Required | Description
------------------|----------|---------------
allergy           | true     | Parent attribute for allergy
↳&nbsp;name       | true     | Description of allergy retrieved from search
↳&nbsp;severity   | false    | Description of severity. Should be one of: <ul><li>Not Sure</li><li>Mild</li><li>Moderate</li><li>Severe</li></ul>
