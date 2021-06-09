> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/reach/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-raw '{"country": "cl","date_end": "2021-06-08","date_start": "2021-05-08","device": "all","group_by": "day","labels_limit": 10,"labels": [{"name": "Coca-Cola - Inicio | Facebook","media_plan": [{"days_with_impressions": 4,"domain": "facebook.com","daily_impressions": [{ "date": "2021-05-20", "impressions": 246954 }]}]}]}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"country": "cl","date_end": "2021-06-08","date_start": "2021-05-08","device": "all","group_by": "day","labels_limit": 10,"labels": [{"name": "Coca-Cola - Inicio | Facebook","media_plan": [{"days_with_impressions": 4,"domain": "facebook.com","daily_impressions": [{ "date": "2021-05-20", "impressions": 246954 }]}]}]}'

response = requests.post('https://clientela.admetricks.com/reach/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/reach/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"country": "cl","date_end": "2021-06-08","date_start": "2021-05-08","device": "all","group_by": "day","labels_limit": 10,"labels": [{"name": "Coca-Cola - Inicio | Facebook","media_plan": [{"days_with_impressions": 4,"domain": "facebook.com","daily_impressions": [{ "date": "2021-05-20", "impressions": 246954 }]}]}]})
});
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'accept' => 'application/json, text/plain, */*',
    'authorization' => 'Token YOUR_TOKEN',
    'content-type' => 'application/json;charset=UTF-8'
);
$data = '{"country": "cl","date_end": "2021-06-08","date_start": "2021-05-08","device": "all","group_by": "day","labels_limit": 10,"labels": [{"name": "Coca-Cola - Inicio | Facebook","media_plan": [{"days_with_impressions": 4,"domain": "facebook.com","daily_impressions": [{ "date": "2021-05-20", "impressions": 246954 }]}]}]}';
$response = Requests::post('https://clientela.admetricks.com/reach/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
[
  {
    "name": "Coca-Cola - Inicio | Facebook",
    "by_websites": [
      {
        "domain": "facebook.com",
        "by_date": [
          {
            "date": "2021-05-20",
            "daily_impressions": 246954,
            "daily_reach": 234805.90535371588,
            "daily_relative_reach": 0.015446903286510211,
            "daily_frequency": 1.0517367509474858,
            "accumulated_impressions": 246954,
            "accumulated_reach": 234805.90535371588,
            "accumulated_relative_reach": 0.015446903286510211,
            "accumulated_frequency": 1.0517367509474858
          }
        ]
      }
    ],
    "by_dates": [
      {
        "date": "2021-05-20",
        "daily_impressions": 246954,
        "daily_reach": 234805.90535371588,
        "daily_relative_reach": 0.015446903286510211,
        "daily_frequency": 1.0517367509474858,
        "accumulated_impressions": 246954,
        "accumulated_reach": 234805.90535371588,
        "accumulated_relative_reach": 0.015446903286510211,
        "accumulated_frequency": 1.0517367509474858
      }
    ]
  }
]
```
