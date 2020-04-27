## Offset a carbon estimate

```ruby
require 'chestnut'

api = Chestnut::APIClient.authorize!('your_secret_chestnut_key')
api.carbon.get
```

```python
import chestnut

api = chestnut.authorize('your_secret_chestnut_key')
api.carbon.get()
```

```shell
curl "http://api.chestnut.co.uk/carbon"
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

`GET http://api.chestnut.co.uk/purchases/convert_estimate`

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
