# Rate Limits

When a rate limit is exceeded, a status of 429 Too Many Requests will be returned.

### REST API

#### PUBLIC ENDPOINTS

We throttle public endpoints by IP: 600 requests for a 5 minute rolling window.

#### PRIVATE ENDPOINTS

We throttle private endpoints by user ID: 300 requests for a 5 minute rolling window.

### Increasing your rate limits

If you are running up against our limits and believe that you have a legitimate need, please email us at support@delta.exchange to discuss increasing your rate limits.
