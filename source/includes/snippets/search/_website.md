> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/website/?countries=1&domain_autocomplete=buzzfeed' \
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
    ('domain_autocomplete', 'buzzfeed'),
)

response = requests.get('https://clientela.admetricks.com/website/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
};

var options = {
    url: 'https://clientela.admetricks.com/website/?countries=1&domain_autocomplete=buzzfeed',
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
$response = Requests::get('https://clientela.admetricks.com/website/?countries=1&domain_autocomplete=buzzfeed', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": "7757",
    "domain": "buzzfeed.com",
    "last_seen": "2021-01-18T22:44:30Z"
  },
  {
    "id": "8260",
    "domain": "buzzfeednews.com",
    "last_seen": "2020-12-21T20:50:25Z"
  }
]
```
