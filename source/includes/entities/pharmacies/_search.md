## Pharmacies - Search

```shell
curl -X POST {server_url}/api/v1/patients/{patient_id}/pharmacies/search
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
-d '{ "city": "Sunrise", "state": "FL", "zipcode":"33351", "page": 1, "per_page": 10, "radius": 10, "name": "CVS/pharmacy #7900", "twenty_four_hour_pharmacy": false, "coordinates": { "latitude": "26.19", "longitude": "-80.12" }}'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{patient_id}/pharmacies/search",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  },
  :payload => {
    city: "Sunrise",
    state: "FL",
    zipcode: "33351",
    page: 1,
    per_page: 10,
    radius: 10,
    name: "CVS/pharmacy #7900",
    twenty_four_hour_pharmacy: false,
    coordinates: { latitude: "26.19", longitude: "-80.12" }
  }
).execute
```

> The command above returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "CVS\/pharmacy #7900",
    "address1": "10000 W COMMERCIAL BLVD",
    "address2": "",
    "city": "SUNRISE",
    "state": "FL",
    "zipcode": "33351",
    "phone": "9547486377",
    "fax": "9547486435",
    "latitude": 26.1935,
    "longitude": -80.2846,
    "twenty_four_hour_flag": false
  }
]
```

Searches for pharmacies nearby to the given patient.


### HTTP Request

`POST {server_url}/api/v1/patients/{patient_id}/pharmacies/search`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}


### Request Body

The following parameters can be used to search for a pharmacy.

Attribute   |                           |Required | Description
----------- | ------------------------- |-------- | -----------
            | id                        | true    | ID of the patient
            | city                      | false   | Name of the city
            | state                     | false   | Two letter abbreviation of the state, see [list](#states)
            | zipcode                   | false   | ZIP code
            | page                      | false   | Index of the page with the results, defaults to 1
            | per_page                  | false   | Results per page, defaults to 10
            | radius                    | false   | Radius of search, defaults to 30
            | name                      | false   | Name of the pharmacy
            | twenty_four_hour_pharmacy | false   | Permitted values are true, false
coordinates |                           | false   | Hash with latitude and longitude
            | latitude                  | true    | Latitude as string
            | longitude                 | true    | Longitude as string
