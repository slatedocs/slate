## Offset your carbon

```ruby
require 'rest-client'

url = 'https://api.getchestnut.co.uk/v1/estimates/shipping'
headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer public_key:47800ea0ee541b4c' }
body = {weight: {value: 94,units:"kg"}}

RestClient.post(url, params: body, headers: headers)

```

```python
import requests

url = 'https://api.getchestnut.co.uk/v1/estimates/flights'
headers = {'Content-type': 'application/json', 'Authorization': 'Bearer Token:47800ea0ee541b4c'}
payload = {"weight": {"value": 94,"units":"kg"}}
response = requests.post(url, headers=headers, data=payload)

print(response.text)
```

```shell
curl "http://api.getchestnut.co.uk/carbon"
  -d '{"weight":{"value":94,"units":"kg"}}' \
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

This endpoint creates an estimate for your carbon

### HTTP Request

`GET http://api.getchestnut.co.uk/carbon`

### Query Parameters

<div class="center-column"></div>

```json
{
  "weight": {
    "value": "100",
    "units": "kg"
  }
}
```


<aside class="success">
If units are not provided, kg are assumed
</aside>
