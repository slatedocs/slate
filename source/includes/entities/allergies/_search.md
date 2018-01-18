## Allergies - Search

```shell
curl -X POST {server_url}/api/v1/allergies/search
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{ "search": {
        "term": "pen",
        "limit": "2"
      }
    }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/allergies/search",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => { "search"=> {
                  "term"=> "pen",
                  "limit"=> "2"
                }
              }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "allergies": [
    {
      "id": 977,
      "name": "Penicillins"
    },
    {
      "id": 981,
      "name": "Pentamidine"
    }
  ]
}
```

MDLIVE offers the ability to search against allergies to be used for offering auto-complete suggestions as a patient is adding an allergy.
To search, make a request to:

### HTTP Request

`POST {server_url}/api/v1/allergies/search`

This request must include a valid JWT token, please see our [documentation](#api-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are accepted when searching medical conditions.

### Request Body Parameter

Attribute    | Required | Description
-------------|----------|-----------------
search       | true     | Parent attribute for search criteria
↳&nbsp;term  | true     | The term to match (string)
↳&nbsp;limit | false    | Limit size of the result set, default size is 10
