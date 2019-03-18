# Global Currencies APIs
Requires authentication.

## List
Returns a list of all global currencies.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/list
```
> Parameters (OPTIONAL)

```
currency_name: currency to group by
```

> Response

```json
{
    result: [{
        currency_id: 179,
        currency_name: "Afghani",
        currency_code: "AFA",
        currency_unit: null,
        currency_rate: null,
        last_update: null,
        country_id: 1,
        country_name: "Afghanistan",
        country_iso2: "AF",
        country_iso3: "AFG"
    }, ...]
}
```

## Groups
Returns a list of all global currencies groups.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/groups
```

> Parameters (OPTIONAL)

```
type: group_type
```

> Response

```json
{
    result: [{
        currency_id: 179,
        currency_name: "Afghani",
        currency_code: "AFA",
        currency_unit: null,
        currency_rate: null,
        last_update: null,
        country_id: 1,
        country_name: "Afghanistan",
        country_iso2: "AF",
        country_iso3: "AFG"
    }, ...]
}
```

## Group
Returns a list of all global currencies grouped by parameters.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/group
```

> Parameters

```
type: group_type
dateTime: DD/MM/YYYY
```

> Response

```json
{
    result: [{
                symbol_id: "1594524",
                symbol_value: "AUDUSD",
                base_currency_code: "AUD",
                currency_code: "USD",
                px_open: "0.72810000",
                px_high: "0.73010000",
                px_low: "0.72760000",
                px_close: "0.72960000"
            }, ...]
}
```

## History
Returns the history for a specific currency.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/history
```

> Parameters

```
currency: your_currency
base: your_base (default "USD")
```

> Response

```json
{
    totalRecords: "1901",
    totalPages: 20,
    pageSize: 100,
    pageNum: null,
    result: [{
                px_date: "2011-12-05",
                symbol_id: "4314964",
                symbol_value: "USDNZD",
                symbol: "USDNZD",
                symbol_name: "US Dollar/NZD",
                chg_1d: "-0.0059",
                return_1d: "-0.4615",
                px_open: "1.2799",
                px_high: "1.2900",
                px_low: "1.2763",
                px_close: "1.2821",
                volume: null,
                totalRecords: "1901"
            }, ...]
}
```


> Response

## Prices
Returns the history for a specific currency.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/prices
```

> Parameters

```
currency/base: your_currency (default "USD")
target: your_target (optional)
dateTime: DD/MM/YYYY
```

> Response

```json
{
  totalRecords: "153",
  totalPages: 2,
  pageSize: 100,
  pageNum: null,
  result: [{
              symbol_id: "1594530",
              symbol_value: "USDAED",
              symbol: "USDAED",
              symbol_name: "US Dollar/AED",
              iso_code: "AED",
              currency_name: "United Arab Emirates Dirham",
              px_open: "3.67280000",
              px_high: "3.67300000",
              px_low: "3.67280000",
              px_close: "3.67300000",
              chg_1d: "0.00020000",
              return_1d: "0.00544544",
              totalRecords: "153"
          }, ...]
}
```

## Convert
Returns the currency conversion result.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/convert
```

> Parameters

```
from: original_currency
to: new_currency
```

> Response

```json
{
    result: {
        rate: 1.4571,
        rate_message: "USD to NZD = 1.4571",
        last_update: "2019-03-18T12:55:00.000Z"
    }
}
```
