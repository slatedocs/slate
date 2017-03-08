# Get user wallets
> `POST https://domain.com/user/get_wallets_list/1.0/json`

Get user wallets

### HTTP Request
`POST /user/get_wallets_list/1.0/json`

```
Response example
```


```json
{
  "id": null,
    "jsonrpc": "2.0",
    "result": [
    {
      "ac_currency_id": [181, "BTC"],
      "acc_number": "1BhrT6d3BLrS2kfT2BQMpJiiUHj8WyCbSw",
      "balance": 1.08274,
      "code": "1BhrT6d3BLrS2kfT2BQMpJiiUHj8WyCbSw",
      "create_date": "2016-06-10 10:28:50",
      "currency_id": [181, "BTC"],
      "display_name": "1BhrT6d3BLrS2kfT2BQMpJiiUHj8WyCbSw",
      "id": 338,
      "name": "/"
    },
    {
      "ac_currency_id": [1, "EUR"],
      "acc_number": "13412341324",
      "balance": 22,
      "code": "13412341324",
      "create_date": "2017-02-28 16:35:15",
      "currency_id": [1, "EUR"],
      "display_name": "13412341324",
      "id": 4067,
      "name": "/"
    }
  ]
}
```
