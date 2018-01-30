## Medications - Search

```shell
curl -X POST {server_url}/api/v2/medications/search \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-type: application/json' \
  -H 'Accept: application/json' \
  -d '{
    "search": {
      "term": "ibuprofen 50",
      "limit": 10
    }
  }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v2/medications/search",
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  },
  :payload => {
    search: {
      term: "ibuprofen 50",
      limit: 10
    }
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "medications": [
    {
      "id": 82465,
      "name": "ibuprofen",
      "description": "ibuprofen 50 mg chewable tablet",
      "med_id": 241699
    },
    {
      "id": 78829,
      "name": "ibuprofen",
      "description": "ibuprofen 50 mg/1.25 mL oral drops,suspension",
      "med_id": 237650
    }
  ]
}
```

Searches for medications starting with _term_. Results must not exceed _limit_.


### HTTP Request

`POST {server_url}/api/v2/medications/search`

This request must include a valid JWT token, please see our [documentation](#api-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}


### Request Body

The following parameters can be used to search for a medication.

Attribute   | Required | Description
----------- | -------- | -----------
search       | true     | Parent attribute for search criteria
↳&nbsp;term  | true     | The term to match (string)
↳&nbsp;limit | false    | Limit size of the result set, default size is 10
