> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/brand-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-30T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":8968,"name":"enel"}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"}]}}'

response = requests.post('https://clientela.admetricks.com/brand-report/', headers=headers, data=data)

```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/brand-report/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"}]}})
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
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-30T23:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"}]}}';
$response = Requests::post('https://clientela.admetricks.com/brand-report/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-30T00:34:01.000Z",
      "end": "2020-12-30T17:25:27.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 49885,
          "count": 142,
          "valuation_usd": 1385.7568036367722,
          "valuation_by_country": [{ "chile": 1010642 }],
          "impressions": 469092,
          "valuation": 1010642
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
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 40936,
              "count": 34,
              "valuation_usd": 1010.1961176972326,
              "valuation_by_country": [{ "chile": 736743 }],
              "impressions": 353745,
              "valuation": 736743
            },
            "date_int": 1609286400000
          }
        ],
        "id": 448
      },
      {
        "domain": "eldinamo.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 5510,
              "count": 19,
              "valuation_usd": 176.7376667124119,
              "valuation_by_country": [{ "chile": 128896 }],
              "impressions": 88103,
              "valuation": 128896
            },
            "date_int": 1609286400000
          }
        ],
        "id": 495
      },
      {
        "domain": "duna.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 1805,
              "count": 75,
              "valuation_usd": 164.68649869528656,
              "valuation_by_country": [{ "chile": 120107 }],
              "impressions": 13696,
              "valuation": 120107
            },
            "date_int": 1609286400000
          }
        ],
        "id": 475
      },
      {
        "domain": "radioagricultura.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 75,
              "count": 1,
              "valuation_usd": 9.768178513369092,
              "valuation_by_country": [{ "chile": 7124 }],
              "impressions": 950,
              "valuation": 7124
            },
            "date_int": 1609286400000
          }
        ],
        "id": 505
      },
      {
        "domain": "elnaveghable.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 108,
              "count": 1,
              "valuation_usd": 9.439098945260083,
              "valuation_by_country": [{ "chile": 6884 }],
              "impressions": 1500,
              "valuation": 6884
            },
            "date_int": 1609286400000
          }
        ],
        "id": 489
      },
      {
        "domain": "aqua.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 437,
              "count": 2,
              "valuation_usd": 7.289112433614555,
              "valuation_by_country": [{ "chile": 5316 }],
              "impressions": 5657,
              "valuation": 5316
            },
            "date_int": 1609286400000
          }
        ],
        "id": 498
      },
      {
        "domain": "aciprensa.com",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 433,
              "count": 2,
              "valuation_usd": 2.3542900768465373,
              "valuation_by_country": [{ "chile": 1717 }],
              "impressions": 2211,
              "valuation": 1717
            },
            "date_int": 1609286400000
          }
        ],
        "id": 4839
      },
      {
        "domain": "lared.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 41,
              "count": 1,
              "valuation_usd": 1.2367907101430264,
              "valuation_by_country": [{ "chile": 902 }],
              "impressions": 207,
              "valuation": 902
            },
            "date_int": 1609286400000
          }
        ],
        "id": 722
      },
      {
        "domain": "as.com",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 219,
              "count": 1,
              "valuation_usd": 1.1792017857239498,
              "valuation_by_country": [{ "chile": 860 }],
              "impressions": 1119,
              "valuation": 860
            },
            "date_int": 1609286400000
          }
        ],
        "id": 851
      },
      {
        "domain": "df.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 58,
              "count": 1,
              "valuation_usd": 1.0036926827324784,
              "valuation_by_country": [{ "chile": 732 }],
              "impressions": 296,
              "valuation": 732
            },
            "date_int": 1609286400000
          }
        ],
        "id": 464
      },
      {
        "domain": "mch.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 168,
              "count": 2,
              "valuation_usd": 0.9008553176984129,
              "valuation_by_country": [{ "chile": 657 }],
              "impressions": 855,
              "valuation": 657
            },
            "date_int": 1609286400000
          }
        ],
        "id": 496
      },
      {
        "domain": "popsugar.com",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 31,
              "count": 1,
              "valuation_usd": 0.49087702242927217,
              "valuation_by_country": [{ "chile": 358 }],
              "impressions": 429,
              "valuation": 358
            },
            "date_int": 1609286400000
          }
        ],
        "id": 887
      },
      {
        "domain": "enlacejudio.com",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 54,
              "count": 1,
              "valuation_usd": 0.29068695182962484,
              "valuation_by_country": [{ "chile": 212 }],
              "impressions": 274,
              "valuation": 212
            },
            "date_int": 1609286400000
          }
        ],
        "id": 10423
      },
      {
        "domain": "elmorrocotudo.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 10,
              "count": 1,
              "valuation_usd": 0.18373609219419684,
              "valuation_by_country": [{ "chile": 134 }],
              "impressions": 50,
              "valuation": 134
            },
            "date_int": 1609286400000
          }
        ],
        "id": 453
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 49885,
          "count": 142,
          "valuation_usd": 1385.7568036367722,
          "valuation_by_country": [{ "chile": 1010642 }],
          "impressions": 469092,
          "valuation": 1010642
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 49885,
          "count": 142,
          "valuation_usd": 1385.7568036367722,
          "valuation_by_country": [
            {
              "chile": 1010642
            }
          ],
          "impressions": 469092,
          "valuation": 1010642
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2020-12-30T00:34:01.000Z",
      "end": "2020-12-30T17:25:27.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 48206,
          "count": 130,
          "valuation_usd": 1349.6074130799977,
          "valuation_by_country": [{ "chile": 984278 }],
          "impressions": 453003,
          "valuation": 984278
        },
        "id": "direct",
        "name": "direct"
      },
      {
        "metrics": {
          "impact": 1406,
          "count": 10,
          "valuation_usd": 34.679501819221095,
          "valuation_by_country": [{ "chile": 25292 }],
          "impressions": 14696,
          "valuation": 25292
        },
        "id": "unknown",
        "name": "unknown"
      },
      {
        "metrics": {
          "impact": 273,
          "count": 2,
          "valuation_usd": 1.4698887375535747,
          "valuation_by_country": [{ "chile": 1072 }],
          "impressions": 1393,
          "valuation": 1072
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 22870,
          "count": 41,
          "valuation_usd": 938.256581778869,
          "valuation_by_country": [{ "chile": 684277 }],
          "impressions": 330589,
          "valuation": 684277
        },
        "id": 1,
        "name": "desktop"
      },
      {
        "metrics": {
          "impact": 27015,
          "count": 101,
          "valuation_usd": 447.5002218579034,
          "valuation_by_country": [{ "chile": 326365 }],
          "impressions": 138503,
          "valuation": 326365
        },
        "id": 2,
        "name": "mobile"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2020-12-30T00:00:00.000Z",
          "metrics": {
            "impact": 49885,
            "valuation_usd": 1385.7568036367722,
            "impressions": 469092,
            "valuation": 1010642
          },
          "date_int": 1609286400000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 49885,
            "valuation_usd": 1385.7568036367722,
            "impressions": 469092,
            "valuation": 1010642
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 49885,
            "valuation_usd": 1385.7568036367722,
            "impressions": 469092,
            "valuation": 1010642
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 469092,
      "total_impact": 49885,
      "devices": [
        {
          "metrics": {
            "impact": 22870,
            "valuation_usd": 938.256581778869,
            "impressions": 330589,
            "valuation": 684277
          },
          "id": 1,
          "name": "desktop"
        },
        {
          "metrics": {
            "impact": 27015,
            "valuation_usd": 447.5002218579034,
            "impressions": 138503,
            "valuation": 326365
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 1385.7568036367722,
      "position": {
        "first_scroll": 0.2112676056338028,
        "second_scroll": 0.1267605633802817,
        "third_or_more_scroll": 0.6549295774647887
      },
      "total_valuation": 1010642
    },
    "campaigns": [
      {
        "landing_page": "enel.cl/es/conoce-enel/plan-de-invierno.html",
        "description": "aprendizaje | medios comunicación | trabajo",
        "title": "Plan de Invierno - enel.cl",
        "date_range": {
          "start": "2020-12-30T06:00:50.000Z",
          "end": "2020-12-30T13:48:20.000Z"
        },
        "industry": {
          "id": 221,
          "name": "energía - energía domestica"
        },
        "brand": {
          "id": 8968,
          "name": "enel"
        },
        "countries": [
          {
            "metrics": {
              "impact": 39178,
              "count": 33,
              "valuation_usd": 986.5846586854112,
              "valuation_by_country": [{ "chile": 719523 }],
              "impressions": 344769,
              "valuation": 719523
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 22903,
              "count": 32,
              "valuation_usd": 338.0689249778537,
              "valuation_by_country": [{ "chile": 246556 }],
              "impressions": 117130,
              "valuation": 246556
            },
            "id": 2,
            "name": "mobile"
          },
          {
            "metrics": {
              "impact": 16275,
              "count": 1,
              "valuation_usd": 648.5157337075575,
              "valuation_by_country": [{ "chile": 472967 }],
              "impressions": 227639,
              "valuation": 472967
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 39178,
          "count": 33,
          "valuation_usd": 986.5846586854112,
          "valuation_by_country": [{ "chile": 719523 }],
          "impressions": 344769,
          "valuation": 719523
        },
        "websites": [
          {
            "metrics": {
              "impact": 39178,
              "count": 33,
              "valuation_usd": 986.5846586854112,
              "valuation_by_country": [{ "chile": 719523 }],
              "impressions": 344769,
              "valuation": 719523
            },
            "domain": "biobiochile.cl",
            "id": 448
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 39178,
              "count": 33,
              "valuation_usd": 986.5846586854112,
              "valuation_by_country": [{ "chile": 719523 }],
              "impressions": 344769,
              "valuation": 719523
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
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_098a2d780f8592ad1c2af186ae571c7d.jpg"
          }
        },
        "id": 7418419,
        "ad_types": [
          {
            "metrics": {
              "impact": 39178,
              "count": 33,
              "valuation_usd": 986.5846586854112,
              "valuation_by_country": [{ "chile": 719523 }],
              "impressions": 344769,
              "valuation": 719523
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "campaigns_with_websites_by_date": [
      {
        "landing_page": "7418419",
        "description": null,
        "title": "Plan de Invierno - enel.cl",
        "brand": {
          "id": 8968,
          "name": "enel"
        },
        "metrics": {
          "impact": 39178,
          "count": 33,
          "valuation_usd": 986.5846586854112,
          "valuation_by_country": [{ "chile": 719523 }],
          "impressions": 344769,
          "valuation": 719523
        },
        "websites_by_date": [
          {
            "domain": "biobiochile.cl",
            "metrics_by_date": [
              {
                "date": "2020-12-30T00:00:00.000Z",
                "metrics": {
                  "impact": 39178,
                  "count": 33,
                  "valuation_usd": 986.5846586854112,
                  "valuation_by_country": [{ "chile": 719523 }],
                  "impressions": 344769,
                  "valuation": 719523
                },
                "date_int": 1609286400000
              }
            ],
            "id": 448
          }
        ],
        "id": 7418419
      }
    ],
    "campaigns_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 39178,
              "count": 33,
              "valuation_usd": 986.5846586854112,
              "valuation_by_country": [{ "chile": 719523 }],
              "impressions": 344769,
              "valuation": 719523
            },
            "date_int": 1609286400000
          }
        ],
        "id": 7418419,
        "name": "Plan de Invierno - enel.cl"
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 40936,
          "count": 34,
          "valuation_usd": 1010.1961176972326,
          "valuation_by_country": [{ "chile": 736743 }],
          "impressions": 353745,
          "valuation": 736743
        },
        "domain": "biobiochile.cl",
        "id": 448
      },
      {
        "metrics": {
          "impact": 5510,
          "count": 19,
          "valuation_usd": 176.7376667124119,
          "valuation_by_country": [{ "chile": 128896 }],
          "impressions": 88103,
          "valuation": 128896
        },
        "domain": "eldinamo.cl",
        "id": 495
      },
      {
        "metrics": {
          "impact": 1805,
          "count": 75,
          "valuation_usd": 164.68649869528656,
          "valuation_by_country": [{ "chile": 120107 }],
          "impressions": 13696,
          "valuation": 120107
        },
        "domain": "duna.cl",
        "id": 475
      },
      {
        "metrics": {
          "impact": 75,
          "count": 1,
          "valuation_usd": 9.768178513369092,
          "valuation_by_country": [{ "chile": 7124 }],
          "impressions": 950,
          "valuation": 7124
        },
        "domain": "radioagricultura.cl",
        "id": 505
      },
      {
        "metrics": {
          "impact": 108,
          "count": 1,
          "valuation_usd": 9.439098945260083,
          "valuation_by_country": [{ "chile": 6884 }],
          "impressions": 1500,
          "valuation": 6884
        },
        "domain": "elnaveghable.cl",
        "id": 489
      },
      {
        "metrics": {
          "impact": 437,
          "count": 2,
          "valuation_usd": 7.289112433614555,
          "valuation_by_country": [{ "chile": 5316 }],
          "impressions": 5657,
          "valuation": 5316
        },
        "domain": "aqua.cl",
        "id": 498
      },
      {
        "metrics": {
          "impact": 433,
          "count": 2,
          "valuation_usd": 2.3542900768465373,
          "valuation_by_country": [{ "chile": 1717 }],
          "impressions": 2211,
          "valuation": 1717
        },
        "domain": "aciprensa.com",
        "id": 4839
      },
      {
        "metrics": {
          "impact": 41,
          "count": 1,
          "valuation_usd": 1.2367907101430264,
          "valuation_by_country": [{ "chile": 902 }],
          "impressions": 207,
          "valuation": 902
        },
        "domain": "lared.cl",
        "id": 722
      },
      {
        "metrics": {
          "impact": 219,
          "count": 1,
          "valuation_usd": 1.1792017857239498,
          "valuation_by_country": [{ "chile": 860 }],
          "impressions": 1119,
          "valuation": 860
        },
        "domain": "as.com",
        "id": 851
      },
      {
        "metrics": {
          "impact": 58,
          "count": 1,
          "valuation_usd": 1.0036926827324784,
          "valuation_by_country": [{ "chile": 732 }],
          "impressions": 296,
          "valuation": 732
        },
        "domain": "df.cl",
        "id": 464
      },
      {
        "metrics": {
          "impact": 168,
          "count": 2,
          "valuation_usd": 0.9008553176984129,
          "valuation_by_country": [{ "chile": 657 }],
          "impressions": 855,
          "valuation": 657
        },
        "domain": "mch.cl",
        "id": 496
      },
      {
        "metrics": {
          "impact": 31,
          "count": 1,
          "valuation_usd": 0.49087702242927217,
          "valuation_by_country": [{ "chile": 358 }],
          "impressions": 429,
          "valuation": 358
        },
        "domain": "popsugar.com",
        "id": 887
      },
      {
        "metrics": {
          "impact": 54,
          "count": 1,
          "valuation_usd": 0.29068695182962484,
          "valuation_by_country": [{ "chile": 212 }],
          "impressions": 274,
          "valuation": 212
        },
        "domain": "enlacejudio.com",
        "id": 10423
      },
      {
        "metrics": {
          "impact": 10,
          "count": 1,
          "valuation_usd": 0.18373609219419684,
          "valuation_by_country": [{ "chile": 134 }],
          "impressions": 50,
          "valuation": 134
        },
        "domain": "elmorrocotudo.cl",
        "id": 453
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 49885,
          "count": 142,
          "valuation_usd": 1385.7568036367722,
          "valuation_by_country": [{ "chile": 1010642 }],
          "impressions": 469092,
          "valuation": 1010642
        },
        "id": 8968,
        "name": "enel"
      }
    ]
  }
}
```
