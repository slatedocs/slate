
## Offset your shipping

```ruby
require 'chestnut'

api = Chestnut::APIClient.authorize!('your_secret_chestnut_key')
api.shipping.get
```

```python
import chestnut

api = chestnut.authorize('your_secret_chestnut_key')
api.shipping.get()
```

```shell
curl "http://api.chestnut.co.uk/shipping"
  -d '{"from":{"postcode":"N1 0AF"},"to":{"postcode":"LL64 5UQ"},"weight":{"value":94,"units":"kg"}}' \
  -H "Content-type: application/json" \
  -H "Authorization: your_secret_chestnut_key"
```

```javascript
const chestnut = require('chestnut');

let api = chestnut.authorize('your_secret_chestnut_key');
let shipping = api.shipping.get();
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

`GET http://api.chestnut.co.uk/shipping`

### Query Parameters


#### Using postcodes

<div class="center-column"></div>

```json
{
  "from": {
    "postcode": "N1 0AF"
  },
  "to": {
    "postcode": "LL64 5UQ"
  },
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
