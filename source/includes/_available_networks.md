## `/products/<imei>/available_networks`
### Description
For diagnosis of connectivity issues it is helpful to be able to see the networks that a unit could connect to, given its SIM type and the country it is in.

This endpoint returns the list of networks a unit could connect to in its current location.

> Get the available networks for the unit in Rwanda (country code 635)

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/available_networks?mcc=635"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "data": {
            'networks': [
                {
                    'created_at': '2016-08-16T13:41:14.431241',
                    'created_by': 'user@bboxx.co.uk',
                    'mcc': 635,
                    'mccmnc': 63514,
                    'mnc': 14,
                    'modified_at': None,
                    'modified_by': None,
                    'name': 'Rwanda Airtel'
                },
                {
                    'created_at': '2016-08-16T13:41:14.431241',
                    'created_by': 'user@bboxx.co.uk',
                    'mcc': 635,
                    'mccmnc': 63510,
                    'mnc': 10,
                    'modified_at': None,
                    'modified_by': None,
                    'name': 'Rwanda MTN'
                }
            ]
        }
    }
```

### Endpoint
To view the `available_networks` for a  <a href=/#product>`Product`</a>  with a given imei make a `GET` request to `/products/<imei>/available_networks`, passing a mobile country code (MCC) value as a query argument.

    | value
---:|:------
__endpoint__ | `/products/<imei>/available_networks?mcc=<mcc>`
__method__ | `GET`
__url_params__ | `product_imei`  <font color="DarkGray">_(str)_</font>
__response__ | 200
__payload__ | None
__permissions__ | `OVERVIEW`

### Response

The format of the data returned by this endpoint is a dictionary with keys `status`, `data`, and (optionally) `message`.

The `data` key contains an array of Network objects 

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response