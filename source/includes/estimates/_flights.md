
## Offset your flight travel

```ruby
require 'faraday'

connection = Faraday.new(:url => 'https://api.getchestnut.co.uk')
connection.post do |req|
  req.url '/v1/estimates/flights'
  req.body = '"origin_airport": "ISB","destination_airport":"LHR", "passengers": "4"'
  req.headers['Content-Type'] = 'application/json'
  req.headers['Authorization'] = 'Bearer public_key:47800ea0ee541b4c'
end
```

```python
import requests

url = 'https://api.getchestnut.co.uk/v1/estimates/flights'
headers = {'Content-type': 'application/json', 'Authorization': 'Bearer Token:47800ea0ee541b4c'}
payload = '"passengers": "4"'
response = requests.post(url, headers=headers, data=payload)

print(response.text)
```

```shell
curl "http://api.chestnut.co.uk/v1/estimates/flights"
  -d '"origin_airport": "ISB","destination_airport":"LHR", "passengers": "4"' \
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

This endpoint creates an estimate for your flight

### HTTP Request

`GET http://api.chestnut.co.uk/flights`

### Query Parameters


#### Using postcodes

<div class="center-column"></div>

```json
{
  "origin_airport": "ISB",
  "destination_airport": "LHR",
  "passengers": "4"
}
```



<aside class="success">
We use IATA approved airport codes
</aside>
