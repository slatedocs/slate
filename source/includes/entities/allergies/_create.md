## Allergies - Create
```shell
curl -X POST {server_url}/api/v2/patients/{patient_id}/allergies
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
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
    "Authorization" => "Bearer 34a2sample-api-token"
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
Authorization| Bearer example.jwttoken

The following parameters are required when creating an allergy. To search for the allergy and retrieve needed parameter values, reference [allergies - search](#allergies-search).

### URL Parameter
 | Attribute | Required | Description
 -|--------- | ------- | -----------
 | patient_id | true| MDLIVE ID for patient

### Request Body Parameters

 | Attribute | Required | Description
 -|--------- | ------- | -----------
 allergy | | true | parent attribute for allergy
 | name | true | Description of allergy retrieved from search
 | severity | false | Description of severity. Should be one of: 'Not Sure', 'Mild', 'Moderate', or 'Severe'
