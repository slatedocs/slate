> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/market-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-raw '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1,"name":"chile"}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-25T00:00:00.000","end":"2021-01-25T00:00:59.999","group_by":"day"}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1,"name":"chile"}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-25T00:00:00.000","end":"2021-01-25T00:00:59.999","group_by":"day"}}'

response = requests.post('https://clientela.admetricks.com/market-report/', headers=headers, data=data)
```

```javascript
var fetch = require("node-fetch");

fetch("https://clientela.admetricks.com/market-report/", {
  method: "POST",
  headers: {
    accept: "application/json, text/plain, */*",
    authorization: "Token YOUR_TOKEN",
    "content-type": "application/json;charset=UTF-8",
    "Content-Type": "application/json; charset=UTF-8",
  },
  body: JSON.stringify({
    order_by: "valuation",
    ad_types: { include: [{ id: 1 }, { id: 2 }, { id: 3 }] },
    countries: { include: [{ id: 1, name: "chile" }] },
    devices: { include: [{ id: 1 }, { id: 2 }] },
    date_range: {
      start: "2021-01-25T00:00:00.000",
      end: "2021-01-25T00:00:59.999",
      group_by: "day",
    },
  }),
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
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":1,"name":"chile"}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-25T00:00:00.000","end":"2021-01-25T00:00:59.999","group_by":"day"}}';

