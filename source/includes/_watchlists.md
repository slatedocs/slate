# Watchlists APIs
Requires authentication.

## List

Returns all list of all watchlists


```APIs
GET https://dev.zoomsymbols.com/api/user-watchlists/list
```

> Parameters (OPTIONAL)

```
type: watchlist_type (default 'P')
```

> Response

```json
  {
    result: [{
        id: 2914,
        name: "Cold2",
        title: "Cold2",
        user_id: "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        display_name: "kirdun vlad",
        user_item_type_id: 16,
        user_item_type_code: "watchlist",
        visibility_code: "P",
        visibility_name: "Private",
        list_order: null,
        create_date: "2019-01-15T15:47:33.136166",
        modify_date: "2019-01-15T15:47:33.136166",
        is_enable: true,
        is_deleted: false,
        can_write: true,
        can_read: true,
        is_fav: false,
        symbols: "COLD,VICI",
        symbolsList: [{
            symbol_id: 1346804,
            company_id: 8983880,
            symbol_value: "COLD",
            symbol: "COLD",
            symbol_name: "Americold Realty Trust",
            exchange_id: 96,
            exchange_code: "NYSE",
            exchange_name: "New York Stock Exchange",
            data_provider_id: 2,
            exchange_country_name: "United States",
            exchange_country_iso2: "US",
            exchange_parent_code: "NYSE",
            symbol_status_name: "Active",
            security_type_code: "equity",
            latest_px_date: "2019-03-15T00:00:00",
            latest_px_open: 30.34,
            latest_px_high: 30.41,
            latest_px_low: 30.07,
            latest_px_close: 30.35,
            latest_volume: 962554,
            latest_chg_1d: 0.06,
            latest_return_1d: 0.1981,
            price_data_provider_id: 5,
            latest_modify_date: "2019-03-15T17:35:39.774283+00:00",
            exchange_currency_name: "US Dollar",
            exchange_currency_code: "USD",
            currency_name: "US Dollar",
            currency_code: "USD",
            row_id: 4654,
            is_active: true,
            ciq_security_id: 111855853,
            exchange_country_id: 194
        }, ...]
    }]
}
```
