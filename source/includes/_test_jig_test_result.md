## <u>Test Jig Test Result</u>
Test results from the BBOXX test jig.


### <u>The test_jig_test_result object</u>

Field | Description
------:|:------------
__test_jig_test_result_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each test result object.
__jig_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | Identfies the test jig that submitted the results
__machine_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | Identfies the test jig gateway computer that submitted the results
__product_imei__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | Identfies the unit under test 
__jig_software_version__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | The test jig's software version 
__user__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | Identfies the user running the test
__passed__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(unique)</font> | Indicates whether the tests passed
__results__ <br><font color="DarkGray">_json_</font> <font color="Crimson">(unique)</font> | JSON structure containing the detailed test results
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<hr>
<br>

> An example POST request. Note that `test_jig_test_result_id`, `created_at`, `modified_at`, `created_by` and `modified_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "https://smartapi.bboxx.co.uk/v1/test_jig_test_results"
    data = json.dumps({
            "jig_id": "81dff512",
            "machine_id": "e1924ae5",
            "product_imei": "864811030998657",
            "jig_software_version": "1.06",
            "user": "ci.system@bboxx.co.uk",
            "passed": True,
            "results": {
                "LEDs": {
                    "pass": True,
                    "value": None,
                    "time": "0.54"
                },
                "3V3 rail": {
                    "pass": True,
                    "value": "3.30",
                    "time": "0.02"
                },
                "Flash firmware": {
                    "pass": True,
                    "value": None,
                    "time": "3.14"
                }
            },
        })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
        "created_at": "2018-04-24T09:20:49.421918",
        "created_by": "ci.system@bboxx.co.uk",
        "jig_id": "81dff512",
        "jig_software_version": "1.06",
        "machine_id": "e1924ae5",
        "modified_at": null,
        "modified_by": null,
        "passed": true,
        "product_imei": "864811030998657",
        "results": {
            "3V3 rail": {
                "pass": true,
                "time": "0.02",
                "value": "3.30"
            },
            "Flash firmware": {
                "pass": true,
                "time": "3.14",
                "value": null
            },
            "LEDs": {
                "pass": true,
                "time": "0.54",
                "value": null
            }
        },
        "test_jig_test_result_id": 6,
        "user": "ci.system@bboxx.co.uk"
    }
```

    > We can retrieve the `test_jig_test_result` created by specifying its `test_jig_test_result_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_test_results/6'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "created_at": "2018-04-24T09:20:49.421918",
        "created_by": "ci.system@bboxx.co.uk",
        "jig_id": "81dff512",
        "jig_software_version": "1.06",
        "machine_id": "e1924ae5",
        "modified_at": null,
        "modified_by": null,
        "passed": true,
        "product_imei": "864811030998657",
        "results": {
            "3V3 rail": {
                "pass": true,
                "time": "0.02",
                "value": "3.30"
            },
            "Flash firmware": {
                "pass": true,
                "time": "3.14",
                "value": null
            },
            "LEDs": {
                "pass": true,
                "time": "0.54",
                "value": null
            }
        },
        "test_jig_test_result_id": 6,
        "user": "ci.system@bboxx.co.uk"
    }
```

> We can retrieve all `test_jig_test_results` by omitting the `test_jig_test_result_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_test_results'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        u'total_pages': 1,
        u'objects': [
            {<record>},
            {<record>},
            {<record>},
            {<record>},
            {<record>},
        ],
        u'num_results': 10,
        u'page': 1
    }
```

> We can edit the newly created `test_jig_test_result` with a `PUT` request:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_test_results/6'
    data = json.dumps({
        "results": {
            "LEDs": {
                "pass": true,
                "value": null,
                "time": "0.56"
            },
            "3V3 rail": {
                "pass": true,
                "value": "3.30",
                "time": "0.02"
            },
            "Flash firmware": {
                "pass": true,
                "value": null,
                "time": "3.29"
            }
        }
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "created_at": "2018-04-24T09:20:49.421918",
        "created_by": "ci.system@bboxx.co.uk",
        "jig_id": "81dff512",
        "jig_software_version": "1.06",
        "machine_id": "e1924ae5",
        "modified_at": "2018-04-24T09:55:00.265075",
        "modified_by": "ci.system@bboxx.co.uk",
        "passed": true,
        "product_imei": "864811030998657",
        "results": {
            "3V3 rail": {
                "pass": true,
                "time": "0.02",
                "value": "3.30"
            },
            "Flash firmware": {
                "pass": true,
                "time": "3.29",
                "value": null
            },
            "LEDs": {
                "pass": true,
                "time": "0.56",
                "value": null
            }
        },
        "test_jig_test_result_id": 6,
        "user": "ci.system@bboxx.co.uk"
    }
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `test_jig_test_result`

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_test_results/6'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.



### POST
     | value
 ----:|:---
endpoint | `/v1/test_jig_test_results`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `test_jig_test_result` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/test_jig_test_results` or `/v1/test_jig_test_results/<test_jig_test_result_id>`
method | `GET`
url_params | `test_jig_test_result_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/test_jig_test_results/<test_jig_test_result_id>`
method | `PUT`
url_params | `test_jig_test_result_id` of the `test_jig_test_result` you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/test_jig_test_results/<test_jig_test_result_id>`
method | `DELETE`
url_params | `test_jig_test_result_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    