## `/products/create_enterprise`

> A POST request to this endpoint will create a new enterprise product on the system

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/create_enterprise"
    data = json.dumps({"imsi": "213514135171353",
                       "imei": "010101234560005",
                       "device_key": "4ab1ab3ab1ab7ab9ab1ab4ab",
                       "battery": {
                           "part_type_id": 72,
                           "serial_number": "BC4pDRSReEFnMHzHARHI7Gr9",
                        },
                       "solar_panel_wattage": 100,
                      })
    headers = {"Content-Type": "application/json", "Authorization": "Token token=" + A_VALID_TOKEN}

    r = requests.post(url=url, data=data, headers=headers)

    print r.json()
    >>> {"status": "success"
         "data": {"battery": {"part_id": 1693186,
                              "part_type_id": 72,
                              "serial": u'BC4pDRSReEFnMHzHARHI7Gr9'},
                  "pcb": {"part_id": 1651800,
                          "part_type_id": 77,
                          "serial": "010101234560005"},
                  "product": {"device_key": "4ab1ab3ab1ab7ab9ab1ab4ab",
                              "imsi": "213514135171353",
                              "product_imei": "010101234560005",
                              "product_type_id": 4,
                              "serial_number": "HB000501-084032-G"},
                  "sim": {"imsi": "213514135171353",
                          "part_id": 1651799,
                          "part_type_id": 43}},
         "message": "EnterpriseProduct: HB000501-084032-G - (010101234560005) created.",
     } 
```

This endpoint will create a new enterprise product on the system

This is a convenience endpoint which is equivalent to calling `/parts/create_hyena_pcb` followed by calling `/products/create_product/enterprise`

    | value 
---:|:------
__endpoint__ | `/products/create_enterprise`
__method__ | `POST`
__url_params__ | None
__payload__ | `{"imei": <imei>,`<br>&nbsp;&nbsp;`"imsi": <imsi>,`<br>&nbsp;&nbsp;`"device_key": <device_key>,`<br>&nbsp;&nbsp;`"pcb_part_type_id": <part_type_id>` (optional, default=77),<br>&nbsp;&nbsp;`"sim_part_type_id": <part_id>` (optional, default=43),<br>&nbsp;&nbsp;`"iccid": <iccid>` (optional, if given then sim part will be created with this as serial_number, otherwise will be the imsi}
__response__ | 200
__permissions__ | <font color="Crimson">__`FACTORY`__</font>
