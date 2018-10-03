## GetOpenQuotes

**Category:** User<br />**Permissions:** Operator, MarketMaker<br />**Call Type:** Synchronous

Returns the current bid and ask quotes for a given instrument ID and account ID.

### Request

```json
{
  "omsId": 0,
  "accountId": 0,
  "instrumentId": 0,
}
```

| Key       | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer**. The ID of the Order Management System where the instrument is traded whose quote may be open. |
| AccountId    | **integer**. The ID of the account whose open quotes will be returned. |
| InstrumentId | **long integer**. The ID of the instrument being quoted.     |

### Response

```json
{
    "bid":"
    {
        "omsId":0,
        "side":0,
        "orderId":0,
        "price":0.0,
        "quantity":0.0,
        "displayQuantity":0.0,
        "instrument":0,
        "account":0,
        "orderType":0,
        "clientOrderId":0,
        "orderState":0
	}",
	"ask":"
	{
    	"omsId":0,
        "side":0,
        "orderId":0,
        "price":0.0,
        "quantity":0.0,
        "displayQuantity":0.0,
        "instrument":0,
        "account":0,
        "orderType":0,
        "clientOrderId":0,
        "orderState":0
    }"
}
```

Returns a JSON object comprising a bid and an ask object. Both object comprise the same key-value pairs.

| Key | Value                  |
| ------ | ---------------------- |
| bid   | Bid object (see below) |
| ask  | Ask object (see below) |

Bid and Ask objects differ only in the values for the keys.

| Key           | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| omsId | **integer.** The ID of the Order Management System containing the open quotes. |
| side            | **integer.** One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (error condition) |
| orderId         | **long integer.** The ID of this quote. Quotes and orders are both executable, but only Operators and MarketMakers may quote. |
| price           | **real.** Price of the Bid/Ask quote.                        |
| quantity        | **real.** Quantity of the Bid/Ask quote.                     |
| displayQuantity | **real.** The quantity available to buy or sell that is publicly displayed to the market. To display a *DisplayQuantity* value, an order must be a Limit order with a reserve. |
| instrument      | **integer.** The ID of the instrument being quoted.          |
| account         | **integer.** The ID of the account quoting the instrument.   |
| orderType       | **integer.** A number describing the type of order (or in this case, quote). One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| cientOrderId  | **long integer.** A user-assigned ID for the quote (like a purchase-order number assigned by a company). *ClientOrderId* defaults to 0. |
| orderState      | **integer.**  A number describing the current state of the order. One of:<br />0 Unknown<br />1 Working<br />2 Rejected<br />3 Canceled<br />4 Expired<br />5 FullyExecuted<br /><br />An open quote will probably have an *OrderState* of Working. |

