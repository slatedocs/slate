# Affiliates Integration Guide

## API access

Once you become our affiliate we will send you TransferWise API access credentials: api_client_id & api_client_secret. 
You can then use these as username and password with **Basic Authentication** method.

There are two endpoints [Exchange Rates.List](#exchange-rates-list) and [Get Temporary Quote](#quotes-get-temporary-quote) which you can call with this authentication method.

### TEST and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com

## Get current exchange rates

> Example Request (Basic authentication):

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD" \
     --user <your api client_id>:<your api client_secret> 
```

> Example Response:

```json
[
    {
        "rate": 1.166,
        "source": "EUR",
        "target": "USD",
        "time": "2018-08-31T10:43:31+0000"
    }
]
```

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD`**

TransferWise updates exchange rates in nearly real-time – at least once per minute. 
This allows you to track and see the current mid-market exchange rate for any currency route. 

See more at [Exchange Rates.List](#exchange-rates-list) 

## Get exchange rate history

> Example Request (Basic authentication):

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2018-08-15T00:00:00&to=2018-08-30T23:59:59&group=day" \
     --user <your api client_id>:<your api client_secret> 
```

> Example Response:

```json
[
    {
        "rate": 1.166,
        "source": "EUR",
        "target": "USD",
        "time": "2018-08-15T00:00:00+0000"
    },
    {
        "rate": 1.168,
        "source": "EUR",
        "target": "USD",
        "time": "2018-06-30T00:00:00+0000"
    }
    ...
]
```

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2018-08-15T00:00:00&to=2018-08-30T23:59:59&group=day`**

We expose up to 30 days exchange rate history via our API. This helps you to build an analysis page to show trends and implement an alerting system for your users.

See more at [Exchange Rates.List](#exchange-rates-list) 

## Get pricing and speed

> Example Request (Basic authentication):

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/quotes?source=EUR&target=GBP&rateType=FIXED&targetAmount=600 \
     --user <your api client_id>:<your api client_secret> 
```

> Example Response:

```json
{
    "source": "EUR",
    "target": "GBP",
    "sourceAmount": 663.84,
    "targetAmount": 600.00,
    "type": "REGULAR",
    "rate": 0.9073,
    "createdTime": "2018-08-27T14:35:44.553Z",
    "createdByUserId": 0,
    "rateType": "FIXED",
    "deliveryEstimate": "2018-08-27T14:35:44.496Z",
    "fee": 2.34,
    "allowedProfileTypes": [
        "PERSONAL",
        "BUSINESS"
    ],
    "guaranteedTargetAmount": false,
    "ofSourceAmount": true
}
```

**`GET https://api.sandbox.transferwise.tech/v1/quotes?source=EUR&target=GBP&rateType=FIXED&targetAmount=600`**

**Is currency route supported?**

If we don't support a route then this endpoint will respond with an error code "error.route.not.supported".

**How much does a transfer cost?**

The TransferWise fee is included in the response. 

**How long does my transfer take?**

Estimated delivery time is included in the response. 
This can vary quite a lot for different currency routes. For example transfers often only take a few hours from EUR to GBP, while sending money from USD can take 1-2 business days. 
This endpoint allows you to find out the estimated delivery time for each currency route.

See more at [Get Temporary Quote](#quotes-get-temporary-quote)

<br /><br /><br /><br /><br /><br /><br /><br />