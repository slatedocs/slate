## Chief Complaints

```shell
curl -X GET {server_url}/api/v1/patients/chief_complaints
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{ "search": {
        "term": "throat",
        "language": "EN",
        "limit": "3"
      }
    }'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/chief_complaints",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => { "search"=> {
                    "term"=> "throat",
                    "language"=> "EN",
                    "limit"=> "3"
                 }
              }
).execute
```

> The above command returns JSON structured like this:

```json
[
  {
    "concept_id": 64,
    "alternate_term": "Throat Hurts",
    "title": "Throat Pain (Sore Throat)",
    "icd9": "784.1",
    "icd10": "R07.0",
    "snomed": "267102003",
    "request_image": null,
    "image_required": false
  },
  {
    "concept_id": 3539,
    "alternate_term": "Throat is Red",
    "title": "Throat Redness (or Red Spots)",
    "icd9": "462",
    "icd10": "J02.9",
    "snomed": "126662008",
    "request_image": null,
    "image_required": false
  },
  {
    "concept_id": 3544,
    "alternate_term": "Throat is Swollen",
    "title": "Throat Swelling or Lump",
    "icd9": "784.2",
    "icd10": "R22.1",
    "snomed": "421581006",
    "request_image": null,
    "image_required": false
  }
]
```
MDLIVE offers the ability to search against a list chief complaints to be used for offering auto-complete suggestions as a patient is scheduling a visit.

### HTTP Request

`GET {server_url}/api/v1/patients/chief_complaints`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken

The following parameters are accepted when searching chief complaints.

### Request Body

 | Attribute | Required | Description
-|--------- | -------  | -----------
search |  |true     | parent attribute for search criteria
 | term | true | The term to match (string)
 | language | false | Options are 'EN' (English) and 'ES' (Spanish), default language is English
 | limit | false | Limit size of the result set, default size is 10
