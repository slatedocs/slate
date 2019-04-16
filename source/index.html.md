---
title: Quadency API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - javascript

toc_footers:
  

includes:

search: true
---

# General

Welcome to Quadency developer documentation. The Quadency API provides a simple and powerful realtime REST/Websocket API to communicate with Binance, Bitfinex, Bittrex, Coinbase, Gemini, Kraken, Kucoin, OKEx, Poloniex.  For access to Quadency's API, please email `support@quadency`.

## Base URL

All Quadency endpoints share the same base url: `https://quadency.com`

## Supported Exchanges

The following the exchange names use in the api: `Binance, Bitfinex, Bittrex, GDAX (used for CoinbasePro), Gemini, Kraken, Kucoin, OKEx, Poloniex`

## Rate Limit
Public Rest endpoints are throttled by IP: 100 requests per 1 seconds.

Public Websocket endpoints are throttled by IP: 5 requests per 1 seconds.

Private endpoints are throttled by the user IP: 20 requests per 1 seconds.

Public Websocket endpoints are throttled by IP: 5 requests per 1 seconds.

# Requests

## Success
All requests and responses are `application/json` content type and follow typical HTTP response status codes for success and failure.

## Errors
Unless otherwise stated, errors to bad requests will respond with HTTP 4xx or status codes. The body will also contain a message parameter indicating the cause. Your language’s http library should be configured to provide message bodies for non-2xx requests so that you can read the message field from the body.

Quadency API uses the following error codes:

Status Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key/secret is wrong.
403 | Forbidden -- The kitten requested is hidden for administrators only.
404 | Not Found -- The specified kitten could not be found.
405 | Method Not Allowed -- You tried to access a kitten with an invalid method.
429 | Too Many Requests -- Exceeded the access frequency limit.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.



# Exchanges

## Get Markets

Get list of normalized pairs for exchange as well as fees, precisions, step sizes for all the support exchanges (Binance, Bitfinex, Bittrex, Coinbase, Gemini, Kraken, Kucoin, OKEx, Poloniex)

### HTTP Request

`GET /api/v1/public/exchanges/markets?exchange=<exchange name>`

### Example

`GET /api/v1/public/exchanges/markets?exchange=BINANCE`

### Details

The query param `exchange` is required.  This endpoint will be updated in the future to provide all markets for all exchanges.

### Parameters

Name | Description
---------- | -------
exchange | exchange to get markets for (required)

# Prices

## Get prices

Get latest price for all

## Get historical average prices

Get volume weighted historical average prices for given pairs, interval, and number of bars

### HTTP Request

`GET /api/v1/public/prices/history/averages?pairs=<given pairs>`

### Example

`GET /api/v1/public/prices/history/averages?pairs=BTC%2FUSD,ETH%2FUSDT`


### Parameters

Name | Description
---------- | -------
pairs | comma separated list of pairs that (required)
interval | defaults to 1h. Time interval you want the average prices for. Following are supported ['1m', '5m', '15m', '30m', '1h', '6h', '1d']
bars | defaults to 24. Number bars from current time.  For example, if 5Bars is given, the endpoint will return the most current 5 bars.  The current bar will not be included.
