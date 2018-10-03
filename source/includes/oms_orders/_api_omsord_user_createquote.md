## CreateQuote

**Category:** User<br />
**Permissions:** Operator, MarketMaker<br />
**Call Type:** Synchronous

**TK** call and response may change

Creates a quote. A quote expresses a willingness to buy or sell at a given price. Both a quote and an order will execute. Only a user with Operator or MarketMaker permission can create a quote.

<aside class="notice"><strong>Note:</strong> Quoting is not enabled for the retail end user of Cubobit software. Only registered market participants or market makers may quote.</aside>

### Request

```json
{
  "OMSId": 0,
  "AccountId": 0,
  "InstrumentId": 0,
  "Bid": 0,
  "BidQty": 0,
  "Ask": 0,
  "AskQty": 0,
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer.** The ID of the Order Management System on which the quote is being created. *Required*. |
| AccountId    | **integer.** The ID of the account in which the quote is being created. If the call provides no AccountId, the system assumes the default account ID for the logged-in user on the OMS. |
| InstrumentId | **long integer.** The ID of the instrument being quoted. *Required*. |
| Bid          | **real.** The bid price. *Required*.                         |
| BidQty       | **real.** The quantity of the bid. *Required*.               |
| Ask          | **real.** The ask price. *Required*.                         |
| AskQty       | **real.** The quantity of the ask. *Required*.               |

### Response

```json
{
  "BidQuoteId": 0,
  "BidResult": "",
  "AskQuoteId": 0,
  "AskResult": "",
 }
```

| Key        | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| BidQuoteId | **integer.** The ID of the bid quote returned by the Order Management System. |
| BidResult  | **string.** If the bid is rejected, this string provides a reason.   |
| AskQuoteId | **integer.** The ID of the ask quote returned by the Order Management System. |
| AskResult  | **string.** If the ask is rejected, this string provides a reason.  |




