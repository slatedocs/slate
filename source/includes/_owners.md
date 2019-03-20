# Owners APIs

Requires authentication.

## Get Insider Transactions Type

Returns all insider transactions types.

```APIs
GET https://dev.zoomsymbols.com/api/owners/getInsiderTransactionsType
```

> Response

```json
{
    result: [{
            code: "acquisition_under_employee_benefit_plan",
            name: "Acquisition Under Employee Benefit Plan"
        },
        {
            code: "automatic_acquisition",
            name: "Automatic Acquisition"
        }, ...
    ]
}
```

## Get Insider Transactions

Returns all transaction types.

```APIs
GET https://dev.zoomsymbols.com/api/owners/getInsiderTransactions
```

> Parameters

```
symbol/symbolId: your_symbol
```

> Response

```json
{
    totalRecords: "2444",
    totalPages: 25,
    pageSize: 100,
    pageNum: null,
    columns: [{
            code: "filing_date",
            name: "Filing Date",
            enableSort: true,
            styles: {
                textAlign: "right"
            },
            format: {
                type: "date",
                formatValue: "MM/DD/YYYY",
                enableSort: true
            },
            width: 150
        },
        {
            code: "owner_name",
            name: "Owner Name",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 280,
            onPress: {
                navigateTo: {
                    screen: "OwnersDetail",
                    params: {
                        owner: {
                            owner_name: "{owner_name}",
                            owner_cik: "{owner_cik}"
                        }
                    }
                }
            }
        },
        {
            code: "officer_title",
            name: "Officer Title",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 320
        }, ...
    ]
}
```


## Get Owners

Returns data for all owners.

```APIs
GET https://dev.zoomsymbols.com/api/owners/getOwners
```

> Response

```json
{
    totalRecords: "17990",
    totalPages: 180,
    pageSize: 100,
    pageNum: null,
    result: [{
        owner_id: "14087",
        owner_name: "033 ASSET MANAGEMENT LLC /",
        owner_cik: "0001114831",
        business_address: "125 HIGH ST, SUITE 1405, BOSTON, MA 02110",
        business_phone_no: "6173712015",
        country_inc: "United States of America",
        country_id: 194,
        state: "Massachusetts",
        state_inc: "Delaware",
        institutional: true,
        mailing_address: "125 HIGH ST, SUITE 1405, BOSTON, MA 02110",
        data_provider_id: 5,
        country_name: "United States",
        country_iso2: "US",
        country_iso3: "USA",
        region_id: 4,
        totalRecords: "17990"
    }, ...]
}
```

## Get Institutional Ownership

Returns all institutional ownerships for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/owners/getInstitutionalOwnership
```

> Parameters

```
symbol/symbolId: your_symbol
```

> Response

```json
{
    totalRecords: "0",
    totalPages: 0,
    pageSize: 100,
    pageNum: null,
    columns: [{
            code: "owner_name",
            name: "Owner Name",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 280,
            onPress: {
                navigateTo: {
                    screen: "OwnersDetail",
                    params: {
                        owner: {
                            owner_name: "{owner_name}",
                            owner_cik: "{owner_cik}"
                        }
                    }
                }
            }
        },
        {
            code: "period_ended",
            name: "Period Ended",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            format: {
                type: "date",
                formatValue: "MM/DD/YYYY",
                enableSort: true
            },
            width: 150
        }, ...
    ]
}
```
