> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/brand/?countries=1&name_autocomplete=toyota' \
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
    ('name_autocomplete', 'toyota'),
)

response = requests.get('https://clientela.admetricks.com/brand/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
};

var options = {
    url: 'https://clientela.admetricks.com/brand/?countries=1&name_autocomplete=toyota',
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
$response = Requests::get('https://clientela.admetricks.com/brand/?countries=1&name_autocomplete=toyota', $headers);
```

> Ejemplo de respuesta exitosa

```json
[
  {
    "id": 496,
    "name": "toyota",
    "last_seen": "2021-01-16T06:18:26Z"
  },
  {
    "id": 5752,
    "name": "taylor toyota",
    "last_seen": "2015-08-14T03:04:37Z"
  },
  {
    "id": 22470,
    "name": "toyota iquique",
    "last_seen": "2014-06-27T01:03:13Z"
  },
  {
    "id": 22471,
    "name": "toyota nuñez",
    "last_seen": "2015-10-11T10:38:06Z"
  },
  {
    "id": 53826,
    "name": "autocentro toyota",
    "last_seen": "2016-06-18T05:31:38Z"
  },
  {
    "id": 73464,
    "name": "toyota financial service",
    "last_seen": "2018-12-26T19:56:47Z"
  },
  {
    "id": 105374,
    "name": "mvp toyota",
    "last_seen": "2020-12-17T10:31:45Z"
  },
  {
    "id": 109482,
    "name": "toyota gazoo racing",
    "last_seen": "2020-03-13T13:55:58Z"
  },
  {
    "id": 181748,
    "name": "toyota football stats",
    "last_seen": "2018-06-07T05:22:58Z"
  },
  {
    "id": 248215,
    "name": "skc toyota",
    "last_seen": "2020-01-07T05:51:23Z"
  },
  {
    "id": 256902,
    "name": "adriel toyota",
    "last_seen": "2020-12-16T09:38:40Z"
  },
  {
    "id": 260989,
    "name": "toyota mobility services",
    "last_seen": "2020-01-02T13:31:18Z"
  },
  {
    "id": 278067,
    "name": "toyota material handling",
    "last_seen": "2020-11-01T05:33:49Z"
  },
  {
    "id": 299920,
    "name": "toyota l.kovacs",
    "last_seen": "2020-11-10T23:23:21Z"
  },
  {
    "id": 309931,
    "name": "entusiasta toyota",
    "last_seen": "2020-05-25T16:22:42Z"
  },
  {
    "id": 325000,
    "name": "toyota business plus",
    "last_seen": "2020-12-19T23:19:20Z"
  },
  {
    "id": 364420,
    "name": "toyota máquina de coser",
    "last_seen": "2021-01-05T15:31:06Z"
  }
]
```
