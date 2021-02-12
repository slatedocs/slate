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
    group_by: "day"
  },
  industries: {
    include: [
      {
        id: 204,
        name: "deportes y tiempo libre - artículos deportivos"
      }
    ]
  }
}


fetch('https://clientela.admetricks.com/industry-report/', {
    method: 'POST',
    headers: {
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify(params)
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

> Respuesta (200)

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-05T08:01:55.000Z",
      "end": "2020-12-05T08:08:05.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "id": 204,
        "name": "deportes y tiempo libre - artículos deportivos"
      }
    ],
    "websites_by_date": [
      {
        "domain": "elmostrador.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-05T00:00:00.000Z",
            "metrics": {
              "impact": 2358,
              "count": 3,
              "valuation_usd": 20.942220828111466,
              "valuation_by_country": [{ "chile": 15579 }],
              "impressions": 13737,
              "valuation": 15579
            },
            "date_int": 1607126400000
          }
        ],
        "id": 339
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2020-12-05T08:01:55.000Z",
      "end": "2020-12-05T08:08:05.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "id": 1,
        "name": "desktop"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2020-12-05T00:00:00.000Z",
          "metrics": {
            "impact": 2358,
            "valuation_usd": 20.942220828111466,
            "impressions": 13737,
            "valuation": 15579
          },
          "date_int": 1607126400000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 2358,
            "valuation_usd": 20.942220828111466,
            "impressions": 13737,
            "valuation": 15579
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 2358,
            "valuation_usd": 20.942220828111466,
            "impressions": 13737,
            "valuation": 15579
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 13737,
      "total_impact": 2358,
      "devices": [
        {
          "metrics": {
            "impact": 2358,
            "valuation_usd": 20.942220828111466,
            "impressions": 13737,
            "valuation": 15579
          },
          "id": 1,
          "name": "desktop"
        }
      ],
      "total_valuation_usd": 20.942220828111466,
      "position": {
        "first_scroll": 0.0,
        "second_scroll": 0.0,
        "third_or_more_scroll": 1.0
      },
      "total_valuation": 15579
    },
    "campaigns": [
      {
        "landing_page": "tiendasaranieto.cl",
        "description": null,
        "ad_format": { "id": 154, "name": "brand-day" },
        "title": "Tienda Sara Nieto",
        "date_range": {
          "start": "2020-12-05T08:01:55.000Z",
          "end": "2020-12-05T08:01:55.000Z"
        },
        "industry": {
          "id": 204,
          "name": "deportes y tiempo libre - artículos deportivos"
        },
        "brand": { "id": 142804, "name": "tiendas sara nieto" },
        "countries": [
          {
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 1572,
          "count": 2,
          "valuation_usd": 13.961480552074311,
          "valuation_by_country": [{ "chile": 10386 }],
          "impressions": 9158,
          "valuation": 10386
        },
        "websites": [
          {
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
            },
            "domain": "elmostrador.cl",
            "id": 339
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": { "width": 300, "height": 600 },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_54ac72545d53be8cc9f2d85c784919e3.jpg"
          }
        },
        "id": 5394307,
        "ad_types": [
          {
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
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
          "impact": 2358,
          "count": 3,
          "valuation_usd": 20.942220828111466,
          "valuation_by_country": [{ "chile": 15579 }],
          "impressions": 13737,
          "valuation": 15579
        },
        "domain": "elmostrador.cl",
        "id": 339
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-05T00:00:00.000Z",
            "metrics": {
              "impact": 1572,
              "count": 2,
              "valuation_usd": 13.961480552074311,
              "valuation_by_country": [{ "chile": 10386 }],
              "impressions": 9158,
              "valuation": 10386
            },
            "date_int": 1607126400000
          }
        ],
        "id": 142804,
        "name": "tiendas sara nieto"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 1572,
          "count": 2,
          "valuation_usd": 13.961480552074311,
          "valuation_by_country": [{ "chile": 10386 }],
          "impressions": 9158,
          "valuation": 10386
        },
        "id": 142804,
        "name": "tiendas sara nieto"
      }
    ]
  }
}
```
