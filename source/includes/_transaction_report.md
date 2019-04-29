# Transaction Report

The transaction report endpoint is the main interface by which your system can determine the current state of payments processed by Rotessa. The transaction report is limited to transcations 3 years into the futre or 1000 transactions, whichever comes first.

## Show Transaction Report

```shell
curl -X GET -H 'Content-Type: application/json' -H "Authorization: Token token=\"<api_key>\"" -d '{"start_date":"2018-09-12", "end_date":"2019-03-12", "filter":"All"}' <rotessa_endpoint>/transaction_report.json | python -m json.tool 
```

>The above command returns JSON structured like this:

```json
[
    {
        "account_number": 111111,
        "amount": "100.00",
        "created_at": "2019-01-29T15:46:03.000-05:00",
        "custom_identifier": "MIKEY",
        "customer_id": 1,
        "earliest_approval_date": null,
        "id": 1233,
        "institution_number": null,
        "process_date": "2019-02-28",
        "settlement_date": "2019-03-7",
        "status": "Future",
        "status_reason": null,
        "transaction_number": null,
        "transaction_schedule_id": 330374,
        "transit_number": null,
        "updated_at": null
    },
    {
        "account_number": 121212,
        "amount": "100.00",
        "created_at": "2019-02-29T14:55:16.000-05:00",
        "custom_identifier": "MIKEY",
        "customer_id": 1,
        "earliest_approval_date": null,
        "id": 1234,
        "institution_number": null,
        "process_date": "2019-03-07",
        "settlement_date": "2019-03-14",
        "status": "Future",
        "status_reason": null,
        "transaction_number": null,
        "transaction_schedule_id": 330374,
        "transit_number": null,
        "updated_at": null
    }
]
```

The endpoint provides 4 parameters which can be queried.

### HTTP REQUEST

`GET https://api.rotessa.com/v1/transaction_report`

Parameter  | Description 
 ------------- | ------------- 
start_date | The earliest process date (YYYY-MM-DD) of the list of transactions
end_date | The last process date (YYYY-MM-DD) of the list of transactions. Optional
status | Filter by the given financial status of the transactions
page | Page selected based on 1000 transactions per page

The `status` parameter can be one of the following values.

Parameter  | Description 
 ------------- | ------------- 
'All' | Return all the transactions. This is the default value
'Pending' | Only pending transactions. These are transactions still being processed by Rotessa
'Approved' | Only approved transactions. These are considered successful transactions
'Declined' | Only declined transactions. These are failed transactions
'Chargeback' | Only chargeback transactions. These are failed transactions