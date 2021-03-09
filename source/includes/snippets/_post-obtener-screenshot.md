> Ejemplo de petición

```shell
curl -L -X POST 'https://clientela.admetricks.com/screenshot/' \
-H 'accept: application/json, text/plain, */*' \
-H 'authorization: Token YOUR_TOKEN' \
-H 'content-type: application/json;charset=UTF-8' \
--data-binary '{"websites":{"include":[{"id":415}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"date_range":{"start":"2021-02-26T00:00:00.000","end":"2021-03-05T23:59:59.999","group_by":"day"},"devices":{"include":[{"id":1},{"id":2}]},"order_by":"valuation","brands":{"include":[{"id":298938,"name":"chilevision.cl"},{"id":323073,"name":"cnnchile.cl"},{"id":305447,"name":"espn.com"}]},"id":14867}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"websites":{"include":[{"id":415}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"date_range":{"start":"2021-02-26T00:00:00.000","end":"2021-03-05T23:59:59.999","group_by":"day"},"devices":{"include":[{"id":1},{"id":2}]},"order_by":"valuation","brands":{"include":[{"id":298938,"name":"chilevision.cl"},{"id":323073,"name":"cnnchile.cl"},{"id":305447,"name":"espn.com"}]},"id":14867}'

response = requests.post('https://clientela.admetricks.com/screenshot/', headers=headers, data=data)
```

```javascript
var fetch = require("node-fetch");

fetch("https://clientela.admetricks.com/screenshot/", {
  method: "POST",
  headers: {
    accept: "application/json, text/plain, */*",
    authorization: "Token YOUR_TOKEN",
    "Content-Type": "application/json; charset=UTF-8",
  },
  body: JSON.stringify({
    websites: { include: [{ id: 415 }] },
    ad_types: { include: [{ id: 1 }, { id: 2 }, { id: 3 }] },
    countries: { include: [{ id: 1 }] },
    date_range: {
      start: "2021-02-26T00:00:00.000",
      end: "2021-03-05T23:59:59.999",
      group_by: "day",
    },
    devices: { include: [{ id: 1 }, { id: 2 }] },
    order_by: "valuation",
    brands: {
      include: [
        { id: 298938, name: "chilevision.cl" },
        { id: 323073, name: "cnnchile.cl" },
        { id: 305447, name: "espn.com" },
      ],
    },
    id: 14867,
  }),
});
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
$data = '{"websites":{"include":[{"id":415}]},"ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"date_range":{"start":"2021-02-26T00:00:00.000","end":"2021-03-05T23:59:59.999","group_by":"day"},"devices":{"include":[{"id":1},{"id":2}]},"order_by":"valuation","brands":{"include":[{"id":298938,"name":"chilevision.cl"},{"id":323073,"name":"cnnchile.cl"},{"id":305447,"name":"espn.com"}]},"id":14867}';
$response = Requests::post('https://clientela.admetricks.com/screenshot/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {},
  "data": [
    {
      "date": "2021-02-26T00:54:39+00:00",
      "webpage": {
        "url": "https://www.chilevision.cl/",
        "website_section": "home"
      },
      "url": "https://screenshots.admetricks.com/cache_idab511a77ecdc4127a8ad4599551286da.jpg",
      "uuid": "ab511a77ecdc4127a8ad4599551286da",
      "campaign": {
        "landing_page": "chilevision.cl/yo-soy",
        "id": 6560656,
        "title": "Yo Soy - Chilevisión"
      }
    }
  ]
}
```
