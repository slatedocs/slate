> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/campaign-report/' \
-H 'accept: application/json, text/plain, */*' \
-H 'authorization: Token YOUR_TOKEN' \
-H 'content-type: application/json;charset=UTF-8' \
--data-binary '{
    "order_by": "valuation",
    "search_term": "a",
    "campaigns": {"include": [{"id": 4394864}]},
    "ad_types": {"include": [{"id": 1},{"id": 2},{"id": 3}]},
    "countries": {"include": [{"id": 4}]},
    "devices": {"include": [{"id": 1},{"id": 2}]},
    "date_range": {"start": "2020-12-28T00:00:00.000","end": "2020-12-30T23:59:59.999","group_by": "day"}
}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{ "order_by": "valuation", "search_term": "a", "campaigns": {"include": [{"id": 4394864}]}, "ad_types": {"include": [{"id": 1},{"id": 2},{"id": 3}]}, "countries": {"include": [{"id": 4}]}, "devices": {"include": [{"id": 1},{"id": 2}]}, "date_range": {"start": "2020-12-28T00:00:00.000","end": "2020-12-30T23:59:59.999","group_by": "day"} }'

response = requests.post('https://clientela.admetricks.com/campaign-report/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/campaign-report/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({ "order_by": "valuation", "search_term": "a", "campaigns": {"include": [{"id": 4394864}]}, "ad_types": {"include": [{"id": 1},{"id": 2},{"id": 3}]}, "countries": {"include": [{"id": 4}]}, "devices": {"include": [{"id": 1},{"id": 2}]}, "date_range": {"start": "2020-12-28T00:00:00.000","end": "2020-12-30T23:59:59.999","group_by": "day"} })
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
$data = '{ "order_by": "valuation", "search_term": "a", "campaigns": {"include": [{"id": 4394864}]}, "ad_types": {"include": [{"id": 1},{"id": 2},{"id": 3}]}, "countries": {"include": [{"id": 4}]}, "devices": {"include": [{"id": 1},{"id": 2}]}, "date_range": {"start": "2020-12-28T00:00:00.000","end": "2020-12-30T23:59:59.999","group_by": "day"} }';
$response = Requests::post('https://clientela.admetricks.com/campaign-report/', $headers, $data);
```

> Respuesta (200)

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-29T00:25:40.000Z",
      "end": "2020-12-30T17:25:27.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 79553,
          "count": 405,
          "valuation_usd": 2478.1347373241542,
          "valuation_by_country": [{"chile": 1724529}],
          "impressions": 684353,
          "valuation": 1724529
        },
        "id": 221,
        "name": "energía - energía domestica"
      }
    ],
    "websites_by_date": [
      {
        "domain": "biobiochile.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 8660,
              "count": 18,
              "valuation_usd": 122.17307761556899,
              "valuation_by_country": [{"chile": 85020}],
              "impressions": 44320,
              "valuation": 85020
            },
            "date_int": 1609200000000
          },
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 27291,
              "count": 34,
              "valuation_usd": 833.8664610353807,
              "valuation_by_country": [{"chile": 580286}],
              "impressions": 283639,
              "valuation": 580286
            },
            "date_int": 1609286400000
          }
        ],
        "id": 448
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 79553,
          "count": 405,
          "valuation_usd": 2478.1347373241542,
          "valuation_by_country": [{"chile": 1724529}],
          "impressions": 684353,
          "valuation": 1724529
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 79553,
          "count": 405,
          "valuation_usd": 2478.1347373241542,
          "valuation_by_country": [{"chile": 1724529}],
          "impressions": 684353,
          "valuation": 1724529
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {"start": "2020-12-29T00:25:40.000Z", "end": "2020-12-30T17:25:27.000Z"},
    "sold_by": [
      {
        "metrics": {
          "impact": 74222,
          "count": 345,
          "valuation_usd": 2198.886915318999,
          "valuation_by_country": [{"chile": 1530201}],
          "impressions": 629810,
          "valuation": 1530201
        },
        "id": "direct",
        "name": "direct"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 52165,
          "count": 342,
          "valuation_usd": 1340.7007981372303,
          "valuation_by_country": [{"chile": 932991}],
          "impressions": 285086,
          "valuation": 932991
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
            "impact": 43310,
            "valuation_usd": 1268.161431423117,
            "impressions": 285382,
            "valuation": 882511
          },
          "date_int": 1609200000000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 79553,
            "valuation_usd": 2478.1347373241542,
            "impressions": 684353,
            "valuation": 1724529
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 79553,
            "valuation_usd": 2478.1347373241542,
            "impressions": 684353,
            "valuation": 1724529
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 684353,
      "total_impact": 79553,
      "devices": [
        {
          "metrics": {
            "impact": 52165,
            "valuation_usd": 1340.7007981372303,
            "impressions": 285086,
            "valuation": 932991
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 2478.1347373241542,
      "position": {
        "first_scroll": 0.1493600385583463,
        "second_scroll": 0.12472802595046056,
        "third_or_more_scroll": 0.7210009104053982
      },
      "total_valuation": 1724529
    },
    "campaigns": [
      {
        "landing_page": "enel.cl/es/conoce-enel/prensa/news/d202011-hito-historico-para-enel-lider-del-dow-jones-sustainability-world-index-de-2020.html",
        "description": "feliz | fotografía | mañana | mundo | paisaje | pie foto | prenda pieza | ropa formal | vestido | viento",
        "ad_format": { "id": 154, "name": "brand-day" },
        "title": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020",
        "date_range": { "start": "2020-12-29T00:25:40.000Z", "end": "2020-12-30T17:25:27.000Z" },
        "industry": { "id": 221, "name": "energía - energía domestica"},
        "brand": { "id": 8968, "name": "enel"},
        "countries": [
          {
            "metrics": {
              "impact": 46444,
              "count": 351,
              "valuation_usd": 1563.2334116346076,
              "valuation_by_country": [{"chile": 1087851}],
              "impressions": 370893,
              "valuation": 1087851
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 35492,
              "count": 293,
              "valuation_usd": 1105.524090192201,
              "valuation_by_country": [{"chile": 769332}],
              "impressions": 199766,
              "valuation": 769332
            },
            "id": 2,
            "name": "mobile"
          },
          {
            "metrics": {
              "impact": 10952,
              "count": 58,
              "valuation_usd": 457.7093214424067,
              "valuation_by_country": [{"chile": 318519}],
              "impressions": 171127,
              "valuation": 318519
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 46444,
          "count": 351,
          "valuation_usd": 1563.2334116346076,
          "valuation_by_country": [{"chile": 1087851}],
          "impressions": 370893,
          "valuation": 1087851
        },
        "websites": [
          {
            "metrics": {
              "impact": 3096,
              "count": 238,
              "valuation_usd": 230.84705041908606,
              "valuation_by_country": [{"chile": 160646}],
              "impressions": 19912,
              "valuation": 160646
            },
            "domain": "duna.cl",
            "id": 475
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 41299,
              "count": 294,
              "valuation_usd": 1285.4556326593363,
              "valuation_by_country": [{"chile": 894546}],
              "impressions": 317250,
              "valuation": 894546
            },
            "id": "direct",
            "name": "direct"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 300,
            "height": 250
          },
          "ad_file": { "name": "https://ads.admetricks.com/banner_c4420d89bb6b5b5a1d348488ace3f8f0.jpg" }
        },
        "id": 7852217,
        "ad_types": [
          {
            "metrics": {
              "impact": 46444,
              "count": 351,
              "valuation_usd": 1563.2334116346076,
              "valuation_by_country": [{"chile": 1087851}],
              "impressions": 370893,
              "valuation": 1087851
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "campaigns_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 35746,
              "count": 242,
              "valuation_usd": 1162.5022682742397,
              "valuation_by_country": [{"chile": 808983}],
              "impressions": 246627,
              "valuation": 808983
            },
            "date_int": 1609200000000
          }
        ],
        "id": 7852217,
        "name": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020"
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 35951,
          "count": 52,
          "valuation_usd": 956.0395386509497,
          "valuation_by_country": [{"chile": 665306}],
          "impressions": 327959,
          "valuation": 665306
        },
        "domain": "biobiochile.cl",
        "id": 448
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 79553,
          "count": 405,
          "valuation_usd": 2478.1347373241542,
          "valuation_by_country": [{"chile": 1724529}],
          "impressions": 684353,
          "valuation": 1724529
        },
        "id": 8968,
        "name": "enel"
      }
    ]
  }
}
```
