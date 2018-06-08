# Items

Items are items, services and any other thing that a Organization can sell. They can be saved and later referenced using their unique ID.

## Create New Item

```shell
curl "https://api.spaceinvoices.com/v1/orgnizations/5a3683ea12d5a67dd0ef2f4d/items" \
  -H "Authorization: TOKEN" \
  -d name="Space suit" \
  -d description="Best in class suit made from durable composites." \
  -d unit="item" \
  -d price=100 \
  -d taxIds[]="5a3683ea12d5a67dd0ef2f4e"
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "Space suit",
  "description": "Best in class suit made from durable composites.",
  "unit": "item",
  "price": 100,
  "taxIds": [ "5a3683ea12d5a67dd0ef2f4e" ]
}
```

This endpoint creates a new Item.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/organizations/:id/items`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Orgniazation for which we are creting the Item. |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of company, item or other type of organization. |
| description | Description of item. |
| unit | Unit of measurement. |
| price | Number price of item. |
| taxIds | Array of related Tax IDs that the Organization has. _The provided taxes will be expanded (loaded from Taxes) and used as default when adding items to documents._ |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |


## Update Item

```shell
curl -X PUT "https://api.spaceinvoices.com/v1/items/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN" \
  -d name="Space suit" \
  -d description="Best in class suit made from durable composites." \
  -d unit="item" \
  -d price=100 \
  -d taxIds[]="5a3683ea12d5a67dd0ef2f4e"
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "Space suit",
  "description": "Best in class suit made from durable composites.",
  "unit": "item",
  "price": 100,
  "taxIds": [ "5a3683ea12d5a67dd0ef2f4e" ]
}
```

This endpoint updates a Item by ID.

### HTTP Request

`PUT https://api.spaceinvoices.com/v1/items/:id`

#### Query parameters

|      |     |
| ---: | --- |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of company, item or other type of organization. |
| description | Description of item. |
| unit | Unit of measurement. |
| price | Number price of item. |
| taxIds | Array of related Tax IDs that the Organization has. _The provided taxes will be expanded (loaded from Taxes) and used as default when adding items to documents._ |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |


## Delete Item

```shell
curl -X DELETE "https://api.spaceinvoices.com/v1/items/5a3683ea12d5a67dd0ef2f4c" \
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

This endpoint soft deletes a Item by ID.

Soft deleted instances stay in database but are not returned on normal calls but can be added by providing `deleted: true` property in filters.

### HTTP Request

`DELETE https://api.spaceinvoices.com/v1/items/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Item to delete. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| count | Number of successfuly deleted items. |


## List Items

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/items" \
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
    "unit": "item",
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

This endpoint lists Organization's Items.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/items`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of Item model instance. |
| organizationId | ID of related Organization the Item belongs to. |
| name | Name of Item. |
| description | Description of Item. |
| unit | Unit of measurement of Item. |
| price | Price of Item. |
| taxes | Collection of objects containing Item taxes. [toggle definition](#expand) |
| name | Name of Tax. |
| _taxRates | Collection of objects containing item taxes. [toggle definition](#expand-inner) |
| dateValidFrom | Date when Tax Rate is valid from. _If Item Tax has multiple Tax Rates, a Rate is selected based on date of document for each document based on the most recent valid Tax Rate._ |
| rate | Number rate of Tax. |
| [](#empty-inner) | |
| recoverable | Booleand indicator if paid Tax can be recovered by Organization. |
| compound | Booleand indicator if Tax is compound. _Compound Tax is calculated on top of Document Item total value including any other Taxes on the item._ |
| [](#empty) | |


## Search Items

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/search-items?term=Space" \
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
    "unit": "item",
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

This endpoint searches for Organization's Items.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/search-items?term=:term`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| term **required** | String term to search for in Item properties. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of Item model instance. |
| organizationId | ID of related Organization the Item belongs to. |
| name | Name of Item. |
| description | Description of Item. |
| unit | Unit of measurement of Item. |
| price | Price of Item. |
| taxes | Collection of objects containing Item taxes. [toggle definition](#expand) |
| name | Name of Tax. |
| _taxRates | Collection of objects containing item taxes. [toggle definition](#expand-inner) |
| dateValidFrom | Date when Tax Rate is valid from. _If Item Tax has multiple Tax Rates, a Rate is selected based on date of document for each document based on the most recent valid Tax Rate._ |
| rate | Number rate of Tax. |
| [](#empty-inner) | |
| recoverable | Booleand indicator if paid Tax can be recovered by Organization. |
| compound | Booleand indicator if Tax is compound. _Compound Tax is calculated on top of Document Item total value including any other Taxes on the item._ |
| [](#empty) | |
