## Clinical Concepts - Search

```shell
curl -X GET {server_url}/api/v1/clinical_concepts
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{ "search": {
        "term": "throat",
        "limit": "3"
      }
    }'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/clinical_concepts",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => { "search"=> {
                  "term"=> "throat",
                  "limit"=> "3"
                }
              }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "clinical_concepts": [
    {
      "concept_id": 64,
      "concept_type": "Symptom",
      "title": "Throat Pain",
      "icd10": "R07.0",
      "snomed": "267102003"
    },
    {
      "concept_id": 3539,
      "concept_type": "Symptom",
      "title": "Throat Redness (or Red Spots)",
      "icd10": "J02.9",
      "snomed": "126662008"
    },
    {
      "concept_id": 3544,
      "concept_type": "Symptom",
      "title": "Throat Swelling (Swollen Tonsils)",
      "icd10": "R22.1",
      "snomed": "421581006"
    }
  ]
}
```
MDLIVE offers the ability to search against medical conditions to be used for offering auto-complete suggestions as a patient is creating a medical condition.
To search, make a request to:

### HTTP Request

`GET {server_url}/api/v1/clinical_concepts`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are accepted when searching medical conditions.

### Query String Parameters

 | Attribute | Required | Description
 -|--------- | ------- | -----------
 search | |true | parent attribute for search criteria
 | term | true | The term to match (string)
 | limit | false | Limit size of the result set, default size is 10