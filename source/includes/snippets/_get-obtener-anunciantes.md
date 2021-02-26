> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/advertiser/?countries=1' \
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

response = requests.get('https://clientela.admetricks.com/advertiser/', headers=headers, params=params)
```

```javascript
var request = require('request');

var headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN'
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
    'authorization' => 'Token YOUR_TOKEN'
);
$response = Requests::get('https://clientela.admetricks.com/advertiser/?countries=1', $headers);
```

> Ejemplo de respuesta exitosa

```json
[
  {
    "id": 1696,
    "name": "nestlé",
    "brands": [
      {
        "id": 683,
        "name": "milo",
        "last_seen": "2021-01-18T11:35:06Z"
      },
      {
        "id": 1696,
        "name": "nestlé",
        "last_seen": "2021-01-18T16:07:39Z"
      },
      {
        "id": 2179,
        "name": "chocapic",
        "last_seen": "2021-01-16T21:51:55Z"
      },
      {
        "id": 2393,
        "name": "nestle fitness",
        "last_seen": "2018-07-01T01:44:16Z"
      },
      {
        "id": 4032,
        "name": "nesquik",
        "last_seen": "2015-06-06T13:19:19Z"
      },
      {
        "id": 9318,
        "name": "gerber",
        "last_seen": "2019-02-15T00:32:38Z"
      },
      {
        "id": 13820,
        "name": "chamyto",
        "last_seen": "2019-09-15T11:14:17Z"
      },
      {
        "id": 13914,
        "name": "chiquitin",
        "last_seen": "2016-08-30T07:42:37Z"
      },
      {
        "id": 16358,
        "name": "galletas mckay",
        "last_seen": "2020-02-26T06:42:30Z"
      },
      {
        "id": 17883,
        "name": "kitkat",
        "last_seen": "2020-12-01T00:08:00Z"
      },
      {
        "id": 18512,
        "name": "maggi",
        "last_seen": "2021-01-18T14:48:04Z"
      },
      {
        "id": 19484,
        "name": "nescafé",
        "last_seen": "2020-11-24T03:45:18Z"
      },
      {
        "id": 19486,
        "name": "nestea",
        "last_seen": "2014-03-02T19:54:16Z"
      },
      {
        "id": 19568,
        "name": "nido",
        "last_seen": "2020-12-10T22:43:15Z"
      },
      {
        "id": 20604,
        "name": "purina",
        "last_seen": "2021-01-18T18:01:28Z"
      },
      {
        "id": 21118,
        "name": "sahne nuss",
        "last_seen": "2020-12-31T13:34:41Z"
      }
    ]
  },
  {
    "id": 639,
    "name": "procter and gamble",
    "brands": [
      {
        "id": 28,
        "name": "gillette",
        "last_seen": "2020-11-07T14:23:16Z"
      },
      {
        "id": 306,
        "name": "pantene",
        "last_seen": "2021-01-06T11:07:25Z"
      },
      {
        "id": 506,
        "name": "ariel",
        "last_seen": "2021-01-01T06:40:31Z"
      },
      {
        "id": 574,
        "name": "pampers",
        "last_seen": "2020-12-31T10:07:46Z"
      },
      {
        "id": 628,
        "name": "herbal essences",
        "last_seen": "2021-01-11T04:05:19Z"
      },
      {
        "id": 1419,
        "name": "prilosec",
        "last_seen": "2014-02-24T16:00:30Z"
      },
      {
        "id": 3707,
        "name": "always",
        "last_seen": "2020-08-23T03:23:11Z"
      },
      {
        "id": 3820,
        "name": "febreze",
        "last_seen": "2015-06-17T18:55:21Z"
      },
      {
        "id": 5943,
        "name": "downy",
        "last_seen": "2020-05-20T20:28:20Z"
      },
      {
        "id": 8191,
        "name": "braun",
        "last_seen": "2020-12-16T06:29:56Z"
      },
      {
        "id": 8409,
        "name": "charmin",
        "last_seen": "2020-02-07T04:20:32Z"
      },
      {
        "id": 9331,
        "name": "gillette venus",
        "last_seen": "2019-03-16T13:05:02Z"
      },
      {
        "id": 9487,
        "name": "head & shoulders",
        "last_seen": "2021-01-07T03:15:31Z"
      },
      {
        "id": 10098,
        "name": "magistral",
        "last_seen": "2020-09-14T22:25:24Z"
      },
      {
        "id": 12067,
        "name": "ace detergentes",
        "last_seen": "2017-06-30T13:02:00Z"
      }
    ]
  },
  {
    "id": 2694,
    "name": "unilever",
    "brands": [
      {
        "id": 102,
        "name": "impulse",
        "last_seen": "2014-11-29T00:59:41Z"
      },
      {
        "id": 112,
        "name": "ala",
        "last_seen": "2013-08-19T00:36:17Z"
      },
      {
        "id": 200,
        "name": "dove",
        "last_seen": "2021-01-18T09:28:39Z"
      },
      {
        "id": 313,
        "name": "rexona",
        "last_seen": "2020-10-27T19:53:18Z"
      },
      {
        "id": 580,
        "name": "sedal",
        "last_seen": "2021-01-15T22:24:26Z"
      },
      {
        "id": 1069,
        "name": "tresemme",
        "last_seen": "2020-01-22T18:30:03Z"
      },
      {
        "id": 2694,
        "name": "unilever",
        "last_seen": "2020-12-25T10:36:10Z"
      },
      {
        "id": 2844,
        "name": "axe",
        "last_seen": "2020-03-16T07:38:47Z"
      },
      {
        "id": 8436,
        "name": "cif",
        "last_seen": "2020-10-01T08:18:02Z"
      },
      {
        "id": 8464,
        "name": "clear",
        "last_seen": "2017-12-31T01:21:11Z"
      },
      {
        "id": 8841,
        "name": "drive",
        "last_seen": "2019-06-06T18:41:50Z"
      },
      {
        "id": 9492,
        "name": "hellmanns",
        "last_seen": "2020-12-30T06:08:26Z"
      },
      {
        "id": 9842,
        "name": "knorr",
        "last_seen": "2020-04-02T04:14:38Z"
      },
      {
        "id": 10719,
        "name": "pond's",
        "last_seen": "2019-09-18T18:59:21Z"
      },
      {
        "id": 13263,
        "name": "bonella",
        "last_seen": "2019-10-22T10:18:29Z"
      },
      {
        "id": 14759,
        "name": "degree",
        "last_seen": "2015-09-24T18:07:25Z"
      }
    ]
  },
  {
    "id": 77,
    "name": "coca cola",
    "brands": [
      {
        "id": 34,
        "name": "whisky johnnie walker",
        "last_seen": "2021-01-18T12:17:54Z"
      },
      {
        "id": 77,
        "name": "coca-cola",
        "last_seen": "2021-01-18T13:47:33Z"
      },
      {
        "id": 85,
        "name": "sprite",
        "last_seen": "2020-06-17T00:08:44Z"
      },
      {
        "id": 468,
        "name": "schweppes",
        "last_seen": "2015-07-31T13:09:28Z"
      },
      {
        "id": 598,
        "name": "fanta",
        "last_seen": "2020-07-19T19:04:36Z"
      },
      {
        "id": 667,
        "name": "powerade",
        "last_seen": "2020-12-18T02:01:49Z"
      },
      {
        "id": 784,
        "name": "huawei",
        "last_seen": "2021-01-18T18:55:42Z"
      },
      {
        "id": 3552,
        "name": "agua san luis",
        "last_seen": "2018-09-05T11:05:32Z"
      },
      {
        "id": 7689,
        "name": "ades",
        "last_seen": "2019-04-02T22:21:30Z"
      },
      {
        "id": 7880,
        "name": "aquarius",
        "last_seen": "2018-03-15T17:10:48Z"
      },
      {
        "id": 9256,
        "name": "fuze tea",
        "last_seen": "2017-06-12T15:06:18Z"
      },
      {
        "id": 12347,
        "name": "pisco alto del carmen",
        "last_seen": "2021-01-12T17:19:36Z"
      },
      {
        "id": 12442,
        "name": "andina del valle",
        "last_seen": "2021-01-14T01:01:05Z"
      },
      {
        "id": 13027,
        "name": "benedictino",
        "last_seen": "2018-04-19T04:02:32Z"
      },
      {
        "id": 17787,
        "name": "kapo",
        "last_seen": "2020-02-02T11:58:58Z"
      },
      {
        "id": 19607,
        "name": "nordic",
        "last_seen": "2019-10-10T01:59:54Z"
      },
      {
        "id": 22090,
        "name": "teatro coca cola city",
        "last_seen": "2015-07-27T00:39:33Z"
      },
      {
        "id": 23108,
        "name": "vital",
        "last_seen": "2020-03-26T14:30:13Z"
      },
      {
        "id": 23114,
        "name": "vitamin water",
        "last_seen": "2015-03-12T15:43:02Z"
      }
    ]
  }
]
```
