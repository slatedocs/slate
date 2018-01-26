## Messages - Retrieve A Conversation between a Patient and Provider

```shell
curl -X GET {server_url}api/v1/patients/{patient_id}/providers/{provider_id}/conversation?page=1&per=5
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/providers/{provider_id}/conversation?page=1&per=5",
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
  "messages": [
    {
      "id": 106,
        "date_time": "2018-01-23T13:50:39+00:00",
        "from": "DR Travis C Stork",
        "from_id": 4,
        "to": "Test Marino",
        "to_id": 3,
        "subject": "Re: Prescription",
        "message": "You can take 1 600mg every 4 hours as needed for pain.",
        "unread_status": true
    },
    {
      "id": 105,
      "date_time": "2018-01-23T02:33:13+00:00",
      "from": "Test Marino",
      "from_id": 3,
      "to": "DR Travis C Stork",
      "to_id": 4,
      "subject": "Prescription",
      "message": "Hello, I received a prescription for extra strength Ibuprofen. How often can I take the medicine?",
      "unread_status": false
    }
    {
      "id": 104,
      "date_time": "2018-01-23T02:32:39+00:00",
      "from": "DR Travis C Stork",
      "from_id": 4,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Start Appointment",
      "message": "Hello, I am ready for your appointment",
      "unread_status": true
    }
  ]
}
```

To retrieve a paginated conversation thread between a patient and a particular provider, make a request to:

### HTTP Request

`GET {server_url}api/v1/patients/{patient_id}/providers/{provider_id}/conversation`

This request must include a valid User JWT token, please see our [documentation](#user-tokens)

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json
Accept       | application/json
Authorization| Bearer {jwttoken}

### URL Parameter
Parameter   | Required | Description
----------- | -------  | -----------
patient_id  | true | MDLIVE ID for patient
provider_id | true | MDLIVE ID for provider
page        | false | Page #
per         | false | # of messages per page
