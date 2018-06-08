# Taxes

Taxes are stored per Organization and are then referenced on Items that need to charge it.

Taxes have rates applied to them and the rates are chosen based on date of document when they came into force as rates change in countries sometimes.

## Create New Tax

```shell
curl "https://api.spaceinvoices.com/v1/orgnizations/5a3683ea12d5a67dd0ef2f4d/taxes" \
  -H "Authorization: TOKEN" \
  -d name="GST 15" \
  -d _taxRates[][rate]=15
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "GST 15",
  "_taxRates": [
    {
      "rate": 15,
      "dateValidFrom": "1970-01-01"
    }
  ],
  "recoverable": true,
  "compound": false,
}
```

This endpoint creates a new Tax.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/organizations/:id/taxes`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Orgniazation for which we are creting the Tax. |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of Tax. |
| _taxRates | Array of rates the Tax has. [toggle definition](#expand) |
| rate | Rate of tax. |
| dateValidFrom | Date when the rate came into force. _Used on Documents to determine which rate should be used based on Document date._ |
| [](#empty) | |
| recoverable _Default is *true*_ | Boolean if Tax is recoverable after being paid. |
| compound _Default is *false*_ | Boolean if Tax is compound. _Compound Tax is calculated based on Item price and any other Tax applied to Item. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |


## Add New Rate to a Tax

```shell
curl "https://api.spaceinvoices.com/v1/taxes/5a3683ea12d5a67dd0ef2f4c/taxRates" \
  -H "Authorization: TOKEN" \
  -d rate=20 \
  -d dateValidFrom="2018-01-01"
```

```javascript
```

> Returns:

```json
{
  "rate": 20,
  "dateValidFrom": "2018-01-01"
}
```

This endpoint creates a new Rate for a Tax.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/taxes/:id/taxRates`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Tax for which we are creting the Rate. |

#### Arguments

|      |     |
| ---: | --- |
| rate | Rate of tax. |
| dateValidFrom | Date when the rate came into force. _Used on Documents to determine which rate should be used based on Document date._ |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |


## Update Tax

```shell
curl -X PUT "https://api.spaceinvoices.com/v1/taxes/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN" \
  -d name="GST 15"
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "GST 15",
  "_taxRates": [
    {
      "rate": 15,
      "dateValidFrom": "1970-01-01"
    }
  ],
  "recoverable": true,
  "compound": false,
}
```

This endpoint updates a Tax by ID.

### HTTP Request

`PUT https://api.spaceinvoices.com/v1/taxes/:id`

#### Query parameters

|      |     |
| ---: | --- |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of Tax. |
| _taxRates | Array of rates the Tax has. [toggle definition](#expand) |
| rate | Rate of tax. |
| dateValidFrom | Date when the rate came into force. _Used on Documents to determine which rate should be used based on Document date._ |
| [](#empty) | |
| recoverable _Default is *true*_ | Boolean if Tax is recoverable after being paid. |
| compound _Default is *false*_ | Boolean if Tax is compound. _Compound Tax is calculated based on Item price and any other Tax applied to Item. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |


## Delete Tax

```shell
curl -X DELETE "https://api.spaceinvoices.com/v1/taxes/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN"
```

```javascript
```

> Returns:

```json
{
  "count": 1
}
```

This endpoint deletes a Tax by ID.

A Tax can only be deleted if it's not used on any Document.

### HTTP Request

`DELETE https://api.spaceinvoices.com/v1/taxes/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Tax to delete. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| count | Number of successfuly deleted taxes. |


## List Taxes

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/taxes" \
  -H "Authorization: TOKEN"
```

```javascript
```

> Returns:

```json
[
  {
    "id": "5a3683ea12d5a67dd0ef2f4c",
    "organizationId": "5a3683ea12d5a67dd0ef2f4d",
    "name": "Space suit",
    "description": "Best in class suit made from durable composites.",
    "unit": "tax",
    "price": 100,
    "taxIds": [ "5a3683ea12d5a67dd0ef2f4e" ],
    "taxes": [
      {
        "id": "5a3683ea12d5a67dd0ef2f4e",
        "name": "VAT 22%",
        "_taxRates": [
          {
            "id": "e5be3095-4d31-4f09-9ac7-d459a8792621",
            "dateValidFrom": 1970-01-01,
            "rate": 22
          }
        ],
        "recoverable": true,
        "compound": false
      }
    ]
  }
]
```

This endpoint lists Organization's Taxes.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/taxes`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of Tax. |
| _taxRates | Array of rates the Tax has. [toggle definition](#expand) |
| rate | Rate of tax. |
| dateValidFrom | Date when the rate came into force. _Used on Documents to determine which rate should be used based on Document date._ |
| [](#empty) | |
| recoverable | Boolean if Tax is recoverable after being paid. |
| compound | Boolean if Tax is compound. _Compound Tax is calculated based on Item price and any other Tax applied to Item. |

