# Private

## Place a New Order

> Open a 100BTC EUR/USD long position at market price, with a stop-loss and take-profit:

```shell
curl "https://api.whaleclub.co/v1/position/new" \
  -H "Authorization: Bearer API_TOKEN" \
  -X POST \
  -d 'direction=long' \
  -d 'market=EUR-USD' \
  -d 'leverage=100' \
  -d 'size=10000000000' \
  -d 'stop_loss=1.07676' \
  -d 'take_profit=1.08316'
```
```json
{
  "id": "22bCNkWhiwxF7qAMs",
  "slug": "vCDQah7Hv",
  "direction": "long",
  "market": "EUR-USD",
  "leverage": 100,
  "type": "market",
  "state": "active",
  "size": 10000000000,
  "margin_size": 10000000000,
  "entry_price": 1.07876,
  "stop_loss": 1.07676,
  "take_profit": 1.08316,
  "created_at": 1486327152,
  "entered_at": 1486327152,
  "liquidation_price": 1.07013,
  "currency": "BTC"
}
```

> Submit a 50BTC Gold sell stop position at 1050:

```shell
curl "https://api.whaleclub.co/v1/position/new" \
  -H "Authorization: Bearer API_TOKEN" \
  -X POST \
  -d 'direction=short' \
  -d 'market=XAU-USD' \
  -d 'leverage=10' \
  -d 'size=5000000000' \
  -d 'entry_price=1050'
```
```json
{
  "id": "d7gAxDSeLtdYtZsEd",
  "slug": "GaK75ndGm",
  "direction": "short",
  "market": "XAU-USD",
  "leverage": 10,
  "type": "stop",
  "state": "pending",
  "size": 5000000000,
  "margin_size": 500000000,
  "entry_price": 1050,
  "created_at": 1486307187,
  "liquidation_price": 1150,
  "currency": "BTC"
}
```

> Submit a 20BTC Netflix limit long position at 99:

```shell
curl "https://api.whaleclub.co/v1/position/new" \
  -H "Authorization: Bearer API_TOKEN" \
  -X POST \
  -d 'direction=long' \
  -d 'market=NFLX' \
  -d 'leverage=10' \
  -d 'size=2000000000' \
  -d 'entry_price=99' \
  -d 'stop_loss=96.5' \
  -d 'take_profit=126'
```
```json
{
  "id": "22Eov6G9gXb7cC7n7",
  "slug": "47n2728b3",
  "direction": "long",
  "market": "NFLX",
  "leverage": 10,
  "type": "limit",
  "state": "pending",
  "size": 2000000000,
  "margin_size": 200000000,
  "entry_price": 99,
  "stop_loss": 96.5,
  "take_profit": 126,
  "created_at": 1465795498,
  "liquidation_price": 91.08,
  "currency": "BTC"
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

\*\* Price can be ignored for `market` orders.

#### Limit order conditions

Additionally, you can specify execution policy conditions for limit orders.

Param | Description
---------- | -------
condition | Can be `GTC` (default), `IOC`, or `PO`.

`GTC` Good till cancelled orders will remain on the book until they're cancelled. This is the default behavior.

`IOC` Immediate-or-cancel orders will only remove liquidity from the book. When submitted, the order will fill partially or fully, and cancel any outstanding amount that is not matched so that no part of the order appears on the book.

`PO` Post-only orders will only add liquidity to the book. If any part of the order results in taking liquidity, the order will be rejected and no part of it will execute.

#### Stop-limit specific parameters

For stop-limit orders, `limit_price` must be specified in addition to the default request parameters.

Param | Description
---------- | -------
limit_price | The limit price of a stop-limit order.

### Order lifecycle

Your account must have sufficient balance to submit an order. An order that is successfully received by the matching engine will be marked as `received`. 

If any part of the order results in adding liquidity to the book, it will be marked as `open`. 

Stop orders do not appear on the book. A successfully submitted stop order will be marked as `set`.

An order that is completely filled will be marked as `done`.

### Response

An order accepted by the matching engine will be assigned an order `id`.
