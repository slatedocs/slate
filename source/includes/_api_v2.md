#API

##Structure

###Overview

The Webconnex API is build upon simple REST patterns. We use standard HTTP methods and error codes in our responses.

###Authentication

Authentication happens through the use of an API key issued from the Integrations pane under account settings.

###Rate Limits

We have limit request to the API at 15000 per account per day. In a 15 minute period we limit the number of accounts by X.

#### HTTP Headers
#### Response Parameters
Header | Description
---------------------- | --------------
X-Daily-Limit | The number of allowed requests in the current period (daily)
X-Daily-Remaining | The number of remaining requests in the current period (daily)
X-Daily-Limit-Reset | The number of seconds left in the current period (daily)
X-Burst-Limit | The number of allowed requests in the current period (15 min)
X-Burst-Remaining | The number of remaining requests in the current period (15 min)
X-Burst-Limit-Reset | The number of seconds left in the current period (15 min)
X-Retry-After | If surpassed `X-Daily-Limit` or `X-Burst-Limit`, - the unix time when requests can be submitted again (15 min or daily depending on which limit is hit)


###Errors

```json
{
	"responseCode": 400,
	"error": {
		"code": 4000,
		"message": "your request sucks!"
	}
}
```

#### HTTP Codes (responseCode)
HTTP Code							 | Description
------------ |-----------------------------------------
200 OK	| The request was successful, we updated the resource and the responded body contains the representation.
201 CREATED	| The request was successful, we created the resource and the responded body contains the representation.
204 OK DELETED	| The request was successful; the resource was deleted.
400 BAD REQUEST | The data given in the POST or PUT failed validation. Inspect the response body for details.
401 UNAUTHORIZED	| The supplied credentials, if any, are not sufficient to create or update the resource.
402 REQUEST FAILED	| The parameters were valid but the request failed.
404 NOT FOUND | Not found (or unauthorized).
405 METHOD NOT ALLOWED	| You can't POST or PUT to the resource.
429 TOO MANY REQUESTS | Your application is sending too many simultaneous requests.
500 SERVER ERROR	| We couldn't create or update the resource. Please try again.

###Expanding Objects

###Pagination

###Filtering
