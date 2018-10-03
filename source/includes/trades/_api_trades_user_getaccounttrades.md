## GetAccountTrades

**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Requests the details on up to 200 past trade executions for a single specific account and Order Management System, starting at index *i*, where *i* is an integer identifying a specific execution in reverse order; that is, the most recent execution has an index of 0, and increments by one as trade executions recede into the past.

Users with Trading or AccountReadOnly permission may access trade information only for accounts with which they are associated; users with Operator permission may access trade information for any account.

The operator of the trading venue determines how long to retain an accessible trading history before archiving.

### Request

```json
{
    "OMSId": 0,
    "AccountId":0,
    "StartIndex":0,
    "Count":0
}
```

| Key        | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| OMSId      | **integer.** The ID of the Order Management System to which the user belongs. A user will belong to only one OMS. |
| AccountId  | **integer.** The ID of the account.                          |
| StartIndex | **integer.** The starting index into the history of trades, beginning from 0 (the most recent trade). |
| Count      | **integer.** The number of trades to return. The system can return up to 200 trades. |

### Response

```json
[
  {
    "omsId":1,
    "executionId":1,
    "tradeId":1,
    "orderId":1,
    "accountId":4,
    "subAccountId":0,
    "clientOrderId":0,
    "instrumentId":0,
    "side":0,
    "quantity":1.2,
    "remainingQuantity":0.0,
    "price":100.0,
    "value":100.0,
    "tradeTime":-62135446664520
   },
 ]
```


The response is an array of objects, each of which represents the account’s side of a trade (either buy or sell).

| Key               | Value                                                        |
| ----------------- | ------------------------------------------------------------ |
| omsId             | **integer.** The ID of the Order Management System to which the account belongs. |
| executionId       | **integer.** The ID of this account's side of the trade. Every trade has two sides. |
| tradeId           | **integer.** The ID of the overall trade.                    |
| orderId           | **long integer.** The ID of the order causing the trade (buy or sell). |
| accountId         | **integer.** The ID of the account that made the trade (buy or sell). |
| subAccountId      | **integer.** Not currently used; reserved for future use. Defaults to 0. |
| clientOrderId     | **integer.** An ID supplied by the client to identify the order (like a purchase order number). The *clientOrderId* defaults to 0 if not supplied. |
| instrumentId      | **integer.** The ID of the instrument being traded. An instrument comprises two products, for example Dollars and BitCoin. |
| side              | **integer.** A number representing one of the following potential sides of a trade: <br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (an error condition) |
| quantity          | **real.** The unit quantity of this side of the trade.       |
| remainingQuantity | **real.** The number of units remaining to be traded by the order after this execution. This number is not revealed to the other party in the trade. This value is also known as "leave size" or "leave quantity." |
| price             | **real.** The unit price at which the instrument traded.     |
| value             | **real.** The total value of the deal. The system calculates this as:<br />unit price X quantity executed. |
| tradeTime         | **long integer.** The date and time stamp of the trade, in POSIX format. |