$response = Requests::post('https://clientela.admetricks.com/market-report/', $headers, $data);
```

> Respuesta (200)

```json
{
  "meta": {
    "date_range": {
      "start": "2021-01-25T00:00:01.000Z",
      "end": "2021-01-25T00:00:54.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 6418506,
          "count": 6,
          "valuation_usd": 41141.96114949372,
          "valuation_by_country": [
            {
              "chile": 30231274
            }
          ],
          "impressions": 39928338,
          "valuation": 30231274
        },
        "id": 13,
        "name": "otros"
      },
      {
        "metrics": {
          "impact": 543,
          "count": 2,
          "valuation_usd": 5.097958705478422,
          "valuation_by_country": [
            {
              "chile": 3746
            }
          ],
          "impressions": 4874,
          "valuation": 3746
        },
        "id": 319,
        "name": "educación y formación - universidades y enseñanza superior"
      }
    ],
    "date_range": {
      "start": "2021-01-25T00:00:01.000Z",
      "end": "2021-01-25T00:00:54.000Z"
    },
    "ad_types": [
      {
        "metrics": {
          "impact": 3667718,
          "count": 3,
          "valuation_usd": 22246.566373751153,
          "valuation_by_country": [
            {
              "chile": 16346864
            }
          ],
          "impressions": 19964169,
          "valuation": 16346864
        },
        "id": 2,
        "name": "video"
      },
      {
        "metrics": {
          "impact": 2752520,
          "count": 9,
          "valuation_usd": 18905.277684476998,
          "valuation_by_country": [
            {
              "chile": 13891672
            }
          ],
          "impressions": 19972993,
          "valuation": 13891672
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 6420238,
          "count": 12,
          "valuation_usd": 41151.844058228155,
          "valuation_by_country": [
            {
              "chile": 30238536
            }
          ],
          "impressions": 39937162,
          "valuation": 30238536
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "sold_by": [
      {
        "metrics": {
          "impact": 6418506,
          "count": 6,
          "valuation_usd": 41141.96114949372,
          "valuation_by_country": [
            {
              "chile": 30231274
            }
          ],
          "impressions": 39928338,
          "valuation": 30231274
        },
        "id": "not available",
        "name": "not available"
      },
      {
        "metrics": {
          "impact": 1732,
          "count": 6,
          "valuation_usd": 9.882908734432542,
          "valuation_by_country": [
            {
              "chile": 7262
            }
          ],
          "impressions": 8824,
          "valuation": 7262
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 1547203,
          "count": 4,
          "valuation_usd": 22393.337503080686,
          "valuation_by_country": [
            {
              "chile": 16454712
            }
          ],
          "impressions": 18550282,
          "valuation": 16454712
        },
        "id": 1,
        "name": "desktop"
      },
      {
        "metrics": {
          "impact": 4873035,
          "count": 8,
          "valuation_usd": 18758.506555147465,
          "valuation_by_country": [
            {
              "chile": 13783824
            }
          ],
          "impressions": 21386880,
          "valuation": 13783824
        },
        "id": 2,
        "name": "mobile"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2021-01-25T00:00:00.000Z",
          "metrics": {
            "impact": 6420238,
            "valuation_usd": 41151.844058228155,
            "impressions": 39937162,
            "valuation": 30238536
          },
          "date_int": 1611532800000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 3667718,
            "valuation_usd": 22246.566373751153,
            "impressions": 19964169,
            "valuation": 16346864
          },
          "id": 2,
          "name": "video"
        },
        {
          "metrics": {
            "impact": 2752520,
            "valuation_usd": 18905.277684476998,
            "impressions": 19972993,
            "valuation": 13891672
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 6420238,
            "valuation_usd": 41151.844058228155,
            "impressions": 39937162,
            "valuation": 30238536
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 39937162,
      "total_impact": 6420238,
      "devices": [
        {
          "metrics": {
            "impact": 1547203,
            "valuation_usd": 22393.337503080686,
            "impressions": 18550282,
            "valuation": 16454712
          },
          "id": 1,
          "name": "desktop"
        },
        {
          "metrics": {
            "impact": 4873035,
            "valuation_usd": 18758.506555147465,
            "impressions": 21386880,
            "valuation": 13783824
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 41151.844058228155,
      "position": {
        "first_scroll": 0.16666666666666666,
        "second_scroll": 0.0,
        "third_or_more_scroll": 0.8333333333333334
      },
      "total_valuation": 30238536
    },
    "campaigns": [
      {
        "landing_page": "ads.google.com/intl/es-419_cl/getstarted",
        "description": "aprendizaje | captura pantalla | diseño | dispositivo electronico | producto | sitio web | tecnología | trabajo",
        "ad_format": {
          "id": 154,
          "name": "brand-day"
        },
        "title": "Google Ads: Atrae a más clientes con publicidad en línea",
        "date_range": {
          "start": "2021-01-25T00:00:11.000Z",
          "end": "2021-01-25T00:00:11.000Z"
        },
        "industry": {
          "id": 280,
          "name": "servicios públicos y privados - consultorías y servicios empresariales"
        },
        "brand": {
          "id": 193765,
          "name": "google ads"
        },
        "countries": [
          {
            "metrics": {
              "impact": 389,
              "count": 1,
              "valuation_usd": 0.6913409029319376,
              "valuation_by_country": [
                {
                  "chile": 508
                }
              ],
              "impressions": 500,
              "valuation": 508
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 389,
              "count": 1,
              "valuation_usd": 0.6913409029319376,
              "valuation_by_country": [
                {
                  "chile": 508
                }
              ],
              "impressions": 500,
              "valuation": 508
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 389,
          "count": 1,
          "valuation_usd": 0.6913409029319376,
          "valuation_by_country": [
            {
              "chile": 508
            }
          ],
          "impressions": 500,
          "valuation": 508
        },
        "websites": [
          {
            "metrics": {
              "impact": 389,
              "count": 1,
              "valuation_usd": 0.6913409029319376,
              "valuation_by_country": [
                {
                  "chile": 508
                }
              ],
              "impressions": 500,
              "valuation": 508
            },
            "domain": "webdelabelleza.com",
            "id": 46
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 389,
              "count": 1,
              "valuation_usd": 0.6913409029319376,
              "valuation_by_country": [
                {
                  "chile": 508
                }
              ],
              "impressions": 500,
              "valuation": 508
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 468,
            "height": 637
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_cbeb8be51ee8179ced68fbd1a5967f03.jpg"
          }
        },
        "id": 6863067,
        "ad_types": [
          {
            "metrics": {
              "impact": 389,
              "count": 1,
              "valuation_usd": 0.6913409029319376,
              "valuation_by_country": [
                {
                  "chile": 508
                }
              ],
              "impressions": 500,
              "valuation": 508
            },
            "id": 1,
            "name": "display"
          }
        ]
      },
      {
        "landing_page": "satellite-map.gosur.com/es",
        "description": "azul | captura pantalla | documento | línea | marca | paralelo",
        "title": "Mapa Satelital",
        "date_range": {
          "start": "2021-01-25T00:00:09.000Z",
          "end": "2021-01-25T00:00:09.000Z"
        },
        "industry": {
          "id": 298,
          "name": "transporte, viajes y turismo - varios"
        },
        "brand": {
          "id": 72828,
          "name": "go sur"
        },
        "countries": [
          {
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 214,
          "count": 2,
          "valuation_usd": 0.4708739220756898,
          "valuation_by_country": [
            {
              "chile": 346
            }
          ],
          "impressions": 450,
          "valuation": 346
        },
        "websites": [
          {
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "domain": "americadigital.com",
            "id": 7419
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 468,
            "height": 390
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_26d09292f03c4883324bd4c07e2384a6.jpg"
          }
        },
        "id": 7680906,
        "ad_types": [
          {
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "websites_by_date": [
      {
        "domain": "facebook.com",
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 5371990,
              "count": 4,
              "valuation_usd": 24160.20751941778,
              "valuation_by_country": [
                {
                  "chile": 17753015
                }
              ],
              "impressions": 27381070,
              "valuation": 17753015
            },
            "date_int": 1611532800000
          }
        ],
        "id": 144
      },
      {
        "domain": "youtube.com",
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 1046516,
              "count": 2,
              "valuation_usd": 16981.75363007594,
              "valuation_by_country": [
                {
                  "chile": 12478259
                }
              ],
              "impressions": 12547268,
              "valuation": 12478259
            },
            "date_int": 1611532800000
          }
        ],
        "id": 147
      },
      {
        "domain": "americadigital.com",
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 214,
              "count": 2,
              "valuation_usd": 0.4708739220756898,
              "valuation_by_country": [
                {
                  "chile": 346
                }
              ],
              "impressions": 450,
              "valuation": 346
            },
            "date_int": 1611532800000
          }
        ],
        "id": 7419
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 5371990,
          "count": 4,
          "valuation_usd": 24160.20751941778,
          "valuation_by_country": [
            {
              "chile": 17753015
            }
          ],
          "impressions": 27381070,
          "valuation": 17753015
        },
        "domain": "facebook.com",
        "id": 144
      },
      {
        "metrics": {
          "impact": 1046516,
          "count": 2,
          "valuation_usd": 16981.75363007594,
          "valuation_by_country": [
            {
              "chile": 12478259
            }
          ],
          "impressions": 12547268,
          "valuation": 12478259
        },
        "domain": "youtube.com",
        "id": 147
      },
      {
        "metrics": {
          "impact": 214,
          "count": 2,
          "valuation_usd": 0.4708739220756898,
          "valuation_by_country": [
            {
              "chile": 346
            }
          ],
          "impressions": 450,
          "valuation": 346
        },
        "domain": "americadigital.com",
        "id": 7419
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 6418506,
              "count": 6,
              "valuation_usd": 41141.96114949372,
              "valuation_by_country": [
                {
                  "chile": 30231274
                }
              ],
              "impressions": 39928338,
              "valuation": 30231274
            },
            "date_int": 1611532800000
          }
        ],
        "id": 186036,
        "name": "other-brand"
      },
      {
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 543,
              "count": 2,
              "valuation_usd": 5.097958705478422,
              "valuation_by_country": [
                {
                  "chile": 3746
                }
              ],
              "impressions": 4874,
              "valuation": 3746
            },
            "date_int": 1611532800000
          }
        ],
        "id": 22818,
        "name": "universidad viña del mar  uvm"
      },
      {
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 586,
              "count": 1,
              "valuation_usd": 3.6227352039464917,
              "valuation_by_country": [
                {
                  "chile": 2662
                }
              ],
              "impressions": 3000,
              "valuation": 2662
            },
            "date_int": 1611532800000
          }
        ],
        "id": 269291,
        "name": "avanza centro ecográfico"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 6418506,
          "count": 6,
          "valuation_usd": 41141.96114949372,
          "valuation_by_country": [
            {
              "chile": 30231274
            }
          ],
          "impressions": 39928338,
          "valuation": 30231274
        },
        "id": 186036,
        "name": "other-brand"
      },
      {
        "metrics": {
          "impact": 543,
          "count": 2,
          "valuation_usd": 5.097958705478422,
          "valuation_by_country": [
            {
              "chile": 3746
            }
          ],
          "impressions": 4874,
          "valuation": 3746
        },
        "id": 22818,
        "name": "universidad viña del mar  uvm"
      },
      {
        "metrics": {
          "impact": 586,
          "count": 1,
          "valuation_usd": 3.6227352039464917,
          "valuation_by_country": [
            {
              "chile": 2662
            }
          ],
          "impressions": 3000,
          "valuation": 2662
        },
        "id": 269291,
        "name": "avanza centro ecográfico"
      }
    ],
    "industries_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 6418506,
              "count": 6,
              "valuation_usd": 41141.96114949372,
              "valuation_by_country": [
                {
                  "chile": 30231274
                }
              ],
              "impressions": 39928338,
              "valuation": 30231274
            },
            "date_int": 1611532800000
          }
        ],
        "id": 13,
        "name": "otros"
      },
      {
        "metrics_by_date": [
          {
            "date": "2021-01-25T00:00:00.000Z",
            "metrics": {
              "impact": 543,
              "count": 2,
              "valuation_usd": 5.097958705478422,
              "valuation_by_country": [
                {
                  "chile": 3746
                }
              ],
              "impressions": 4874,
              "valuation": 3746
            },
            "date_int": 1611532800000
          }
        ],
        "id": 319,
        "name": "educación y formación - universidades y enseñanza superior"
      }
    ]
  }
}
```
