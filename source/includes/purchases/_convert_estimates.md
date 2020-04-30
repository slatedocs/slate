## Offset a carbon estimate

```ruby
require 'rest-client'

url = 'https://api.getchestnut.co.uk/v1/purchases/offset'
headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer public_key:47800ea0ee541b4c' }
body = {carbon_estimate: 100}

RestClient.post(url, params: body, headers: headers)

```

```python
import requests

url = 'https://api.getchestnut.co.uk/v1/estimates/carbon'
headers = {'Content-type': 'application/json', 'Authorization': 'Bearer public_key:47800ea0ee541b4c'}
payload = {"carbon_estimate": 100}
response = requests.post(url, headers=headers, data=payload)

print(response.text)
```

```shell
curl "http://api.getchestnut.co.uk/carbon"
  -d '{"carbon_estimate": "100"}' \
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
  }
}
```

This endpoint creates an estimate for your carbon

### HTTP Request

`GET http://api.getchestnut.co.uk/purchases/convert_estimate`

### Query Parameters

<div class="center-column"></div>

```json
{
  "carbon_estimate": "100"
}
```


<aside class="success">
If units are not provided, kg are assumed
</aside>
