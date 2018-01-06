# Candles

> Response

```json
[
	[
		1511481600,
		0.051323,
		0.051323,
		0.05132,
		0.05132,
		"1009.753645"
	],
	[
		1511467200,
		0.051323,
		0.051323,
		0.051323,
		0.051323,
		"3201.906964"
	],
	[
		1511251200,
		0.044683,
		0.053744,
		0.042048,
		0.045321,
		"3310.527428"
	]
]
```

Get historical candles for a product. Candles returned are grouped by `resolution`.

### HTTP Request

**`GET /candles/:product`**

### Parameters

Name | Description
---------- | -------
product | A valid product

### Query Parameters

Name | Default | Description
---------- | ---- | -------
resolution | *N/A* | (required) Candle resolution to return. Can be `5`, `15`, `60`, `240`, or `1D`.
start | 0 | The time after which to fetch candles, in ms
end | Current time | The time before which to fetch candles, in ms

E.g. `/candles/ETH-BTC?resolution=60&start=1511480127561&end=1511480129513` fetches 1h candles between the start and end timestamps.

A maximum of 100 candles are returned per request.

### Response

Each item in the array returned represents a candle with granularity `resolution`:

* **timestamp** (in seconds)
* **open** (first trade in this interval)
* **high** (highest trade in this interval)
* **low** (lowest trade in this interval)
* **close** (last trade in this interval)
* **volume** (volume of trading during this interval)

`volume` is returned as string to preserve float number precision. If the candle is active, `close` is the last price.
