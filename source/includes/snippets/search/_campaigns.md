```shell
curl 'https://clientela.admetricks.com/campaigns/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","search_term":"4x4","industries":{"include":[{"id":161,"name":"automoción - accesorios y mantenimiento de automóviles"},{"id":156,"name":"automoción - automóviles"},{"id":163,"name":"automoción - camiones y autobuses"},{"id":162,"name":"automoción - concesionarias"},{"id":157,"name":"automoción - motocicletas"},{"id":158,"name":"automoción - náutica y aeronáutica"},{"id":159,"name":"automoción - neumáticos"},{"id":155,"name":"automoción - varios"},{"id":160,"name":"automoción - vehículos industriales"}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-19T23:59:59.999","start":"2021-01-12T00:00:00.000","group_by":"day"}}'
```

```javascript
var fetch = require("node-fetch");

fetch(
  "https://clientela.admetricks.com/campaigns/",
  {
    method: "POST",
    headers: {
      accept: "application/json, text/plain, */*",
      authorization: "Token YOUR_TOKEN",
      "content-type": "application/json;charset=UTF-8",
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      order_by: "valuation",
      search_term: "4x4",
      industries: {
        include: [
          {
            id: 161,
            name: "automoción - accesorios y mantenimiento de automóviles",
          },
          { id: 156, name: "automoción - automóviles" },
          { id: 163, name: "automoción - camiones y autobuses" },
          { id: 162, name: "automoción - concesionarias" },
          { id: 157, name: "automoción - motocicletas" },
          { id: 158, name: "automoción - náutica y aeronáutica" },
          { id: 159, name: "automoción - neumáticos" },
          { id: 155, name: "automoción - varios" },
          { id: 160, name: "automoción - vehículos industriales" },
        ],
      },
      ad_types: { include: [{ id: 1 }, { id: 2 }, { id: 3 }] },
      countries: { include: [{ id: 3 }] },
      devices: { include: [{ id: 1 }, { id: 2 }] },
      date_range: {
        end: "2021-01-19T23:59:59.999",
        start: "2021-01-12T00:00:00.000",
        group_by: "day",
      },
    }),
  }
);
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","search_term":"4x4","industries":{"include":[{"id":161,"name":"automoci\xF3n - accesorios y mantenimiento de autom\xF3viles"},{"id":156,"name":"automoci\xF3n - autom\xF3viles"},{"id":163,"name":"automoci\xF3n - camiones y autobuses"},{"id":162,"name":"automoci\xF3n - concesionarias"},{"id":157,"name":"automoci\xF3n - motocicletas"},{"id":158,"name":"automoci\xF3n - n\xE1utica y aeron\xE1utica"},{"id":159,"name":"automoci\xF3n - neum\xE1ticos"},{"id":155,"name":"automoci\xF3n - varios"},{"id":160,"name":"automoci\xF3n - veh\xEDculos industriales"}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-19T23:59:59.999","start":"2021-01-12T00:00:00.000","group_by":"day"}}'

response = requests.post('https://clientela.admetricks.com/campaigns/', headers=headers, data=data)
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'accept' => 'application/json, text/plain, */*',
    'authorization' => 'Token YOUR_TOKEN',
    'content-type' => 'application/json;charset=UTF-8'
);
$data = '{"order_by":"valuation","search_term":"4x4","industries":{"include":[{"id":161,"name":"automoci\xF3n - accesorios y mantenimiento de autom\xF3viles"},{"id":156,"name":"automoci\xF3n - autom\xF3viles"},{"id":163,"name":"automoci\xF3n - camiones y autobuses"},{"id":162,"name":"automoci\xF3n - concesionarias"},{"id":157,"name":"automoci\xF3n - motocicletas"},{"id":158,"name":"automoci\xF3n - n\xE1utica y aeron\xE1utica"},{"id":159,"name":"automoci\xF3n - neum\xE1ticos"},{"id":155,"name":"automoci\xF3n - varios"},{"id":160,"name":"automoci\xF3n - veh\xEDculos industriales"}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-19T23:59:59.999","start":"2021-01-12T00:00:00.000","group_by":"day"}}';
$response = Requests::post('https://clientela.admetricks.com/campaigns/', $headers, $data);
```

> Ejemplo de respuesta (200)

```json
{
  "meta": {},
  "data": [
    {
      "landing_page": "chevrolet.com.ar/camionetas-4x4-pick-up/s10-high-country-camioneta-4x4",
      "description": "camioneta | camión | coche | mini suv | neumático automoción | paisaje | vehículo | vehículo terrestre | vehículo utilitario deportivo",
      "countries": [{ "id": 3, "name": "argentina" }],
      "industry": { "id": 156, "name": "automoción - automóviles" },
      "title": "S10 High Country | Camioneta 4x4 | Chevrolet",
      "devices": [
        { "id": 1, "name": "desktop" },
        { "id": 2, "name": "mobile" }
      ],
      "id": 7766651,
      "date_range": {
        "gte": "2020-11-21T00:01:27.000Z",
        "lte": "2021-01-19T14:07:43.000Z"
      },
      "preview": {
        "ad_measurements": { "width": 300, "height": 280 },
        "ad_file": {
          "name": "https://ads.admetricks.com/video_39df000f7f0e30a7385d7381ef90a37b.mp4"
        }
      },
      "brand": { "id": 63, "name": "chevrolet" },
      "ad_types": [
        { "id": 1, "name": "display" },
        { "id": 2, "name": "video" }
      ]
    }
  ]
}
```
