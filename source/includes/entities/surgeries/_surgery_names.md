## Surgeries/Procedures - Names List
```shell
curl -X GET {server_url}/api/v2/surgery_names
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
```
```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/surgery_names",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token"
  }
).execute
```
> The above command returns JSON structured like this:

```json
{
  "surgery_names": [
    { "name": "Ankle" },
    { "name": "Appendectomy" },
    { "name": "CABG (Bypass surgery)" },
    { "name": "Colon resection" },
    { "name": "Craniotomy" },
    { "name": "Ear Tubes" },
    { "name": "Gall bladder" },
    { "name": "Head or neck" },
    { "name": "Hip replacement" },
    { "name": "Knee" },
    { "name": "Lung resection" },
    { "name": "Pacemaker" },
    { "name": "Plastic Surgery" },
    { "name": "Wrist" }
  ]
}
```
To retrieve the full list of names for surgeries of interest on patient history in the MDLIVE system, make a request to:

### HTTP Request

`GET {server}/api/v2/surgery_names`

This request must include a valid JWT token, please see our [documentation](#api-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Authorization| Bearer example.jwttoken
