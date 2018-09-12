# Affiliates Integration Guide

Rates API and Quote APIs are designed for our affiliates to retrieve the latest information about TransferWise's supported currencies and pricing. 
You can use this information to build your own valuable content to your customers. 






### Rates API 
**Get the real-time mid-market exchange rate**<br/>

TransferWise uses the mid-market exchange rate for cross-border money transfers. You can check real-time exchange rate value for any supported currency route by making a simple call to our API. 

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD`**

<br/>

**Get mid-market exhange rate history**<br/>
We expose 30 days exchange rate history via our API. This helps you to build a simple analysis page to show trends and even implement a simple alert system for your users.

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2018-08-15T00:00:00&to=2018-08-30T23:59:59&group=day`**

See more technical info about [Exchange Rates.List](#exchange-rates-list) endpoint.




### Quote API

**Is my currency route supported?**
Today we support money transfers in 774 currency routes and we are constantly adding more.  This includes 18 source currencies and 43 target currencies. Our API helps you to discover which routes are currently supported. 

**How much does my transfer cost?**
Send a currency route and transfer amount to the Quote API and you will receive a response with the exact price for this transfer.

**How long does my transfer take?**
The Quote API also responds with an “estimated delivery time”. This can vary across different currency routes, for example transfers often only take a few hours from EUR to GBP, while sending money from USD can take 1-2 business days. Our API allows you to find out the estimated delivery time for each currency route.


### How to join the TransferWise affiliate program? 
[Apply here](https://transferwise.com/partnerwise).
  




TransferWise updates exchange rates in nearly real-time — at least once per minute. This allows you  to track and see the current mid-market exchange rate for any currency route, both at present or in the past. 

***

### Get current exchange rate

You are able to track and see the current mid-market exchange rate for any currency route. This includes both currency pairs supported by TransferWise and those which are not. For example, you can query rates for USD-EUR and ARS-CRC, despite only one route (USD-EUR) being suppored by us.

**Parameters:** 

* source (send) currency
* target (receive) currency


**Response:** 

* mid-market exchange rate
* timestamp


***

### Get exchange rate for specific time/date


Get the historical mid-market exchange rate for a currency route at a specified time. 

**Parameters:** 

* source (send) currency
* target (receive) currency
* timestamp


**Response:** 

* mid-market exchange rate
* timestamp

***


### Get exchange rate history for a period of time

You can get the mid-market exchange rate for one currency route over a given time period. The default shows the daily interval — one exchange rate per day at midnight.

There are also options to specify other time intervals, such as every hour, day or certain amount of minutes. For example, if an interval is set to 1 hour then you will see exchange rates for each full hour within the given time period.

**Parameters:** 
* source (send) currency
* target (receive) currency
* period start time
* period end time
* interval (day, hour, minute)

**Response:** 
* List of:
  * mid-market exchange rate
  * timestamp
