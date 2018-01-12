## Surgeries/Procedures - Create
```shell
curl -X POST {server_url}/api/v2/patients/{patient_id}/surgeries
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{
      "surgery": {
        "name": "Hip Replacement",
        "surgery_year": 2015
      }
    }'
```
```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v2/patients/{patient_id}/surgeries",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => {
                "surgery": {
                  "name": "Hip Replacement",
                  "surgery_year": 2015
                }
              }
).execute
```
> The above command returns JSON structured like this:

```json
{
  "surgery": {
    "id": 108,
    "name": "Hip Replacement",
    "surgery_year": 2015
  }
}
```

To create a surgery or procedure for a patient, make a request to:

### HTTP Request

`POST {server}/api/v2/patients/{patient_id}/surgeries`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are required when creating a surgery. To search for surgery name, reference [Surgeries/Procedures - Names List](#surgeries-procedures-names-list).

### URL Parameter
 | Attribute | Required | Description
 -|--------- | ------- | -----------
 | patient_id | true| MDLIVE ID for patient

### Request Body Parameters

 | Attribute | Required | Description
 -|--------- | ------- | -----------
 surgery | | true | parent attribute for surgery/procedure
 | name | true | Description of surgery/procedure from [surgery names list](#surgeries-procedures-names-list)
 | surgery_year | true | Four digit year when the surgery/procedure took place