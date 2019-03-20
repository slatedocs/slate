# Search APIs

Requires authentication.

## Get Search Tree

Returns the entire search tree.

```APIs
GET https://dev.zoomsymbols.com/api/search/getSearchTree
```

> Response

```json
{
    result: [{
        name: "Symbols",
        code: "symbols",
        items: [{
                code: "bond",
                name: "Bond",
                type: "bond"
            },
            {
                code: "commodity",
                name: "Commodity",
                type: "commodity"
            }, ...
        ]
    }]
}
```

## Get Search Result

Returns the result of a search by item and query.

```APIs
GET https://dev.zoomsymbols.com/api/search/getSearchResult
```

> Parameters

```
item: item_type (e.g. 'symbols')
query: search_query
compare: (default 'contains')
```

> Response

```json
{
    result: [{
        code: "symbols",
        rows: [{
            symbol_id: "4671555",
            symbol_value: "MSF",
            symbol_name: "MSF Sugar Limited",
            exchange_id: 2,
            symbol_sub_type_id: 56,
            symbol_start_date: "1992-01-08T00:00:00.000Z",
            symbol_end_date: "2012-03-01T00:00:00.000Z",
            symbol_status_id: 11,
            country_id: null,
            data_provider_id: 2,
            company_id: 4484092,
            ciq_security_id: 20094585,
            create_date: "2018-10-31T07:44:11.834Z",
            modify_date: "2018-10-31T07:44:11.834Z",
            is_enable: true,
            ciq_trading_item_id: "20179455",
            composite_figi: null,
            gics_id: null,
            importance: null,
            security_type_id: 1,
            currency_id: 10,
            decimal_places: null,
            data_provider_symbol_value: null,
            is_primary_symbol: true,
            is_primary_security: true,
            old_symbol_name: "MSF Sugar Limited",
            totalRecords: "38"
        }, ...]
    }]
}
```
