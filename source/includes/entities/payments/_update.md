## Payments - Update credit card

```shell
curl -X PUT {server_url}/api/v1/patients/{patient_id}/credit_card \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{
    "credit_card": {
      "billing_data": {
        "name": "John Doe",
        "address1": "2900 NW 130th Ave #101",
        "address2": "",
        "state_abbrev": "FL",
        "city": "Sunrise",
        "zip": "33323"
      },
      "card_data": {
        "card_number": "4242424242424242",
        "cvv": "200",
        "expiration_month": 1,
        "expiration_year": 2019
      }
    }
  }'
```

```ruby
RestClient::Request.new(
  :method => :put,
  :url => '{server_url}/api/v1/patients/{patient_id}/credit_card',
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  },
  :payload => {
    :credit_card => {
      :billing_data => {
        :name => "John Doe",
        :address1 => "2900 NW 130th Ave #101",
        :address2" => "",
        :state_abbrev => "FL",
        :city => "Sunrise",
        :zip => "33323"
      },
      :card_data => {
        :card_number => "4242424242424242",
        :cvv => "200",
        :expiration_month => 1,
        :expiration_year => 2019
      }
    }
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
      "address1": "2900 NW 130th Ave #101",
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
      "expiration_year": 2019
    }
  }
}
```


### HTTP Request

To update the patient's default credit card, make a request to:

`PUT {server_url}/api/v1/patients/{patient_id}/credit_card`


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


### Request Body Parameters

The following parameters need to be included in the body of the request:

Attribute                      | Required | Description
------------------------------ |----------|--------------------
credit_card                                     | true     | Parent attribute for the credit card
↳&nbsp;billing_data                             | true     | Parent attribute for billing information
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;name             | true     | Cardholder's name
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;address1         | true     | Cardholder's address 1
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;address2         | false    | Cardholder's address 2
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;state_abbrev     | true     | Cardholder's state abbreviation
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;city             | true     | Cardholder's city
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;zip              | true     | Cardholder's ZIP Code
↳&nbsp;card_data                                | true     | Parent attribute for credit card information
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;card_number      | true     | The card number, as a string without any separators
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;cvv              | true     | Cardholder's name
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;expiration_month | true     | Two digit number representing the card's expiration month
&nbsp;&nbsp;&nbsp;&nbsp;↳&nbsp;expiration_year  | true     | Four digit number representing the card's expiration year
