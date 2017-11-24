# Private Events

# Order

## Received

```json
{
	"event": "received",
	"id": "bf2b704c-010a-48ca-93fb-d0193f24420a",
	"product": "ETH-BTC",
	"size": "0.77942322",
	"price": "0.05132",
	"side": "buy",
	"type": "limit",
	"timestamp": "1511482279492.417"
}
```

A `received` event is an acknowledgement by the matching engine that your order has been accepted for initial processing, regardless of whether it has filled or not.

Received orders that begin to fill trigger one or more `match` events. Received orders that result in an open order on the book trigger an `open` event.


## Open

```json
{
	"event": "open",
	"id": "bf2b704c-010a-48ca-93fb-d0193f24420a",
	"product": "ETH-BTC",
	"size": "0.77942322",
	"filled": "0.2451223",
	"price": "0.05132",
	"side": "buy",
	"type": "limit",
	"timestamp": "1511482279492.417"
}
```

An `open` event means that your order is now visible on the book with a non-zero amount. Open orders remain on the book until they are filled or cancelled.

`size` is the original size of the order. `filled` indicates how much of the order was filled after going on the book.

Market and stop orders will never trigger an `open` event.


## Set

```json
{
	"event": "set",
	"id": "c6023aca-333a-44d9-98fe-279e279f3a86",
	"product": "ETH-BTC",
	"size": "0.88210022",
	"price": "0.05132",
	"side": "buy",
	"type": "stop",
	"timestamp": "1511432679991.121"
}
```

A `set` event indicates that a stop or stop-limit order has been set successfully. Stop-limit orders will also have a `limit_price` field that indicates the limit price for that order.

## Triggered

```json
{
	"event": "triggered",
	"id": "c6023aca-333a-44d9-98fe-279e279f3a86",
	"product": "ETH-BTC",
	"size": "0.88210022",
	"price": "0.05132",
	"side": "buy",
	"type": "stop",
	"timestamp": "1511434619393.320"
}
```

A `triggered` event indicates that your stop or stop-limit order has been triggered and will become visible on the book.


## Match

```json
{
	"event": "match",
	"product": "ETH-BTC",
	"taker_order_id": "7ec97c53-75b2-4e9b-bdfa-6eca818f8c8d",
	"maker_order_id": "5d818156-fc9a-4bfe-b0e3-1ef3f3f5d799",
	"size": "11.774650",
	"price": "0.04771",
	"side": "buy",
	"timestamp": "1511434619393.320"
}
```

A `match` event indicates that a trade occurred concerning one of your orders. `side` represents the taker side: a `buy` side match is an up-tick and a `sell` side match is a down-tick.


## Done

```json
{
	"event": "done",
	"id": "bf2b704c-010a-48ca-93fb-d0193f24420a",
	"product": "ETH-BTC",
	"price": "0.05132",
	"side": "buy",
	"timestamp": "1511434699393.991"
}
```

A `done` event indicates that your order has been fully filled and is no longer visible on the book.


## Cancelled

```json
{
	"event": "cancelled",
	"id": "31bf3a89-2a0a-40b0-9327-ec0a5cc3ce3c",
	"product": "ETH-BTC",
	"size": "1.22393981",
	"price": "0.03131",
	"side": "buy",
	"type": "limit",
	"timestamp": "1511434617391.877"
}
```

A `cancelled` event indicates that your order was manually cancelled.
