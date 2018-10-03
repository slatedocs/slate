## UpdateQuote

**Category:** User<br />
**Permissions:** Operator, MarketMaker<br />
**Call Type:** Synchronous

Updates an existing quote. Quoting is not enabled for the retail end user of the Cubobit software. Only registered market participants or market makers may quote.

<aside class="warning"><strong>Warning</strong> **UpdateQuote** resets the quote's priority in the order book.</aside>

### Request

```json
{
	"OMSId": 0,
	"AccountId": 0,
	"InstrumentId": 0,
	"BidQuoteId": 0,
	"Bid": 0,
	"BidQTY": 0,
	"AskQuoteId": 0,
	"Ask": 0,
	"AskQTY": 0,
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer.** The ID of the Order Management System where the quote is located. |
| AccountId    | **integer.** The ID of the account whose quote will be updated. |
| InstrumentId | **long integer.** The ID of the instrument whose quote is being updated. |
| BidQuoteId   | **integer.** The ID of the original bid quote being updated. |
| Bid          | **real.** The new amount of the bid quote.                   |
| BidQTY       | **real.** The new quantity of the bid quote.                 |
| AskQuoteId   | **integer.** The ID of the original ask quote being updated. |
| Ask          | **real.** The new amount of the ask quote.                   |
| AskQTY       | **real.** The new quantity of the ask quote.                 |

### Response

```json
{
  "bidQuoteId":0,
  "bidResult":"",
  "askQuoteId":0,
  "askResult":""
}
```

| Key        | Value                                                    |
| ---------- | -------------------------------------------------------- |
| bidQuoteId | **long integer.** The ID of the Bid quote being updated. |
| bidResult  | **string.** If this bid is rejected, this string provides a reason. |
| askQuoteId | **long integer.** The ID of the Ask quote being updated. |
| askResult  | **string.** If this ask is rejected, this string provides a reason. |


