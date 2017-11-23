# Private

## Place a New Order

> **Place a limit order to sell 10 ETH at 0.04BTC.**

> Request

```json
{
  "product": "ETH-BTC",
  "side": "sell",
  "size": "10",
  "price": "0.04"
}
```

> Response

```json
{
  "id": "9d335cce-d581-45f6-8efc-bdab3d61c6e2",
  "product": "ETH-BTC",
  "type": "limit",
  "side": "sell",
  "size": "5.00000000",
  "price": "0.04",
  "filled": "0.00000000",
  "timestamp": "1511467005839.417"
}
```

### HTTP Request

`POST https://api.wcex.com/new-order`

### Parameters

Param | Description
---------- | -------
product | A valid product.
side | Can be `buy` or `sell`.
type | Can be `market`, `limit` (default), `stop`, or `stop-limit`.
size | \* Amount of base asset to buy or sell.
funds | \* Amount of counter asset to buy or sell. 
price | \*\* Entry price of your order.

\* `funds` must be specified for `buy` `market` and `buy` `stop` orders. In all other cases, `size` must be specified. Only one of `funds` or `size` can be set.

\*\* Price can be ignored for `market` orders, but is required for all other order types.

As an alternative to market orders, you can use limit orders with price set deep in the opposite book. This allows you to set a size in base asset and your price, which gives you an execution price guarantee.

#### Limit order conditions

Additionally, you can specify an execution policy condition for limit orders. This parameter is optional.

Param | Description
---------- | -------
condition | Can be `GTC` (default), `IOC`, or `PO`.

`GTC` Good till cancelled orders will remain on the book until they're cancelled. This is the default order placement behavior.

`IOC` Immediate-or-cancel orders will only remove liquidity from the book. When submitted, the order will fill partially or fully, and cancel any outstanding amount that is not matched so that no part of the order appears on the book.

`PO` Post-only orders will only add liquidity to the book. If any part of the order results in taking liquidity, the order will be rejected and no part of it will execute.

#### Stop-limit order parameters

For stop-limit orders, `limit_price` must be specified in addition to the default request parameters.

Param | Description
---------- | -------
limit_price | The limit price of a stop-limit order.

### Order lifecycle

Your account must have sufficient balance to submit an order. An order that is successfully received by the matching engine will be marked as `received`. 

If any part of the order results in adding liquidity to the book, it will be marked as `open`. 

Stop orders do not appear on the book. A successfully submitted stop order will be marked as `set` and triggered at `price`.

An order that is completely filled and off the book will be marked as `done`.

### Response

An order accepted by the matching engine will be assigned an order `id`.

The response will also contain a `filled` field which specifies the amount, in base asset, that was filled as a result of your order.
