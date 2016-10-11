---
title: API reference

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors
  - status

search: true
---

# Introduction

Market Alerts is a simple API to calculate market indicators and signals across different timeframes in Commodity, Bonds, Stock Indices and FX markets.

The API works in a REST like manner over HTTP, and covers 3 main areas:

  * Market Data
    * Download historical open,high,low,close data for various instruments in different timeframes.
  * Indicators
    * Calculate different technical indicators
      * RSI, Moving averages, MACD, Bollinger Bands, Average True Range
  * Signals
    * Test for the existence of market signals, eg:
      * close > ema(close,200) # Price closed above 200-day moving average
      * crossoverup(rsi(close,14),70) # RSI just went above 70

# Authentication


MarketAlerts is open for beta and does not currently require Authentication.

# API Reference

## indicators

> See also the full <a href='#function-reference'>indicator function reference</a>

```shell
curl \
"http://api.fxhistoricaldata.com/v1/indicators?expression=close,ema(close,200),rsi(close,14)&instruments=USDJPY"

# Example expressions
open,high,low,close
rsi(close,14)
ema(close,200)
rsi(ema(close,20),14)

```

> The above command returns JSON structured like this:

```shell
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
expression | Yes      | A comma separated list of technical indicators to be calculated.
instruments| Yes      | A list of instruments for which to calculate the indicators expression. See the <a href='#available-markets'>list of available instruments</a>.
timeframe  | No (day) | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day'.  This is ignored if the expression uses multiple timeframe signals.
itemcount  | No (1)   | The number of data items to return.

## signals

> See also the full <a href='#signal-reference'>signal expression reference</a>

```shell
curl \
"http://api.fxhistoricaldata.com/v1/signals?expression=close>ema(close,200) and rsi(close,14)<50&s=USDJPY"

# Example expressions
rsi(close,14) > 70
close > ema(close,200)
# Mixed timeframes are also allowed in expressions
day(close > ema(close,200)) and 4hour(close < ema(close,200))
```

> The above command returns JSON structured like this:

```shell
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

### Query Parameters

Parameter  | Required | Description
---------  | -------- | ----------
expression | Yes      | The signal expression to be evaluated.
instruments| Yes      | A list of instruments for which to calculate the signal expression. See the <a href='#available-markets'>list of available instruments</a>.
timeframe  | No (day) | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day'.  This is ignored if the expression uses multiple timeframe signals.
itemcount  | No (1)   | The number of data items to return.


# Function reference

<aside class="notice">
Expressions can be arbitrarly nested, ie: <code>rsi(ema(close,20),14</code>
</aside>


## open,high,low,close

The open, high, low and closing price of the security in the given timeframe.

## ema(expression, n)

```shell
ema(close,200)
ema(abs(high-low),20)
```

Exponential moving average of expression of n periods

## sma(expression, n)

```shell
sma(close,200)
sma(abs(high-low),20)
```

Simple moving average of expression over n periods


## rsi(expression, n)

```shell
rsi(close,14)
```

Relative strength index of expression over n periods

## max(expression, n)

```shell
max(high,10)
```

Maximum value of expression over n periods

## min(expression, n)

```shell
min(low,10)
```

Minimum value of expression over n periods

## tr()

```shell
tr()
```

True range is defined as:
max[ (high-low), abs(high - previous_close), abs(low - previous_close) ]

## atr(n)

```shell
atr(14)
```

Average true range over n periods (eg: atr(14) )

## previous(expression, n)

```shell
previous(close, 1)
```

Value of expression n periods ago, useful to calculate crossover signals 

## bolhigh(expression, n, y)

```shell
bolhigh(close,21,2)
```

Upper bollinger band of expression 

## bollow(expression, n, y)

```shell
bollow(close, 21, 2)
```

Lower bollinger band of expression 

## macd(expression, shortperiod, longperiod, smoothingperiod)

```shell
macd(close, 12, 26, 9)
```

Macd value of expression

## macdsig(expression, shortperiod, longperiod, smoothingperiod)

```shell
macdsig(close, 12, 26, 9)
```

Macd signal value of expression

## macddiff(expression, shortperiod, longperiod, smoothingperiod)


```shell
macddiff(close, 12, 26, 9)
```

Difference between macd and the macd signal (eg: macddiff(close, 12, 26, 9) )

## abs(expression)

```shell
abs( close - previous(close,1) )
```

Returns absolute value of expression (eg: abs(close - previous(close, 1)) )


# Signal reference

## crossoverup(expression1,expression2)

```shell
crossoverup(close,ema(close,200))
```

True when expression1 goes above expression2.

## crossoverdown(expression1,expression2)

```shell
crossoverdown(close,ema(close,200))
```

True when expression1 goes below expression2.

## expression1 compare_to expression2

```shell
ema(close,50) >  ema(close,200)
ema(close,50) >= ema(close,200)
ema(close,50) <  ema(close,200)
ema(close,50) <= ema(close,200)
```

Compares expression1 to expression2, ie, greater, greater than, lesser, lesser than.

## Multiple timeframe signals

```shell
day(close > ema(close,200)) and 4hour(close < ema(close,200))
```

Compare signals in different timeframes. When using expressions with multiple timeframe signals, the timeframe querystring parameter is ignored.  The following timeframe functions are available:

* 5min
* 15min
* 30min
* hour
* 2hour
* 3hour
* 4hour
* day


# Available markets

The list of instruments available can be retrieved programmatically with a get request to the instruments endpoint.

```shell
curl \
http://api.fxhistoricaldata.com/v1/instruments
```

## Forex

- AUDUSD
- AUDJPY
- AUDNZD
- CHFJPY
- EURCAD
- EURCHF
- EURGBP
- EURJPY
- EURUSD
- GBPCHF
- GBPJPY
- GBPNZD
- GBPUSD
- NZDUSD
- NZDJPY
- USDCAD
- USDCHF
- USDHKD
- USDJPY
- USDOLLAR

## Commodities/Bonds
- XAUUSD
- XAGUSD
- UKOil
- USOil
- Bund

## Stock Market Indices
- AUS200
- ESP35
- FRA40
- GER30
- HKG33
- JPN225
- NAS100
- SPX500
- UK100
- US30
