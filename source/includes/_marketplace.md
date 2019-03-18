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

## Set Dataset Item

Returns all settings for given dataset.

```APIs
POST https://dev.zoomsymbols.com/api/marketplace/setDatasetItem
```

> Parameters

```json
{
"id": set_id (null will create a new one),
"name": "dataset_name",
"title": "dataset_title",
"type": "open/closed",
"is_published": "true/false",
"description": "dataset_description",
"symbol_id": symbol_id,
"frequency": "weekly/monthly/yearly",
"sheet_id": "the google spread sheet id",
"date_column": "The column range for dates e.g (A2)",
"value_column": "The column range for values e.g (B2)",
"sheet_name": "The google sheet name",
"is_paid": "true/false",
"payment_type": "weekly/monthly/yearly",
"paid_cost": pay_cost,
"currency_code": "currency_code e.g (USD)",
"is_free_trial": "true/false",
"trial_type": "week/month/year",
"free_trial_duration": trial_duration
}
```

> Response

```json
{
    "result": {
        "id": 19,
        "name": "testDataset",
        "title": "testTitle",
        "owner_id": "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        "owner_name": "kirdun vlad",
        "type": "Open",
        "is_published": true,
        "description": "The test description",
        "symbol_id": 68,
        "symbol_value": "MSFT",
        "symbol_name": "Microsoft Corporation",
        "frequency": "Weekly",
        "is_paid": true,
        "payment_type": "Weekly",
        "payment_code": 100,
        "currency_id": 161,
        "currency_code": "USD",
        "is_free_trial": true,
        "trial_type": "Week",
        "free_trial_duration": 100,
        "create_date": "2019-03-18T13:26:34.027832",
        "modify_date": "2019-03-18T13:26:34.027832",
        "is_deleted": false,
        "sheet_id": "1FYjKFXhMS1feYKCjFYtuaARdwsLXa4DeXGeHlHlJEso",
        "sheet_name": "Sheet1",
        "date_column": "A2",
        "value_column": "B2"
    }
}
```

## Delete Dataset Item

Returns all settings for given dataset.

```APIs
POST https://dev.zoomsymbols.com/api/marketplace/deleteDatasetItem
```

> Parameters

```
id: dataset_id
```

> Response

```json
{
    "result": {
        "id": 19,
        "name": "testDataset",
        "title": "testTitle",
        "owner_id": "7b3b58c8-2091-11e8-9d2e-53dce223a590",
        "owner_name": "kirdun vlad",
        "type": "Open",
        "is_published": true,
        "description": "The test description",
        "symbol_id": 68,
        "symbol_value": "MSFT",
        "symbol_name": "Microsoft Corporation",
        "frequency": "Weekly",
        "is_paid": true,
        "payment_type": "Weekly",
        "payment_code": 100,
        "currency_id": 161,
        "currency_code": "USD",
        "is_free_trial": true,
        "trial_type": "Week",
        "free_trial_duration": 100,
        "create_date": "2019-03-18T13:26:34.027832",
        "modify_date": "2019-03-18T13:26:34.027832",
        "is_deleted": true
    }
}
```

## Subscribe

Subscribes currently authorized user to the given dataset.

```APIs
POST https://dev.zoomsymbols.com/api/marketplace/subscribe
```

> Parameters

```
id: dataset_id
```

> Response

```json
{
    "result": "User has subscribed to the dataset successfully!"
}
```

## Subscribe

Unsubscribes currently authorized user to the given dataset.

```APIs
POST https://dev.zoomsymbols.com/api/marketplace/unsubscribe
```

> Parameters

```
id: dataset_id
```

> Response

```json
{
    "result": "User has unsubscribed to the dataset successfully!"
}
```
