# DCM - Device Credit Management

The section lists information about the SMARTSolar DCM (Device Credit Management) Service. Including how DCM works and details of the various API endpoints and tables that are provided to interact with DCM Enabled Units.

## What is DCM?
DCM is a new way for SMARTSolar to control when a unit is `enabled` or `disabled`.
Historically, all BBOXX units operated in "Server Credit Mode". When a customer pays, BBOXX servers `/enable` the unit and when a customer rus out of credit BBOXX Servers disable the unit again.

This system was simple but has a significant flaw: if the unit is placed in an area of bad signal, messages cannot reach the unit and the state of the unit cannot be changed. This is a particular problem for units that are currently `enabled` and cannot be `disabled` since they provide free energy to our customers.

The new DCM service allows BBOXX to add "credit" to a unit. The unit will keep a record of the remaining `Balance` and when the `Balance` reaches `0` the unit will `disable` itself automatically, regardless of connectivity.

Credit can be added and removed from the unit and the unit can be "zero'd" meaning that the unit sets it's own `balance` to `0` and returns the `final_balance` back to SMARTSolar.

The `Balance` on a unit can never go below `0`. If a user attempts to remove more credit than the unit has remaining in the `Balance` then the unit will accept this request but set the `balance` the `0`.

The unit will periodically update SMARTSolar with it's current `Balance` and the `expected_expiry` of that `Balance`.

## How does DCM Work?
The DCM API can be used  to add credit, remove credit or zero a unit. SMARTSolar will receive these `payment_commands` and update the unit each time a new `payment_command` is received. SMARTSolar will receive confirmation from the unit that it has received each `payment_command`. If confirmation is not received SMARTSolar will periodically retry to update the unit eventually falling back to SMS messages if GSM communication is not available.

SMARTSolar will retain a history of all of the `payment-commands` added to each unit.

## PaymentCommands
Credit is managed using the <a href="#payment-command">payment_command</a> table and the dedicated `/products/<imei>/add_payment_command` endpoint.

A `payment_command` has:

* `value`: an integer number of seconds of credit to add or remove from the unit
* `status`: whether the unit has received and accepted that payment_command
* `category`: the category of the payment_command
* `transaction_id`: a unique id used to reject duplicate payment_commands

There are 3 possible categories:

* `payment`  (for adding credit)
* `bad-payment`  (for removing credit)
* `zero-command`  (for zero-ing a unit)

Additionally if a unit does not respond to a `zero-command` it is possible to `force-reset` a unit using the dedicated `/force_reset` endpoint.

Users can add as many `payment_commands` as they like with the following restrictions:

* You may not remove more credit than has ever been added to the unit
* You may not add `payment_commands` whilst there is an unacknowledged `zero-command`
* Transaction_id must be `unique`
* `payment_commands` with category `payment` must have `value` > `0`
* `payment_commands` with category `bad-payment` must have `value` < `0`
* `payment_commands` with category `zero-command` must have `value` == `0`

### Balance
The unit will keep a record of it's own `Balance` in memory. Periodically the unit will update SMARTSolar with it's `Balance`. SMARTSolar will keep the most recent `Balance` in the <a href="#balance">Balance</a> table and log a history of `Balances` in Influx. Whenever a `Balance` is uploaded from a unit, SMARTSolar will calculate and store the  <a href="#balance">expected_expiry</a> of that `Balance` which is the date and time that we expect that unit to swtich-off (assuming no further `payment-commands` are added).

The `Balance` <a href="#balance">Balance</a> table in SMARTSolar is updated whenever a unit receives a new `payment_command`. Additionally the unit will regularly update SMARTSolar with it's current `Balance` if it has a good GSM connection.

Note that the purpose of DCM is to overcome issues of poor connectivity which means that, by nature, we expect many DCM units to have poor connectivity and therefore have out-of-date `Balance` values!

### Zeroing a Unit
Sometimes it's necessary to return all the remaining credit on a unit and set the `Balance` to `0`.
This is acheived using a specific `payment_command` called a `zero-command`.
A `zero-command` is  a `payment_command` with:
* `category`: `zero-command`
* `value`:`0`

When a `zero-command` is added SMARTSolar forwards the `zero-command` along with all outstanding `payment-commands` to the unit. When the unit receives the `zero-command` it will update it's `Balance` with the outstanding `payment-commands` then immediately set it's `Balance` to `0` and return the <a href="#final-balance">FinalBalance</a> to SMARTSolar.

When SMARTSolar receives the <a href="#final-balance">FinalBalance</a> it will store the result in the <a href="#final-balance">FinalBalance</a> table and then `VOID` all previous `payment_commands`.

Zero-ing is an asynchronous process. The initial response to the `zero-command` is immediate but the `FinalBalance` is updated in a separate message at a later time often much later.

### Voiding Commands
After a `zero-command` (or `force-reset`) all previous `payment-commands` for the unit have `VOID` set to `True`. This allows SMARTSolar to ignore these commands and treat the unit as though it has been completely reset without losing the history of the `payment_commands` that have been supplied. You can see which commands are `VOID` by accessing the `
"void"` column (boolean) of the `payment_command` table.


