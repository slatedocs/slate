# Rate Limits

When a rate limit is exceeded, a status of 429 Too Many Requests will be returned.
'X-RATE-LIMIT-RESET' is returned in response header with time left in milisecond
after which next API request can be hit. 

We throttle unauthenticated api requests by IP and authenticated requests by user ID. 

Default Quota is 10000 for a fixed 5 minute window.

### REST API Cost Structure
Every rest endpoint has been assigned a cost (weight). When you make an api call, the cost incurred is deducted from your 5 min quota. So, Apis related to reading public data are cheaper whereas Apis related to writing private data (like placing an order) are the costliest. 

Here is the cost structure for various endpoints. Please note that any endpoint not mentioned here has a cost of 1 unit.

Cost Slab|API Endpoints
--|--
3| Get Products, Get Orderbook, Get Tickers, Get Open Orders, Get Open Postions, Get Balances, OHLC Candles
5| Place/Edit/Delete Order, Add Position Margin
10| Get Order History, Get Fills, Get Txn Logs
25| Batch Order Apis


### Increasing your rate limits

If you are running up against our limits and believe that you have a legitimate need, please email us at [support@delta.exchange](mailto:support@delta.exchange) to discuss increasing your rate limits.
