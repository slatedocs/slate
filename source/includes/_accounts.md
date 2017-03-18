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

# Get wallet operations
> `POST https://domain.com/user/accounts/<account_id>/operations/`

```
Response example
```

```json
{
    "id": null,
    "jsonrpc": "2.0",
    "result": {
        "balance": "4.13",
        "currency_name": "BTC",
        "items": [
            {
                "amount": 0.11,
                "balance": 4.13,
                "date": "2017-03-09",
                "name": "Sell bitcoin",
                "num": "EUR/2017/03/17",
                "operation_ref": "ff525a15",
                "recipient": {
                    "name": "Money-4",
                    "surname": "Limited",
                    "id": 5067
                },
                "reference": "Sell bitcoin"
            }
        ],
        "topup": "0.11",
        "withdraw": "0.0"
    }
}
```

Get partner operations for specified acccount and date range.
If no date_from and date_to specified returns operations within last 30 days.

### HTTP Request
`POST /user/accounts/<account_id>/operations/`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
date_from | string | Optional | Datetime moment including timezone, ex: 2016-03-11T10:14:00.190Z
date_to | string | Optional | Datetime moment including timezone, ex: 2016-03-11T10:14:00.190Z

<aside class="notice">
For fetching data for wallets containing slash symbols '/' please substitute slash for undescrore symbol '_'. Ex., 'W/1234' should be requested as 'W_1234'
</aside>

# Get user cards
> `POST https://domain.com/user/get_cards/1.0/json`

Get user saved cards

### HTTP Request
`POST /user/get_cards/1.0/json`

```
Response example
```


```json
{
    "id": null,
    "jsonrpc": "2.0",
    "result": [
        {
            "code": 4,
            "expiration_date": "2019-10-31 23:59:59",
            "pan_number": "42424242",
            "payment_system": "Visa"
        }
    ]
}
```

