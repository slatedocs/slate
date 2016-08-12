## `/products/<imei>/change_customer`

```python
url = "http://smartapi.bboxx.co.uk/v1/products/111111111111111/change_customer"

data = json.dumps({
    "entity_id": 4,
    "external_customer_id": 1234
    "external_customer_code": "MuzanseRwanda22"
    "reason": "broken unit"
})

headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.put(url=url, data=data, headers=headers)

print r
>>> {
    "status": "success",
    "message": "Customer Bill Stickers (1) changed to 111111111111111"
    "data": {
        "name": customer_name,
        "customer_id": customer_id,
        "external_customer_id": external_customer_id,
        "external_customer_code": external_customer_code,
        "new_product_imei": imei,
        "remvoal_reason": None,
}
```

In the SMARTSolar system the <a href=/#customer>`Customer`</a> belongs to a <a href=/#product>`Product`</a> rather than the reverse.  Therefore if a <a href=/#customer>`Customer`</a> changes their <a href=/#product>`Product`</a>, in the SMARTSolar system this equates to a <a href=/#product>`Product`</a> changing their <a href=/#customer>`Customer`</a>.   
This endpoint can be called to change the <a href=/#customer>`Customer`</a> that is assigned to <a href=/#product>`Product`</a>. 

To do so simply make the `PUT` request to the imei of the new <a href=/#product>`Product`</a>. The old <a href=/#product>`Product`</a> will have that <a href=/#customer>`Customer`</a> removed automatically by the system. 

    | value 
---:|:------
__endpoint__ | `/products/<imei>/change_customer`
__method__ | `PUT`
__url_params__ | `product_imei` _(str)_
__payload__ | (entity_id, external_customer_id OR external_customer_code, reason)
__response__ | 200


### <u>Example Usage</u>

If Customer-A current has unit `000000000000000` and changes to unit `111111111111111` then the correct action is therefore a request to `products/111111111111111/change_customer` as shown to the right.