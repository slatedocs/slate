##`/products/<imei>/suggest_energy_limit`

### Description

The energy_limit is restricted by the energy_limit_cap, if it is set.
Requests will be accepted and the energy_limit truncated if the requested
limit is higher than the cap.
The endpoint will inform the user of the requested and applied limit, the
energy_limit_cap and explicitly state whether the requested limit has been
truncated.

If a product has total_accessory_energy set, the endpoint will
prevent the energy_limit being altered.

The unit must also be in either: `ACTIVATED`, `MONITORED` or `IN_REPAIR_SYSTEM`.

### Endpoint

To suggest an energy limit on a <a href=/#product>`Product`</a>  with a given imei make a `PUT` request to `/products/<imei>/suggest_energy_limit`.

Energy limits are passed in as strings.

`data = json.dumps({"energy_limit": "<suggested_energy_limit>"})`

    | value
---:|:------
__endpoint__ | `/products/<imei>/suggest_energy_limit`
__method__ | `PUT`
__url_params__ | `product_imei`  <font color="DarkGray">_(str)_</font>
__response__ | 200
__payload__ | date <font color="DarkGray">_(optional)_</font>
__permissions__ | `TECHNICAL`


```python
    data = {"energy_limit": "<energy_limit>"}
    endpoint = "/products/{}/suggest_energy_limit".format(imei)
    r = self.put(endpoint, data=data, user=user, expected_response=expected_response)

    print(r.json())

    >>>{
        "status": "success",
        "message": message,
        "data": {
            "requested": requested_limit,
            "applied": applied_limit,
            "max_energy_limit": max_energy_limit,
            "min_energy_limit": min_energy_limit,
            "bounded": bounded
        } 200
    }


```