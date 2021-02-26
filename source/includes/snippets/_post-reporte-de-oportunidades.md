> Ejemplo de petición

```shell
curl -k 'https://clientela.admetricks.com/opportunity-brand-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-28T00:00:00.000","group_by":"day"},"websites":{"exclude":[{"id":732,"domain":"guiainfantil.com"}],"include":[{"id":1350,"domain":"20minutos.es","last_seen":"2020-12-29T03:02:49Z","added":true}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-28T00:00:00.000","group_by":"day"},"websites":{"exclude":[{"id":732,"domain":"guiainfantil.com"}],"include":[{"id":1350,"domain":"20minutos.es","last_seen":"2020-12-29T03:02:49Z","added":true}]}}'

response = requests.post('https://clientela.admetricks.com/opportunity-brand-report/', headers=headers, data=data, verify=False)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/opportunity-brand-report/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-28T00:00:00.000","group_by":"day"},"websites":{"exclude":[{"id":732,"domain":"guiainfantil.com"}],"include":[{"id":1350,"domain":"20minutos.es","last_seen":"2020-12-29T03:02:49Z","added":true}]}})
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
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-28T00:00:00.000","group_by":"day"},"websites":{"exclude":[{"id":732,"domain":"guiainfantil.com"}],"include":[{"id":1350,"domain":"20minutos.es","last_seen":"2020-12-29T03:02:49Z","added":true}]}}';
$response = Requests::post('https://clientela.admetricks.com/opportunity-brand-report/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-29T03:02:49.000Z",
      "end": "2020-12-29T03:02:49.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": 288,
        "name": "telecomunicaciones e internet - empresas de telecomunicaciones"
      }
    ],
    "date_range": {
      "start": "2020-12-29T03:02:49.000Z",
      "end": "2020-12-29T03:02:49.000Z"
    },
    "ad_types": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "sold_by": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": 2,
        "name": "mobile"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2020-12-29T00:00:00.000Z",
          "metrics": {
            "impact": 15213,
            "valuation_usd": 68.54452837288451,
            "impressions": 62093,
            "valuation": 47700
          },
          "date_int": 1609200000000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 15213,
            "valuation_usd": 68.54452837288451,
            "impressions": 62093,
            "valuation": 47700
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 15213,
            "valuation_usd": 68.54452837288451,
            "impressions": 62093,
            "valuation": 47700
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 62093,
      "total_impact": 15213,
      "devices": [
        {
          "metrics": {
            "impact": 15213,
            "valuation_usd": 68.54452837288451,
            "impressions": 62093,
            "valuation": 47700
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 68.54452837288451,
      "position": {
        "first_scroll": 0,
        "second_scroll": 0,
        "third_or_more_scroll": 1
      },
      "total_valuation": 47700
    },
    "campaigns": [
      {
        "landing_page": "clarochile.cl/personas/todos-bienvenidos",
        "description": "captura pantalla | colorido | cuadrado | línea | número | paralelo | rectángulo",
        "title": "Todos Bienvenidos | Claro Chile",
        "date_range": {
          "start": "2020-12-29T03:02:49.000Z",
          "end": "2020-12-29T03:02:49.000Z"
        },
        "industry": {
          "id": 288,
          "name": "telecomunicaciones e internet - empresas de telecomunicaciones"
        },
        "brand": {
          "id": 3,
          "name": "claro"
        },
        "countries": [
          {
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "websites": [
          {
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
            },
            "domain": "20minutos.es",
            "id": 1350
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 336,
            "height": 280
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_64f743f73597d32265713f5cce72ce7d.jpg"
          }
        },
        "id": 7847163,
        "ad_types": [
          {
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
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
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "domain": "20minutos.es",
        "id": 1350
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 15213,
              "count": 1,
              "valuation_usd": 68.54452837288451,
              "valuation_by_country": [
                {
                  "chile": 47700
                }
              ],
              "impressions": 62093,
              "valuation": 47700
            },
            "date_int": 1609200000000
          }
        ],
        "id": 3,
        "name": "claro"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 15213,
          "count": 1,
          "valuation_usd": 68.54452837288451,
          "valuation_by_country": [
            {
              "chile": 47700
            }
          ],
          "impressions": 62093,
          "valuation": 47700
        },
        "id": 3,
        "name": "claro"
      }
    ]
  }
}
```
