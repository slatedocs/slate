# Buy and sell currency

## Get available buy and sell limit
> `POST https://domain.com/btc/get_buy_limit/1.0/json`

Get user available limit to buy and sell currency

```
Response example
```

```json
{
  "id": null,
  "jsonrpc": "2.0",
  "result": {
    "status": "success",
    "limit": 300,
    "currency": "EUR"
  }
}
```
