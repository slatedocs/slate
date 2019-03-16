# Marketplace APIs
Requires authentication.

## Get Datasets

Returns all datasets for authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/marketplace/getDatasets
```

> Parameters (OPTIONAL)

```
type: open/private/all
```

> Response

```json
{
    columns: [{
            code: "name",
            name: "Name",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 200,
            onPress: {
                navigateTo: {
                    screen: "Dataset",
                    params: {
                        dataset: {
                            id: "{id}",
                            title: "{title}",
                            type: "{type}"
                        }
                    }
                }
            }
        },
        {
            code: "title",
            name: "Title",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 200
        }
    ],
    result: [{
        id: 1,
        name: "akram_ds",
        title: "Akram DS",
        owner_id: "5cde2208-1078-11e8-ae1b-83714d76deca",
        owner_name: "Akram 5 akamal",
        type: "Open",
        is_published: true,
        description: "Dataset for testing",
        symbol_id: "68",
        symbol_value: "MSFT",
        symbol_name: "Microsoft Corporation",
        frequency: "Monthly",
        is_paid: false,
        payment_type: null,
        payment_code: null,
        currency_id: null,
        currency_code: null,
        is_free_trial: false,
        trial_type: null,
        free_trial_duration: null,
        create_date: "2019-03-12T14:20:48.706Z",
        modify_date: "2019-03-12T14:20:48.706Z",
        is_deleted: false
    },
    ...
  ]
}
```


## Get Dataset Types

Returns all dataset types.

```APIs
GET https://dev.zoomsymbols.com/api/marketplace/getDatasetTypes
```


> Response

```json
{
    result: [{
            code: "open",
            name: "Open"
        },
        {
            code: "private",
            name: "Private"
        }
    ]
}
```

## Get Dataset Charts

Returns all charts for given dataset.

```APIs
GET https://dev.zoomsymbols.com/api/marketplace/getDatasetCharts
```

> Parameters

```
id: dataset_id
```

> Response

```json
{
    result: [{
            title: "Target - MSFT",
            rows: [{
                    date: "2019-03-12",
                    value: 113.62
                },
                ...
            ]
        },
      ]
    }
}
```

## Get Dataset File Data

Returns all files data for given dataset.

```APIs
GET https://dev.zoomsymbols.com/api/marketplace/getDatasetFileData
```

> Parameters

```
id: dataset_id
```

> Response

```json


{
    columns: [{
            code: "date",
            name: "Date",
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
        },
        {
            code: "value",
            name: "Value",
            enableSort: true,
            styles: {
                textAlign: "right"
            },
            format: {
                type: "number",
                cellsFormat: "d",
                formatValue: "2",
                enableSort: true
            },
            width: 130
        }
    ],
    result: [{
        date: "2019-03-12T00:00:00.000Z",
        value: "113.31"
    }, ...]
}
```

## Get Dataset Settings

Returns all settings for given dataset.

```APIs
GET https://dev.zoomsymbols.com/api/marketplace/getDatasetSettings
```

> Parameters

```
id: dataset_id
```

> Response

```json
{
    result: {
        name: "akram_ds",
        title: "Akram DS",
        dataset_type: "Open",
        target_symbol: "MSFT",
        market_type: "Equity"
    }
}
```
