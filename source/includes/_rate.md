# Rate Limiting

> Rate limiting happens on a rolling basis.

Period | Limit
---|---
Minute | Maximum of 120 requests 
Day | Maximum of 86,400 requests (Avg. of 1 per second)


### HTTP Headers and Response codes

The following headers are included with every API response:

Header | Description
---|---
`X-Rate-Limit-Limit` | The rate limit ceiling for that given request
`X-Rate-Limit-Remaining` | The number of requests left for the 15 minute window
`X-Rate-Limit-Reset` | The remaining window before the rate limit resets in UTC [epoch seconds](http://en.wikipedia.org/wiki/Unix_time)
