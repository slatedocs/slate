## `/products/<imei>/product_parameters`

> A `GET` request to this endpoint enables the unit.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/enable"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Product enabled", 
        "data": None
    }
```