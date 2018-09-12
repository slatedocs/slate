## `/products/create_hub2`

> A POST request to this endpoint will create a new hub 2 product on the system

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/create_hub2"
    data = json.dumps({"imsi": "213514135171353",
                       "imei": "010101234560005",
                       "device_key": "4ab1ab3ab1ab7ab9ab1ab4ab",
                       "product": {"assembler": "Assembly House 1"}})
    headers = {"Content-Type": "application/json", "Authorization": "Token token=" + A_VALID_TOKEN}

    r = requests.post(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success"
        "data": {"pcb": {"part_id": 1651798,
                         "part_type_id": 77,
                         "serial": "010101234560005"},
                 "product": {"device_key": "4ab1ab3ab1ab7ab9ab1ab4ab",
                             "imsi": "213514135171353",
                             "product_imei": "010101234560005",
                             "product_type_id": 7,
                             "serial_number": "HB000501-084031-B",
                             "assembler": "Assembly House 1"},
                 "sim": {"imsi": "213514135171353",
                         "part_id": 1651797,
                         "part_type_id": 43}},
        "message": "Hub2Product: HB000501-084031-B - (010101234560005) created.",
    }
```

This endpoint will create a new hub 2 product on the system

This is a convenience endpoint which is equivalent to calling `/parts/create_hyena_pcb` followed by calling `/products/create_product/hub2`

    | value 
---:|:------
__endpoint__ | `/products/create_hub2`
__method__ | `POST`
__url_params__ | None
__payload__ | `{"imei": <imei>,`<br>&nbsp;&nbsp;`"imsi": <imsi>,`<br>&nbsp;&nbsp;`"device_key": <device_key>,`<br>&nbsp;&nbsp;`"pcb_part_type_id": <part_type_id>` (optional, default=77),<br>&nbsp;&nbsp;`"sim_part_type_id": <part_id>` (optional, default=43),<br>&nbsp;&nbsp;`"iccid": <iccid>` (optional, if given then sim part will be created with this as serial_number, otherwise will be the imsi}
__response__ | 200
__permissions__ | <font color="Crimson">__`FACTORY`__</font>
