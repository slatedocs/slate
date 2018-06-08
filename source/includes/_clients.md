# Clients

Clients are businesses, end persons, organizations and any other entity that can receive a document from an organization. They can be saved and later referenced using their unique ID.

## Create New Client

```shell
curl "https://api.spaceinvoices.com/v1/orgnizations/5a3683ea12d5a67dd0ef2f4d/clients" \
  -H "Authorization: TOKEN" \
  -d name="Space Exploration Technologies corp" \
  -d address="Rocket Road" \
  -d city="Hawthorne" \
  -d zip="CA 90250" \
  -d country="USA" \
  -d email="info@spacex.com" \
  -d contact="Elon M." \
  -d phone="+1 123 456 789" \
  -d note="Orders rocket fuel every month."
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "Space Exploration Technologies corp",
  "address": "Rocket Road",
  "city": "Hawthorne",
  "zip": "CA 90250",
  "country": "USA",
  "email": "info@spacex.com",
  "contact": "Elon M.",
  "phone": "+1 123 456 789",
  "note": "Orders rocket fuel every month."
}
```

This endpoint creates a new Client.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/organizations/:id/clients`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Orgniazation for which we are creting the Client. |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of company, client or other type of organization. |
| address | Street or similar address. |
| address2 | Address line 2. |
| city | City name. |
| zip | Zip / post code. |
| country | ISO 3166 county. |
| taxSubject _default is *false*_ | Specify if the Client is subject to tax. |
| taxNumber | String VAT / GST / etc. tax identification number. |
| companyNumber | String registration or similar identification number. |
| email | Email address of Client. _Used as recipient when sending documents in email._ |
| contact | Name of Client. |
| phone | Phone number of Client. |
| note | Text note about Client. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |


## Update Client

```shell
curl -X PUT "https://api.spaceinvoices.com/v1/clients/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN" \
  -d name="Space Exploration Technologies corp" \
  -d address="Rocket Road" \
  -d city="Hawthorne" \
  -d zip="CA 90250" \
  -d country="USA" \
  -d email="info@spacex.com" \
  -d contact="Elon M." \
  -d phone="+1 123 456 789" \
  -d note="Orders rocket fuel every month."
```

```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "name": "Space Exploration Technologies corp",
  "address": "Rocket Road",
  "city": "Hawthorne",
  "zip": "CA 90250",
  "country": "USA",
  "email": "info@spacex.com",
  "contact": "Elon M.",
  "phone": "+1 123 456 789",
  "note": "Orders rocket fuel every month."
}
```

This endpoint updates a Client by id.

### HTTP Request

`PUT https://api.spaceinvoices.com/v1/clients/:id`

#### Query parameters

|      |     |
| ---: | --- |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of company, client or other type of organization. |
| address | Street or similar address. |
| address2 | Address line 2. |
| city | City name. |
| zip | Zip / post code. |
| country | ISO 3166 county. |
| taxSubject _default is *false*_ | Specify if the Client is subject to tax. |
| taxNumber | String VAT / GST / etc. tax identification number. |
| companyNumber | String registration or similar identification number. |
| email | Email address of Client. _Used as recipient when sending documents in email._ |
| contact | Name of Client. |
| phone | Phone number of Client. |
| note | Text note about Client. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |


## Delete Client

```shell
curl -X DELETE "https://api.spaceinvoices.com/v1/clients/5a3683ea12d5a67dd0ef2f4c" \
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

This endpoint soft deletes a Client by id.

Soft deleted instances stay in database but are not returned on normal calls but can be added by providing `deleted: true` property in filters.

### HTTP Request

`DELETE https://api.spaceinvoices.com/v1/clients/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Client to delete. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| count | Number of successfuly deleted items. |


## List Clients

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/clients" \
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
    "name": "Space Exploration Technologies corp",
    "address": "Rocket Road",
    "city": "Hawthorne",
    "zip": "CA 90250",
    "country": "USA",
    "email": "info@spacex.com",
    "contact": "Elon M.",
    "phone": "+1 123 456 789",
    "note": "Orders rocket fuel every month."
  }
]
```

This endpoint lists Organization's Clients.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/clients`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| name | Name of company, client or other type of organization. |
| address | Street or similar address. |
| address2 | Address line 2. |
| city | City name. |
| zip | Zip / post code. |
| country | ISO 3166 county. |
| taxSubject | Specify if the Client is subject to tax. |
| taxNumber | String VAT / GST / etc. tax identification number. |
| companyNumber | String registration or similar identification number. |
| email | Email address of Client. _Used as recipient when sending documents in email._ |
| contact | Name of Client. |
| phone | Phone number of Client. |
| note | Text note about Client. |


## Search Clients

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/search-clients?term=Space" \
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
    "name": "Space Exploration Technologies corp",
    "address": "Rocket Road",
    "city": "Hawthorne",
    "zip": "CA 90250",
    "country": "USA",
    "email": "info@spacex.com",
    "contact": "Elon M.",
    "phone": "+1 123 456 789",
    "note": "Orders rocket fuel every month."
  }
]
```

This endpoint searches for Organization's Clients.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/search-clients?term=:term`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |
| term **required** | String term to search for in Client properties. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| name | Name of company, client or other type of organization. |
| address | Street or similar address. |
| address2 | Address line 2. |
| city | City name. |
| zip | Zip / post code. |
| country | ISO 3166 county. |
| taxSubject | Specify if the Client is subject to tax. |
| taxNumber | String VAT / GST / etc. tax identification number. |
| companyNumber | String registration or similar identification number. |
| email | Email address of Client. _Used as recipient when sending documents in email._ |
| contact | Name of Client. |
| phone | Phone number of Client. |
| note | Text note about Client. |
