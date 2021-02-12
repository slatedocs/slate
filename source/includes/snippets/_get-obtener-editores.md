> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/publisher/?countries=1' \
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
)

response = requests.get('https://clientela.admetricks.com/publisher/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
};

var options = {
    url: 'https://clientela.admetricks.com/publisher/?countries=1',
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
$response = Requests::get('https://clientela.admetricks.com/publisher/?countries=1', $headers);
```

> Respuesta (200)

```json
[
  {
    "id": 2845,
    "name": "discovery networks international",
    "websites": [
      {
        "id": "601",
        "domain": "tudiscovery.com",
        "last_seen": "2021-01-18T21:42:02Z"
      },
      {
        "id": "604",
        "domain": "discoverymujer.com",
        "last_seen": "2016-12-03T19:13:20Z"
      },
      {
        "id": "2975",
        "domain": "discovery.com",
        "last_seen": "2016-11-30T00:53:27Z"
      }
    ]
  },
  {
    "id": 3119,
    "name": "amazon, inc.",
    "websites": [
      {
        "id": "6862",
        "domain": "amazon.com",
        "last_seen": "2021-01-18T16:59:37Z"
      },
      {
        "id": "11221",
        "domain": "amazon.es",
        "last_seen": "2020-10-16T00:00:01Z"
      }
    ]
  },
  {
    "id": 1525,
    "name": "univision communications",
    "websites": [
      {
        "id": "124",
        "domain": "univision.com",
        "last_seen": "2021-01-18T21:37:01Z"
      },
      {
        "id": "3205",
        "domain": "uvideos.com",
        "last_seen": "2019-02-08T23:06:47Z"
      }
    ]
  },
  {
    "id": 1474,
    "name": "televisa",
    "websites": [
      {
        "id": "8228",
        "domain": "cocinafacil.com.mx",
        "last_seen": "2021-01-18T15:20:47Z"
      }
    ]
  }
]
```
