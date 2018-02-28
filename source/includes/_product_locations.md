## `/products/locations`

### Description

> A `GET` request to this endpoint will return a complete list of products and their latest recorded locations.

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/locations"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            u'data': [
                {
                    u'error_radius': 2952,
                    u'latitude': u'-2.354956',
                    u'longitude': u'29.740627',
                    u'product_imei': u'861508031138712'
                },
                {
                    u'error_radius': 3560,
                    u'latitude': u'4.395848',
                    u'longitude': u'9.439759',
                    u'product_imei': u'862117022347339'
                },
                {
                    u'error_radius': 1936,
                    u'latitude': u'-1.591342',
                    u'longitude': u'30.071951',
                    u'product_imei': u'861508033164062'
                },
                {
                    u'error_radius': 1243,
                    u'latitude': u'-1.509023',
                    u'longitude': u'29.510557',
                    u'product_imei': u'866771029560751'
                },
                .
                .
                .
            ]
        }
```

This endpoint will return a complete list of products and their latest recorded locations.


### Endpoint

    | value
---:|:------
__endpoint__ | `/products/locations`
__method__ | `GET`
__url_params__ | None
__payload__ | None
__response__ | 200
__permissions | `OVERVIEW`


### Response

The format of the data returned by this endpoint is a dictionary containing a single key: 'data'. The value is an array of dictionaries. Each dictionary contains the location info for a single product:


<code>{         
          "product_imei": { imei },         
          "latitude": { latitude },         
          "longitude": { longitude },
          "error_radius": { error_radius },    
      }</code>


