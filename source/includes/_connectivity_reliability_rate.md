## `/products/<imei>/connectivity_reliability_rate`
### Description
For diagnosis of connectivity issues it is desirable to see the `connectivity_reliability_rate` of a unit

defined as:

_connectivity_rate = actual-number-of-connections / expected-number-of-connections_

This endpoint calculates the connectivity rate of a unit between the times `start` and `end`.

* `start` defaults to 7 days ago
* `end` defaults to now()
* `start` and `end` may be specified in the request. If unspecified the default values will be used.
* `end` must not be in the future
* `end` must not be before `start`
* `start` and `end` must both be either isoformatted timestamps or in `yyyy-mm-dd HH:MM:SS` format

The endpoint assumes that a unit will connect once every four hours and will be pessimistic in it's calculations:
ie: it will assume that in a 7 hour period a unit will connect only once. 

It is possible (especially due to wake-ups) that a unit will connect more than once every four hours in this case the rate is "capped" at 1.00

> Get the reliability rate for the default time range (previous 7 days)

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/connectivity_reliability_rate"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Successfully computed product connectivity reliability rate",
        "data": {
            "connectivity_reliability_rate": 0.85
        }
    }
```

> Get the reliability rate for the last month

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/connectivity_reliability_rate"
    data = json.dumps({
        "start": (dt.datetime.utcnow() - dt.timedelta(days=30)).isoformat()
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Successfully computed product connectivity reliability rate",
        "data": {
            "connectivity_reliability_rate": 0.70
        }
    }
```
> Get the reliability rate for the month before last

```python

    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/connectivity_reliability_rate"
    data = json.dumps({
        "start": "2017-01-01 00:00:00"
        "end": "2017-06-01 00:00:00"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Successfully computed product connectivity reliability rate",
        "data": {
            "connectivity_reliability_rate": 1.00
        }
    }
```

### Endpoint
To view the `connectivity_reliability_rate` of a  <a href=/#product>`Product`</a>  with a given imei make a `GET` request to `/products/<imei>/connectivit_reliability_rate`.
You may optionally include a date(ISO 8601 format) time-range in the payload:

`data = json.dumps({"start": "start-date", "end": "end-date"})`

    | value
---:|:------
__endpoint__ | `/products/<imei>/connectivity_reliability_rate`
__method__ | `GET`
__url_params__ | `product_imei`  <font color="DarkGray">_(str)_</font>
__response__ | 200
__payload__ | start, end <font color="DarkGray">_(optional)_</font>
__permissions__ | `OVERVIEW`

### Response

The format of the data returned by this endpoint is a dictionary with keys `status`, `message`, `data`.

The `data` key contains a dictionary with `connectivity_reliability_rate`: <value>

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response