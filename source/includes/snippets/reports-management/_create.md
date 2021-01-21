> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/report/' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Authorization: Token YOUR_TOKEN' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  --data-binary '{"name":"Reporte de autos Ford","period":30,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: chile. Ordenar por: valorización. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available","report_type":{"id":2},"query":"{\"order_by\":\"valuation\",\"ad_types\":{\"include\":[{\"id\":1},{\"id\":2},{\"id\":3}]},\"countries\":{\"include\":[{\"id\":1}]},\"devices\":{\"include\":[{\"id\":1},{\"id\":2}]},\"sold_by\":{\"include\":[{\"id\":\"unknown\"},{\"id\":\"direct\"},{\"id\":\"google\"},{\"id\":\"ad network\"},{\"id\":\"programmatic\"},{\"id\":\"self promotion\"},{\"id\":\"not available\"}]},\"date_range\":{\"end\":\"2021-01-20T23:59:59.999\",\"start\":\"2020-12-20T00:00:00.000\",\"group_by\":\"day\"},\"brands\":{\"include\":[{\"id\":465,\"name\":\"ford\"}]}}"}'
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/report/', {
    method: 'POST',
    headers: {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'Token YOUR_TOKEN',
        'Content-Type': 'application/json;charset=UTF-8'
    },
    body: JSON.stringify({"name":"Reporte de autos Ford","period":30,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: chile. Ordenar por: valorización. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available","report_type":{"id":2},"query":"{\"order_by\":\"valuation\",\"ad_types\":{\"include\":[{\"id\":1},{\"id\":2},{\"id\":3}]},\"countries\":{\"include\":[{\"id\":1}]},\"devices\":{\"include\":[{\"id\":1},{\"id\":2}]},\"sold_by\":{\"include\":[{\"id\":\"unknown\"},{\"id\":\"direct\"},{\"id\":\"google\"},{\"id\":\"ad network\"},{\"id\":\"programmatic\"},{\"id\":\"self promotion\"},{\"id\":\"not available\"}]},\"date_range\":{\"end\":\"2021-01-20T23:59:59.999\",\"start\":\"2020-12-20T00:00:00.000\",\"group_by\":\"day\"},\"brands\":{\"include\":[{\"id\":465,\"name\":\"ford\"}]}}"})
});
```

```python
import requests

headers = {
    'Accept': 'application/json, text/plain, */*',
    'Authorization': 'Token YOUR_TOKEN',
    'Content-Type': 'application/json;charset=UTF-8',
}

data = '{"name":"Reporte de autos Ford","period":30,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y m\xF3vil. Pa\xEDses: chile. Ordenar por: valorizaci\xF3n. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available","report_type":{"id":2},"query":"{\\"order_by\\":\\"valuation\\",\\"ad_types\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2},{\\"id\\":3}]},\\"countries\\":{\\"include\\":[{\\"id\\":1}]},\\"devices\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2}]},\\"sold_by\\":{\\"include\\":[{\\"id\\":\\"unknown\\"},{\\"id\\":\\"direct\\"},{\\"id\\":\\"google\\"},{\\"id\\":\\"ad network\\"},{\\"id\\":\\"programmatic\\"},{\\"id\\":\\"self promotion\\"},{\\"id\\":\\"not available\\"}]},\\"date_range\\":{\\"end\\":\\"2021-01-20T23:59:59.999\\",\\"start\\":\\"2020-12-20T00:00:00.000\\",\\"group_by\\":\\"day\\"},\\"brands\\":{\\"include\\":[{\\"id\\":465,\\"name\\":\\"ford\\"}]}}"}'

response = requests.post('https://clientela.admetricks.com/report/', headers=headers, data=data)
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'Accept' => 'application/json, text/plain, */*',
    'Authorization' => 'Token YOUR_TOKEN',
    'Content-Type' => 'application/json;charset=UTF-8'
);
$data = '{"name":"Reporte de autos Ford","period":30,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y m\xF3vil. Pa\xEDses: chile. Ordenar por: valorizaci\xF3n. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available","report_type":{"id":2},"query":"{\\"order_by\\":\\"valuation\\",\\"ad_types\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2},{\\"id\\":3}]},\\"countries\\":{\\"include\\":[{\\"id\\":1}]},\\"devices\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2}]},\\"sold_by\\":{\\"include\\":[{\\"id\\":\\"unknown\\"},{\\"id\\":\\"direct\\"},{\\"id\\":\\"google\\"},{\\"id\\":\\"ad network\\"},{\\"id\\":\\"programmatic\\"},{\\"id\\":\\"self promotion\\"},{\\"id\\":\\"not available\\"}]},\\"date_range\\":{\\"end\\":\\"2021-01-20T23:59:59.999\\",\\"start\\":\\"2020-12-20T00:00:00.000\\",\\"group_by\\":\\"day\\"},\\"brands\\":{\\"include\\":[{\\"id\\":465,\\"name\\":\\"ford\\"}]}}"}';
$response = Requests::post('https://clientela.admetricks.com/report/', $headers, $data);
```

> Ejemplo de Respuesta (200)

```json
{
  "id": 13506,
  "name": "Reporte de autos Ford",
  "query": "{\"ad_types\": {\"include\": [{\"id\": 1}, {\"id\": 2}, {\"id\": 3}]}, \"countries\": {\"include\": [{\"id\": 1}]}, \"date_range\": {\"start\": \"2020-12-20T00:00:00Z\", \"end\": \"2021-01-20T23:59:59.999000Z\", \"group_by\": \"day\"}, \"devices\": {\"include\": [{\"id\": 1}, {\"id\": 2}]}, \"order_by\": \"valuation\", \"sold_by\": {\"include\": [{\"id\": \"unknown\"}, {\"id\": \"direct\"}, {\"id\": \"google\"}, {\"id\": \"ad network\"}, {\"id\": \"programmatic\"}, {\"id\": \"self promotion\"}, {\"id\": \"not available\"}]}, \"brands\": {\"include\": [{\"id\": 465, \"name\": \"ford\"}]}}",
  "filter": "Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: chile. Ordenar por: valorización. Vendido por: unknown, direct, google, ad network, programmatic, self promotion y not available",
  "period": 30,
  "daily_updates": false,
  "weekly_updates": false,
  "monthly_updates": false,
  "monthly_memories": false,
  "last_delivered_date": null,
  "last_delivered_status": null,
  "weekly_updates_delivery_day": 1,
  "report_type": { "id": 2, "name": "brand" }
}
```
