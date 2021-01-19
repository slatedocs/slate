> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/advertiser/?countries=1' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2',
}

params = (
    ('countries', '1'),
)

response = requests.get('https://clientela.admetricks.com/advertiser/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
};

var options = {
    url: 'https://clientela.admetricks.com/advertiser/?countries=1',
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
    'authorization' => 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
);
$response = Requests::get('https://clientela.admetricks.com/advertiser/?countries=1', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": 7593,
    "name": "ccu compañía cervecerías unidas",
    "brands": [
      {
        "id": 490,
        "name": "cerveza cristal",
        "last_seen": "2020-08-15T12:13:09Z"
      },
      {
        "id": 780,
        "name": "redbull",
        "last_seen": "2021-01-08T14:40:00Z"
      }
    ]
  }
]
```
