## `/upload_tool_log`

> A `POST` request to this endpoint is used to upload a log message from a manufacturing or repair tool to Influx.

```python
    url = "https://smartapi.bboxx.co.uk/v1/upload_tool_log"
    data = json.dumps({
        "time": "2020-11-05T10:25:30Z",
        "message": "{\"serials\": {\"pcb\": \"BX0020-417157-M\", \"battery\": \"BT01090101-012042-0G9-3\", \"product\": \"BX0020-417157-M\"}, \"input_pv\": {\"value\": \"5.150\", \"pass\": true}, \"output_usb\": {\"value\": \"1.183\", \"pass\": true}, \"output_12v\": {\"value\": \"3.285\", \"pass\": true}}",
        "toolname": "bpower20_registration_production",
        "hostname": "CN-REG03",
        "machine_id": "593bfa0c",
        "passed": True,
        "product_imei": "866557056339858",
        "serial_number": "",
        "software_version": "0.3.0",
        "user": "mfg.sunworth@bboxx.co.uk",
        })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
        "data": None
        "status": "success",
        "message": "Log uploaded successfully",
    }    

```

This endpoint uploads a log message from a manufacturing or repair tool to Influx. 

The "time", "message" and "toolname" fields must be supplied with every request to this endpoint. The value of "toolname" determines which other fields are allowed

toolname | permitted fields
----:|:---
tiger_test_jig_production | jig_id, machine_id, user, time, software_version, passed, serial_number
tiger_test_jig_repair | jig_id, machine_id, user, software_version, passed, serial_number, product_imei, count
koala_test_jig_production | jig_id, machine_id, user, software_version, passed, serial_number, product_imei, hostname, control_board_revision
bpower20_registration_production | machine_id, hostname, user, software_version, passed, serial_number, product_imei


### POST
     | value
 ----:|:---
endpoint | `/v1/upload_tool_log`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the log entry
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`


If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response