# Transaction Schedules

Transaction schedules are the method by which recurring or one time payments are scheduled in Rotessa for a customer. Payments require a schedule date, which must be at least 2 business days in the future, as well as a frequency.

Parameter  | Description 
 ------------- | ------------- 
ID | ID of the transaction schedule. 
process_date | The initial date to begin withdrawing funds. (e.g. November 20, 2016)
installments | The number of installments. Leave blank to continue withdrawing funds indefinitely.
comment | A places to enter notes for the transaction schedule.
next_process_date | The next date that funds will be withdrawn.
financial_transactions | A list of financial transactions generated as a result of the payment schedule specified.

## Schedule Frequency

The frequency of a transaction schedule must be one of the following values:

Frequency  | Description 
 ------------- | ------------- 
Once | One time payment
Weekly | Every week
Every Other Week | Every two weeks
Monthly | Every month
Every Other Month | Every two months
Quarterly | Every 3 months
Semi-Annually | Every six months
Yearly | Once a year

Transaction schedules have an optional installments parameter that allow you to schedule a set number of payments. To schedule payments indefinitely simply omit this parameter and Rotessa will continue withdrawing funds until the schedule is cancelled.

## Get A Specific Transaction Schedule

```shell
curl "<rotessa_endpoint>/transaction_schedules/<ID>.json" -H "Authorization: Token token=\"<api_key>\"" | python -m json.tool
```

>The above command returns JSON structured like this:

```json
{
    "amount": "123.00",
    "comment": "",
    "created_at": "2019-04-16T14:40:38.000-05:00",
    "financial_transactions": [],
    "frequency": "Once",
    "id": 333215,
    "installments": 1,
    "next_process_date": "2019-04-16",
    "process_date": "2019-04-16",
    "updated_at": "2019-04-16T14:40:38.000-05:00"
}
```

This endpoint creates a transaction schedule for a customer.

### HTTP REQUEST

`GET https://api.rotessa.com/v1/transaction_schedules/<ID>.json`

### URL PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
ID | The ID of the transaction schedule to retrieve

## Create A Transaction Schedule with Rotessa Customer ID

```shell
curl -X POST -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\""  -d '{"customer_id":1, "amount": 100, "frequency": "Monthly", "process_date": "November 24, 2017", "comment": "Membership fees"}' <rotessa_endpoint>/transaction_schedules.json | python -m json.tool
```

>The above command returns JSON structured like this:

```json
{
    "amount": "100.00",
    "comment": "Membership fees (Created with API)",
    "created_at": "2017-04-29T13:31:54.000-05:00",
    "financial_transactions": [],
    "frequency": "Monthly",
    "id": 111111,
    "installments": null,
    "next_process_date": "2017-11-24",
    "process_date": "2017-11-24",
    "updated_at": "2017-04-29T13:31:54.000-05:00"
}
```

This endpoint creates a transaction schedule for a customer.

### HTTP REQUEST

POST https://api.rotessa.com/v1/transaction_schedules.json

