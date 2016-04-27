# Loans

> Loans success JSON response:

```json
{
"loan_limit" : "401.21",
  "loans": [
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
    "payments" : [],
    "status" : "open",
    "stripe_transfer_id" : "tr_182ZmjBzPVtDbW80WOM5qLnt",
    "tc_accepted_at" : "2016-04-21T00:51:25.134-04:00",
    "updated_at" : "2016-04-21T00:51:25.134-04:00",
    "user_id" : 1
    }
  ]
}
```
### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/loans`

# Validate amount

> Validate amount success JSON response:

```json
{
  "status" : "success",
  "amount" : "100.0"
}
```
> Validate amount error JSON response:

```json
{
  "status" : "error",
  "message" : "Your credit limit is $401.21 only!"
}
```
### HTTP Request

`POST http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/validate/amount`

# Fund processing

> Fund processing JSON request:

```json
{
"loan" : {
 "amount" : "100",
 "dues_attributes" : [
  {
  "amount" : 11.33,
  "due_date" : "2016-05-25"
  },
  {
    "amount" : 11.33,
    "due_date" : "2016-06-25"
    }
 ],
 "payment_period" : "30",
 "payment_term" : "360",
 "payment_type" : "manual"
 }
}
```
> Fund processing success JSON response:

```json
{
"message" : "Your request under process...!",
"status" : "success",
  "loan": {
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
    "status" : "processing",
    "stripe_transfer_id" : null,
    "tc_accepted_at" : null
    "updated_at" : "2016-04-21T00:51:25.134-04:00",
    "user_id" : 1
    }
}
```
### HTTP Request

`POST http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/ loans`

# Loan details

> Loan details success JSON response:

```json
{
  "loan": {
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
    "payments" : [],
    "status" : "open",
    "stripe_transfer_id" : "tr_182ZmjBzPVtDbW80WOM5qLnt",
    "tc_accepted_at" : "2016-04-21T00:51:25.134-04:00",
    "updated_at" : "2016-04-21T00:51:25.134-04:00",
    "user_id" : 1,
    "dues" : [
    {
    "amount" : "1.00",
    "created_at" : "2016-04-21T00:50:14.801-04:00",
    "due_date" : "2016-04-28",
    "id " : 1,
    "loan_id" : 2,
    "status" : "pending",
    "updated_at" : "2016-04-21T00:50:14.801-04:00"
    }
    ]
    }
}
```
### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/loan/2/show`
