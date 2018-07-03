## `/parts/create_hyena_pcb`

> A POST request to this endpoint will create a new hyena pcb part on the system

```python
    url = "https://smartapi.bboxx.co.uk/v1/parts/create_hyena_pcb"
    data = json.dumps({"imsi": 213514135171353,
                       "imei": 010101234560005,
                       "device_key": 4ab1ab3ab1ab7ab9ab1ab4ab})
    headers = {"Content-Type": "application/json", "Authorization": "Token token=" + A_VALID_TOKEN}

    r = requests.post(url=url, data=data, headers=headers)

    print r.json()
    >>> {"status": "success"
         "message": "new pcb part and sim successfully created",
         "data": {"pcb": {"part_type_id": 77,
                          "properties": {"device_key": "4ab1ab3ab1ab7ab9ab1ab4ab",
                                         "imei": "010101234560005",
                                         "imsi": "213514135171353",
                                         "serial_number": "HB000501-084032-G"},
                          "serial_number": "010101234560005"},
                  "sim": {"part_type_id": 43,
                          "serial_number": "213514135171353"}},
     }
```

This endpoint will create a new hyena pcb part on the system

    | value 
---:|:------
__endpoint__ | `/parts/create_hyena_pcb`
__method__ | `POST`
__url_params__ | None
__payload__ | `{"imei": <imei>,`<br>&nbsp;`"imsi": <imsi>,`<br>&nbsp;`"device_key": <device_key>,`<br>&nbsp;`"pcb_part_type_id": <part_type_id>` (optional, default=77),<br>&nbsp;`"sim_part_type_id": <part_id>` (optional, default=43),<br>&nbsp;`"iccid": <iccid>` (optional, if given then sim part will be created with this as serial_number, otherwise will be the imsi}
__response__ | 200
__permissions__ | <font color="Crimson">__`FACTORY`__</font>

