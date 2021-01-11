> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/website-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-07T23:59:59.999","start":"2021-01-01T00:00:00.000","group_by":"day"},"websites":{"include":[{"id":1350,"domain":"20minutos.es"}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-07T23:59:59.999","start":"2021-01-01T00:00:00.000","group_by":"day"},"websites":{"include":[{"id":1350,"domain":"20minutos.es"}]}}'

response = requests.post('https://clientela.admetricks.com/website-report/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/website-report/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"order_by":"valuation","ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-07T23:59:59.999","start":"2021-01-01T00:00:00.000","group_by":"day"},"websites":{"include":[{"id":1350,"domain":"20minutos.es"}]}})
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
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-07T23:59:59.999","start":"2021-01-01T00:00:00.000","group_by":"day"},"websites":{"include":[{"id":1350,"domain":"20minutos.es"}]}}';
$response = Requests::post('https://clientel.admetricks.com/website-report/', $headers, $data);

```

> Respuesta (200)

```json
{
  "meta": {
    "date_range": {
      "start": "2021-01-07T03:21:38.000Z",
      "end": "2021-01-07T03:21:38.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": 214,
        "name": "tiendas y restaurantes - tiendas de productos al por menor"
      }
    ],
    "websites_by_date": [
      {
        "domain": "20minutos.es",
        "metrics_by_date": [
          {
            "date": "2021-01-07T00:00:00.000Z",
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "date_int": 1609977600000
          }
        ],
        "id": 1350
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2021-01-07T03:21:38.000Z",
      "end": "2021-01-07T03:21:38.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": 2,
        "name": "mobile"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2021-01-07T00:00:00.000Z",
          "metrics": {
            "impact": 39966,
            "valuation_usd": 150.15338660829642,
            "impressions": 120366,
            "valuation": 107327
          },
          "date_int": 1609977600000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 39966,
            "valuation_usd": 150.15338660829642,
            "impressions": 120366,
            "valuation": 107327
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 39966,
            "valuation_usd": 150.15338660829642,
            "impressions": 120366,
            "valuation": 107327
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 120366,
      "total_impact": 39966,
      "devices": [
        {
          "metrics": {
            "impact": 39966,
            "valuation_usd": 150.15338660829642,
            "impressions": 120366,
            "valuation": 107327
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 150.15338660829642,
      "position": {
        "first_scroll": 0.0,
        "second_scroll": 0.0,
        "third_or_more_scroll": 1.0
      },
      "total_valuation": 107327
    },
    "campaigns": [
      {
        "landing_page": "falabella.com/falabella-cl/collection/liquidacion-mango-man",
        "description": "blanco | colorido | fotografía | línea | magenta | patrón | rojo | rosado",
        "ad_format": { "id": 154, "name": "brand-day" },
        "title": " Liquidacion Mango Man - Falabella.com ",
        "date_range": {
          "start": "2021-01-07T03:21:38.000Z",
          "end": "2021-01-07T03:21:38.000Z"
        },
        "industry": {
          "id": 214,
          "name": "tiendas y restaurantes - tiendas de productos al por menor"
        },
        "brand": { "id": 9077, "name": "falabella" },
        "countries": [
          {
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "websites": [
          {
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "domain": "20minutos.es",
            "id": 1350
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": { "width": 300, "height": 250 },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_2988870f46de0c084cba3a82c2e1d9ed.jpg"
          }
        },
        "id": 7990066,
        "ad_types": [
          {
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "domain": "20minutos.es",
        "id": 1350
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2021-01-07T00:00:00.000Z",
            "metrics": {
              "impact": 39966,
              "count": 2,
              "valuation_usd": 150.15338660829642,
              "valuation_by_country": [{ "chile": 107327 }],
              "impressions": 120366,
              "valuation": 107327
            },
            "date_int": 1609977600000
          }
        ],
        "id": 9077,
        "name": "falabella"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 39966,
          "count": 2,
          "valuation_usd": 150.15338660829642,
          "valuation_by_country": [{ "chile": 107327 }],
          "impressions": 120366,
          "valuation": 107327
        },
        "id": 9077,
        "name": "falabella"
      }
    ]
  }
}
```
