## `/repairs/<repair_id>/current_state`

> A `GET` request to this endpoint retrieves information about the current state of the given workflow. 

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/000000000000/current_state"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair found",
            "data": {
                "description": "The test jig indicates that this unit has a faulty PCB. Replace the PCB. Click the button below when this has been done",
                "events": [],
                "ident": "replace_pcb",
                "inputs": [
                    {
                        "data_type": "selection",
                        "ident": "replacement_part_type",
                        "label": "Choose one of these replacement PCB's",
                        "options": [
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 7)",
                                "value": 61
                            },
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 2)",
                                "value": 44
                            },
                            {
                                "label": "BBOXX Home 2 PCB (Tiger 6)",
                                "value": 48
                            }
                        ],
                        "selection_type": "single"}],
                "name": "Replace PCB"
            },
    }
```

This endpoint retrieves information about the current state of the given workflow. 

    | value 
---:|:------
__endpoint__ | `/repairs/<repair_id>/current_state`
__method__ | `GET`
__url_params__ | `repair_id` _(int)_
__payload__ | None
__response__ | 200

The format of the data returned by this endpoint is a dictionary with key `status`, `data`, and (optionally) `message`.

The `data` key contains a dictionary with the following keys:

* "ident" - a unique identifier for the state within the workflow
* "name" - the name of the state which can be displayed to the user
* "description" - description of the purpose of the state and any actions the user is required to take
* "inputs" - a list of [IRT Input Specifications](#irt-input-specifications) (may be empty)
* "events" - a list of [IRT Event Specifications](#irt-event-specifications) (may be empty)

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response