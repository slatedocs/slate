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

The API works in a REST like manner over HTTP, and covers these areas:

  * Market Data
    * Download historical open,high,low,close data for various instruments in different timeframes.
  * Indicators
    * Calculate different technical indicators
      * RSI, Moving averages, MACD, Bollinger Bands, Average True Range, Minimum/Maximum/Previous period values.
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

Parameter     | Required | Default      | Description
------------- | -------- | ------------ | -----------
expression    | Yes      |              | A comma separated list of technical indicators to be calculated.
instruments   | Yes      |              | A list of instruments for which to calculate the indicators expression. See the <a href='#available-markets'>list of available instruments</a>.
timeframe     | No       | day          | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day'.  See also <a href='#available-timeframes'>available timeframes</a>.
item_count    | No       | 10           | The number of data items to return.

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

Parameter     | Required | Default      | Description
------------- | -------- | ------------ | -----------
expression    | Yes      |              | The signal expression to be evaluated.
instruments   | Yes      |              | A list of instruments for which to calculate the signal expression. See the <a href='#available-markets'>list of available instruments</a>.
timeframe     | No       | day          | The timeframe of the request. One of '5min', '15min', '30min', 'hour', '2hour', '3hour', '4hour', 'day'.  This is ignored if the expression uses multiple timeframe signals. See also <a href='#available-timeframes'>available timeframes</a>.
item_count    | No       | 50           | The maximum number of data items to return.
start_period  | No       | 3 months ago | A datetime in the UTC timezone representing the date of the earliest signal to be returned
end_period    | No       | now          | A datetime in the UTC timezone representing the date of the lastest signal to be returned


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

### Limitations

#### Unique timeframe functions

> This doesn't work

```shell
hour(close > ema(close,21)) and hour(ema(close,21) > ema(close,50)) and 2hour(close > ema(close,21))
```

> But this does

```shell
hour(close > ema(close,21) and ema(close,21) > ema(close,50)) and 2hour(close > ema(close,21))
```

A timeframe function can only be called once per expression, however, multiple expressions can exist inside a timeframe function.

#### Boolean combinations

> This doesn't work

```shell
hour(signal_expression) and 2hour(signal_expression) or hour(signal_expression)
```

> But these do

```shell
hour(signal_expression) and 2hour(signal_expression) and hour(signal_expression)
hour(signal_expression) or  2hour(signal_expression) or  hour(signal_expression)
```


Signal expressions with multiple timeframes are only supported when the different timeframe functions are joined by the same boolean operator (one of 'and','or').

# Available timeframes

The list of timeframes available can be retrieved programmatically with a get request to the timeframes endpoint.

```shell
curl \
http://api.fxhistoricaldata.com/v1/timeframes
```

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
- UKOilUSD - Brent crude priced in US Dollars
- USOil
- Bund
- BundUSD - German Bunds priced in US Dollars

## Stock Market Indices
- AUS200
- AUS200USD - AUS200 priced in US Dollars
- ESP35
- ESP35USD - ESP35 priced in US Dollars
- FRA40
- FRA40USD - FRA40 priced in US Dollars
- GER30
- GER30USD - GER30 priced in US Dollars
- HKG33
- HKG33USD - HKG33 priced in US Dollars
- JPN225
- JPN225USD - JPN225 priced in US Dollars
- NAS100
- SPX500
- UK100
- UK100USD - UK100 priced in US Dollars
- US30
