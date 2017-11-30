<h1 id='rate-limits-rest'>Rate limits</h1>

WCX rate limits its API to prevent abuse that would degrade the exchange's ability to maintain top-notch performance for all traders.

By default, all endpoints are limited to 5 requests per second per IP. Requests that exceed this limit will receive a Rate Limit Exceeded error with status code `429`.