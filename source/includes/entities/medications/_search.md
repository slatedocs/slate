## Medications - Search

```shell
curl -X POST {server_url}/api/v1/medications/search
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{ "search_str": "ibuprofen 50", "max_results": 10 }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/medications/search",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => {
    search_str: "ibuprofen 50",
    max_results: 10
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "medications": [
    {
      "id": 82465,
      "description": "ibuprofen 50 mg chewable tablet"
    },
    {
      "id": 78829,
      "description": "ibuprofen 50 mg/1.25 mL oral drops,suspension"
    }
  ]
}
```

Searches for medications starting with _search_str_. Results must not exceed _max_results_.


### HTTP Request

`POST {server_url}/api/v1/medications/search`

This request must include a valid JWT token, please see our [documentation](#api-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer example.jwttoken


### Request Body

The following parameters can be used to search for a medication.

Attribute   | Required | Description
----------- | -------- | -----------
search_str  | true     | The description to match (string)
max_results | false    | Integer to specify the max number of results to be returned


### Response codes

HTTP Status Code | Reason
---------------- | ------
200              | Successful operation
401              | Not authorized or invalid token data
422              | Empty _search_str_ or number of results > _max_results_
