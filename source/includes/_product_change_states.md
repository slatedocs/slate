## `/products/<imei>/change_state`
### Description
Each unit is represented by a `State Type` which provides an overview of the unit within its lifecycle. There are currently 9 allowed `State Types` on units, each of which correspond with an integer `state_type_id`. 

State Type| state_type_id
---:|:------
__NON_EXISTANT__ | 1
__STORED__ | 2
__SHIPPED__ | 3
__ACTIVATING__ | 4
__ACTIVATED__ | 5
__MONITORED__ | 6
__UNMONITORED__ | 7
__IN_REPAIR_SYSTEM__ | 8
__TERMINATED__ | 9

Transition between State Types are strictly enforced and operate in the following way:

Original State Type | Allowed Transitions
---:|:-----
__NON_EXISTANT__ | STORED
__STORED__ | SHIPPED, TERMINATED
__SHIPPED__ | ACTIVATING, ACTIVATED, IN_REPAIR_SYSTEM, TERMINATED
__ACTIVATING__ | ACTIVATED, IN_REPAIR_SYSTEM, TERMINATED
__ACTIVATED__ | MONITORED, UNMONITORED, IN_REPAIR_SYSTEM, TERMINATED
__MONITORED__ | UNMONITORED, IN_REPAIR_SYSTEM, TERMINATED
__UNMONITORED__ | MONITORED, IN_REPAIR_SYSTEM, TERMINATED
__IN_REPAIR_SYSTEM__ | ACTIVATED, TERMINATED
__TERMINATED__ | 

For example, a unit in `IN_REPAIR_SYSTEM` can only be moved into `ACTIVATED` or `TERMINATED`, all other transitions are disallowed.

`State Type` transitions are recorded in `State` with each `State` record containing `product_imei`, `prev_state_type`, `current_state_type` along with associated meta-data. For a full explanation of `States` see <a href=/#states>States</a>

> A `PUT` request to this endpoint changes the current `State` of the unit. A valid `state_type_id` need to be included in the data package. The following example shows demonstrates a unit transitioning from `ACTIVATED`(5) to `IN_REPAIR_SYSTEM`(8) successfully:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/change_state"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}
    data = {
    	"new_state": 8
	}

    r = requests.put(url=url, headers=headers, data=json.dumps(data))

    print r.json()
    >>> {
    		u'status': u'success', 
    		u'message': u'Product state changed'
    	}
```

> Here another `PUT` request is submitted to the endpoint, the unit is currently `ACTIVATED`(5) and an attempt to change it to `STORED` will result in failure:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/change_state"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}
    data = {
    	"new_state": 2
	}

    r = requests.put(url=url, headers=headers, data=json.dumps(data))

    print r.json()
    >>> {
	    	u'status': u'validation-error', 
	    	u'validation_errors': 
	    		{
	    			u'state_transition': u" A unit may not transition from state '5' to state '2'"
	    		}, 
	    	u'message': u"Your request contained invalid data. See 'data' or 'validation_errors' for exact details", 
	    	u'data': 
	    		{
	    			u'state_transition': u" A unit may not transition from state '5' to state '2'"
	    		}
    	}
```

### Endpoint

    | value
---:|:------
__endpoint__ | `/products/<imei>/change_state`
__method__ | `PUT`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"entity_id": <state_type_id>}`
__response__ | 200
__permissions__ | `ADMIN`