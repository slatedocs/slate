---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Market Alerts is a simple API to calculate market indicators and signals across different timeframes in Commodity, Stock Indices and FX markets.

The API works in a REST like manner over HTTP, and covers 3 main areas:

  * Market Data
    * Download historical open,high,low,close data for various symbols in different timeframes.
  * Indicators
    * Calculate different technical indicators
      * RSI, Moving averages, MACD, Bollinger Bands, Average True Range
  * Signals
    * Test for the existence of market signals, eg:
      * close > ema(close,200) # Price closed above 200-day moving average
      * crossoverup(rsi(close,14),70) # RSI just went above 70

# Authentication


MarketAlerts is currently open for beta and does not require Authentication at this point.

# API Reference

## indicators

```shell
curl \
"http://api.fxhistoricaldata.com/v1/indicators?e=close,ema(close,200),rsi(close,14)&s=USDJPY"
```

> The above command returns JSON structured like this:

```json
{
	results: {
		USDJPY: {
			data: [
				[
				"2016-10-07 00:00:00",
				"103.1000",
				"107.5165",
				"57.80"
				]
			]
		}
	}
}
```

This endpoint retrieves market data and calculates technical indicators

### HTTP Request

`GET http://api.fxhistoricaldata.com/v1/indicators`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
t         | day     | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day' or 'week'.
e         | N/A     | A comma separated list of technical indicators to be calculated.
s         | N/A     | A list of symbols for which to calculate technical indicators.
d         | 1       | The number of data items to return.

## signals

```shell
curl \
"http://api.fxhistoricaldata.com/v1/signals?e=close>ema(close,200) and rsi(close,14)<50&s=USDJPY"
```

> The above command returns JSON structured like this:

```json
{
	results: {
		USDJPY: {
			data: [
				[
					"2016-10-07 00:00:00"
				]
			]
		}
	}
}
```

This endpoint calculates signals ie: rsi crossed above 70, closing price is above upper bollinger band, etc

### HTTP Request

`GET http://api.fxhistoricaldata.com/v1/signals`

### URL Parameters

Parameter | Description
--------- | -----------
t         | day     | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day' or 'week'.
e         | N/A     | The signal expression to be evaluated.
s         | N/A     | A list of symbols for which to calculate the signal.
d         | 1       | The number of data items to return.

