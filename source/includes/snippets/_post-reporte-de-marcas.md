> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/brands-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-29T01:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"},{"id":8968,"name":"enel"}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-29T01:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"},{"id":8968,"name":"enel"}]}}'

response = requests.post('https://clientela.admetricks.com/brands-report/', headers=headers, data=data)
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/brands-report/', {
    method: 'POST',
    headers: {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify({"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-29T01:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"},{"id":8968,"name":"enel"}]}})
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
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":3}]},"countries":{"include":[{"id":1}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"end":"2020-12-29T01:59:59.999","start":"2020-12-29T00:00:00.000","group_by":"day"},"brands":{"include":[{"id":1,"name":"mercedes benz"},{"id":8968,"name":"enel"}]}}';
$response = Requests::post('https://clientela.admetricks.com/brands-report/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-29T00:25:40.000Z",
      "end": "2020-12-29T00:37:48.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "id": 221,
        "name": "energía - energía domestica"
      }
    ],
    "websites_by_date": [
      {
        "domain": "lacuarta.com",
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 3798,
              "count": 1,
              "valuation_usd": 36.25358951294694,
              "valuation_by_country": [
                {
                  "chile": 25728
                }
              ],
              "impressions": 19434,
              "valuation": 25728
            },
            "date_int": 1609200000000
          }
        ],
        "id": 335
      },
      {
        "domain": "elnortero.cl",
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 37,
              "count": 1,
              "valuation_usd": 0.762328666297586,
              "valuation_by_country": [
                {
                  "chile": 541
                }
              ],
              "impressions": 188,
              "valuation": 541
            },
            "date_int": 1609200000000
          }
        ],
        "id": 481
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2020-12-29T00:25:40.000Z",
      "end": "2020-12-29T00:37:48.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 3798,
          "count": 1,
          "valuation_usd": 36.25358951294694,
          "valuation_by_country": [
            {
              "chile": 25728
            }
          ],
          "impressions": 19434,
          "valuation": 25728
        },
        "id": "direct",
        "name": "direct"
      },
      {
        "metrics": {
          "impact": 37,
          "count": 1,
          "valuation_usd": 0.762328666297586,
          "valuation_by_country": [
            {
              "chile": 541
            }
          ],
          "impressions": 188,
          "valuation": 541
        },
        "id": "unknown",
        "name": "unknown"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
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
            "impact": 3835,
            "valuation_usd": 37.01591817924452,
            "impressions": 19622,
            "valuation": 26269
          },
          "date_int": 1609200000000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 3835,
            "valuation_usd": 37.01591817924452,
            "impressions": 19622,
            "valuation": 26269
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 3835,
            "valuation_usd": 37.01591817924452,
            "impressions": 19622,
            "valuation": 26269
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 19622,
      "total_impact": 3835,
      "devices": [
        {
          "metrics": {
            "impact": 3835,
            "valuation_usd": 37.01591817924452,
            "impressions": 19622,
            "valuation": 26269
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 37.01591817924452,
      "position": {
        "first_scroll": 0,
        "second_scroll": 0,
        "third_or_more_scroll": 1
      },
      "total_valuation": 26269
    },
    "campaigns": [
      {
        "landing_page": "enel.cl/es/conoce-enel/prensa/news/d202011-hito-historico-para-enel-lider-del-dow-jones-sustainability-world-index-de-2020.html",
        "description": "feliz | fotografía | mañana | mundo | paisaje | pie foto | prenda pieza | ropa formal | vestido | viento",
        "title": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020",
        "date_range": {
          "start": "2020-12-29T00:25:40.000Z",
          "end": "2020-12-29T00:37:48.000Z"
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
              "impact": 3835,
              "count": 2,
              "valuation_usd": 37.01591817924452,
              "valuation_by_country": [
                {
                  "chile": 26269
                }
              ],
              "impressions": 19622,
              "valuation": 26269
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 3835,
              "count": 2,
              "valuation_usd": 37.01591817924452,
              "valuation_by_country": [
                {
                  "chile": 26269
                }
              ],
              "impressions": 19622,
              "valuation": 26269
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "websites": [
          {
            "metrics": {
              "impact": 3798,
              "count": 1,
              "valuation_usd": 36.25358951294694,
              "valuation_by_country": [
                {
                  "chile": 25728
                }
              ],
              "impressions": 19434,
              "valuation": 25728
            },
            "domain": "lacuarta.com",
            "id": 335
          },
          {
            "metrics": {
              "impact": 37,
              "count": 1,
              "valuation_usd": 0.762328666297586,
              "valuation_by_country": [
                {
                  "chile": 541
                }
              ],
              "impressions": 188,
              "valuation": 541
            },
            "domain": "elnortero.cl",
            "id": 481
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 3798,
              "count": 1,
              "valuation_usd": 36.25358951294694,
              "valuation_by_country": [
                {
                  "chile": 25728
                }
              ],
              "impressions": 19434,
              "valuation": 25728
            },
            "id": "direct",
            "name": "direct"
          },
          {
            "metrics": {
              "impact": 37,
              "count": 1,
              "valuation_usd": 0.762328666297586,
              "valuation_by_country": [
                {
                  "chile": 541
                }
              ],
              "impressions": 188,
              "valuation": 541
            },
            "id": "unknown",
            "name": "unknown"
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
              "impact": 3835,
              "count": 2,
              "valuation_usd": 37.01591817924452,
              "valuation_by_country": [
                {
                  "chile": 26269
                }
              ],
              "impressions": 19622,
              "valuation": 26269
            },
            "id": 1,
            "name": "display"
          }
        ]
      }
    ],
    "campaigns_with_websites_by_date": [
      {
        "landing_page": "7852217",
        "description": null,
        "title": "Hito histórico para Enel: líder del Dow Jones Sustainability World Index de 2020",
        "brand": {
          "id": 8968,
          "name": "enel"
        },
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "websites_by_date": [
          {
            "domain": "lacuarta.com",
            "metrics_by_date": [
              {
                "date": "2020-12-29T00:00:00.000Z",
                "metrics": {
                  "impact": 3798,
                  "count": 1,
                  "valuation_usd": 36.25358951294694,
                  "valuation_by_country": [
                    {
                      "chile": 25728
                    }
                  ],
                  "impressions": 19434,
                  "valuation": 25728
                },
                "date_int": 1609200000000
              }
            ],
            "id": 335
          },
          {
            "domain": "elnortero.cl",
            "metrics_by_date": [
              {
                "date": "2020-12-29T00:00:00.000Z",
                "metrics": {
                  "impact": 37,
                  "count": 1,
                  "valuation_usd": 0.762328666297586,
                  "valuation_by_country": [
                    {
                      "chile": 541
                    }
                  ],
                  "impressions": 188,
                  "valuation": 541
                },
                "date_int": 1609200000000
              }
            ],
            "id": 481
          }
        ],
        "id": 7852217
      }
    ],
    "campaigns_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 3835,
              "count": 2,
              "valuation_usd": 37.01591817924452,
              "valuation_by_country": [
                {
                  "chile": 26269
                }
              ],
              "impressions": 19622,
              "valuation": 26269
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
          "impact": 3798,
          "count": 1,
          "valuation_usd": 36.25358951294694,
          "valuation_by_country": [
            {
              "chile": 25728
            }
          ],
          "impressions": 19434,
          "valuation": 25728
        },
        "domain": "lacuarta.com",
        "id": 335
      },
      {
        "metrics": {
          "impact": 37,
          "count": 1,
          "valuation_usd": 0.762328666297586,
          "valuation_by_country": [
            {
              "chile": 541
            }
          ],
          "impressions": 188,
          "valuation": 541
        },
        "domain": "elnortero.cl",
        "id": 481
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2020-12-29T00:00:00.000Z",
            "metrics": {
              "impact": 3835,
              "count": 2,
              "valuation_usd": 37.01591817924452,
              "valuation_by_country": [
                {
                  "chile": 26269
                }
              ],
              "impressions": 19622,
              "valuation": 26269
            },
            "date_int": 1609200000000
          }
        ],
        "id": 8968,
        "name": "enel"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "id": 8968,
        "name": "enel"
      }
    ],
    "brands_with_websites_by_date": [
      {
        "metrics": {
          "impact": 3835,
          "count": 2,
          "valuation_usd": 37.01591817924452,
          "valuation_by_country": [
            {
              "chile": 26269
            }
          ],
          "impressions": 19622,
          "valuation": 26269
        },
        "websites_by_date": [
          {
            "domain": "lacuarta.com",
            "metrics_by_date": [
              {
                "date": "2020-12-29T00:00:00.000Z",
                "metrics": {
                  "impact": 3798,
                  "count": 1,
                  "valuation_usd": 36.25358951294694,
                  "valuation_by_country": [
                    {
                      "chile": 25728
                    }
                  ],
                  "impressions": 19434,
                  "valuation": 25728
                },
                "date_int": 1609200000000
              }
            ],
            "id": 335
          },
          {
            "domain": "elnortero.cl",
            "metrics_by_date": [
              {
                "date": "2020-12-29T00:00:00.000Z",
                "metrics": {
                  "impact": 37,
                  "count": 1,
                  "valuation_usd": 0.762328666297586,
                  "valuation_by_country": [
                    {
                      "chile": 541
                    }
                  ],
                  "impressions": 188,
                  "valuation": 541
                },
                "date_int": 1609200000000
              }
            ],
            "id": 481
          }
        ],
        "id": 8968,
        "name": "enel"
      }
    ]
  }
}
```
