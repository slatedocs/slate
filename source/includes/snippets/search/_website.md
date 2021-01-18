> Ejemplo de petición

```shell
curl 'http://clientela-document-search-endpoints.eks.admetricks.net/website/?countries=1&domain_autocomplete=facebook' \
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
    ('domain_autocomplete', 'facebook'),
)

response = requests.get('http://clientela-document-search-endpoints.eks.admetricks.net/website/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2'
};

var options = {
    url: 'http://clientela-document-search-endpoints.eks.admetricks.net/website/?countries=1&domain_autocomplete=facebook',
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
$response = Requests::get('http://clientela-document-search-endpoints.eks.admetricks.net/website/?countries=1&domain_autocomplete=facebook', $headers);
```

> Respuesta (200)

```json
[{"id":"144", "domain":"facebook.com", "last_seen":"2021-01-18T01:50:38Z"}]
```
