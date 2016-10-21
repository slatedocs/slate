## `/products/<imei>/parameters/history`
### Description

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/parameters/history"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Product enabled", 
        "data": None
    }
```