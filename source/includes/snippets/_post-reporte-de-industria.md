> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/industry-report/' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","new_campaigns":1,"ad_format":1,"ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1}]},"date_range":{"start":"2020-11-23T00:00:00.000","end":"2020-11-24T23:59:59.999","group_by":"day"},"industries":{"include":[{"id":204,"name":"deportes y tiempo libre - artículos deportivos"}]}}'
```

```python
import requests

headers = {
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}


data = {
    "order_by": "valuation",
    "new_campaigns": 1,
    "ad_format": 1,
    "ad_types": { "include": [{ "id": 1 }] },
    "countries": { "include": [{ "id": 1 }] },
    "devices": { "include": [{ "id": 1 }] },
    "date_range": {
        "start": "2020-11-23T00:00:00.000",
        "end": "2020-11-24T23:59:59.999",
        "group_by": "day"
    },
    "industries": {
        "include": [{
            "id": 204,
            "name": "deportes y tiempo libre - artículos deportivos"
        }]
}

response = requests.post(
    'https://clientela.admetricks.com/industry-report/',
    headers=headers,
    data=data
)
```

```javascript
const params = {
  order_by: "valuation",
  new_campaigns: 1,
  ad_format: 1,
  ad_types: { include: [{ id: 1 }] },
  countries: { include: [{ id: 1 }] },
  devices: { include: [{ id: 1 }] },
  date_range: {
    start: "2020-11-23T00:00:00.000",
    end: "2020-11-24T23:59:59.999",
    group_by: "day",
  },
  industries: {
    include: [
      {
        id: 204,
        name: "deportes y tiempo libre - artículos deportivos",
      },
    ],
  },
};

fetch("https://clientela.admetricks.com/industry-report/", {
  method: "POST",
  headers: {
    authorization: "Token YOUR_TOKEN",
    "content-type": "application/json;charset=UTF-8",
    "Content-Type": "application/json; charset=UTF-8",
  },
  body: JSON.stringify(params),
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
$data = '{"order_by":"valuation","new_campaigns":1,"ad_format":1,"ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1}]},"date_range":{"start":"2020-11-23T00:00:00.000","end":"2020-11-24T23:59:59.999","group_by":"day"},"industries":{"include":[{"id":204,"name":"deportes y tiempo libre - art\xEDculos deportivos"}]}}';

$response = Requests::post('https://clientela.admetricks.com/industry-report/', $headers, $data);

?>
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2020-11-23T11:06:44.000Z",
      "end": "2020-11-23T11:06:44.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": 204,
        "name": "deportes y tiempo libre - artículos deportivos"
      }
    ],
    "websites_by_date": [
      {
        "domain": "clarin.com",
        "metrics_by_date": [
          {
            "date": "2020-11-23T00:00:00.000Z",
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "date_int": 1606089600000
          }
        ],
        "id": 365
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2020-11-23T11:06:44.000Z",
      "end": "2020-11-23T11:06:44.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": 1,
        "name": "desktop"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2020-11-23T00:00:00.000Z",
          "metrics": {
            "impact": 8152,
            "valuation_usd": 54.44819822133432,
            "impressions": 29387,
            "valuation": 38163
          },
          "date_int": 1606089600000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 8152,
            "valuation_usd": 54.44819822133432,
            "impressions": 29387,
            "valuation": 38163
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 8152,
            "valuation_usd": 54.44819822133432,
            "impressions": 29387,
            "valuation": 38163
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 29387,
      "total_impact": 8152,
      "devices": [
        {
          "metrics": {
            "impact": 8152,
            "valuation_usd": 54.44819822133432,
            "impressions": 29387,
            "valuation": 38163
          },
          "id": 1,
          "name": "desktop"
        }
      ],
      "total_valuation_usd": 54.44819822133432,
      "position": {
        "first_scroll": 0.0,
        "second_scroll": 0.0,
        "third_or_more_scroll": 1.0
      },
      "total_valuation": 38163
    },
    "campaigns": [
      {
        "landing_page": "gympro.cl/deportes-y-fitness/peto-de-entrenamiento-mitre-junior-amarillo.html",
        "description": null,
        "ad_format": {
          "id": 154,
          "name": "brand-day"
        },
        "title": "Peto Deportivo, Peto Polera de Entrenamiento - Mitre",
        "date_range": {
          "start": "2020-11-23T11:06:44.000Z",
          "end": "2020-11-23T11:06:44.000Z"
        },
        "industry": {
          "id": 204,
          "name": "deportes y tiempo libre - artículos deportivos"
        },
        "brand": {
          "id": 141894,
          "name": "gympro"
        },
        "countries": [
          {
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "websites": [
          {
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "domain": "clarin.com",
            "id": 365
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 970,
            "height": 300
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_145e33725b203c379d1e3aaf7bbdf5cf.jpg"
          }
        },
        "id": 7797882,
        "ad_types": [
          {
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
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
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "domain": "clarin.com",
        "id": 365
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-11-23T00:00:00.000Z",
            "metrics": {
              "impact": 8152,
              "count": 1,
              "valuation_usd": 54.44819822133432,
              "valuation_by_country": [
                {
                  "chile": 38163
                }
              ],
              "impressions": 29387,
              "valuation": 38163
            },
            "date_int": 1606089600000
          }
        ],
        "id": 141894,
        "name": "gympro"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 54.44819822133432,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "id": 141894,
        "name": "gympro"
      }
    ]
  }
}
```
