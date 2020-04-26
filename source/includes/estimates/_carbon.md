## Offset your carbon

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
  -d '{"weight":{"value":94,"units":"kg"}}' \
  -H "Content-type: application/json" \
  -H "Authorization: your_secret_chestnut_key"
```

```javascript
const chestnut = require('chestnut');

let api = chestnut.authorize('your_secret_chestnut_key');
let carbon = api.carbon.get();
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

`GET http://api.chestnut.co.uk/carbon`

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
