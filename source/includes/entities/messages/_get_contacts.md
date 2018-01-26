## Messages - Retreive All Contacts

```shell
curl -X GET {server_url}api/v1/patients/{patient_id}/messages/contacts
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/messages/contacts",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  },
).execute
```

> The above command returns JSON structured like this:

```json
{
  "contacts": [
    {
      "id": 35,
      "prefix": "",
      "fullname": "demoprovider1 demoprovider1",
      "gender": "Male",
      "photo_url": "/users/35/photo",
      "specialty": "General Practice"
    },
    {
      "id": 37,
      "prefix": null,
      "fullname": "demoprovider3 demoprovider3",
      "gender": "Male",
      "photo_url": "/users/37/photo",
      "specialty": "General Practice"
    },
    {
      "id": 38,
      "prefix": null,
      "fullname": "demoprovider4 demoprovider4",
      "gender": "Male",
      "photo_url": "/users/38/photo",
      "specialty": "General Practice"
    }
  ]
}
```

A patient can contact providers that they have previously seen or are scheduled to see.  For a list of these providers, make a request to:

### HTTP Request

`GET {server_url}/api/v1/patients/{patient_id}/messages/contacts`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Accept       | application/json
Authorization| Bearer {jwttoken}

### URL Parameter
Parameter | Required | Description
--------- | -------  | -----------
patient_id | true | MDLIVE ID for patient
