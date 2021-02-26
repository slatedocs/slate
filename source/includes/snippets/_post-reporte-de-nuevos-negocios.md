> Ejemplo de petición

```shell
curl -k 'http://clientela.admetricks.com/newdeals-report/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'authorization: Token YOUR_TOKEN' \
  -H 'content-type: application/json;charset=UTF-8' \
  --data-binary '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-07T00:00:00.000","end":"2021-01-09T00:00:59.999","group_by":"day"},"websites":{"our_sites":[{"id":144,"domain":"facebook.com"}],"include":[{"id":147,"domain":"youtube.com","last_seen":"2021-01-13T17:56:36Z"}]}}'
```

```python
import requests

headers = {
    'accept': 'application/json, text/plain, */*',
    'authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json;charset=UTF-8',
}

data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-07T00:00:00.000","end":"2021-01-09T00:00:59.999","group_by":"day"},"websites":{"our_sites":[{"id":144,"domain":"facebook.com"}],"include":[{"id":147,"domain":"youtube.com","last_seen":"2021-01-13T17:56:36Z"}]}}'

response = requests.post('http://clientela.admetricks.com/newdeals-report/', headers=headers, data=data, verify=False)
```

```javascript
var fetch = require("node-fetch");

fetch(
  "http://clientela.admetricks.com/newdeals-report/",
  {
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
      countries: { include: [{ id: 3 }] },
      devices: { include: [{ id: 1 }, { id: 2 }] },
      date_range: {
        start: "2021-01-07T00:00:00.000",
        end: "2021-01-09T00:00:59.999",
        group_by: "day",
      },
      websites: {
        our_sites: [{ id: 144, domain: "facebook.com" }],
        include: [
          { id: 147, domain: "youtube.com", last_seen: "2021-01-13T17:56:36Z" },
        ],
      },
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
    'authorization' => 'Token YOUR_TOKEN',
    'content-type' => 'application/json;charset=UTF-8'
);
$data = '{"order_by":"valuation","ad_types":{"include":[{"id":1},{"id":2},{"id":3}]},"countries":{"include":[{"id":3}]},"devices":{"include":[{"id":1},{"id":2}]},"date_range":{"start":"2021-01-07T00:00:00.000","end":"2021-01-09T00:00:59.999","group_by":"day"},"websites":{"our_sites":[{"id":144,"domain":"facebook.com"}],"include":[{"id":147,"domain":"youtube.com","last_seen":"2021-01-13T17:56:36Z"}]}}';
$response = Requests::post('http://clientela.admetricks.com/newdeals-report/', $headers, $data);
```

> Ejemplo de respuesta exitosa

