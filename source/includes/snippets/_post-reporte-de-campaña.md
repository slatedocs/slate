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
var fetch = require("node-fetch");

fetch("https://clientela.admetricks.com/campaign-report/", {
  method: "POST",
  headers: {
    accept: "application/json, text/plain, */*",
    authorization: "Token YOUR_TOKEN",
    "content-type": "application/json;charset=UTF-8",
    "Content-Type": "application/json; charset=UTF-8",
  },
  body: JSON.stringify({
    order_by: "valuation",
    search_term: "a",
    campaigns: { include: [{ id: 4394864 }] },
    ad_types: { include: [{ id: 1 }, { id: 2 }, { id: 3 }] },
    countries: { include: [{ id: 4 }] },
    devices: { include: [{ id: 1 }, { id: 2 }] },
    date_range: {
      start: "2020-12-28T00:00:00.000",
      end: "2020-12-30T23:59:59.999",
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
$data = '{ "order_by": "valuation", "search_term": "a", "campaigns": {"include": [{"id": 4394864}]}, "ad_types": {"include": [{"id": 1},{"id": 2},{"id": 3}]}, "countries": {"include": [{"id": 4}]}, "devices": {"include": [{"id": 1},{"id": 2}]}, "date_range": {"start": "2020-12-28T00:00:00.000","end": "2020-12-30T23:59:59.999","group_by": "day"} }';
$response = Requests::post('https://clientela.admetricks.com/campaign-report/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2020-12-28T11:33:16.000Z",
      "end": "2020-12-30T23:59:59.999"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": 196,
        "name": "cultura - productos editoriales impresos y online"
      }
    ],
    "websites_by_date": [
      {
        "domain": "dicio.com.br",
        "metrics_by_date": [
          {
            "date": "2020-12-28T00:00:00.000Z",
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "date_int": 1609113600000
          }
        ],
        "id": 1027
      },
      {
        "domain": "jornalopcao.com.br",
        "metrics_by_date": [
          {
            "date": "2020-12-28T00:00:00.000Z",
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "date_int": 1609113600000
          }
        ],
        "id": 8044
      },
      {
        "domain": "gazetaweb.com.br",
        "metrics_by_date": [
          {
            "date": "2020-12-28T00:00:00.000Z",
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "date_int": 1609113600000
          }
        ],
        "id": 7964
      }
    ],
    "ad_files": [
      {
        "date_range": {
          "start": "2020-12-28T15:20:33.000Z",
          "end": "2020-12-28T15:20:33.000Z"
        },
        "websites": [
          {
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "domain": "dicio.com.br",
            "id": 1027
          }
        ],
        "ad_types": [
          {
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "id": 1,
            "name": "display"
          }
        ],
        "url": "https://ads.admetricks.com/banner_900a8fa54e8a37380f822c6049164c87.jpg",
        "sold_by": [
          {
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "id": "google",
            "name": "google"
          }
        ],
        "ad_measurements": {
          "width": 468,
          "height": 390
        },
        "metrics": {
          "impact": 4816,
          "count": 1,
          "valuation_usd": 9.9879774345695,
          "valuation_by_country": [
            {
              "brazil": 54
            }
          ],
          "impressions": 10131,
          "valuation": 54
        },
        "devices": [
          {
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "id": 195305111
      },
      {
        "date_range": {
          "start": "2020-12-28T16:43:48.000Z",
          "end": "2020-12-28T16:43:48.000Z"
        },
        "websites": [
          {
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "domain": "jornalopcao.com.br",
            "id": 8044
          }
        ],
        "ad_types": [
          {
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "id": 1,
            "name": "display"
          }
        ],
        "url": "https://ads.admetricks.com/banner_bc5bee7ad5154c4bccda203f7e439def.jpg",
        "sold_by": [
          {
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "id": "google",
            "name": "google"
          }
        ],
        "ad_measurements": {
          "width": 320,
          "height": 100
        },
        "metrics": {
          "impact": 48,
          "count": 1,
          "valuation_usd": 0.7398501803384814,
          "valuation_by_country": [
            {
              "brazil": 4
            }
          ],
          "impressions": 576,
          "valuation": 4
        },
        "devices": [
          {
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "id": 195354200
      },
      {
        "date_range": {
          "start": "2020-12-28T11:33:16.000Z",
          "end": "2020-12-28T11:33:16.000Z"
        },
        "websites": [
          {
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "domain": "gazetaweb.com.br",
            "id": 7964
          }
        ],
        "ad_types": [
          {
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "id": 1,
            "name": "display"
          }
        ],
        "url": "https://ads.admetricks.com/banner_e10340542517a6f94f9ff5627d0ae572.jpg",
        "sold_by": [
          {
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "id": "google",
            "name": "google"
          }
        ],
        "ad_measurements": {
          "width": 468,
          "height": 390
        },
        "metrics": {
          "impact": 8,
          "count": 1,
          "valuation_usd": 0.18496254508462034,
          "valuation_by_country": [
            {
              "brazil": 1
            }
          ],
          "impressions": 16,
          "valuation": 1
        },
        "devices": [
          {
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "id": 195194494
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": 4,
        "name": "brazil"
      }
    ],
    "date_range": {
      "start": "2020-12-28T11:33:16.000Z",
      "end": "2020-12-28T16:43:48.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": "google",
        "name": "google"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": 2,
        "name": "mobile"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2020-12-28T00:00:00.000Z",
          "metrics": {
            "impact": 4872,
            "valuation_usd": 10.912790159992602,
            "impressions": 10723,
            "valuation": 59
          },
          "date_int": 1609113600000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 4872,
            "valuation_usd": 10.912790159992602,
            "impressions": 10723,
            "valuation": 59
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 4872,
            "valuation_usd": 10.912790159992602,
            "impressions": 10723,
            "valuation": 59
          },
          "id": 4,
          "name": "brazil"
        }
      ],
      "total_impressions": 10723,
      "total_impact": 4872,
      "devices": [
        {
          "metrics": {
            "impact": 4872,
            "valuation_usd": 10.912790159992602,
            "impressions": 10723,
            "valuation": 59
          },
          "id": 2,
          "name": "mobile"
        }
      ],
      "total_valuation_usd": 10.912790159992602,
      "position": {
        "first_scroll": 0.6666666666666666,
        "second_scroll": 0.0,
        "third_or_more_scroll": 0.3333333333333333
      },
      "total_valuation": 59
    },
    "campaigns": [
      {
        "landing_page": "loja.grupoa.com.br",
        "description": null,
        "title": "Compre Livros Acadêmicos, Universitários, Profissionais e Técnicos",
        "date_range": {
          "start": "2020-12-28T11:33:16.000Z",
          "end": "2020-12-28T16:43:48.000Z"
        },
        "industry": {
          "id": 196,
          "name": "cultura - productos editoriales impresos y online"
        },
        "brand": {
          "id": 146829,
          "name": "grupo a"
        },
        "countries": [
          {
            "metrics": {
              "impact": 4872,
              "count": 3,
              "valuation_usd": 10.912790159992602,
              "valuation_by_country": [
                {
                  "brazil": 59
                }
              ],
              "impressions": 10723,
              "valuation": 59
            },
            "id": 4,
            "name": "brazil"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 4872,
              "count": 3,
              "valuation_usd": 10.912790159992602,
              "valuation_by_country": [
                {
                  "brazil": 59
                }
              ],
              "impressions": 10723,
              "valuation": 59
            },
            "id": 2,
            "name": "mobile"
          }
        ],
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "websites": [
          {
            "metrics": {
              "impact": 4816,
              "count": 1,
              "valuation_usd": 9.9879774345695,
              "valuation_by_country": [
                {
                  "brazil": 54
                }
              ],
              "impressions": 10131,
              "valuation": 54
            },
            "domain": "dicio.com.br",
            "id": 1027
          },
          {
            "metrics": {
              "impact": 8,
              "count": 1,
              "valuation_usd": 0.18496254508462034,
              "valuation_by_country": [
                {
                  "brazil": 1
                }
              ],
              "impressions": 16,
              "valuation": 1
            },
            "domain": "gazetaweb.com.br",
            "id": 7964
          },
          {
            "metrics": {
              "impact": 48,
              "count": 1,
              "valuation_usd": 0.7398501803384814,
              "valuation_by_country": [
                {
                  "brazil": 4
                }
              ],
              "impressions": 576,
              "valuation": 4
            },
            "domain": "jornalopcao.com.br",
            "id": 8044
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 4872,
              "count": 3,
              "valuation_usd": 10.912790159992602,
              "valuation_by_country": [
                {
                  "brazil": 59
                }
              ],
              "impressions": 10723,
              "valuation": 59
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
            "name": "https://ads.admetricks.com/banner_900a8fa54e8a37380f822c6049164c87.jpg"
          }
        },
        "id": 4394864,
        "ad_types": [
          {
            "metrics": {
              "impact": 4872,
              "count": 3,
              "valuation_usd": 10.912790159992602,
              "valuation_by_country": [
                {
                  "brazil": 59
                }
              ],
              "impressions": 10723,
              "valuation": 59
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
            "date": "2020-12-28T00:00:00.000Z",
            "metrics": {
              "impact": 4872,
              "count": 3,
              "valuation_usd": 10.912790159992602,
              "valuation_by_country": [
                {
                  "brazil": 59
                }
              ],
              "impressions": 10723,
              "valuation": 59
            },
            "date_int": 1609113600000
          }
        ],
        "id": 4394864,
        "name": "Compre Livros Acadêmicos, Universitários, Profissionais e Técnicos"
      }
    ],
    "websites": [
      {
        "metrics": {
          "impact": 4816,
          "count": 1,
          "valuation_usd": 9.9879774345695,
          "valuation_by_country": [
            {
              "brazil": 54
            }
          ],
          "impressions": 10131,
          "valuation": 54
        },
        "domain": "dicio.com.br",
        "id": 1027
      },
      {
        "metrics": {
          "impact": 48,
          "count": 1,
          "valuation_usd": 0.7398501803384814,
          "valuation_by_country": [
            {
              "brazil": 4
            }
          ],
          "impressions": 576,
          "valuation": 4
        },
        "domain": "jornalopcao.com.br",
        "id": 8044
      },
      {
        "metrics": {
          "impact": 8,
          "count": 1,
          "valuation_usd": 0.18496254508462034,
          "valuation_by_country": [
            {
              "brazil": 1
            }
          ],
          "impressions": 16,
          "valuation": 1
        },
        "domain": "gazetaweb.com.br",
        "id": 7964
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 4872,
          "count": 3,
          "valuation_usd": 10.912790159992602,
          "valuation_by_country": [
            {
              "brazil": 59
            }
          ],
          "impressions": 10723,
          "valuation": 59
        },
        "id": 146829,
        "name": "grupo a"
      }
    ]
  }
}
```
