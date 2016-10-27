## `/products/<imei>/parameters`
### Description

> A `GET` request to this endpoint returns a dictionary containing active and pending parameters of the product and its parts

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/parameters"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Current parameters for # returned successfully",
        "data": {
                    'part_parameters':
                    [
                        {
                            'status': 'pending',
                            'modified_by': None,
                            'part_parameter_id': 105,
                            'date_removed': None,
                            'created_at': '2016-10-24T09:46:33.613074',
                            'modified_at': None,
                            'created_by': 'ci.system@bboxx.co.uk',
                            'parameter_type_id': 55,
                            'value': 'elephants',
                            'part_id': 616479,
                            'date_added': None
                        }
                    ],
                    'product_parameters':
                    [
                        {
                            'product_imei': '111010101010101',
                            'status': 'active',
                            'modified_by': 'ci.system@bboxx.co.uk',
                            'date_removed': None,
                            'created_at': '2016-10-24T09:46:15.945135',
                            'modified_at': '2016-10-24T09:46:16.287039',
                            'created_by': 'ci.system@bboxx.co.uk',
                            'parameter_type_id': 1,
                            'value': 'False',
                            'date_added': '2016-10-24T09:46:16.285136',
                            'product_parameter_id': 76880
                        },
                        {
                            'product_imei': '111010101010101',
                            'status': 'active',
                            'modified_by': 'ci.system@bboxx.co.uk',
                            'date_removed': None,
                            'created_at': '2016-10-24T09:46:16.139237',
                            'modified_at': '2016-10-24T09:46:16.412951',
                            'created_by': 'ci.system@bboxx.co.uk',
                            'parameter_type_id': 2,
                            'value': 'False',
                            'date_added': '2016-10-24T09:46:16.411008',
                            'product_parameter_id': 76881
                        },
                        {
                            'product_imei': '111010101010101',
                            'status': 'pending',
                            'modified_by': None,
                            'date_removed': None,
                            'created_at': '2016-10-24T09:46:33.678810',
                            'modified_at': None,
                            'created_by': 'ci.system@bboxx.co.uk',
                            'parameter_type_id': 55,
                            'value': 'elephants',
                            'date_added': None,
                            'product_parameter_id': 76890
                        }
                    ]
                }
        }

```

> A `POST` request to this endpoint will update the product and parts with the new parameters and return a response dictionary confirming newly set values

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/parameters"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}
    data = {
            'part_parameters': {'616479': {'string_test_parameter': 'elephants'}},
            'product_parameters': {'string_test_parameter': 'elephants'}}
    }

    r = requests.post(url=url, headers=headers, data=data)

    print r.json()
    >>> {
        "status": "success",
        "message": "Current parameters for #111010101010101 successfully updated",
        "data": {
                    'data':
                    {
                        'part_parameters':
                        {
                            '616479':
                            [
                                {
                                    'status': 'pending',
                                    'modified_by': None,
                                    'part_parameter_id': 105,
                                    'date_removed': None,
                                    'created_at': '2016-10-24T09:28:34.601150',
                                    'modified_at': None,
                                    'created_by': 'ci.system@bboxx.co.uk',
                                    'parameter_type_id': 55,
                                    'value': 'elephants',
                                    'part_id': 616479,
                                    'date_added': None
                                }
                            ]
                        },
                        'product_parameters':
                        [
                            {
                                'product_imei': '111010101010101',
                                'status': 'pending',
                                'modified_by': None,
                                'date_removed': None,
                                'created_at': '2016-10-24T09:28:34.63
                            }
                        ]
                    }
                }
```

There are a variety of settings and configurations that a user may wish to apply to a particular unit. In order to allow flexible configuration of any unit, and keep a record of the configurations at any given time the system uses `parameters` to control it's configuration.

In addition to configuration on the unit in question, the `parts` on the unit may also require configuration.

For this reason `product_parameters` and `part_parameters` distinguish between a config applied to a particular product, and a config applied to a particular part on a particular product.

When a user wishes to change the config of a unit they should create a new `product_parameter` or `part_parameter`, with that setting, for the unit.
All new `parameters` are initialised as `pending` until the unit has been successfully sent the new config, at which point they move to `active`. Previously active `parameters` are changed to `removed` when a new parameter of that `parameter_type` is added.

If a `parameter` is `pending` and another `parameter` is sent, the old pending parameter is changed to `overwritten` and the most recently submitted `parameter` becomes `pending`.

A complete history of parameters for a unit is kept so that the historical state of a unit may be observed.

A list of possile `parameters` for a unit is shown in `parameter_types`.

### Endpoint
Users can retrieve the current parameters for the product with a `GET` request to `product/<imei>/parameters. The request should:

* Return all the parameters with the state `active` that belongs to the product
* Return all the parameters with the state `pending` that belongs to the product

To view the current active and pending parameters of a  <a href=/#product>`Product`</a>  and its parts, make a `GET` request to `/products/<imei>/parameters` with a valid imei.

    | value
---:|:------
__endpoint__ | `/products/<imei>/parameters`
__method__ | `GET`
__url_params__ | product_imei <font color="DarkGray">_(str)_</font>
__payload__ | None
__response__ | 200
__permissions | `OVERVIEW`

Users can set new parameters for the product or parts associated with the product using a `POST` request.



    | value
---:|:------
__endpoint__ | `/products/<imei>/parameters`
__method__ | `POST`
__url_params__ | product_imei <font color="DarkGray">_(str)_</font>
__payload__ | data <font color="DarkGray">_(JSON dictionary)_</font>
__response__ | 200
__permissions | `OVERVIEW`

* The data has be in the form of a valid JSON object and follow the standardised format, valid `part_ids` for each part must be declared in the dictionary. (See Example 1)

> `Example 1`

```python
data = {
    "product_parameters": {parameter_type_name: valid_parameter_value},
    "part_parameters": {
        sim_id: {parameter_type_name: valid_parameter_value}
    }
}
```

* All `parameter_type_name`(str) can be found in the `parameter_types` table and the values for the `parameter_types` must follow the validation rules set for the parameter_type. Alternative, users may choose to use the `parameter__type_id`(int) as an alternative to `parameter_type_name`. (See Example 2)

> `Example 2`

```python
data = {
    "product_parameters": {parameter_id: valid_parameter_value},
    "part_parameters": {
        sim_id: {parameter_id: valid_parameter_value}
    }
}
data = json.dumps(data)
```

* If only `product_parameters` or only `part_parameters` are to be altered, an empty dictionary should be provided in place of the dictionary of parameter values. (See Example 3)

> `Example 3`

```python
data = {
    "product_parameters": {},
    "part_parameters": {
        sim_id: {parameter_type_name: valid_parameter_value}
    }
}
data = json.dumps(data)
```

* Parameters may be declared for multiple parts in `part_parameters`. (See Example 4)

> `Example 4`

```python
data = {
    "product_parameters": {parameter_type_name: valid_parameter_value},
    "part_parameters": {
        sim_id: {parameter_type_name: valid_parameter_value},
        battery_id: {parameter_type_name: valid_parameter_value}
    }
}
data = json.dumps(data)
```