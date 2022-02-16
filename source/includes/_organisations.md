# Organisations

The Organisations endpoints allow you to create and manage organisations to associated with assets in SIERA. You can upload new organisations, update organisations or delete them from a given instance in SIERA.

<aside class="notice">
Be careful to not delete organisations which are associated with funds.
</aside>

## Get all organisations

```shell
```

> GET /api/v1/organisations

```shell
curl https://api.sieraglobal.com/api/v1/organisations \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
    "organisationId": 1,
    "organisationName": "TPG Financial Services",
    "reportingCurrency": "GBP",
    "gresbMeasurement": "M2",
    "yearStart": 1
  },
  {
    "organisationId": 2,
    "organisationName": "Colias",
    "reportingCurrency": "GBP",
    "gresbMeasurement": "FT2",
    "yearStart": 4
  },
  {
    "organisationId": 3,
    "organisationName": "Sakitai",
    "reportingCurrency": "GBP",
    "gresbMeasurement": "M2",
    "yearStart": 1
  }
]
```

**Summary:** Provides a list of all the organisations in the API caller's instance in SIERA.

### HTTP Request 
`GET /api/v1/organisations` 


**Response Body**

The response body will be a list of organisations in the API caller's instance.

| Attribute           | Type and description                                                                                                                                  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organisationId`    | **integer**<br/>The SIERA-generated id of the organisation                                                                                            |
| `organisationName`  | **string**<br/>The name of the organisation                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the organisation                                                               |
| `gresbMeasurement`  | **string**<br/>The floor area measurement unit used in the organisation, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the organisation, 1 for a calendar start (January), 4 for financial year start (April) |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new organisation

```shell
```

> POST /api/v1/organisations

```shell
curl POST https://api.sieraglobal.com/api/v1/organisations \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "organisationName": "PL Green organisation",
    "reportingCurrency": "GBP",
    "gresbMeasurement": "M2",
    "yearStart": 4,
  }
```

> Response (201)

**Summary:** Upload a new organisation

### HTTP Request 
`POST /api/v1/organisations` 


**Request body**

| Attribute           | Type and description                                                                                                                                  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organisationName`  | **string**<br/>The name of the organisation                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the organisation                                                               |
| `gresbMeasurement`  | **string**<br/>The floor area measurement unit used in the organisation, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the organisation, 1 for a calendar start (January), 4 for financial year start (April) |

**Responses**

| Code | Description                                                                                        |
| ---- | -------------------------------------------------------------------------------------------------- |
| 201  | Created                                                                                            |
| 401  | Not found, the specified asset or unit id does not exist in the caller's instance or was not found |
| 500  | Server error                                                                                       |


## Get a organisation

```shell
```

> GET /api/v1/organisations

```shell
curl https://api.sieraglobal.com/api/v1/organisations/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
{
  "organisationId": 3,
  "organisationName": "Sakitai",
  "reportingCurrency": "GBP",
  "gresbMeasurement": "M2",
  "yearStart": 1
}
```

**Summary:** Provides a single organisation given an ID

### HTTP Request 
`GET /api/v1/organisations/{organisationId}` 

**Paraorganisations**

| Name           | Located in | Description                                  | Required | Type        |
| -------------- | ---------- | -------------------------------------------- | -------- | ----------- |
| organisationId | path       | A valid id of a organisation stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will the specified organisation which matches the organisationId given as a parameter.


| Attribute           | Type and description                                                                                                                                  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organisationId`    | **integer**<br/>The SIERA-generated id of the organisation                                                                                            |
| `organisationName`  | **string**<br/>The name of the organisation                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the organisation                                                               |
| `gresbMeasurement`  | **string**<br/>The floor area measurement unit used in the organisation, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the organisation, 1 for a calendar start (January), 4 for financial year start (April) |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Update a organisation

```shell
```

> PUT /api/v1/organisations/{organisationId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/organisations/3 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
    "organisationName": "PL Green organisation",
    "reportingCurrency": "GBP",
    "gresbMeasurement": "FT2",
    "yearStart": 4
  }
```

> Response (200)

**Summary:** Updates an existing organisation by ID

### HTTP Request 
`PUT /api/v1/organisations/{organisationId}` 

**Paraorganisations**

| Name           | Located in | Description                                       | Required | Type        |
| -------------- | ---------- | ------------------------------------------------- | -------- | ----------- |
| organisationId | path       | The id of the organisation to be updated in SIERA | Yes      | **integer** |

**Request body**

| Attribute           | Type and description                                                                                                                                  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organisationId`    | **integer**<br/>The SIERA-generated id of the organisation                                                                                            |
| `organisationName`  | **string**<br/>The name of the organisation                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the organisation                                                               |
| `gresbMeasurement`  | **string**<br/>The floor area measurement unit used in the organisation, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the organisation, 1 for a calendar start (January), 4 for financial year start (April) |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 201  | Created                                                                           |
| 401  | Not found, the specified organisation id was not found                            |
| 500  | Server error                                                                      |

## Delete a organisation 

```shell
```

> DELETE /api/v1/organisations/{organisationId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/organisations/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing organisation by ID

### HTTP Request 
`DELETE /api/v1/organisation/{organisationId}` 

**Paraorganisations**

| Name           | Located in | Description                                       | Required | Type        |
| -------------- | ---------- | ------------------------------------------------- | -------- | ----------- |
| organisationId | path       | The id of the organisation to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                            |
| ---- | ------------------------------------------------------ |
| 200  | Success                                                |
| 401  | Not found, the specified organisation id was not found |
| 500  | Server error                                           |