### Final Balance
After receiving a `zero-command` the unit will return it's `FinalBalance` to SMARTSolar. SMARTSolar will store the `FinalBalance` of the unit along with the `payment_command_id` of the associated `zero-command`. SMARTSolar will Publish the `FinalBalance` into the 'dcm' pubsub channel where any external serivce who has subscribed to the `dcm` channel can receive the `FinalBalance` and return it to the customer's account.

### Force-Reset
In order to receive and process a `zero-command` the unit must be working correctly. If a unit is damaged or cannot receive messages from SMARTSolar it will not process the `zero-command`. In the event that a unit cannot process a `zero-command` but we still need to `zero` the unit it is possible to `Force-Reset` the unit. This action attempts to remove as much credit as possible from a unit without connecting to it based on known information in SMARTSolar.

A user can `force-reset` a unit using the dedicated `/force_reset` endpoint.

When a unit is Force-Reset SMARTSolar will synchronously remove credit from the device and return it in the response to the `/force_reset` API request.

SMARTSolar will return two values in response to a `/force_reset`:
```
{
    "status": "success",
    "data": {
        "outstanding_payments": <int>   # (sum of all payment not yet acknowledged by the unit)
        "last_known_balance": <int>     # (the last balance recorded by the unit (can be None)
    },
    "message": "Product #111222333444555 has been Force-Reset"
}
```

A `/force_reset` request will `VOID` all previously `payment_commands` and `zero` the `Balance` in SMARTSolar for that unit.

## DCM API Examples

### Adding Credit
To add credit to a unit, send a `payment_command` with `category`: `payment` and `value` > `0`.
> Here is an example request to add 10 credit to a device:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/add_payment_command"
    data = {
            "value": 10,
            "transaction_id": 'eda4997b-8efa-4ec7-8496-8c6f38ddb579',
            "category": 'payment'
        }
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, json=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "new payment_command added to product #000000000000",
        "data": None,
    }
```


    | value
---:|:------
__endpoint__ | `/products/<imei>/add_payment_command`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"value": 10,`<br>&nbsp;`"category": 'payment',`<br>&nbsp;`"transaction_id": <tx_id>}`
__response__ | 201


### Removing Credit
To remove credit from the device you must add a new payment_command with `category`: `bad_payment` and `value` < `0`.

A unit's `Balance` can never be negative.
Requests which attempt to remove more credit than has ever been added to a device will be rejected.
Requests which remove more credit than there is `Balance` remaining will be accepted but the `Balance` will be floored at `0`.

> For example:

```python
payment: +10          | Balance: +10
< 7 credit used >     | Balance: +3
bad_payment: -20      | Rejected! (-20 is more than has ever been added (+10))
bad_payment: -5       | Balance: 0 (request accepted but Balance cant be < 0)
```

> Here is an example request to remove 10 credit from a unit:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/add_payment_command"
    data = {
            "value": -10,
            "transaction_id": 'eda4997b-8efa-4ec7-8496-8c6f38ddb579',
            "category": 'bad-payment'
        }
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, json=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "new payment_command added to product #000000000000",
        "data": None,
    }
```
    | value
---:|:------
__endpoint__ | `/products/<imei>/add_payment_command`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"value": -10,`<br>&nbsp;`"category": "bad-payment", `<br>&nbsp;`"transaction_id": <tx_id>}`
__response__ | 201

### Zero-ing a unit
To zero a unit you must add a new `payment_command` with `category`: `zero-command` and `value`: `0`.

> Here is an example request to zero and unit:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/add_payment_command"
    data = {
            "value": 0,
            "transaction_id": 'eda4997b-8efa-4ec7-8496-8c6f38ddb579',
            "category": 'zero-command'
        }
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, json=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "new payment_command added to product #000000000000",
        "data": None,
    }
```

    | value
---:|:------
__endpoint__ | `/products/<imei>/add_payment_command`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"value": 0,`<br>&nbsp;`"category": "zero-command",`<br>&nbsp;`"transaction_id": <tx_id>}`
__response__ | 201

### Force-Reseting a unit.
To `force-reset` a unit you must use the dedicated `/force_reset` endpoint. This endpoint still requires a `transaction_id` to prevent duplicate `force-reset` messages.

> Here is an example request to force-reset a unit:

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/force_reset"
    data = {"transaction_id": 'eda4997b-8efa-4ec7-8496-8c6f38ddb579'}
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, json=data, headers=headers)

    print r.json()
    >>> {
        "status": "success",
        "message": "Product #111222333444555 has been Force-Reset",
        "data": {
            "outstanding_payments": 250
            "last_known_balance": 58
        }
    }
```

    | value
---:|:------
__endpoint__ | `/products/<imei>/force_reset`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"transaction_id": <tx_id>}`
__response__ | 201

### Querying PaymentCommands
See the <a href="#payment-command">PaymentCommand</a> table.

### Querying Balances and expected_expiry
See the <a href="#balance">Balance</a> table.

### Querying FinalBalances
See the <a href="#final-balance">FinalBalance</a> table.


