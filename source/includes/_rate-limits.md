# Rate Limits

## API Rate Limits

For our rate limit endpoint, please refer to <a href="#rate-limit">Rate Limit endpoint</a>.

### Plan Tier Limits

Your account plan tier will limit the overall number of requests you can make per month.
Current rate limits by plan tier are:

| Plan Tier     | Calls per month |
| ---           | ---             |
| Professional  | 40,000          |
| Premium       | 100,000         |
| Enterprise    | Unlimited       |

This monthly account-level limit resets at the end of each calendar month.

### Per Minute API Limits

All API requests will be halted at 900 per user, per minute.

<aside class="notice">
  <h6>Note</h6>
  <p>Once a rate limit is hit, all further requests will return an error code of 429.</p>
</aside>

## Webhook Subscription Limit

There is a limit of three webhook subscriptions per Affinity instance.