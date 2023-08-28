# Rate limits

> Sample response:

```json
{
    "x-daily-requests-left": 295,
    "x-daily-usage": 5,
    "x-hourly-requests-left": 95,
    "x-hourly-usage": 5,
    "x-minute-requests-left": 45,
    "x-minute-usage": 5,
    "x-rate-limit-daily": 300,
    "x-rate-limit-hourly": 100,
    "x-rate-limit-minute": 50
}
```

Requests to our API will be limited in accordance with your current pricing plan, detailed [here](https://www.apollo.io/pricing/#compare-plans) under Compare Plans > CRM > API Access.

To view how many requests your current plan allows, as well as how many requests you have used, you can reference the headers of a successful response from the API. See the sample response to the right for more detail.

<aside class="notice">
We use a fixed-window rate limiting strategy for calls to our API. If your team's rate limit is 50 requests per minute, those 50 api calls can be made at any interval within the 60 second window.
</aside>

### Response headers

Header name | Description | Example
----------- | ----------- | -----------
x-daily-requests-left | the total requests left for the current 24 hour period |  295
x-daily-usage | the total requests used for the current 24 hour period | 5
x-hourly-requests-left | the total requests left for the current 60 minute period | 95
x-hourly-usage | the total requests used for the current 60 minute period | 5
x-minute-requests-left | the total requests left for the current 60 second period | 45
x-minute-usage | the total requests used for the current 60 second period | 5
x-rate-limit-daily | based on your plan | 300
x-rate-limit-hourly | based on your plan | 100
x-rate-limit-minute | based on your plan | 50