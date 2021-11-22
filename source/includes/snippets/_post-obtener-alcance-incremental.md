> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/reach/incremental/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-raw '{"accumulated_reach": 0.119059494,"country": "cl","date_start": "2021-05-09","website_limit": 5,"websites_with_reach": [{ "domain": "youtube.com", "relative_reach": 0.11828468514207159 },{ "domain": "dailymotion.com", "relative_reach": 0.0006256090382416021 },{ "domain": "facebook.com", "relative_reach": 0.00014919990441392876 }]}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"accumulated_reach": 0.119059494,"country": "cl","date_start": "2021-05-09","website_limit": 5,"websites_with_reach": [{ "domain": "youtube.com", "relative_reach": 0.11828468514207159 },{ "domain": "dailymotion.com", "relative_reach": 0.0006256090382416021 },{ "domain": "facebook.com", "relative_reach": 0.00014919990441392876 }]}'

response = requests.post('https://clientela.admetricks.com/reach/incremental/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/reach/incremental/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"accumulated_reach": 0.119059494,"country": "cl","date_start": "2021-05-09","website_limit": 5,"websites_with_reach": [{ "domain": "youtube.com", "relative_reach": 0.11828468514207159 },{ "domain": "dailymotion.com", "relative_reach": 0.0006256090382416021 },{ "domain": "facebook.com", "relative_reach": 0.00014919990441392876 }]})
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
$data = '{"accumulated_reach": 0.119059494,"country": "cl","date_start": "2021-05-09","website_limit": 5,"websites_with_reach": [{ "domain": "youtube.com", "relative_reach": 0.11828468514207159 },{ "domain": "dailymotion.com", "relative_reach": 0.0006256090382416021 },{ "domain": "facebook.com", "relative_reach": 0.00014919990441392876 }]}';
$response = Requests::post('https://clientela.admetricks.com/reach/incremental/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
[
    {
        "domain": "youtube.com",
        "relative_reach": 0.11828468514207159,
        "accumulated_reach": 0.11828468514207159,
        "incremental_reach": 0.0
    },
    {
        "domain": "dailymotion.com",
        "relative_reach": 0.0006256090382416021,
        "accumulated_reach": 0.11883247259456782,
        "incremental_reach": 0.000547787452496229
    },
    {
        "domain": "facebook.com",
        "relative_reach": 0.00014919990441392876,
        "accumulated_reach": 0.11893433972548356,
        "incremental_reach": 0.00010186713091574207
    }
]
```
