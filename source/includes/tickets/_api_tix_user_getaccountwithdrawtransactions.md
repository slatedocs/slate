## GetAccountWithdrawTransactions

**Category:** User<br />**Permissions:** Trading, AccountReadOnly<br />**Call Type:** Synchronous

Obtains a list of withdrawals for an account.

Users with Trading and AccountReadOnly permission can return withdrawal transactions only from an account with which they are associated.

The owner of the trading venue determines how long to retain transaction history before archiving.

<aside class="notice"><strong>Note:</strong> Depth in this call is a count of how many withdrawal transactions to report. It is not "depth of market."</aside>

###Request

```json
{
    "OMSId": 1,
    "AccountId": 1,
    "Depth": 200
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer.** The ID of the Order Management System on which the account transactions took place. |
| AccountId | **integer.** The ID of the account whose transactions will be returned. |
| Depth     | **integer.** The count of withdrawal transactions to be returned. Defaults to 200. |

### Response

```json
[
  {
    "transactionId":0,
    "omsId":0,
    "accountId":0,
    "cr":0.0,
    "dr":0.0,
    "counterparty":0,
    "transactionType":0,
    "referenceId":0,
    "referenceType":0,
    "productId":0,
    "balance":0.0,
    "timeStamp":0
    },
]
```

The response returns an array of transaction objects.

| Key             | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| transactionId   | **Integer.** The ID of the transaction.                      |
| omsId           | **Integer.** The ID of the Order Management System under which the requested transactions took place. |
| accountId       | **Integer.** The single account under which the transactions took place. |
| cr              | **real.** Credit entry for the account on the order book. Funds entering an account. |
| dr              | **real.** Debit entry for the account on the order book. Funds leaving an account. |
| counterparty    | **long integer.** The corresponding party in a trade.        |
| transactionType | **integer.** A number representing the type of transaction:<br />1 Fee<br />2 Trade<br />3 Other<br />4 Reverse<br />5 Hold<br />6 Rebate<br />7 MarginAcquisition<br />8 MarginRelinquish |
| referenceId     | **long integer.** The ID of the action or event that triggered this transaction. |
| referenceType   | **integer.** A number representing the type of action or event that triggered this transaction. One of:<br />1 Trade<br />2 Deposit<br />3 Withdraw<br />4 Transfer<br />5 OrderHold<br />6 WithdrawHold<br />7 DepositHold<br />8 MarginHold<br />9 ManualHold<br />10 ManualEntry<br />11 MarginAcquisition<br />12 MarginRelinquish<br />13 MarginQuoteHold |
| productId       | **integer.** The ID of the product that was withdrawn. Use **GetProduct** to return information about a product based on its ID. |
| balance         | **real.** The balance in the account after the transaction.  |
| timeStamp       | **long integer.** Time at which the transaction took place, in POSIX format. |



