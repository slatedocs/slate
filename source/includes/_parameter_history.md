## `/products/<imei>/parameters/history`
### Description
It is desirable to be able to see both the current configuration of a product and it's parts and the historical configuration of the product.

For this reason, all `parameters` (both `product_parameters` and `part_parameters`) are stored in the systems with the dates that they are added and removed and the user who assigned them.

The `/parameters/history` endpoint can either return:

* The full parameter history of the product if no date is specified in the request.
* The `active` parameter set on a product at a given date and time if a date is specified in the request.

### Full Parameter History
If the user does not include a date in the request the API will return a complete history of all parameters for that unit for all time.
This will include:

* `active` parameters currently set on the unit
* `pending` parameters
* `removed` parameters which used to be active but have been subsquently removed
* `expired` parameters - those which were schedule to update but a new parameter was set before the change could take effect

The `date_added` field indicates the time at which that parameter moved from `pending` -> `active`.  
The `date_removed` field indicates the time at which that parameter moved from `active` -> `removed`.  
`pending` parameters have neither `date_added` nor `date_removed` set.  
`expired` parameters have `date_added` and `date_removed` immediately after each other.  

### Active parameter set on a given date
If a user includes a date with the `GET` request then the API will return the active parameter set at the specified date/time.
This means it will return the list of parameters as the unit would have "seen them". It will adjust the states of the returned parameters to be current "as it was". It is therefore the case that a parameter which is listed as `removed` in the system should be returned as `active` if it was `active` at the time specified.

### Endpoints

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/111010101010101/parameters/history"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Full parameter history for #111010101010101 returned successfully",
        "data":
        	{
        		"part_parameters":
        		{
        			'616479':
        			[
	        			{
	        				'status': 'expired',
		        			'modified_by': 'ci.system@bboxx.co.uk',
		        			'part_parameter_id': 98,
		        			'date_removed': '2016-10-21T11:38:16.961100',
		        			'created_at': '2016-10-21T11:38:16.884380',
		        			'modified_at': '2016-10-21T11:38:16.961501',
		        			'created_by': 'ci.system@bboxx.co.uk',
		        			'parameter_type_id': 52,
		        			'value': '5',
		        			'part_id': 616479,
		        			'date_added':
		        			'2016-10-21T11:38:16.960878'
		        		},
	        			{
	        				'status': 'removed',
	        				'modified_by': 'ci.system@bboxx.co.uk',
		        			'part_parameter_id': 99,
		        			'date_removed': '2016-10-21T11:38:18.285516',
		        			'created_at': '2016-10-21T11:38:16.967994',
		        			'modified_at': '2016-10-21T11:38:18.286111',
		        			'created_by': 'ci.system@bboxx.co.uk',
		        			'parameter_type_id': 52,
		        			'value': '6',
		        			'part_id': 616479,
		        			'date_added': '2016-10-21T11:38:17.888303'
		        		},
	        			{
	        				'status': 'active',
	        			  	'modified_by': 'ci.system@bboxx.co.uk',
	        			  	'part_parameter_id': 100,
	        			  	'date_removed': None,
	        			  	'created_at': '2016-10-21T11:38:18.087947',
	        			  	'modified_at': '2016-10-21T11:38:18.287348',
	        			  	'created_by': 'ci.system@bboxx.co.uk',
	        			  	'parameter_type_id': 52,
	        			  	'value': '7',
	        			  	'part_id': 616479,
	        			  	'date_added': '2016-10-21T11:38:18.285744'
	        			}
        			],
	        		'616484': [],
	        		'616483': [],
	        		'616482': [],
	        		'616481': [],
	        		'616480': []
        		},

        		'product_parameters':
        		[
        			{
        				'product_imei': '111010101010101',
		        		'status': 'active',
		        		'modified_by': 'ci.system@bboxx.co.uk',
		        		'date_removed': None,
		        		'created_at': '2016-10-21T11:36:55.397643',
		        		'modified_at': '2016-10-21T11:38:17.590436',
		        		'created_by': 'ci.system@bboxx.co.uk',
		        		'parameter_type_id': 1,
		        		'value': 'True',
		        		'date_added': '2016-10-21T11:38:17.589958',
		        		'product_parameter_id': 76796
        			},
	        		{
	        			'product_imei': '111010101010101',
		        		'status': 'active',
		        		'modified_by': 'ci.system@bboxx.co.uk',
		        		'date_removed': None, 'created_at':
		        		'2016-10-21T11:36:55.530771',
		        		'modified_at': '2016-10-21T11:38:17.636904',
		        		'created_by': 'ci.system@bboxx.co.uk',
		        		'parameter_type_id': 2,
		        		'value': 'False',
		        		'date_added': '2016-10-21T11:38:17.636484',
		        		'product_parameter_id': 76797
	        		},
	        		{
	        			'product_imei': '111010101010101',
		        		'status': 'expired',
		        		'modified_by': 'ci.system@bboxx.co.uk',
		        		'date_removed': '2016-10-21T11:38:16.995178',
		        		'created_at': '2016-10-21T11:38:16.920406',
		        		'modified_at': '2016-10-21T11:38:16.995607',
		        		'created_by': 'ci.system@bboxx.co.uk',
		        		'parameter_type_id': 52,
		        		'value': '5',
		        		'date_added': '2016-10-21T11:38:16.994943',
		        		'product_parameter_id': 76864
		        	},
        			{
        				'product_imei': '111010101010101',
		        		'status': 'removed',
		        		'modified_by': 'ci.system@bboxx.co.uk',
		        		'date_removed': '2016-10-21T11:38:18.248536',
		        		'created_at': '2016-10-21T11:38:17.004684',
		        		'modified_at': '2016-10-21T11:38:18.249128',
		        		'created_by': 'ci.system@bboxx.co.uk',
		        		'parameter_type_id': 52,
		        		'value': '6',
		        		'date_added': '2016-10-21T11:38:17.680470',
		        		'product_parameter_id': 76865
        			},
	        		{
	        			'product_imei': '111010101010101',
		        		'status': 'active',
		        		'modified_by': 'ci.system@bboxx.co.uk',
		        		'date_removed': None,
		        		'created_at': '2016-10-21T11:38:18.132115',
		        		'modified_at': '2016-10-21T11:38:18.250434',
		        		'created_by': 'ci.system@bboxx.co.uk',
		        		'parameter_type_id': 52,
		        		'value': '7',
		        		'date_added':
		        		'2016-10-21T11:38:18.248753',
		        		'product_parameter_id': 76866
		        	}
        		]
        	}
        }
    }
```
### Endpoint
To view the parameter history of a  <a href=/#product>`Product`</a>  with a given imei make a `GET` request to `/products/<imei>/parameters/history`.
You may optionally include a date(ISO 8601 format) filter in the payload:

`data = json.dumps({"date": "Some date"})`

    | value
---:|:------
__endpoint__ | `/products/<imei>/parameters/history`
__method__ | `GET`
__url_params__ | `product_imei`  <font color="DarkGray">_(str)_</font>
__response__ | 200
__payload__ | date <font color="DarkGray">_(optional)_</font>
__permissions__ | `OVERVIEW`

### Response

The format of the data returned by this endpoint is a dictionary where the keys are `part_parameters` and `product_parameters`.

The `part_parameter` dictionary contains integer keys which represent the `part_id` of a part which belongs to the product. The values linked to the key is a list of dictionaries, each of which represents a single parameter for the product.

The `product_parameter` dictionary consists of a single list of dictionaries which contains the parameters assigned to the product.