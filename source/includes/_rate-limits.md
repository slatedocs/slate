# Rate Limits

## API Rate Limits

### Plan Tier Limits

Your account plan tier will limit the number of requests each API key can make per month.
Current rate limits by plan tier are:

| Plan Tier     | Calls per month |
| ---           | ---             |
| Professional  | 40,000          |
| Premium       | 100,000         |
| Enterprise    | Unlimited       |

### Daily API Limits

All API requests will be halted at 450K per user, per day. Your daily limit will reset the next day at 12AM (midnight) Pacific Time.

<aside class="notice">
  <h6>Note</h6>
  <p>Once a rate limit is hit, all further requests will return an error code of 429.</p>
</aside>

## Webhook Subscription Limit

There is a limit of three webhook subscriptions per Affinity instance.