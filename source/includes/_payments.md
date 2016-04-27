# Payments

> Payments success JSON response:

```json
{
"status" : "success",
"payments": [
    {
        "amount" : "100.0",
        "bank_transfer_id" : "tr_182ZmjDhWncaQU9BeCmZmjWU",
        "created_at" : "2016-04-21T00:50:14.771-04:00",
        "created_on" : "2016-04-26",
        "due_id" : null,
        "id" : 1,
        "loan_id" : 1,
        "status" : "succeeded",
        "stripe_charge_id" : "py_181YzIBzPVtDbW80vfOJ1SoD",
        "updated_at" : "2016-04-21T00:51:25.134-04:00",
        "loan" :
        {
            "amount" : "100.0",
            "bank_transfer_id" : "tr_182ZmjDhWncaQU9BeCmZmjWU",
            "created_at" : "2016-04-21T00:50:14.771-04:00",
            "created_on" : "2016-04-26",
            "end_date" : "2016-07-20",
            "id" : 1,
            "loan_number" : "loan-1461214214",
            "payment_period" : 7,
            "payment_term" : 90,
            "payment_type" : "manual",
            "status" : "open",
            "stripe_transfer_id" : "tr_182ZmjBzPVtDbW80WOM5qLnt",
            "tc_accepted_at" : "2016-04-21T00:51:25.134-04:00",
            "updated_at" : "2016-04-21T00:51:25.134-04:00",
            "user_id" : 1
            }
        }
    ]
}
```

### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/payments`