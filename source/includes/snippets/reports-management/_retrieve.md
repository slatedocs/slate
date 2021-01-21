> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/report/13504/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN'
```

```javascript
var fetch = require("node-fetch");

fetch("https://clientela.admetricks.com/report/13504/", {
  headers: {
    accept: "application/json, text/plain, */*",
    authorization: "Token YOUR_TOKEN"
  },
});
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
}

response = requests.get('https://clientela.admetricks.com/report/13504/', headers=headers)
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'accept' => 'application/json, text/plain, */*',
    'authorization' => 'Token YOUR_TOKEN'
);
$response = Requests::get('https://clientela.admetricks.com/report/13504/', $headers);
```

> Ejemplo de Respuesta (200)

```json
[
  {
    "id": 13496,
    "name": "Industry Report",
    "query": "{\"ad_types\": {\"include\": [{\"id\": 1}, {\"id\": 2}, {\"id\": 3}]}, \"countries\": {\"include\": [{\"id\": 1}]}, \"date_range\": {\"start\": \"2021-01-13T00:00:00.000\", \"end\": \"2021-01-20T23:59:59.999\"}, \"devices\": {\"include\": [{\"id\": 1}, {\"id\": 2}]}, \"order_by\": \"valuation\", \"sold_by\": {\"include\": [{\"id\": \"unknown\"}, {\"id\": \"direct\"}, {\"id\": \"google\"}, {\"id\": \"ad network\"}, {\"id\": \"programmatic\"}, {\"id\": \"self promotion\"}, {\"id\": \"not available\"}]}, \"industries\": {\"include\": [{\"id\": 133, \"name\": \"alimentación - aceites y aliños\"}]}}",
    "filter": "Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: chile. Ordenar por: valorización. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available",
    "period": 7,
    "daily_updates": false,
    "weekly_updates": false,
    "monthly_updates": false,
    "monthly_memories": false,
    "last_delivered_date": "2021-01-14T15:38:55.157223Z",
    "last_delivered_status": "Sent",
    "weekly_updates_delivery_day": 1,
    "report_type": { "id": 4, "name": "industry" }
  }
]
```
