# Today APIs

Requires authentication.

## Get Todays Data

Returns all today's data.

```APIs
GET https://dev.zoomsymbols.com/api/today/getTodaysData
```

> Response

```json
{
    result: [{
            code: "equities",
            name: "Equities",
            rows: [{
                    symbol: "$INDU",
                    symbol_id: "1594520",
                    symbol_value: "$INDU",
                    symbol_name: "Dow Jones",
                    group_code: "equities",
                    group_name: "Equities",
                    title_code: "major_indices",
                    title_name: "Major Indices",
                    latest_px_open: "25987.87",
                    latest_px_high: "26109.68",
                    latest_px_low: "25814.92",
                    latest_px_close: "25887.38",
                    latest_volume: null,
                    latest_chg_1d: "-26.72",
                    latest_return_1d: "-0.10"
                }, ...
            }]
    }]
}
```

## Get Todays Data Settings

Returns all today's data settings for authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/today/getTodaysDataSettings
```

> Response

```json
{
    result: {
        user_setting_id: 664,
        user_id: "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        username: "test",
        is_default: false,
        accepted_terms: false,
        enable_earning: true,
        enable_news: true,
        enable_market_equity: true,
        enable_market_commodity: true,
        enable_market_global_instrument: false,
        symbol_value_list: [{
            symbol_id: "5",
            symbol_value: "AMZN",
            symbol_name: "Amazon.com, Inc."
        }, ...]
    }
}
```

## Set Todays Data Settings

Sets today's data settings for currently authorized user.

```APIs
POST https://dev.zoomsymbols.com/api/today/setTodaysDataSettings
```
> Parameters

```json
{
"user_setting_id": 664,
"user_id": "7b3b58c8-2091-11e8-9d2e-53dce223a590",
"username": "test",
"is_default": false,
"accepted_terms": false,
"enable_earning": true,
"enable_news": true,
"enable_market_equity": true,
"enable_market_commodity": true,
"enable_market_global_instrument": false,
"symbol_value_list": []
}
```

> Response

```json
{
    result: {
        user_setting_id: 664,
        user_id: "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        username: "test",
        is_default: false,
        accepted_terms: false,
        enable_earning: true,
        enable_news: true,
        enable_market_equity: true,
        enable_market_commodity: true,
        enable_market_global_instrument: false,
        symbol_value_list: [{
            symbol_id: "5",
            symbol_value: "AMZN",
            symbol_name: "Amazon.com, Inc."
        }, ...]
    }
}
```

## Reset Today's Data Settings

Resets today's data settings for currently authorized user.

```APIs
POST https://dev.zoomsymbols.com/api/today/resetTodaysDataSettings
```

> Response

```json
{
    "result": {
        "user_setting_id": 2,
        "user_id": "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        "username": "test",
        "is_default": true,
        "accepted_terms": false,
        "enable_earning": true,
        "enable_news": true,
        "enable_market_equity": true,
        "enable_market_commodity": true,
        "enable_market_global_instrument": true,
        "symbol_value_list": [
            {
                "symbol_id": "5",
                "symbol_value": "AMZN",
                "symbol_name": "Amazon.com, Inc."
            },
            {
                "symbol_id": "68",
                "symbol_value": "MSFT",
                "symbol_name": "Microsoft Corporation"
            },
            {
                "symbol_id": "283",
                "symbol_value": "AAPL",
                "symbol_name": "Apple Inc."
            },
            {
                "symbol_id": "48351",
                "symbol_value": "GOOG.L",
                "symbol_name": "Alphabet Inc."
            },
            {
                "symbol_id": "1338591",
                "symbol_value": "SPY",
                "symbol_name": "SPDR S&P 500 ETF Trust"
            },
            {
                "symbol_id": "1361467",
                "symbol_value": "FB",
                "symbol_name": "Facebook, Inc."
            }
        ],
        "symbol_ids_list": "5,68,283,48351,1338591,1361467",
        "active_source": "symbol"
    }
}
```
