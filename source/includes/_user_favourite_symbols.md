# User Favorite Symbols APIs

Requires authentication.

## Get Favorite Symbols

Returns all favorite symbols for currently authorized user.

```API
GET https://dev.zoomsymbols.com/api/user/getFavoriteSymbols
```

> Response

```json
{
    result: [{
        symbol_id: "48351",
        symbol_value: "GOOG.L",
        symbol: "GOOG.L",
        symbol_name: "Alphabet Inc.",
        exchange_id: 414,
        exchange_code: "NasdaqGS",
        exchange_name: "Nasdaq Global Select",
        data_provider_id: 2,
        exchange_country_name: "United States",
        exchange_country_iso2: "US",
        exchange_parent_code: "NASDAQ",
        symbol_status_name: "Active",
        security_type_code: "equity",
        latest_px_open: "1198.0000",
        latest_px_high: "1201.7250",
        latest_px_low: "1187.0100",
        latest_px_close: "1190.30",
        latest_volume: "2591771",
        latest_chg_1d: "-2.2300",
        latest_return_1d: "-0.1870",
        create_date: "2018-11-05T15:44:05.851Z",
        is_fav: true
    }, ...]
}
```

## Set Favorite Symbol

Sets a favorite symbol for currently authorized user.

```API
POST https://dev.zoomsymbols.com/api/user/setFavoriteSymbols
```

> Parameters

```
symbol/symbolId: your_symbol
```

> Response

```json
{
    "result": {
        "symbol": "MKG",
        "symbol_id": "63",
        "company_id": 21609,
        "symbol_value": "MKG",
        "symbol_name": "Mallinckrodt LLC",
        "exchange_id": 96,
        "exchange_code": "NYSE",
        "exchange_name": "New York Stock Exchange",
        "data_provider_id": 2,
        "exchange_country_name": "United States",
        "exchange_country_id": 194,
        "exchange_country_iso2": "US",
        "exchange_parent_code": "NYSE",
        "symbol_status_name": "Merged",
        "security_type_code": "equity",
        "latest_px_date": "2000-10-17T00:00:00.000Z",
        "latest_px_open": "45.5000",
        "latest_px_high": "45.7500",
        "latest_px_low": "43.1250",
        "latest_px_close": "43.94",
        "latest_volume": "3388500",
        "latest_chg_1d": "-0.8125",
        "latest_return_1d": "-1.8156",
        "price_data_provider_id": 2,
        "latest_modify_date": null,
        "exchange_currency_name": "US Dollar",
        "exchange_currency_code": "USD",
        "currency_name": "US Dollar",
        "currency_code": "USD",
        "row_id": "189048",
        "is_active": false,
        "ciq_security_id": 2628251,
        "briefDescription": "10/17/2000 | NYSE | EOD | Currency in USD",
        "enable_trade": 96,
        "is_fav": true
    }
}
```

## Remove Favorite Symbol

Removes a symbol from the list of favorites for currently authorized user.

```API
POST https://dev.zoomsymbols.com/api/user/removeFavoriteSymbols
```

> Parameters

```
symbol/symbolId: your_symbol
```

> Response

```json
{
    "result": {
        "symbol": "MKG",
        "symbol_id": "63",
        "company_id": 21609,
        "symbol_value": "MKG",
        "symbol_name": "Mallinckrodt LLC",
        "exchange_id": 96,
        "exchange_code": "NYSE",
        "exchange_name": "New York Stock Exchange",
        "data_provider_id": 2,
        "exchange_country_name": "United States",
        "exchange_country_id": 194,
        "exchange_country_iso2": "US",
        "exchange_parent_code": "NYSE",
        "symbol_status_name": "Merged",
        "security_type_code": "equity",
        "latest_px_date": "2000-10-17T00:00:00.000Z",
        "latest_px_open": "45.5000",
        "latest_px_high": "45.7500",
        "latest_px_low": "43.1250",
        "latest_px_close": "43.94",
        "latest_volume": "3388500",
        "latest_chg_1d": "-0.8125",
        "latest_return_1d": "-1.8156",
        "price_data_provider_id": 2,
        "latest_modify_date": null,
        "exchange_currency_name": "US Dollar",
        "exchange_currency_code": "USD",
        "currency_name": "US Dollar",
        "currency_code": "USD",
        "row_id": "189048",
        "is_active": false,
        "ciq_security_id": 2628251,
        "briefDescription": "10/17/2000 | NYSE | EOD | Currency in USD",
        "enable_trade": 96,
        "is_fav": true
    }
}
```
