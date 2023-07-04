# Rate Limits

## API Rate Limits

For our rate limit endpoint, please refer to <a href="#rate-limit">Rate Limit endpoint</a>.

### Plan Tier Limits

Your account plan tier will limit the overall number of requests you can make per month.
Current rate limits by plan tier are:

| Plan Tier    | Calls per month |
| ------------ | --------------- |
| Professional | None\*          |
| Premium      | 100,000         |
| Enterprise   | Unlimited       |

<aside class="notice">
  <h6>Note</h6>
  <p>Professional tier customers who signed up for Affinity before July 5, 2023 are alotted 40,000 calls per month.</p>
</aside>

This monthly account-level limit resets at the end of each calendar month.

### Per Minute API Limits

All API requests will be halted at 900 per user, per minute.

<aside class="notice">
  <h6>Note</h6>
  <p>Once a rate limit is hit, all further requests will return an error code of 429.</p>
</aside>

## Webhook Subscription Limit

There is a limit of three webhook subscriptions per Affinity instance.

## Rate Limit Headers

Each external API call will include headers with rate limit information. This is a convenient way to retrieve your rate limits and usage without needing to hit the [`/rate-limit`](#rate-limit) endpoint. Every API call will respond with the following headers:

| Header                           | Description                                                  |
| -------------------------------- | ------------------------------------------------------------ |
| X-Ratelimit-Limit-User           | Number of requests allowed per minute for the user           |
| X-Ratelimit-Limit-User-Remaining | Number of requests remaining for the user                    |
| X-Ratelimit-Limit-User-Reset     | Time in seconds before the limit resets for the user         |
| X-Ratelimit-Limit-Org            | Number of requests allowed per month for the organization    |
| X-Ratelimit-Limit-Org-Remaining  | Number of requests remaining for the organization            |
| X-Ratelimit-Limit-Org-Reset      | Time in seconds before the limit resets for the organization |