### POST PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
customer_id | ID of customer
amount | Amount for schedule
process_date | The initial date to begin withdrawing funds. (e.g. November 20, 2016)
frequency | Frequecy of transaction. Must be one of preceding [valid frequecies](#schedule-frequency)
installments | The number of installments. If value is excluded, schedule is indefinite
comment | Optional comment for schedule

<aside class="notice">
When creating schedules you must specify a process date of at least 2 business days in the future.
</aside>

## Create A Transaction Schedule with Custom Identifier

```shell
curl -XPOST -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\""  -d '{"custom_identifier":"MikeSmith0001", "amount": 100, "frequency": "Monthly", "process_date": "November 24, 2019", "comment": "Membership fees"}' <rotessa_endpoint>/v1/transaction_schedules/create_with_custom_identifier.json
```

>The above command returns JSON structured like this:

```json
{
    "amount": "100.00",
    "comment": "Membership fees (Created with API)",
    "created_at": "2019-04-29T15:45:18.000-05:00",
    "financial_transactions": [],
    "frequency": "Monthly",
    "id": 435194,
    "installments": null,
    "next_process_date": "2019-11-24",
    "process_date": "2019-11-24",
    "updated_at": "2019-04-29T15:45:18.000-05:00"
}
```

This endpoint creates a transaction schedule for a customer.

### HTTP REQUEST

`POST https://api.rotessa.com/v1/transaction_schedules/create_with_custom_identifier.json`

### POST PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
custom_identifier | Your own unique custom identifier for the customer
amount | Amount for schedule
process_date | The initial date to begin withdrawing funds. (e.g. November 20, 2016)
frequency | Frequecy of transaction. Must be one of preceding [valid frequecies](#schedule-frequency)
installments | The number of installments. If value is excluded, schedule is indefinite
comment | Optional comment for schedule

<aside class="notice">
When creating schedules you must specify a process date of at least 2 business days in the future.
</aside>

## Update A Specific Transaction Schedule with Custom Identifier

```shell
curl -X POST -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\""  -d '{"customer_identifier":"MIKEY", "amount": 100, "frequency": "Monthly", "process_date": "November 24, 2019", "comment": "Membership fees"}' <rotessa_endpoint>/transaction_schedules/create_with_custom_identifier.json | python -m json.tool
```

>The above command returns JSON structured like this:

```json
{
    "amount": "100.00",
    "comment": "Membership fees (Created with API)",
    "created_at": "2019-04-29T15:46:03.000-05:00",
    "financial_transactions": [],
    "frequency": "Monthly",
    "id": 435195,
    "installments": null,
    "next_process_date": "2019-11-24",
    "process_date": "2019-11-24",
    "updated_at": "2019-04-29T15:46:03.000-05:00"
}
```

This endpoint updates a transaction schedule for a customer.

### HTTP REQUEST

`PATCH https://api.rotessa.com/v1/transaction_schedules/<ID>.json`

### URL PARAMETERS
Parameter  | Description 
 ------------- | ------------- 
id | The ID of the transaction schedule to retrieve
comment | Optional comment for schedule

<aside class="notice">
Once a schedule is created, you may only modify the amount and comment values.
</aside>

## Update A Specific Transaction Schedule with Transaction ID

```shell
curl -X PATCH -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\"" -d '{"customer_id":1, "amount": 150, "comment": "New Membership fees"}' <rotessa_endpoint>/transaction_schedules/435191.json | python -m json.tool
```

>The above command returns JSON structured like this:

```json
{
    "amount": "150.00",
    "comment": "New Membership fees",
    "created_at": "2019-04-29T14:55:16.000-05:00",
    "financial_transactions": [],
    "frequency": "Monthly",
    "id": 435191,
    "installments": null,
    "next_process_date": "2019-11-24",
    "process_date": "2019-11-24",
    "updated_at": "2019-04-29T14:58:29.000-05:00"
}
```

This endpoint updates a transaction schedule for a customer.

### HTTP REQUEST

`PATCH https://api.rotessa.com/v1/transaction_schedules/<ID>.json`

### URL PARAMETERS
Parameter  | Description 
 ------------- | ------------- 
id | The ID of the transaction schedule to retrieve
comment | Optional comment for schedule

<aside class="notice">
Once a schedule is created, you may only modify the amount and comment values.
</aside>

## Update A Specific Transaction Schedule with Transaction ID via POST

```shell
curl -X PATCH -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\"" -d '{"customer_id":1, "amount": 150, "comment": "New Membership fees"}' <rotessa_endpoint>/transaction_schedules/<ID>.json | python -m json.tool
```

>The above command returns JSON structured like this:

```json
{
    "amount": "150.00",
    "comment": "New Membership fees",
    "created_at": "2019-04-29T14:55:16.000-05:00",
    "financial_transactions": [],
    "frequency": "Monthly",
    "id": 435191,
    "installments": null,
    "next_process_date": "2019-11-24",
    "process_date": "2019-11-24",
    "updated_at": "2019-04-29T14:58:29.000-05:00"
}
```

This endpoint updates a transaction schedule for a customer.

### HTTP REQUEST

`POST https://api.rotessa.com/v1/transaction_schedules/<ID>.json`

### URL PARAMETERS
Parameter  | Description 
 ------------- | ------------- 
id | The ID of the transaction schedule to retrieve
comment | Optional comment for schedule

<aside class="notice">
Once a schedule is created, you may only modify the amount and comment values.
</aside>


## Delete A Specific Transaction Schedule

```shell
curl -X DELETE -H "Authorization: Token token=\"<api_key>\"" "<rotessa_endpoint>/transaction_schedules/<id>.json"
```

This endpoint deletes a transaction schedule for a customer.

A successfully deleted transaction schedule will return no errors.

### HTTP REQUEST

`DELETE https://api.rotessa.com/v1/transaction_schedules/<ID>.json`

### URL PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
ID | The ID of the transaction schedule to retrieve









