##`/products/<imei>/set_dcm_enabled_flag`

> A `PUT` request to this endpoint sets `dcm_enabled_flag` of a product.

```python
    data = {"enabled": True}
    endpoint = "/products/{}/set_dcm_enabled_flag".format(imei)
    r = self.put(endpoint, data=data, user=user, expected_response=expected_response)

    print(r.json())

    >>>{
        "status": "success",
        "message": "Product 866771029508370. DCM Enabled Flag set to True",
        "data": None
    }


```

This endpoint sets `dcm_enabled_flag` of products. The imei of the unit is specified in the url.

BP20 devices are DCM enabled by default and cannot be modified using this endpoint. This endpoint is for making other products (e.g. BP50) DCM enabled.

    | value
---:|:------
__endpoint__ | `/products/<imei>/set_dcm_enabled_flag`
__method__ | `PUT`
__url_params__ | `product_imei` _(str)_
__response__ | 200
__payload__ | `{"enabled": <enabled>}`
__permissions__ | `TECHNICAL`

### Enabled
The body of the `PUT` can either be `{"enabled": True}` or `{"enabled": False}`.