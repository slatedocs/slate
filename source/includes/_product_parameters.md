## `/products/<imei>/product_parameters`
### Description

> A `GET` request to this endpoint retrieves the product and its subsequent part parameters for the specified product

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

>A `POST` request to this endpoint sets the product and its subsequent part parameters for the specified product

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