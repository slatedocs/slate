## Messages - Create a Message from a Patient

```shell
curl -X POST {server_url}/api/v1/patients/{patient_id}/messages
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
  -d '{
    "message": {
      "message_type": "follow_up",
      "to_id": 4,
      "subject": "Prescription",
      "message": "Hello, I received a prescription for extra strength Ibuprofen. How often can I take the medicine?",
      "replied_to_message_id": 104
    }
  }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{patient_id}/messages",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  },
  :payload => {
    message: {
      message_type: "follow_up",
      to_id: 4,
      subject: "Prescription",
      message: "Hello, I received a prescription for extra strength Ibuprofen. How often can I take the medicine?",
      replied_to_message_id: 104
    }
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "message": {
    "id": 105,
    "date_time": "2018-01-23T02:33:13+00:00",
    "from": "Test Marino",
    "from_id": 3,
    "to": "Travis C Stork",
    "to_id": 4,
    "subject": "Prescription",
    "message": "Hello, I received a prescription for extra strength Ibuprofen. How often can I take the medicine?",
    "unread_status": true,
    "replied_to_message_id": 104
  }
}
```

Patients can only send messages to an authorized provider.  A provider is authorized if the patient has a previous or upcoming appointment with that provider.  To create a new message, make a request to:

### HTTP Request

`POST {server}/api/v1/patients/{patient_id}/messages`

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

### Request Body Parameters

Parameter                     |Type     | Required | Description
------------------------------|---------| -------- | -----------
message                       | object  |true      | Object containing the content of a message
↳&nbsp; message_type          | string  |true      | Type of message. For messages to providers, use the type: `follow_up`
↳&nbsp; to_id                 | integer |true      | MDLIVE ID of the provider recipient
↳&nbsp; subject               | string  |true      | Text subject of message
↳&nbsp; message               | string  |true      | Text body of message
↳&nbsp; replied_to_message_id | integer |false     | If a message is created in response to another message from the provider, the previous message's ID must be supplied