```json
{
  "meta": {
    "date_range": {
      "start": "2021-01-09T00:00:01.000Z",
      "end": "2021-01-09T00:00:01.000Z"
    }
  },
  "data": {
    "industries": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": 13,
        "name": "otros"
      }
    ],
    "websites_by_date": [
      {
        "domain": "youtube.com",
        "metrics_by_date": [
          {
            "date": "2021-01-01T00:00:00.000Z",
            "metrics": {
              "impact": 9474714,
              "count": 1,
              "valuation_usd": 111151.20862660409,
              "valuation_by_country": [
                {
                  "argentina": 9555469
                }
              ],
              "impressions": 132530774,
              "valuation": 9555469
            },
            "date_int": 1609459200000
          }
        ],
        "id": 147
      },
      {
        "domain": "facebook.com",
        "metrics_by_date": [
          {
            "date": "2021-01-01T00:00:00.000Z",
            "metrics": {
              "impact": 99955,
              "count": 1,
              "valuation_usd": 1005.0926158193128,
              "valuation_by_country": [
                {
                  "argentina": 86406
                }
              ],
              "impressions": 1398144,
              "valuation": 86406
            },
            "date_int": 1609459200000
          }
        ],
        "id": 144
      }
    ],
    "ad_types": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": 1,
        "name": "display"
      }
    ],
    "countries": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": 3,
        "name": "argentina"
      }
    ],
    "date_range": {
      "start": "2021-01-09T00:00:01.000Z",
      "end": "2021-01-09T00:00:01.000Z"
    },
    "sold_by": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": "not available",
        "name": "not available"
      }
    ],
    "devices": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": 1,
        "name": "desktop"
      }
    ],
    "summary": {
      "metrics_by_date": [
        {
          "date": "2021-01-01T00:00:00.000Z",
          "metrics": {
            "impact": 9574669,
            "valuation_usd": 112156.3012424234,
            "impressions": 133928918,
            "valuation": 9641875
          },
          "date_int": 1609459200000
        }
      ],
      "ad_types": [
        {
          "metrics": {
            "impact": 9574669,
            "valuation_usd": 112156.3012424234,
            "impressions": 133928918,
            "valuation": 9641875
          },
          "id": 1,
          "name": "display"
        }
      ],
      "countries": [
        {
          "metrics": {
            "impact": 9574669,
            "valuation_usd": 112156.3012424234,
            "impressions": 133928918,
            "valuation": 9641875
          },
          "id": 3,
          "name": "argentina"
        }
      ],
      "total_impressions": 133928918,
      "total_impact": 9574669,
      "devices": [
        {
          "metrics": {
            "impact": 9574669,
            "valuation_usd": 112156.3012424234,
            "impressions": 133928918,
            "valuation": 9641875
          },
          "id": 1,
          "name": "desktop"
        }
      ],
      "total_valuation_usd": 112156.3012424234,
      "position": {
        "first_scroll": 0.0,
        "second_scroll": 0.0,
        "third_or_more_scroll": 1.0
      },
      "total_valuation": 9641875
    },
    "campaigns": [
      {
        "landing_page": "docs.admetricks.com/other-campaigns",
        "description": null,
        "title": "Other campaigns",
        "date_range": {
          "start": "2021-01-09T00:00:01.000Z",
          "end": "2021-01-09T00:00:01.000Z"
        },
        "industry": {
          "id": 13,
          "name": "otros"
        },
        "brand": {
          "id": 186036,
          "name": "other-brand"
        },
        "countries": [
          {
            "metrics": {
              "impact": 9574669,
              "count": 2,
              "valuation_usd": 112156.3012424234,
              "valuation_by_country": [
                {
                  "argentina": 9641875
                }
              ],
              "impressions": 133928918,
              "valuation": 9641875
            },
            "id": 3,
            "name": "argentina"
          }
        ],
        "devices": [
          {
            "metrics": {
              "impact": 9574669,
              "count": 2,
              "valuation_usd": 112156.3012424234,
              "valuation_by_country": [
                {
                  "argentina": 9641875
                }
              ],
              "impressions": 133928918,
              "valuation": 9641875
            },
            "id": 1,
            "name": "desktop"
          }
        ],
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "websites": [
          {
            "metrics": {
              "impact": 99955,
              "count": 1,
              "valuation_usd": 1005.0926158193128,
              "valuation_by_country": [
                {
                  "argentina": 86406
                }
              ],
              "impressions": 1398144,
              "valuation": 86406
            },
            "domain": "facebook.com",
            "id": 144
          },
          {
            "metrics": {
              "impact": 9474714,
              "count": 1,
              "valuation_usd": 111151.20862660409,
              "valuation_by_country": [
                {
                  "argentina": 9555469
                }
              ],
              "impressions": 132530774,
              "valuation": 9555469
            },
            "domain": "youtube.com",
            "id": 147
          }
        ],
        "sold_by": [
          {
            "metrics": {
              "impact": 9574669,
              "count": 2,
              "valuation_usd": 112156.3012424234,
              "valuation_by_country": [
                {
                  "argentina": 9641875
                }
              ],
              "impressions": 133928918,
              "valuation": 9641875
            },
            "id": "not available",
            "name": "not available"
          }
        ],
        "preview": {
          "ad_measurements": {
            "width": 300,
            "height": 250
          },
          "ad_file": {
            "name": "https://ads.admetricks.com/other_campaigns.jpg"
          }
        },
        "id": 6823116,
        "ad_types": [
          {
            "metrics": {
              "impact": 9574669,
              "count": 2,
              "valuation_usd": 112156.3012424234,
              "valuation_by_country": [
                {
                  "argentina": 9641875
                }
              ],
              "impressions": 133928918,
              "valuation": 9641875
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
          "impact": 9474714,
          "count": 1,
          "valuation_usd": 111151.20862660409,
          "valuation_by_country": [
            {
              "argentina": 9555469
            }
          ],
          "impressions": 132530774,
          "valuation": 9555469
        },
        "domain": "youtube.com",
        "id": 147
      },
      {
        "metrics": {
          "impact": 99955,
          "count": 1,
          "valuation_usd": 1005.0926158193128,
          "valuation_by_country": [
            {
              "argentina": 86406
            }
          ],
          "impressions": 1398144,
          "valuation": 86406
        },
        "domain": "facebook.com",
        "id": 144
      }
    ],
    "brands_by_date": [
      {
        "metrics_by_date": [
          {
            "date": "2021-01-01T00:00:00.000Z",
            "metrics": {
              "impact": 9574669,
              "count": 2,
              "valuation_usd": 112156.3012424234,
              "valuation_by_country": [
                {
                  "argentina": 9641875
                }
              ],
              "impressions": 133928918,
              "valuation": 9641875
            },
            "date_int": 1609459200000
          }
        ],
        "id": 186036,
        "name": "other-brand"
      }
    ],
    "brands": [
      {
        "metrics": {
          "impact": 9574669,
          "count": 2,
          "valuation_usd": 112156.3012424234,
          "valuation_by_country": [
            {
              "argentina": 9641875
            }
          ],
          "impressions": 133928918,
          "valuation": 9641875
        },
        "id": 186036,
        "name": "other-brand"
      }
    ]
  }
}
```
