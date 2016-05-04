## Timestamp ping to check the system status.

|||
|---|---
| **Manages** |
| **OAuth Scopes** | `default`

## Operations

*   [Get a Timestamp](#get-a-timestamp)

## Get a Timestamp

Gets the system timestamp.

*   [OAuth](#get-a-timestamp-oauth)
>`GET /stores/{store_hash}/v2/time`
*   [Basic Auth](#get-a-timestamp-basic)
>`GET /api/v2/time`

### Notes

The time resource is useful for validating API authentication details and testing client connections.

It returns the [system timestamp](http://en.wikipedia.org/wiki/Unix_time) at the time of the request.

```json
{
  "time": 1393657780
}
```
