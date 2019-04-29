# Financial Transactions

Financial transactions are are a history of the payments made for a customer. Financial transactions are created as a result of Transaction Schedules, and typcially move from a status of `Pending` -> `Approved` or `Pending` -> `Declined`. If a later chargeback occurs after a successful payment has been reported, financial transactions will be moved to a status of `Chargeback`.

Field  | Description 
 ------------- | ------------- 
id | ID of the financial transaction
amount | Transaction amount
process_date | The scheduled process date of the transaction
status | The current status of the transaction
status_reason | The reason for the `Declined` or `Chargeback` status of a transactions
transaction_schedule_id | ID of the transction schedule that created this financial transaction
bank_name | Bank name
institution_number | Bank institution number
transit_number | Bank transit number
account_number | Bank account number

## Status

Financial transactions can be in one of the following statuses.

Status | Description 
 ------------- | ------------- 
Future | The financial transaction has not yet been scheduled
Pending | The financial transaction is being processed
Approved | The financial transaction was successful
Declined | The financial transaction was declined for the reason specified in status_reason

## Status Reasons

Financial transactions, if `Declined` or `Chargeback` will have a value in the <code>status_reason</code> field.

Reason | 
 ------------- | 
NSF | 
Payment Stopped/Recalled | 
Edit Reject | 
Funds Not Cleared | 
Account Closed | 
Invalid/Incorrect Account No. | 
Account Not Found | 
Account Frozen | 
Agreement Revoked | 
No Debit Allowed | 

