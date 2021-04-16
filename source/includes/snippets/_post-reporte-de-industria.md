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
      "end": "2020-11-24T00:48:55.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 8241,
          "count": 4,
          "valuation_usd": 55.02575678173888,
          "valuation_by_country": [
            {
              "chile": 39050
            }
          ],
          "impressions": 30168,
          "valuation": 39050
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
              "valuation_usd": 53.775875955480174,
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
      },
      {
        "domain": "diarioconcepcion.cl",
        "metrics_by_date": [
          {
            "date": "2020-11-23T00:00:00.000Z",
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "date_int": 1606089600000
          }
        ],
        "id": 4250
      },
      {
        "domain": "aplicaciones.info",
        "metrics_by_date": [
          {
            "date": "2020-11-24T00:00:00.000Z",
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
            },
            "date_int": 1606176000000
          }
        ],
        "id": 386
      },
      {
        "domain": "bluradio.com",
        "metrics_by_date": [
          {
            "date": "2020-11-24T00:00:00.000Z",
            "metrics": {
              "impact": 5,
              "count": 1,
              "valuation_usd": 0.04509152924495887,
              "valuation_by_country": [
                {
                  "chile": 32
                }
              ],
              "impressions": 28,
              "valuation": 32
            },
            "date_int": 1606176000000
          }
        ],
        "id": 1276
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 8241,
          "count": 4,
          "valuation_usd": 55.02575678173888,
          "valuation_by_country": [
            {
              "chile": 39050
            }
          ],
          "impressions": 30168,
          "valuation": 39050
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 8241,
          "count": 4,
          "valuation_usd": 55.02575678173888,
          "valuation_by_country": [
            {
              "chile": 39050
            }
          ],
          "impressions": 30168,
          "valuation": 39050
        },
        "id": 1,
        "name": "chile"
      }
    ],
    "date_range": {
      "start": "2020-11-23T11:06:44.000Z",
      "end": "2020-11-24T00:48:55.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 8241,
          "count": 4,
          "valuation_usd": 55.02575678173888,
          "valuation_by_country": [
            {
              "chile": 39050
            }
          ],
          "impressions": 30168,
          "valuation": 39050
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 8241,
          "count": 4,
          "valuation_usd": 55.02575678173888,
          "valuation_by_country": [
            {
              "chile": 39050
            }
          ],
          "impressions": 30168,
          "valuation": 39050
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
            "impact": 8214,
            "valuation_usd": 54.85384532649247,
            "impressions": 30061,
            "valuation": 38928
          },
          "date_int": 1606089600000
        },
        {
          "date": "2020-11-24T00:00:00.000Z",
          "metrics": {
            "impact": 27,
            "valuation_usd": 0.17191145524640572,
            "impressions": 107,
            "valuation": 122
          },
          "date_int": 1606176000000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 8241,
            "valuation_usd": 55.02575678173888,
            "impressions": 30168,
            "valuation": 39050
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 8241,
            "valuation_usd": 55.02575678173888,
            "impressions": 30168,
            "valuation": 39050
          },
          "id": 1,
          "name": "chile"
        }
      ],
      "total_impressions": 30168,
      "total_impact": 8241,
      "devices": [
        {
          "metrics": {
            "impact": 8241,
            "valuation_usd": 55.02575678173888,
            "impressions": 30168,
            "valuation": 39050
          },
          "id": 1,
          "name": "desktop"
        }
      ],
      "total_valuation_usd": 55.02575678173888,
      "position": {
        "first_scroll": 0,
        "second_scroll": 0.75,
        "third_or_more_scroll": 0.25
      },
      "total_valuation": 39050
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
              "valuation_usd": 53.775875955480174,
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
              "valuation_usd": 53.775875955480174,
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
          "valuation_usd": 53.775875955480174,
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
              "valuation_usd": 53.775875955480174,
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
              "valuation_usd": 53.775875955480174,
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
              "valuation_usd": 53.775875955480174,
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
      },
      {
        "landing_page": "dirtbrothers.cl/products/zapatilla-dc-shoes-hombre-dc-infinite-m-shoe-b",
        "description": "amarillo | blanco | engranaje deportes | equipo protección personal | guante | guante bateo | guante bicicleta | guante seguridad | ropa | ropa deporte",
        "ad_format": {
          "id": 154,
          "name": "brand-day"
        },
        "title": "Zapatilla DC Shoes Hombre DC INFINITE M SHOE B– Dirt Brothers",
        "date_range": {
          "start": "2020-11-23T17:20:52.000Z",
          "end": "2020-11-23T17:20:52.000Z"
        },
        "industry": {
          "id": 204,
          "name": "deportes y tiempo libre - artículos deportivos"
        },
        "brand": {
          "id": 342746,
          "name": "dirt brothers"
        },
        "countries": [
          {
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 62,
          "count": 1,
          "valuation_usd": 1.0779693710122982,
          "valuation_by_country": [
            {
              "chile": 765
            }
          ],
          "impressions": 674,
          "valuation": 765
        },
        "websites": [
          {
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "domain": "diarioconcepcion.cl",
            "id": 4250
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
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
            "name": "https://ads.admetricks.com/banner_869179d3f518e157cc726586f752bc49.jpg"
          }
        },
        "id": 7798600,
        "ad_types": [
          {
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "id": 1,
            "name": "display"
          }
        ]
      },
      {
        "landing_page": "yerka.cl/products/chapa-yerka",
        "description": null,
        "ad_format": {
          "id": 154,
          "name": "brand-day"
        },
        "title": "Chapa Yerka– Yerka Bikes Chile",
        "date_range": {
          "start": "2020-11-24T00:48:55.000Z",
          "end": "2020-11-24T00:48:55.000Z"
        },
        "industry": {
          "id": 204,
          "name": "deportes y tiempo libre - artículos deportivos"
        },
        "brand": {
          "id": 120972,
          "name": "yerka"
        },
        "countries": [
          {
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
            },
            "id": 1,
            "name": "chile"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 22,
          "count": 1,
          "valuation_usd": 0.12681992600144684,
          "valuation_by_country": [
            {
              "chile": 90
            }
          ],
          "impressions": 79,
          "valuation": 90
        },
        "websites": [
          {
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
            },
            "domain": "aplicaciones.info",
            "id": 386
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
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
            "name": "https://ads.admetricks.com/banner_cee4bae399a44001dde42e6fecc48886.jpg"
          }
        },
        "id": 7799653,
        "ad_types": [
          {
            "metrics": {
              "impact": 22,
              "count": 1,
              "valuation_usd": 0.12681992600144684,
              "valuation_by_country": [
                {
                  "chile": 90
                }
              ],
              "impressions": 79,
              "valuation": 90
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
          "valuation_usd": 53.775875955480174,
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
      },
      {
        "metrics": {
          "impact": 62,
          "count": 1,
          "valuation_usd": 1.0779693710122982,
          "valuation_by_country": [
            {
              "chile": 765
            }
          ],
          "impressions": 674,
          "valuation": 765
        },
        "domain": "diarioconcepcion.cl",
        "id": 4250
      },
      {
        "metrics": {
          "impact": 22,
          "count": 1,
          "valuation_usd": 0.12681992600144684,
          "valuation_by_country": [
            {
              "chile": 90
            }
          ],
          "impressions": 79,
          "valuation": 90
        },
        "domain": "aplicaciones.info",
        "id": 386
      },
      {
        "metrics": {
          "impact": 5,
          "count": 1,
          "valuation_usd": 0.04509152924495887,
          "valuation_by_country": [
            {
              "chile": 32
            }
          ],
          "impressions": 28,
          "valuation": 32
        },
        "domain": "bluradio.com",
        "id": 1276
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
              "valuation_usd": 53.775875955480174,
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
      },
      {
        "metrics_by_date": [
          {
            "date": "2020-11-23T00:00:00.000Z",
            "metrics": {
              "impact": 62,
              "count": 1,
              "valuation_usd": 1.0779693710122982,
              "valuation_by_country": [
                {
                  "chile": 765
                }
              ],
              "impressions": 674,
              "valuation": 765
            },
            "date_int": 1606089600000
          }
        ],
        "id": 342746,
        "name": "dirt brothers"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 53.775875955480174,
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
      },
      {
        "metrics": {
          "impact": 62,
          "count": 1,
          "valuation_usd": 1.0779693710122982,
          "valuation_by_country": [
            {
              "chile": 765
            }
          ],
          "impressions": 674,
          "valuation": 765
        },
        "id": 342746,
        "name": "dirt brothers"
      }
    ],
    "brands_with_websites_by_date": [
      {
        "metrics": {
          "impact": 8152,
          "count": 1,
          "valuation_usd": 53.775875955480174,
          "valuation_by_country": [
            {
              "chile": 38163
            }
          ],
          "impressions": 29387,
          "valuation": 38163
        },
        "websites_by_date": [
          {
            "domain": "clarin.com",
            "metrics_by_date": [
              {
                "date": "2020-11-23T00:00:00.000Z",
                "metrics": {
                  "impact": 8152,
                  "count": 1,
                  "valuation_usd": 53.775875955480174,
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
        "id": 141894,
        "name": "gympro"
      },
      {
        "metrics": {
          "impact": 62,
          "count": 1,
          "valuation_usd": 1.0779693710122982,
          "valuation_by_country": [
            {
              "chile": 765
            }
          ],
          "impressions": 674,
          "valuation": 765
        },
        "websites_by_date": [
          {
            "domain": "diarioconcepcion.cl",
            "metrics_by_date": [
              {
                "date": "2020-11-23T00:00:00.000Z",
                "metrics": {
                  "impact": 62,
                  "count": 1,
                  "valuation_usd": 1.0779693710122982,
                  "valuation_by_country": [
                    {
                      "chile": 765
                    }
                  ],
                  "impressions": 674,
                  "valuation": 765
                },
                "date_int": 1606089600000
              }
            ],
            "id": 4250
          }
        ],
        "id": 342746,
        "name": "dirt brothers"
      }
    ]
  }
}
```
