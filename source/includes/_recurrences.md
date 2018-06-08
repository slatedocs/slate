# Recurrences

Recurrences are created for Documents. A recurrence dictates when a periodic automatic creation of documents using the original document content as a base but changing the dates and number.

## Create New Recurrence

```shell
curl "https://api.spaceinvoices.com/v1/documents/5a3683ea12d5a67dd0ef2f4d/recurrences" \
  -H "Authorization: TOKEN" \
  -d name="Monthly recurrence" \
  -d type="month" \
  -d dateFirst="2018-01-01" \
  -d numRecurrences=2
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "documentId": "5a3683ea12d5a67dd0ef2f4d",
  "organizationId": "5a3683ea12d5a67dd0ef2f4e",
  "accountId": "5a3683ea12d5a67dd0ef2f4f",
  "name": "Monthly recurrence",
  "type": "month",
  "dateFirst": "2018-01-01",
  "numRecurrences": 2,
  "autoSend": false,
  "notify": true,
  "saveAsDraft": false,
  "_recurrenceDates": [
    {
      "date": "2018-01-01",
      "iteration": 1
    }, {
      "date": "2018-02-01",
      "iteration": 2
    }
  ]
}
```

This endpoint creates a new Recurrence.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/documents/:id/recurrences`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Document for which we are creting the Recurrence. |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of recurrence. |
| type **required** | Type of recurrence, one of `week` / `month` / `year`. |
| dateFirst **required** | Date of first recurrence. |
| numRecurrences **required** | Number of Recurrence. |
| autoSend | Boolean if a created Document should be automaticaly sent to Client when created. |
| notify | Boolean if Account that created the Recurrence should be notified when a Document is created. |
| saveAsDraft | Boolean if invoice should be created as draft. |
| recurrenceDates | Array of objects containing created Recurrence dates. [toggle definition](#expand) |
| date | Date of Recurrence. |
| iteration | Number iteration index of Recurrence. |
| [](#empty) | |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |


## Delete Recurrence

```shell
curl -X DELETE "https://api.spaceinvoices.com/v1/recurrences/5a3683ea12d5a67dd0ef2f4c" \
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

This endpoint deletes a Recurrence by ID.

### HTTP Request

`DELETE https://api.spaceinvoices.com/v1/recurrences/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Recurrence to delete. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| count | Number of successfuly deleted recurrences. |


## List Recurrences

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/recurrences" \
  -H "Authorization: TOKEN"
```

```javascript
```

> Returns:

```json
[
  {
    "id": "5a3683ea12d5a67dd0ef2f4c",
    "documentId": "5a3683ea12d5a67dd0ef2f4d",
    "organizationId": "5a3683ea12d5a67dd0ef2f4e",
    "type": "bank",
    "date": "2018-01-01",
    "amount": 1000
  }
]
```

This endpoint lists Organization's Recurrences.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/recurrences`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| type | Type of recurrence. |
| date | Number price of recurrence. |
| amount | Amount of Recurrence. |
| description | Description of Recurrence. |


## List Recurrences

```shell
curl "https://api.spaceinvoices.com/v1/documents/5a3683ea12d5a67dd0ef2f4d/recurrences" \
  -H "Authorization: TOKEN"
```

```javascript
```

> Returns:

```json
[
  {
    "id": "5a3683ea12d5a67dd0ef2f4c",
    "documentId": "5a3683ea12d5a67dd0ef2f4d",
    "organizationId": "5a3683ea12d5a67dd0ef2f4e",
    "accountId": "5a3683ea12d5a67dd0ef2f4f",
    "name": "Monthly recurrence",
    "type": "month",
    "dateFirst": "2018-01-01",
    "numRecurrences": 2,
    "autoSend": false,
    "notify": true,
    "saveAsDraft": false,
    "_recurrenceDates": [
      {
        "date": "2018-01-01",
        "iteration": 1
      }, {
        "date": "2018-02-01",
        "iteration": 2
      }
    ]
  }
]
```

This endpoint lists Recurrences.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/documents/:id/recurrences`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Document. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| name  | Name of recurrence. |
| type  | Type of recurrence. |
| dateFirst  | Date of first recurrence. |
| numRecurrences | Number of Recurrence. |
| autoSend | Boolean if a created Document should be automaticaly sent to Client when created. |
| notify | Boolean if Account that created the Recurrence should be notified when a Document is created. |
| saveAsDraft | Boolean if invoice should be created as draft. |
| recurrenceDates | Array of objects containing created Recurrence dates. [toggle definition](#expand) |
| date | Date of Recurrence. |
| iteration | Number iteration index of Recurrence. |
| [](#empty) | |
