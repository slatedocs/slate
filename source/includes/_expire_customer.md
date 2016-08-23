## `/products/<imei>/expire_customer`
### Description

```python
url = "http://smartapi.bboxx.co.uk/v1/products/000000000000000000/expire_customer"
data = json.dumps({"reason": "repossessed"})
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.put(url=url, data=data, headers=headers)

print r
>>> {
    "status": "success",
    "message": "Product 000000000000000 removed from customer",
    "data": None,
}
```

In certain situations a <a href=/#product>Product</a>  is simply removed from a <a href=/#customer>`Customer`</a> with no replacement. In this scenario its necessary to expire that product's <a href=/#customer>`Customer`</a>. This will simply remove the <a href=/#customer>`Customer`</a> from that <a href=/#product>`Product`</a>  and leave the <a href=/#product>`Product`</a>  not associated to any <a href=/#customer>`Customer`</a>


### Endpoint
To remove a <a href=/#customer>`Customer`</a> from a <a href=/#product>`Product`</a>  with a given imei make a `PUT` request to `/products/<imei>/expire_customer`.   
You may optionally include a <a href="/#customer-product-history">reason</a> in the payload:

`data = json.dumps({"reason": "Some sensible reason"})`

    | value 
---:|:------
__endpoint__ | `/products/<imei>/expire_customer`
__method__ | `PUT`
__url_params__ | `product_imei`  <font color="DarkGray">_(str)_</font> 
__payload__ | reason <font color="DarkGray">_(optional)_</font>
__response__ | 200
