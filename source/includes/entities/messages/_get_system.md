## Messages - Retrieve System Messages for a Patient

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/messages/system?page=1&per=5
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => "{server_url}/api/v1/patients/{patient_id}/messages/system?page1&per=5",
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
      "id": 99,
      "date_time": "2018-01-10T00:42:57+00:00",
      "from": "System Controller",
      "from_id": 2,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Appointment Scheduled",
      "message": "You have scheduled an appointment with Dr. Travis C Stork at 01/09/2018 at 07:43 PM (EST)",
      "unread_status": true,
      "replied_to_message_id": null
    },
    {
      "id": 97,
      "date_time": "2018-01-09T16:36:20+00:00",
      "from": "System Controller",
      "from_id": 2,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Appointment Scheduled",
      "message": "You have scheduled an appointment with Dr. Travis C Stork at 01/09/2018 at 11:37 AM (EST)",
      "unread_status": true,
      "replied_to_message_id": null
    },
    {
      "id": 94,
      "date_time": "2017-12-29T21:21:03+00:00",
      "from": "System Controller",
      "from_id": 2,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Appointment Scheduled",
      "message": "You have scheduled an appointment with Dr. Travis C Stork at 12/29/2017 at 09:30 PM (EST)",
      "unread_status": false,
      "replied_to_message_id": null
    },
    {
      "id": 92,
      "date_time": "2017-12-29T21:16:00+00:00",
      "from": "System Controller",
      "from_id": 2,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Appointment Scheduled",
      "message": "You have scheduled an appointment with Dr. Travis C Stork at 12/29/2017 at 07:30 PM (EST)",
      "unread_status": true,
      "replied_to_message_id": null
    },
    {
      "id": 64,
      "date_time": "2017-12-27T16:52:15+00:00",
      "from": "System Controller",
      "from_id": 2,
      "to": "Test Marino",
      "to_id": 3,
      "subject": "Appointment Scheduled",
      "message": "You have scheduled an appointment with Dr. Travis C Stork at 12/29/2017 at 11:15 AM (EST)",
      "unread_status": true,
      "replied_to_message_id": null
    }
  ],
  "unread": 25
}
```

A patient can view messages from the MDLIVE system.  The view a paginated list of system messages, make a request to:

### HTTP Request

`GET {server_url}/api/v1/patients/{patient_id}/messages/system?page=1&per=5`

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
page       | false | Page #
per        | false | # of messages per page
