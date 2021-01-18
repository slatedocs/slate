> Ejemplo de petición

```shell
curl 'http://clientela-document-search-endpoints.eks.admetricks.net/publisher/?countries=1' \
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

response = requests.get('http://clientela-document-search-endpoints.eks.admetricks.net/publisher/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
};

var options = {
    url: 'http://clientela-document-search-endpoints.eks.admetricks.net/publisher/?countries=1',
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
$response = Requests::get('http://clientela-document-search-endpoints.eks.admetricks.net/publisher/?countries=1', $headers);
```

> Respuesta (200)

```json
[
  {
    "id":269,
    "name":"prisa",
    "websites":[
      {
        "id":"215",
        "domain":"elpais.com",
        "last_seen":"2021-01-17T18:16:40Z"
      },
      {
        "id":"343",
        "domain":"concierto.cl",
        "last_seen":"2021-01-18T00:25:01Z"
      },
      {
        "id":"344",
        "domain":"futuro.cl",
        "last_seen":"2021-01-18T00:17:54Z"
      },
      {
        "id":"454",
        "domain":"adnradio.cl",
        "last_seen":"2021-01-18T00:11:24Z"
      }
    ]
  }
]
```
