## Messages - Retrieve All Conversations for a Patient

```shell
curl -X GET {server_url}api/v2/patients/{patient_id}/messages/conversations
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v2/patients/{patient_id}/messages/conversations",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  },
).execute
```

> The above command returns JSON structured like this:

```json
{ conversations:
  [
    {
      "provider": {
        "id": 37,
        "prefix": null,
        "fullname": "demoprovider3 demoprovider3",
        "gender": "Male",
        "photo_url": "/users/37/photo",
        "specialty": "General Practice"
      },
      "unread_messages": null,
      "recent_message_body": "Hello, I am waiting for you to start the appointment",
      "last_message_at": "2018-01-22T10:38:07.000-05:00",
      "last_message_by": "patient"
    },
    {
      "provider": {
        "id": 4,
        "prefix": "DR",
        "fullname": "Travis C Stork",
        "gender": "Male",
        "photo_url": "/users/4/photo",
        "specialty": "General Practice"
      },
      "unread_messages": 2,
      "recent_message_body": "You can take 1 600mg every 4 hours as needed for pain.",
      "last_message_at": "2018-01-23T08:50:39.000-05:00",
      "last_message_by": "provider"
    }
  ]
}
```

To fetch a list of all the patient's conversations with various providers, make a request to:

### HTTP Request

`GET {server_url}/api/v2/patients/{patient_id}/messages/conversations`

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

