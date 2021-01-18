> Ejemplo de petición

```shell
curl 'http://clientela-document-search-endpoints.eks.admetricks.net/brand/?countries=1&name_autocomplete=faceb' \
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
    ('name_autocomplete', 'faceb'),
)

response = requests.get('http://clientela-document-search-endpoints.eks.admetricks.net/brand/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
};

var options = {
    url: 'http://clientela-document-search-endpoints.eks.admetricks.net/brand/?countries=1&name_autocomplete=faceb',
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
$response = Requests::get('http://clientela-document-search-endpoints.eks.admetricks.net/brand/?countries=1&name_autocomplete=faceb', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": 73814,
    "name": "fbza facebook marketing online",
    "last_seen": "2017-09-02T21:33:37Z"
  },
  {
    "id": 91096,
    "name": "facebook gameroom",
    "last_seen": "2017-02-27T14:27:25Z"
  },
  {
    "id": 136696,
    "name": "facebook business",
    "last_seen": "2020-11-26T05:32:26Z"
  }
]
```
