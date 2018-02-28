## Payments - Get patient's default card

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/credit_card \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
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
  "credit_card": {
    "subscriber_id": 950,
    "subscriber_card_id": 486,
    "billing_data": {
      "address1": "2900 NW 130th Ave #106",
      "address2": "",
      "city": "Sunrise",
      "state": "FL",
      "zip": "33323",
      "name": "John Doe",
      "country": "US"
    },
    "card_data": {
      "last_four": "4242",
      "active": true,
      "type": "VISA",
      "expiration_month": 1,
      "expiration_year": 2020
    }
  }
}
```


### HTTP Request

To retrieve the patient's default card, make a request to:

`GET {server_url}/api/v1/patients/{patient_id}/credit_card`


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
