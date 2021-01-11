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

> Respuesta (200)

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
          "impact": 36243,
          "count": 142,
          "valuation_usd": 1209.973305901037,
          "valuation_by_country": [
            {
              "chile": 842018
            }
          ],
          "impressions": 398971,
          "valuation": 842018
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
              "impact": 27291,
              "count": 34,
              "valuation_usd": 833.8664610353807,
              "valuation_by_country": [
                {
                  "chile": 580286
                }
              ],
              "impressions": 283639,
              "valuation": 580286
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
              "valuation_usd": 185.46827344870198,
              "valuation_by_country": [
                {
                  "chile": 129067
                }
              ],
              "impressions": 88217,
              "valuation": 129067
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
              "impact": 1712,
              "count": 75,
              "valuation_usd": 153.28395894204593,
              "valuation_by_country": [
                {
                  "chile": 106670
                }
              ],
              "impressions": 12992,
              "valuation": 106670
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
              "impact": 80,
              "count": 1,
              "valuation_usd": 11.013108290351926,
              "valuation_by_country": [
                {
                  "chile": 7664
                }
              ],
              "impressions": 1022,
              "valuation": 7664
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
              "valuation_usd": 9.892254367273312,
              "valuation_by_country": [
                {
                  "chile": 6884
                }
              ],
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
              "impact": 441,
              "count": 2,
              "valuation_usd": 7.720959139360764,
              "valuation_by_country": [
                {
                  "chile": 5373
                }
              ],
              "impressions": 5718,
              "valuation": 5373
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
              "impact": 502,
              "count": 2,
              "valuation_usd": 2.8624884804776927,
              "valuation_by_country": [
                {
                  "chile": 1992
                }
              ],
              "impressions": 2563,
              "valuation": 1992
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
              "impact": 42,
              "count": 1,
              "valuation_usd": 1.3349657622308115,
              "valuation_by_country": [
                {
                  "chile": 929
                }
              ],
              "impressions": 213,
              "valuation": 929
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
              "impact": 221,
              "count": 1,
              "valuation_usd": 1.2458722452681523,
              "valuation_by_country": [
                {
                  "chile": 867
                }
              ],
              "impressions": 1128,
              "valuation": 867
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
              "impact": 65,
              "count": 1,
              "valuation_usd": 1.1682746659780945,
              "valuation_by_country": [
                {
                  "chile": 813
                }
              ],
              "impressions": 329,
              "valuation": 813
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
              "valuation_usd": 0.9441038813623716,
              "valuation_by_country": [
                {
                  "chile": 657
                }
              ],
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
              "valuation_usd": 0.5144432108489025,
              "valuation_by_country": [
                {
                  "chile": 358
                }
              ],
              "impressions": 429,
              "valuation": 358
            },
            "date_int": 1609286400000
          }
        ],
        "id": 887
      },
      {
        "domain": "elmorrocotudo.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 18,
              "count": 1,
              "valuation_usd": 0.3535000834324861,
              "valuation_by_country": [
                {
                  "chile": 246
                }
              ],
              "impressions": 92,
              "valuation": 246
            },
            "date_int": 1609286400000
          }
        ],
        "id": 453
      },
      {
        "domain": "enlacejudio.com",
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 54,
              "count": 1,
              "valuation_usd": 0.30464234832393117,
              "valuation_by_country": [
                {
                  "chile": 212
                }
              ],
              "impressions": 274,
              "valuation": 212
            },
            "date_int": 1609286400000
          }
        ],
        "id": 10423
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 36243,
          "count": 142,
          "valuation_usd": 1209.973305901037,
          "valuation_by_country": [
            {
              "chile": 842018
            }
          ],
          "impressions": 398971,
          "valuation": 842018
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 36243,
          "count": 142,
          "valuation_usd": 1209.973305901037,
          "valuation_by_country": [
            {
              "chile": 842018
            }
          ],
          "impressions": 398971,
          "valuation": 842018
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
          "impact": 34503,
          "count": 130,
          "valuation_usd": 1172.1229311139978,
          "valuation_by_country": [
            {
              "chile": 815678
            }
          ],
          "impressions": 382511,
          "valuation": 815678
        },
        "id": "direct",
        "name": "direct"
      },
      {
        "metrics": {
          "impact": 1465,
          "count": 10,
          "valuation_usd": 36.29986019344729,
          "valuation_by_country": [
            {
              "chile": 25261
            }
          ],
          "impressions": 15058,
          "valuation": 25261
        },
        "id": "unknown",
        "name": "unknown"
      },
      {
        "metrics": {
          "impact": 275,
          "count": 2,
          "valuation_usd": 1.5505145935920834,
          "valuation_by_country": [
            {
              "chile": 1079
            }
          ],
          "impressions": 1402,
          "valuation": 1079
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 22767,
          "count": 41,
          "valuation_usd": 965.0379838641783,
          "valuation_by_country": [
            {
              "chile": 671568
            }
          ],
          "impressions": 329451,
          "valuation": 671568
        },
        "id": 1,
        "name": "desktop"
      },
      {
        "metrics": {
          "impact": 13476,
          "count": 101,
          "valuation_usd": 244.9353220368588,
          "valuation_by_country": [
            {
              "chile": 170450
            }
          ],
          "impressions": 69520,
          "valuation": 170450
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
            "impact": 36243,
            "valuation_usd": 1209.973305901037,
            "impressions": 398971,
            "valuation": 842018
          },
          "date_int": 1609286400000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 36243,
            "valuation_usd": 1209.973305901037,
            "impressions": 398971,
            "valuation": 842018
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 36243,
            "valuation_usd": 1209.973305901037,
            "impressions": 398971,
            "valuation": 842018
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 398971,
      "total_impact": 36243,
      "devices": [
        {
          "metrics": {
            "impact": 22767,
            "valuation_usd": 965.0379838641783,
            "impressions": 329451,
            "valuation": 671568
          },
          "id": 1,
          "name": "desktop"
        },
        {
          "metrics": {
            "impact": 13476,
            "valuation_usd": 244.9353220368588,
            "impressions": 69520,
            "valuation": 170450
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 1209.973305901037,
      "position": {
        "first_scroll": 0.2112676056338028,
        "second_scroll": 0.13028169014084506,
        "third_or_more_scroll": 0.6549295774647887
      },
      "total_valuation": 842018
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
              "impact": 25545,
              "count": 33,
              "valuation_usd": 809.242162540669,
              "valuation_by_country": [
                {
                  "chile": 563150
                }
              ],
              "impressions": 274705,
              "valuation": 563150
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 9312,
              "count": 32,
              "valuation_usd": 131.32959197179582,
              "valuation_by_country": [
                {
                  "chile": 91392
                }
              ],
              "impressions": 47648,
              "valuation": 91392
            },
            "id": 2,
            "name": "mobile"
          },
          {
            "metrics": {
              "impact": 16233,
              "count": 1,
              "valuation_usd": 677.9125705688732,
              "valuation_by_country": [
                {
                  "chile": 471758
                }
              ],
              "impressions": 227057,
              "valuation": 471758
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 25545,
          "count": 33,
          "valuation_usd": 809.242162540669,
          "valuation_by_country": [
            {
              "chile": 563150
            }
          ],
          "impressions": 274705,
          "valuation": 563150
        },
        "websites": [
          {
            "metrics": {
              "impact": 25545,
              "count": 33,
              "valuation_usd": 809.242162540669,
              "valuation_by_country": [
                {
                  "chile": 563150
                }
              ],
              "impressions": 274705,
              "valuation": 563150
            },
            "domain": "biobiochile.cl",
            "id": 448
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 25545,
              "count": 33,
              "valuation_usd": 809.242162540669,
              "valuation_by_country": [
                {
                  "chile": 563150
                }
              ],
              "impressions": 274705,
              "valuation": 563150
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
              "impact": 25545,
              "count": 33,
              "valuation_usd": 809.242162540669,
              "valuation_by_country": [
                {
                  "chile": 563150
                }
              ],
              "impressions": 274705,
              "valuation": 563150
            },
            "id": 1,
            "name": "display"
          }
        ]
      },
      {
        "landing_page": "enel.cl/es/conoce-enel/prensa/news/d202011-hito-historico-para-enel-lider-del-dow-jones-sustainability-world-index-de-2020.html",
        "description": "feliz | fotografía | mañana | mundo | paisaje | pie foto | prenda pieza | ropa formal | vestido | viento",
        "ad_format": {
          "id": 154,
          "name": "brand-day"
        },
        "title": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020",
        "date_range": {
          "start": "2020-12-30T00:34:01.000Z",
          "end": "2020-12-30T17:25:27.000Z"
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
              "impact": 10698,
              "count": 109,
              "valuation_usd": 400.7311433603681,
              "valuation_by_country": [
                {
                  "chile": 278868
                }
              ],
              "impressions": 124266,
              "valuation": 278868
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 4164,
              "count": 69,
              "valuation_usd": 113.60573006506296,
              "valuation_by_country": [
                {
                  "chile": 79058
                }
              ],
              "impressions": 21872,
              "valuation": 79058
            },
            "id": 2,
            "name": "mobile"
          },
          {
            "metrics": {
              "impact": 6534,
              "count": 40,
              "valuation_usd": 287.1254132953051,
              "valuation_by_country": [
                {
                  "chile": 199810
                }
              ],
              "impressions": 102394,
              "valuation": 199810
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 10698,
          "count": 109,
          "valuation_usd": 400.7311433603681,
          "valuation_by_country": [
            {
              "chile": 278868
            }
          ],
          "impressions": 124266,
          "valuation": 278868
        },
        "websites": [
          {
            "metrics": {
              "impact": 1712,
              "count": 75,
              "valuation_usd": 153.28395894204593,
              "valuation_by_country": [
                {
                  "chile": 106670
                }
              ],
              "impressions": 12992,
              "valuation": 106670
            },
            "domain": "duna.cl",
            "id": 475
          },
          {
            "metrics": {
              "impact": 5510,
              "count": 19,
              "valuation_usd": 185.46827344870198,
              "valuation_by_country": [
                {
                  "chile": 129067
                }
              ],
              "impressions": 88217,
              "valuation": 129067
            },
            "domain": "eldinamo.cl",
            "id": 495
          },
          {
            "metrics": {
              "impact": 168,
              "count": 2,
              "valuation_usd": 0.9441038813623716,
              "valuation_by_country": [
                {
                  "chile": 657
                }
              ],
              "impressions": 855,
              "valuation": 657
            },
            "domain": "mch.cl",
            "id": 496
          },
          {
            "metrics": {
              "impact": 441,
              "count": 2,
              "valuation_usd": 7.720959139360764,
              "valuation_by_country": [
                {
                  "chile": 5373
                }
              ],
              "impressions": 5718,
              "valuation": 5373
            },
            "domain": "aqua.cl",
            "id": 498
          },
          {
            "metrics": {
              "impact": 502,
              "count": 2,
              "valuation_usd": 2.8624884804776927,
              "valuation_by_country": [
                {
                  "chile": 1992
                }
              ],
              "impressions": 2563,
              "valuation": 1992
            },
            "domain": "aciprensa.com",
            "id": 4839
          },
          {
            "metrics": {
              "impact": 1746,
              "count": 1,
              "valuation_usd": 24.624298494711717,
              "valuation_by_country": [
                {
                  "chile": 17136
                }
              ],
              "impressions": 8934,
              "valuation": 17136
            },
            "domain": "biobiochile.cl",
            "id": 448
          },
          {
            "metrics": {
              "impact": 18,
              "count": 1,
              "valuation_usd": 0.3535000834324861,
              "valuation_by_country": [
                {
                  "chile": 246
                }
              ],
              "impressions": 92,
              "valuation": 246
            },
            "domain": "elmorrocotudo.cl",
            "id": 453
          },
          {
            "metrics": {
              "impact": 65,
              "count": 1,
              "valuation_usd": 1.1682746659780945,
              "valuation_by_country": [
                {
                  "chile": 813
                }
              ],
              "impressions": 329,
              "valuation": 813
            },
            "domain": "df.cl",
            "id": 464
          },
          {
            "metrics": {
              "impact": 108,
              "count": 1,
              "valuation_usd": 9.892254367273312,
              "valuation_by_country": [
                {
                  "chile": 6884
                }
              ],
              "impressions": 1500,
              "valuation": 6884
            },
            "domain": "elnaveghable.cl",
            "id": 489
          },
          {
            "metrics": {
              "impact": 80,
              "count": 1,
              "valuation_usd": 11.013108290351926,
              "valuation_by_country": [
                {
                  "chile": 7664
                }
              ],
              "impressions": 1022,
              "valuation": 7664
            },
            "domain": "radioagricultura.cl",
            "id": 505
          },
          {
            "metrics": {
              "impact": 42,
              "count": 1,
              "valuation_usd": 1.3349657622308115,
              "valuation_by_country": [
                {
                  "chile": 929
                }
              ],
              "impressions": 213,
              "valuation": 929
            },
            "domain": "lared.cl",
            "id": 722
          },
          {
            "metrics": {
              "impact": 221,
              "count": 1,
              "valuation_usd": 1.2458722452681523,
              "valuation_by_country": [
                {
                  "chile": 867
                }
              ],
              "impressions": 1128,
              "valuation": 867
            },
            "domain": "as.com",
            "id": 851
          },
          {
            "metrics": {
              "impact": 31,
              "count": 1,
              "valuation_usd": 0.5144432108489025,
              "valuation_by_country": [
                {
                  "chile": 358
                }
              ],
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
              "valuation_usd": 0.30464234832393117,
              "valuation_by_country": [
                {
                  "chile": 212
                }
              ],
              "impressions": 274,
              "valuation": 212
            },
            "domain": "enlacejudio.com",
            "id": 10423
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 8958,
              "count": 97,
              "valuation_usd": 362.8807685733287,
              "valuation_by_country": [
                {
                  "chile": 252528
                }
              ],
              "impressions": 107806,
              "valuation": 252528
            },
            "id": "direct",
            "name": "direct"
          },
          {
            "metrics": {
              "impact": 1465,
              "count": 10,
              "valuation_usd": 36.29986019344729,
              "valuation_by_country": [
                {
                  "chile": 25261
                }
              ],
              "impressions": 15058,
              "valuation": 25261
            },
            "id": "unknown",
            "name": "unknown"
          },
          {
            "metrics": {
              "impact": 275,
              "count": 2,
              "valuation_usd": 1.5505145935920834,
              "valuation_by_country": [
                {
                  "chile": 1079
                }
              ],
              "impressions": 1402,
              "valuation": 1079
            },
            "id": "google",
            "name": "google"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 300,
            "height": 250
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/banner_c4420d89bb6b5b5a1d348488ace3f8f0.jpg"
          }
        },
        "id": 7852217,
        "ad_types": [
          {
            "metrics": {
              "impact": 10698,
              "count": 109,
              "valuation_usd": 400.7311433603681,
              "valuation_by_country": [
                {
                  "chile": 278868
                }
              ],
              "impressions": 124266,
              "valuation": 278868
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
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 25545,
              "count": 33,
              "valuation_usd": 809.242162540669,
              "valuation_by_country": [
                {
                  "chile": 563150
                }
              ],
              "impressions": 274705,
              "valuation": 563150
            },
            "date_int": 1609286400000
          }
        ],
        "id": 7418419,
        "name": "Plan de Invierno - enel.cl"
      },
      {
        "metrics_by_date": [
          {
            "date": "2020-12-30T00:00:00.000Z",
            "metrics": {
              "impact": 10698,
              "count": 109,
              "valuation_usd": 400.7311433603681,
              "valuation_by_country": [
                {
                  "chile": 278868
                }
              ],
              "impressions": 124266,
              "valuation": 278868
            },
            "date_int": 1609286400000
          }
        ],
        "id": 7852217,
        "name": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020"
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 27291,
          "count": 34,
          "valuation_usd": 833.8664610353807,
          "valuation_by_country": [
            {
              "chile": 580286
            }
          ],
          "impressions": 283639,
          "valuation": 580286
        },
        "domain": "biobiochile.cl",
        "id": 448
      },
      {
        "metrics": {
          "impact": 5510,
          "count": 19,
          "valuation_usd": 185.46827344870198,
          "valuation_by_country": [
            {
              "chile": 129067
            }
          ],
          "impressions": 88217,
          "valuation": 129067
        },
        "domain": "eldinamo.cl",
        "id": 495
      },
      {
        "metrics": {
          "impact": 1712,
          "count": 75,
          "valuation_usd": 153.28395894204593,
          "valuation_by_country": [
            {
              "chile": 106670
            }
          ],
          "impressions": 12992,
          "valuation": 106670
        },
        "domain": "duna.cl",
        "id": 475
      },
      {
        "metrics": {
          "impact": 80,
          "count": 1,
          "valuation_usd": 11.013108290351926,
          "valuation_by_country": [
            {
              "chile": 7664
            }
          ],
          "impressions": 1022,
          "valuation": 7664
        },
        "domain": "radioagricultura.cl",
        "id": 505
      },
      {
        "metrics": {
          "impact": 108,
          "count": 1,
          "valuation_usd": 9.892254367273312,
          "valuation_by_country": [
            {
              "chile": 6884
            }
          ],
          "impressions": 1500,
          "valuation": 6884
        },
        "domain": "elnaveghable.cl",
        "id": 489
      },
      {
        "metrics": {
          "impact": 441,
          "count": 2,
          "valuation_usd": 7.720959139360764,
          "valuation_by_country": [
            {
              "chile": 5373
            }
          ],
          "impressions": 5718,
          "valuation": 5373
        },
        "domain": "aqua.cl",
        "id": 498
      },
      {
        "metrics": {
          "impact": 502,
          "count": 2,
          "valuation_usd": 2.8624884804776927,
          "valuation_by_country": [
            {
              "chile": 1992
            }
          ],
          "impressions": 2563,
          "valuation": 1992
        },
        "domain": "aciprensa.com",
        "id": 4839
      },
      {
        "metrics": {
          "impact": 42,
          "count": 1,
          "valuation_usd": 1.3349657622308115,
          "valuation_by_country": [
            {
              "chile": 929
            }
          ],
          "impressions": 213,
          "valuation": 929
        },
        "domain": "lared.cl",
        "id": 722
      },
      {
        "metrics": {
          "impact": 221,
          "count": 1,
          "valuation_usd": 1.2458722452681523,
          "valuation_by_country": [
            {
              "chile": 867
            }
          ],
          "impressions": 1128,
          "valuation": 867
        },
        "domain": "as.com",
        "id": 851
      },
      {
        "metrics": {
          "impact": 65,
          "count": 1,
          "valuation_usd": 1.1682746659780945,
          "valuation_by_country": [
            {
              "chile": 813
            }
          ],
          "impressions": 329,
          "valuation": 813
        },
        "domain": "df.cl",
        "id": 464
      },
      {
        "metrics": {
          "impact": 168,
          "count": 2,
          "valuation_usd": 0.9441038813623716,
          "valuation_by_country": [
            {
              "chile": 657
            }
          ],
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
          "valuation_usd": 0.5144432108489025,
          "valuation_by_country": [
            {
              "chile": 358
            }
          ],
          "impressions": 429,
          "valuation": 358
        },
        "domain": "popsugar.com",
        "id": 887
      },
      {
        "metrics": {
          "impact": 18,
          "count": 1,
          "valuation_usd": 0.3535000834324861,
          "valuation_by_country": [
            {
              "chile": 246
            }
          ],
          "impressions": 92,
          "valuation": 246
        },
        "domain": "elmorrocotudo.cl",
        "id": 453
      },
      {
        "metrics": {
          "impact": 54,
          "count": 1,
          "valuation_usd": 0.30464234832393117,
          "valuation_by_country": [
            {
              "chile": 212
            }
          ],
          "impressions": 274,
          "valuation": 212
        },
        "domain": "enlacejudio.com",
        "id": 10423
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 36243,
          "count": 142,
          "valuation_usd": 1209.973305901037,
          "valuation_by_country": [
            {
              "chile": 842018
            }
          ],
          "impressions": 398971,
          "valuation": 842018
        },
        "id": 8968,
        "name": "enel"
      }
    ]
  }
}
```
