# Transaction Report

The transaction report endpoint is the main interface by which your system can determine the current state of payments processed by Rotessa. The transaction report is limited to transcations 3 years into the futre or 1000 transactions, whichever comes first.

## Show Transaction Report

```shell
curl -X GET -H 'Content-Type: application/json' 
  -H "Authorization: Token token=\"<api_key>\""  "<rotessa_endpoint>/transaction_report.json?start_date=2016-09-12&end_date=2016-11-12&filter=All"
```

>The above command returns JSON structured like this:

```json

```

The endpoint provides 4 parameters which can be queried.

### HTTP REQUEST

`GET https://api.rotessa.com/v1/transaction_report`

Parameter  | Description 
 ------------- | ------------- 
start_date | The earliest process date (YYYY-MM-DD) of the list of transactions.
end_date | The last process date (YYYY-MM-DD) of the list of transactions. Optional
status | Filter by the given financial status of the transactions.
page | Page selected based on 1000 transactions per page

The `status` parameter can be one of the following values.

Parameter  | Description 
 ------------- | ------------- 
'All' | Return all the transactions. This is the default value.
'Pending' | Only pending transactions. These are transactions still being processed by Rotessa.
'Approved' | Only approved transactions. These are considered successful transactions.
'Declined' | Only declined transactions. These are failed transactions.
'Chargeback' | Only chargeback transactions. These are failed transactions.