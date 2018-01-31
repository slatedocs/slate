## Payments - Delete credit card

```shell
curl -X DELETE {server_url}/api/v1/patients/{patient_id}/credit_card \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :delete,
  :url => '{server_url}/api/v1/patients/{patient_id}/credit_card',
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "success":true
}
```


### HTTP Request

To delete the patient's default credit card, make a request to:

`DELETE {server_url}/api/v1/patients/{patient_id}/credit_card`


### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Accept        | application/json
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute  | Required | Description
-----------|----------|----------------------
patient_id | true     | MDLIVE ID for patient
