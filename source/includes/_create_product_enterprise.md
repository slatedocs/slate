## `/products/create_product/enterprise`

> A POST request to this endpoint will create a new enterprise product on the system using an existing pcb

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/create_product/enterprise"
    data = json.dumps({"pcb_imei": "010101234560005",
                       "battery": {
                           "part_type_id": 72,
                           "serial_number": "BC4pDRSReEFnMHzHARHI7Gr9",
                        },
                       "solar_panel_wattage": 100,
                       "product": {"assembler": "Assembly House 1"}
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
                              "serial_number": "HB000501-084032-G",
                              "assembler": "Assembly House 1"},
                  "sim": {"imsi": "213514135171353",
                          "part_id": 1651799,
                          "part_type_id": 43}},
         "message": "EnterpriseProduct: HB000501-084032-G - (010101234560005) created.",
     } 
```

This endpoint will create a new enterprise product on the system using an existing pcb

    | value 
---:|:------
__endpoint__ | `/products/create_product/enterprise`
__method__ | `POST`
__url_params__ | None
__payload__ | `{"pcb_imei": <imei>,`<br>&nbsp;&nbsp;`"battery": {"part_type_id": <part_type_id>,`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"serial_number": <serial_number>}`<br>&nbsp;&nbsp;`"solar_panel_wattage": 100`<br>`}`
__response__ | 200
__permissions__ | <font color="Crimson">__`FACTORY`__</font>

