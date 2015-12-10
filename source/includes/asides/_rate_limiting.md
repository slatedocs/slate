## Rate Limiting

The TradeGecko API provides a rate limit of 300 requests per 300 seconds.

Your current rate limit quota is provided in the headers of every request.

| Header                     | Description
| -------------------------- | ------------- 
| **X-Rate-Limit-Limit**     | Number of requests available for this endpoint (currently 300 for every endpoint)       
| **X-Rate-Limit-Remaining** | Number of requests remaining in quota
| **X-Rate-Limit-Reset**     | Integer representing the epoch time at which the quota will reset

If you go over this limit the API will return a response with a status code of 429 until the reset time.

N.B. The API limit is counted against the combination of application and account, so if your application is serving multiple accounts each account will have it's own quota.
