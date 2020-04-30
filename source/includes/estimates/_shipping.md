
## Offset your shipping

```ruby
require 'rest-client'

url = 'https://api.getchestnut.co.uk/v1/estimates/shipping'
headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer public_key:47800ea0ee541b4c' }
body = {origin_postcode: "N1 0AF", destination_postcode: "LL64 5UQ", weight: { value:94, units: "kg" }}

RestClient.post(url, params: body, headers: headers)

```

```python
import requests

url = 'https://api.getchestnut.co.uk/v1/estimates/carbon'
headers = {'Content-type': 'application/json', 'Authorization': 'Bearer public_key:47800ea0ee541b4c'}
payload = '{"weight":{"value":35,"units":"kg"}}'
response = requests.post(url, headers=headers, data=payload)

print(response.text)
```

```shell
curl "http://api.getchestnut.co.uk/v1/estimates/shipping"
  -d '{"origin_postcode":"N1 0AF"},"destination_postcode":"LL64 5UQ"},"weight":{"value":94,"units":"kg"}}' \
  -H "Content-type: application/json" \
  -H "Authorization: your_secret_chestnut_key"
```


> The above command returns JSON structured like this:

```json
{
  "equivalent_carbon_in_kg": "number",
  "electricity_in_kwh": "string",
  "cost": {
    "currency": "string",
    "value": "string",
  },
}
```

This endpoint creates an estimate for your shipping

### HTTP Request

`GET http://api.getchestnut.co.uk/shipping`

### Query Parameters


#### Using postcodes

<div class="center-column"></div>

```json
{
  "destination_postcode": "N1 0AF",
  "origin_postcode": "LL64 5UQ",
  "weight": {
    "value": "100",
    "units": "kg"
  }
}
```


#### Using distance

<div class="center-column"></div>

```json
{
  "distance": "100",
  "weight": {
    "value": "100",
    "units": "kg"
  }
}
```


<aside class="success">
Remember - provide us with distance or, give us the postcodes, and let us do the heavy lifting
</aside>
