## Allergies - List

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/allergies
-H "Content-type: application/json"
-H "Authorization: Bearer {jwt_token}"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/allergies",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer {jwt_token}"
  }
).execute
```

> The above command returns JSON structured like this:

```json
{

  "allergies": [
    {
      "id": 110750,
      "name": "Bee Pollens",
      "severity": "Mild",
      "active": true,
      "reaction": "bump",
      "source": "Call Center",
      "current": true
    },
    {
      "id": 110749,
      "name": "Mold spores",
      "severity": "Severe",
      "active": true,
      "reaction": "Rashes and Hot Flashes",
      "source": "Self Reported",
      "current": true
      }
   ]
}
```

To retrieve the list of a patient's current list of allergies, make a request to:

### HTTP Request

`GET {server_url}/api/v1/patients/{patient_id}/allergies`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer {jwt_token}

The following parameters are required to retrieve the list of patient's medical conditions.

### URL Parameter

Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient
