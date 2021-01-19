> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=tel' \
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
    ('name_autocomplete', 'tel'),
)

response = requests.get('https://clientela.admetricks.com/industry/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
};

var options = {
    url: 'https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=tel',
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
$response = Requests::get('https://clientela.admetricks.com/industry/?countries=1&name_autocomplete=tel', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": 133,
    "name": "alimentación - aceites y aliños",
    "code": "102"
  },
  {
    "id": 136,
    "name": "alimentación - alimentos dietéticos y adelgazantes",
    "code": "105"
  },
  {
    "id": 142,
    "name": "alimentación - chocolates",
    "code": "111"
  }
]
```
