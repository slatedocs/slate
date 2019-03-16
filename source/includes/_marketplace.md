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
    }]
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
