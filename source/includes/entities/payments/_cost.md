## Payments - Cost

Returns the appointment cost.

```shell
curl -X GET '{server_url}/api/v2/payments/costs/check?patient_id={patient_id}&provider_type_id={provider_type_id}&promo_code={promo_code}&state_abbrev={state_abbrev}' \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => '{server_url}/api/v2/payments/costs/check?patient_id={patient_id}&provider_type_id={provider_type_id}&promo_code={promo_code}&state_abbrev={state_abbrev}',
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
  "cost_with_no_promocode": 49,
  "final_amount": 49,
  "cost": 49,
  "consultation_charge": 49,
  "payment_breakup": null
}
```


### HTTP Request

To retrieve the appointment cost, make a request to:

`GET {server_url}/api/v1/payments/costs/check`


### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Accept        | application/json
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute        | Required | Description
-----------------|----------|----------------------
patient_id       | true     | MDLIVE ID for patient
provider_type_id | true     | Provider Type ID, from the [provider types list](#provider-types)
promo_code       | false    | Promo code to apply to the cost of the appointment
state_abbrev     | false    | 2-Letter state abbreviated, from the [states list](#states)
