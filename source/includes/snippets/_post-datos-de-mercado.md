> Ejemplo de petición

```shell
curl -X POST -H "Authorization: Token YOUR_TOKEN" "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1"
```

```python
import requests

headers = {
    'Authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json'
}

params = (
    ('day', '2020-10-01'),
    ('country', '1'),
    ('device', '1'),
    ('ad_type', '1'),
)

response = requests.post(
  'https://clientela.admetricks.com/market-report/data/v3/',
  headers=headers,
  params=params
)
```

```javascript
const endpoint = "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1"

fetch(endpoint, {
    method: 'POST',
    headers: {
        'Authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json'
    }
});
```

```php
<?php

include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();

$headers = array(
    'authorization' => 'Token YOUR_TOKEN',
    'content-type' => 'application/json;charset=UTF-8'
);
$endpoint = 'https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1'

$response = Requests::post($endpoint, $headers);

?>
```

> Ejemplo de petición filtrando por industrias

```shell
curl -X POST -H "Authorization: Token YOUR_TOKEN" "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1&industries=281,282,288,289"
```

```python
import requests

headers = {
    'Authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json'
}

params = (
    ('day', '2020-10-01'),
    ('country', '1'),
    ('device', '1'),
    ('ad_type', '1'),
    ('industries', '281,282,288,289')
)

response = requests.post(
  'https://clientela.admetricks.com/market-report/data/v3/',
  headers=headers,
  params=params
)
```

```javascript
const endpoint = "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1&industries=281,282,288,289"

fetch(endpoint, {
    method: 'POST',
    headers: {
        'Authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json'
    }
});
```

```php
<?php

include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();

$headers = array(
    'authorization' => 'Token YOUR_TOKEN',
    'content-type' => 'application/json;charset=UTF-8'
);
$endpoint = 'https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1&industries=281,282,288,289'

$response = Requests::post($endpoint, $headers);

?>
```

> Ejemplo de respuesta exitosa

```json
{
  "data": [
    {
      "advertiser": "Not classified",
      "skip": 0.0,
      "website_id": 935,
      "ad_type": "display",
      "brand_id": 193765,
      "ad_link": "https://ads.admetricks.com/banner_2049ed07afe9c5d4ae18b4bb2eced5eb.jpg",
      "duration": "0",
      "campaign_name": "Google Ads: Atrae a más clientes con publicidad en línea",
      "campaign_landing_page": "ads.google.com/intl/es-419_cl/getstarted",
      "metrics_count": 66,
      "date": "2020-10-06",
      "industry_id": 280,
      "metrics_impressions": 1680,
      "country_id": 1,
      "metrics_valuation": 1465,
      "website_sections": "home,cine/tv,música,entrevistas,reviews,cartelera",
      "device": "desktop",
      "website": "rutarock.com",
      "hosted_by": "doubleclick.net",
      "brand": "google ads",
      "campaign_id": 6863067,
      "ad_type_id": 1,
      "sold_bys": "google",
      "metrics_impact": 147,
      "screenshot_link": "https://screenshots.admetricks.com/cache_ida0496477d76540fc8df0841e7e04c428.jpg",
      "device_id": 1,
      "publisher": "Not classified",
      "ad_sizes": "728x90,300x250,1068x280",
      "country": "chile",
      "industry": "servicios públicos y privados - consultorías y servicios empresariales",
      "campaign_tags": "aprendizaje, captura pantalla, diseño, dispositivo electronico, producto, sitio web, tecnología, trabajo",
      "web_report": "https://web.admetricks.com/#/campaign?name=Google%20Ads%3A%20Atrae%20a%20m%C3%A1s%20clientes%20con%20publicidad%20en%20l%C3%ADnea",
      "metrics_valuation_usd": 1.9693403628720265,
      "position": "First scroll: 68.18%, Second scroll: 27.27%, Third or more: 4.55%"
    }
  ]
}
```
