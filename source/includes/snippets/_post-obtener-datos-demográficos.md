> Ejemplo de petición

```shell
curl -L -X POST 'https://clientela.admetricks.com/reach/demographic/' \
-H 'Accept: application/json, text/plain, */*' \
-H 'Authorization: Token YOUR_TOKEN' \
-H 'Content-Type: application/json;charset=UTF-8' \
--data-raw '{
  "country": "cl",
  "date_end": "2021-07-18",
  "date_start": "2021-07-11",
  "device": ["mobile", "desktop"],
  "labels_limit": 3,
  "labels": [
    {
      "name": "Coca-Cola",
      "media_plan": [
        {
          "days_with_impressions": 1,
          "domain": "facebook.com",
          "daily_impressions": [
            {
              "date": "2021-07-13",
              "impressions": 511
            }
          ],
          "impressions": {
            "desktop": 100,
            "mobile": 411
          }
        }
      ]
    }
  ]
}'
```

```python
import requests

headers = {
    'Accept': 'application/json, text/plain, */*',
    'Authorization': 'Token YOUR_TOKEN',
    'Content-Type': 'application/json;charset=UTF-8',
}

data = '{ "country": "cl", "date_end": "2021-07-18", "date_start": "2021-07-11", "device": ["mobile", "desktop"], "labels_limit": 3, "labels": [ { "name": "Coca-Cola", "media_plan": [ { "days_with_impressions": 1, "domain": "facebook.com", "daily_impressions": [ { "date": "2021-07-13", "impressions": 511 } ], "impressions": { "desktop": 100, "mobile": 411 } } ] } ] }'

response = requests.post('https://clientela.admetricks.com/reach/demographic/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/reach/demographic/', {
    method: 'POST',
    headers: {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'Token YOUR_TOKEN',
        'Content-Type': 'application/json;charset=UTF-8'
    },
    body: JSON.stringify({ "country": "cl", "date_end": "2021-07-18", "date_start": "2021-07-11", "device": ["mobile", "desktop"], "labels_limit": 3, "labels": [ { "name": "Coca-Cola", "media_plan": [ { "days_with_impressions": 1, "domain": "facebook.com", "daily_impressions": [ { "date": "2021-07-13", "impressions": 511 } ], "impressions": { "desktop": 100, "mobile": 411 } } ] } ] })
});
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'Accept' => 'application/json, text/plain, */*',
    'Authorization' => 'Token YOUR_TOKEN',
    'Content-Type' => 'application/json;charset=UTF-8'
);
$data = '{ "country": "cl", "date_end": "2021-07-18", "date_start": "2021-07-11", "device": ["mobile", "desktop"], "labels_limit": 3, "labels": [ { "name": "Coca-Cola", "media_plan": [ { "days_with_impressions": 1, "domain": "facebook.com", "daily_impressions": [ { "date": "2021-07-13", "impressions": 511 } ], "impressions": { "desktop": 100, "mobile": 411 } } ] } ] }';
$response = Requests::post('https://clientela.admetricks.com/reach/demographic/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
[
  {
    "name": "CocaCola",
    "age_share": {
      "age_18_to_24": 0.2380923200117701,
      "age_25_to_34": 0.34227870937409793,
      "age_35_to_44": 0.19478713922438898,
      "age_45_to_54": 0.1126649769729414,
      "age_55_to_64": 0.07377685208994313,
      "age_65_plus": 0.03840000232685833
    },
    "gender_share": {
      "male": 0.5179537712850619,
      "female": 0.4820462287149381
    }
  }
]
```
