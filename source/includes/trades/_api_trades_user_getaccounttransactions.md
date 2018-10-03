## GetAccountTransactions

**Category:** User<br />
**Permissions:** Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Returns a list of transactions for a specific account on an Order Management System. The owner of the trading venue determines how long to retain order history before archiving. The caller must be associated with the account named in *AccountId*.

<aside class="notice"><strong>Note:</strong> In this call, “Depth” refers not to the depth of the order book, but to the count of trades to report.</aside>

### Request

```json
{
  "OMSId": 1,
  "AccountId": 1,
  "Depth": 200
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer.** The ID of the Order Management System from which the account’s transactions will be returned. |
| AccountId | **integer.** The ID of the account for which transactions will be returned. If not specified, the call returns transactions for the default account for the logged-in user. |
| Depth     | **integer.** The number of transactions that will be returned, starting with the most recent transaction. |

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

The response returns an array of transaction objects. Note capitalization changes from the request.

| Key             | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| transactionId   | **Integer.** The ID of the transaction.                      |
| omsId           | **Integer.** The ID of the Order Management System under which the requested transactions took place. |
| accountId       | **Integer.** The single account under which the transactions took place. |
| cr              | **real.** Credit entry for the account on the order book. Funds entering an account. |
| dr              | **real.** Debit entry for the account on the order book. Funds leaving an account. |
| counterparty    | **long integer.** The corresponding party in a trade. |
| transactionType | **integer.** A number representing the type of transaction:<br />1 Fee<br />2 Trade<br />3 Other<br />4 Reverse<br />5 Hold<br />6 Rebate<br />7 MarginAcquisition<br />8 MarginRelinquish |
| referenceId     | **long integer.** The ID of the action or event that triggered this transaction. |
| referenceType   | **integer.** A number representing the type of action or event that triggered this transaction. One of:<br />1 Trade<br />2 Deposit<br />3 Withdraw<br />4 Transfer<br />5 OrderHold<br />6 WithdrawHold<br />7 DepositHold<br />8 MarginHold<br />9 ManualHold<br />10 ManualEntry<br />11 MarginAcquisition<br />12 MarginRelinquish<br />13 MarginQuoteHold |
| productId       | **integer.** The ID of the product on this account’s side of the transaction. For example, in a dollars-for-BitCoin transaction, one side will have the product Dollar and the other side will have the product BitCoin. Use **GetProduct** to return information about a product based on its ID. |
| balance         | **real.** The balance in the account after the transaction.  |
| timeStamp       | **long integer.** Time at which the transaction took place, in POSIX format. |


