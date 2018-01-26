## Messages - Mark A Message as Read

```shell
curl -X PUT {server_url}/api/v1/patients/{patient_id}/messages/{message_id}/mark_read
  -H "Content-type: application/json"
  -H "Authorization: Bearer 34a2sample-api-token"
  -H "Accept: application/json"
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{patient_id}/messages/{messages_id}/mark_read",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-api-token",
    "Accept" => "application/json"
  }
).execute
```

> The above command will return a 204 status code with no content in the body.

A patient can only mark messages sent to them as read.  To mark a message as read, make a request to:

### HTTP Request

`POST {server}/api/v1/patients/{patient_id}/messages/{message_id}/mark_read`

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
message_id | true | MDLIVE ID for message

