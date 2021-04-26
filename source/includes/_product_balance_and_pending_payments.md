## `/products/<imei>/balance_and_pending_payments`

### Description
> A `GET` request to this endpoint will return the balance, expected expiry and pending payment commands associated with that unit.

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/balance_and_pending_payments"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print(r.json())

    >>>{
        "status": "success",
        "message": "Balance and pending credits.",
        "data": {
            "balance": 432000,
            "expected_expiry": "2020-11-06T07:07:45.796359",
            "pending_payment_commands": [
                {
                    "category": "force-reset",
                    "created_at": "2020-11-06T07:07:45.742314",
                    "modified_at": "2020-11-06T07:07:45.742314",
                    "value": 0
                },
                {
                    "category": "zero-command",
                    "created_at": "2020-11-06T07:02:44.906775",
                    "modified_at": "2020-11-06T07:07:45.742314",
                    "value": 0
                },
                {
                    "category": "payment",
                    "created_at": "2020-10-29T12:40:49.443969",
                    "modified_at": "2020-11-06T07:07:45.742314",
                    "value": 2592000
                }
            ]
        }
    }


```
A `GET` request to this endpoint will return:

* The remaining balance (in seconds) present on the unit
* The expected expiry of the balance
* The pending payment commands along with category, value, created_at and modified_at


### Endpoint

    | value
---:|:------
__endpoint__ | `/products/<imei>/balance_and_pending_payments`
__method__ | `GET`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200
__permissions | `OVERVIEW`