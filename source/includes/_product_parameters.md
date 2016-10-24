## `/products/<imei>/product_parameters`
### Description

> A `GET` request to this endpoint returns a dictionary containing active and pending parameters of the product and its parts

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/product_parameters"
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
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/product_parameters"
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

The `GET` request endpoint is designed for users to retrieve the current parameters for the product. The request should:

* Return all the parameters with the state `active` that belongs to the product
* Return all the parameters with the state `pending` that belongs to the product

The `POST` request endpoint is designed for users to provide new parameters for the product or parts associated with the product. The request should:

* Set the parameters to the product or part if it is a completely new parameter_type on the part or product and set the state of the parameter as `active`
* Update the parameters for the parts and product. This happens if the parameter_types being posted are pre-existing on the product or part, if this is the case, the previous parameters will have their state changed to `removed` and the new parameter will be given the state `active`

### Endpoint
To view the current parameter of a  <a href=/#product>`Product`</a>  and its parts, make a `GET` request to `/products/<imei>/product_parameters` with a valid imei.

    | value
---:|:------
__endpoint__ | `/products/<imei>/product_parameter`
__method__ | `GET`
__url_params__ | product_imei <font color="DarkGray">_(str)_</font> 
__payload__ | None
__response__ | 200
__permissions | `OVERVIEW`

To `POST` parameters to the product or its parts, make a `GET` request to `/products/<imei>/product_parameters` with a valid imei.

    | value
---:|:------
__endpoint__ | `/products/<imei>/product_parameter`
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