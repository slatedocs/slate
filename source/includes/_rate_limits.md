# Rate Limits

When a rate limit is exceeded, a status of 429 Too Many Requests will be returned.

### REST API

### Limits

We throttle unauthenticated api requests by IP and authenticated requests by user ID.
These are the limits for different categories of requests in a 5 minute rolling window.

|Request Type|Limit|Description|
|---|---|---|
|Chart data|600|Requests for chart data|
|Public read requests|200|Requests to get list of live products, L2 orderbook etc|
|Private read requests|200|Requests to get open orders, fills, positions etc|
|Private write requests|150|Requests to place orders, change leverage, cancel orders etc|
|Account requests|200|Requests to change password, create api keys etc|
|Others|300|All other requests|

### Increasing your rate limits

If you are running up against our limits and believe that you have a legitimate need, please email us at support@delta.exchange to discuss increasing your rate limits.
