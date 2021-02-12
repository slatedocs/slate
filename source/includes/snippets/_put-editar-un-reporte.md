> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/report/13504/' \
  -X 'PUT' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Authorization: Token YOUR_TOKEN' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  --data-binary '{"name":"campaigns with data","period":7,"daily_updates":false,"weekly_updates":false,"monthly_updates":false,"monthly_memories":false,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: brasil. Ordenar por: valorización","report_type":{"id":11},"query":"{\"ad_types\":{\"include\":[{\"id\":1},{\"id\":2},{\"id\":3}]},\"countries\":{\"include\":[{\"id\":4}]},\"date_range\":{\"start\":\"2021-01-13T00:00:00.000\",\"end\":\"2021-01-20T23:59:59.999\",\"group_by\":\"day\"},\"devices\":{\"include\":[{\"id\":1},{\"id\":2}]},\"order_by\":\"valuation\",\"search_term\":\"a\",\"id\":13504}"}'
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/report/13504/', {
    method: 'PUT',
    headers: {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'Token YOUR_TOKEN',
        'Content-Type': 'application/json;charset=UTF-8'
    },
    body: JSON.stringify({"name":"campaigns with data","period":7,"daily_updates":false,"weekly_updates":false,"monthly_updates":false,"monthly_memories":false,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y móvil. Países: brasil. Ordenar por: valorización","report_type":{"id":11},"query":"{\"ad_types\":{\"include\":[{\"id\":1},{\"id\":2},{\"id\":3}]},\"countries\":{\"include\":[{\"id\":4}]},\"date_range\":{\"start\":\"2021-01-13T00:00:00.000\",\"end\":\"2021-01-20T23:59:59.999\",\"group_by\":\"day\"},\"devices\":{\"include\":[{\"id\":1},{\"id\":2}]},\"order_by\":\"valuation\",\"search_term\":\"a\",\"id\":13504}"})
});
```

```python
import requests

headers = {
    'Accept': 'application/json, text/plain, */*',
    'Authorization': 'Token YOUR_TOKEN',
    'Content-Type': 'application/json;charset=UTF-8',
}

data = '{"name":"campaigns with data","period":7,"daily_updates":false,"weekly_updates":false,"monthly_updates":false,"monthly_memories":false,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y m\xF3vil. Pa\xEDses: brasil. Ordenar por: valorizaci\xF3n","report_type":{"id":11},"query":"{\\"ad_types\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2},{\\"id\\":3}]},\\"countries\\":{\\"include\\":[{\\"id\\":4}]},\\"date_range\\":{\\"start\\":\\"2021-01-13T00:00:00.000\\",\\"end\\":\\"2021-01-20T23:59:59.999\\",\\"group_by\\":\\"day\\"},\\"devices\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2}]},\\"order_by\\":\\"valuation\\",\\"search_term\\":\\"a\\",\\"id\\":13504}"}'

response = requests.put('https://clientela.admetricks.com/report/13504/', headers=headers, data=data)
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
$data = '{"name":"campaigns with data","period":7,"daily_updates":false,"weekly_updates":false,"monthly_updates":false,"monthly_memories":false,"weekly_updates_delivery_day":1,"filter":"Formatos: imagen, video y texto. Dispositivos: escritorio y m\xF3vil. Pa\xEDses: brasil. Ordenar por: valorizaci\xF3n","report_type":{"id":11},"query":"{\\"ad_types\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2},{\\"id\\":3}]},\\"countries\\":{\\"include\\":[{\\"id\\":4}]},\\"date_range\\":{\\"start\\":\\"2021-01-13T00:00:00.000\\",\\"end\\":\\"2021-01-20T23:59:59.999\\",\\"group_by\\":\\"day\\"},\\"devices\\":{\\"include\\":[{\\"id\\":1},{\\"id\\":2}]},\\"order_by\\":\\"valuation\\",\\"search_term\\":\\"a\\",\\"id\\":13504}"}';
$response = Requests::put('https://clientela.admetricks.com/report/13504/', $headers, $data);
```

> Ejemplo de Respuesta (200)

```json
true
```
