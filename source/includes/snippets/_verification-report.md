> Ejemplo de petición

```shell
curl 'http://clientela-verification-and-newdeals.eks.admetricks.net/verification-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'accept-language: es-ES,es;q=0.9,en;q=0.8,fi;q=0.7,gl;q=0.6,el;q=0.5' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-09T23:59:59.999","start":"2021-01-07T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":156014,"name":"facebook"}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2',
    'content-type': 'application/json;charset=UTF-8',
    'accept-language': 'es-ES,es;q=0.9,en;q=0.8,fi;q=0.7,gl;q=0.6,el;q=0.5',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-09T23:59:59.999","start":"2021-01-07T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":156014,"name":"facebook"}]}}'

response = requests.post('http://clientela-verification-and-newdeals.eks.admetricks.net/verification-report/', headers=headers, data=data)
```

```javascript
var fetch = require("node-fetch");

fetch(
  "http://clientela-verification-and-newdeals.eks.admetricks.net/verification-report/",
  {
    method: "POST",
    headers: {
      accept: "application/json, text/plain, */*",
      authorization: "Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2",
      "accept-language": "es-ES,es;q=0.9,en;q=0.8,fi;q=0.7,gl;q=0.6,el;q=0.5",
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      order_by: "valuation",
      ad_types: { include: [{ id: 1 }, { id: 2 }, { id: 3 }] },
      countries: { include: [{ id: 3 }] },
      devices: { include: [{ id: 1 }, { id: 2 }] },
      date_range: {
        end: "2021-01-09T23:59:59.999",
        start: "2021-01-07T00:00:00.000",
        group_by: "day",
      },
      brands: { include: [{ id: 156014, name: "facebook" }] },
    }),
  }
);
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'accept' => 'application/json, text/plain, */*',
    'authorization' => 'Token 53c566f0ee81d09acb616e913e38bd22ed17c0e2',
    'content-type' => 'application/json;charset=UTF-8',
    'accept-language' => 'es-ES,es;q=0.9,en;q=0.8,fi;q=0.7,gl;q=0.6,el;q=0.5'
);
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2021-01-09T23:59:59.999","start":"2021-01-07T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":156014,"name":"facebook"}]}}';
$response = Requests::post('http://clientela-verification-and-newdeals.eks.admetricks.net/verification-report/', $headers, $data);
```

> Respuesta (200)

```json
{
  "meta": {
    "date_range": {
      "start": "2021-01-08T06:02:16.000Z",
      "end": "2021-01-09T07:27:22.000Z"
    }
  },
  "data": {
    "ad_types": [
      {
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "id": 3,
        "name": "argentina"
      }
    ],
    "sold_by": [
      {
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "id": "google",
        "name": "google"
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "domain": "wildtangent.com",
        "id": 6190
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2021-01-08T00:00:00.000Z",
          "metrics": {
            "impact": 188,
            "valuation_usd": 0.34896625783602275,
            "impressions": 750,
            "valuation": 30
          },
          "date_int": 1610064000000
        },
        {
          "date": "2021-01-09T00:00:00.000Z",
          "metrics": {
            "impact": 188,
            "valuation_usd": 0.34896625783602275,
            "impressions": 750,
            "valuation": 30
          },
          "date_int": 1610150400000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 376,
            "valuation_usd": 0.6979325156720455,
            "impressions": 1500,
            "valuation": 60
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 376,
            "valuation_usd": 0.6979325156720455,
            "impressions": 1500,
            "valuation": 60
          },
          "id": 3,
          "name": "argentina"
        }
      ],
      "total_impressions": 1500,
      "total_impact": 376,
      "devices": [
        {
          "metrics": {
            "impact": 376,
            "valuation_usd": 0.6979325156720455,
            "impressions": 1500,
            "valuation": 60
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 0.6979325156720455,
      "position": {
        "first_scroll": 1.0,
        "second_scroll": 0.0,
        "third_or_more_scroll": 0.0
      },
      "total_valuation": 60
    },
    "date_range": {
      "start": "2021-01-08T06:02:16.000Z",
      "end": "2021-01-09T07:27:22.000Z"
    },
    "campaigns_with_websites_by_date": [
      {
        "landing_page": "facebook.com/campaign/landing.php?campaign_id=1653388251",
        "description": null,
        "title": "Sign Up for Facebook | Facebook",
        "date_range": {
          "start": "2021-01-08T06:02:16.000Z",
          "end": "2021-01-09T07:27:22.000Z"
        },
        "industry": {
          "id": 229,
          "name": "informática y equipos de oficina - redes sociales"
        },
        "brand": {
          "id": 156014,
          "name": "facebook"
        },
        "countries": [
          {
            "metrics": {
              "impact": 376,
              "count": 2,
              "valuation_usd": 0.6979325156720455,
              "valuation_by_country": [
                {
                  "argentina": 60
                }
              ],
              "impressions": 1500,
              "valuation": 60
            },
            "id": 3,
            "name": "argentina"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 376,
              "count": 2,
              "valuation_usd": 0.6979325156720455,
              "valuation_by_country": [
                {
                  "argentina": 60
                }
              ],
              "impressions": 1500,
              "valuation": 60
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "websites_by_date": [
          {
            "domain": "wildtangent.com",
            "metrics_by_date": [
              {
                "date": "2021-01-08T00:00:00.000Z",
                "metrics": {
                  "impact": 188,
                  "count": 1,
                  "valuation_usd": 0.34896625783602275,
                  "valuation_by_country": [
                    {
                      "argentina": 30
                    }
                  ],
                  "impressions": 750,
                  "valuation": 30
                },
                "date_int": 1610064000000
              },
              {
                "date": "2021-01-09T00:00:00.000Z",
                "metrics": {
                  "impact": 188,
                  "count": 1,
                  "valuation_usd": 0.34896625783602275,
                  "valuation_by_country": [
                    {
                      "argentina": 30
                    }
                  ],
                  "impressions": 750,
                  "valuation": 30
                },
                "date_int": 1610150400000
              }
            ],
            "id": 6190
          }
        ],
        "websites": [
          {
            "metrics": {
              "impact": 376,
              "count": 2,
              "valuation_usd": 0.6979325156720455,
              "valuation_by_country": [
                {
                  "argentina": 60
                }
              ],
              "impressions": 1500,
              "valuation": 60
            },
            "domain": "wildtangent.com",
            "id": 6190
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 376,
              "count": 2,
              "valuation_usd": 0.6979325156720455,
              "valuation_by_country": [
                {
                  "argentina": 60
                }
              ],
              "impressions": 1500,
              "valuation": 60
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 160,
            "height": 600
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_0d040ea31b45e49f998fc6f4daa61561.jpg"
          }
        },
        "id": 6512196,
        "ad_types": [
          {
            "metrics": {
              "impact": 376,
              "count": 2,
              "valuation_usd": 0.6979325156720455,
              "valuation_by_country": [
                {
                  "argentina": 60
                }
              ],
              "impressions": 1500,
              "valuation": 60
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 376,
          "count": 2,
          "valuation_usd": 0.6979325156720455,
          "valuation_by_country": [
            {
              "argentina": 60
            }
          ],
          "impressions": 1500,
          "valuation": 60
        },
        "id": 2,
        "name": "mobile"
      }
    ]
  }
}
```
