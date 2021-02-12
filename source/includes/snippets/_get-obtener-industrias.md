> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=auto' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
}

params = (
    ('countries', '1'),
    ('name_autocomplete', 'auto'),
)

response = requests.get('https://clientela.admetricks.com/industry/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
};

var options = {
    url: 'https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=auto',
    headers: headers
};

function callback(error, response, body) {
    if (!error && response.statusCode == 200) {
        console.log(body);
    }
}

request(options, callback);
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'accept' => 'application/json, text/plain, */*',
    'authorization' => 'Token YOUR_TOKEN'
);
$response = Requests::get('https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=auto', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": 161,
    "name": "automoción - accesorios y mantenimiento de automóviles",
    "code": "207"
  },
  {
    "id": 156,
    "name": "automoción - automóviles",
    "code": "202"
  },
  {
    "id": 163,
    "name": "automoción - camiones y autobuses",
    "code": "209"
  },
  {
    "id": 162,
    "name": "automoción - concesionarias",
    "code": "208"
  },
  {
    "id": 157,
    "name": "automoción - motocicletas",
    "code": "203"
  },
  {
    "id": 158,
    "name": "automoción - náutica y aeronáutica",
    "code": "204"
  },
  {
    "id": 159,
    "name": "automoción - neumáticos",
    "code": "205"
  },
  {
    "id": 155,
    "name": "automoción - varios",
    "code": "201"
  },
  {
    "id": 160,
    "name": "automoción - vehículos industriales",
    "code": "206"
  }
]
```
