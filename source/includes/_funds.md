# Funds

The Funds endpoints allow you to create and manage funds to associated with assets in SIERA. You can upload new funds, update funds or delete them from a given instance in SIERA. Note that a fund must be associated with an [organisation](#organisations) and can't exist on its own.

## Get all funds

```shell
```

> GET /api/v1/funds

```shell
curl https://api.sieraglobal.com/api/v1/funds \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
    "fundId": 1,
    "fundName": "TG Pension Fund",
    "reportingCurrency": "GBP",
    "reportingUnit": "M2",
    "yearStart": 4,
    "organisationId": 3
  },
  {
    "fundId": 2,
    "fundName": "TF Sustainable Fund",
    "reportingCurrency": "GBP",
    "reportingUnit": "M2",
    "yearStart": 4,
    "organisationId": 3
  }
]
```

**Summary:** Provides a list of all the funds in the API caller's instance in SIERA.

### HTTP Request 
`GET /api/v1/funds` 


**Response Body**

The response body will be a list of funds in the API caller's instance.

| Attribute           | Type and description                                                                                                                          |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `fundId`            | **integer**<br/>The SIERA-generated id of the fund                                                                                            |
| `fundName`          | **string**<br/>The name of the fund                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the fund                                                               |
| `reportingUnit`     | **string**<br/>The floor area measurement unit used in the fund, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the fund, 1 for a calendar start (January), 4 for financial year start (April) |
| `organisationId`    | **integer**<br/>The id of the associated [organisation](#organisations)                                                                       |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new fund

```shell
```

> POST /api/v1/funds

```shell
curl POST https://api.sieraglobal.com/api/v1/assets \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "fundName": "PL Green Fund",
    "reportingCurrency": "GBP",
    "reportingUnit": "M2",
    "yearStart": 1,
    "organisationId": 3
  }
```

> Response (201)

**Summary:** Upload a new fund

### HTTP Request 
`POST /api/v1/funds` 


**Request body**

| Attribute           | Type and description                                                                                                                          |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `fundId`            | **integer**<br/>The SIERA-generated id of the fund                                                                                            |
| `fundName`          | **string**<br/>The name of the fund                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the fund                                                               |
| `reportingUnit`     | **string**<br/>The floor area measurement unit used in the fund, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the fund, 1 for a calendar start (January), 4 for financial year start (April) |
| `organisationId`    | **integer**<br/>The id of the associated [organisation](#organisations)                                                                       |

**Responses**

| Code | Description                                                                                        |
| ---- | -------------------------------------------------------------------------------------------------- |
| 201  | Created                                                                                            |
| 400  | Validation failure, one or more of the enumerations were not correctly identified.                 |
| 401  | Not found, the specified asset or unit id does not exist in the caller's instance or was not found |
| 500  | Server error                                                                                       |


## Get a fund

```shell
```

> GET /api/v1/funds/{fundId}

```shell
curl https://api.sieraglobal.com/api/v1/funds/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

{
  "fundId": 2,
  "fundName": "TF Sustainable Fund",
  "reportingCurrency": "GBP",
  "reportingUnit": "M2",
  "yearStart": 1,
  "organisationId": 3
}
```

**Summary:** Provides a single fund given an ID

### HTTP Request 
`GET /api/v1/funds/{fundId}` 

**Parafunds**

| Name   | Located in | Description                          | Required | Type        |
| ------ | ---------- | ------------------------------------ | -------- | ----------- |
| fundId | path       | A valid id of a fund stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will the specified fund which matches the fundId given as a parameter.


| Attribute           | Type and description                                                                                                                          |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `fundId`            | **integer**<br/>The SIERA-generated id of the fund                                                                                            |
| `fundName`          | **string**<br/>The name of the fund                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the fund                                                               |
| `reportingUnit`     | **string**<br/>The floor area measurement unit used in the fund, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the fund, 1 for a calendar start (January), 4 for financial year start (April) |
| `organisationId`    | **integer**<br/>The id of the associated [organisation](#organisations)                                                                       |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Update a fund

```shell
```

> PUT /api/v1/funds/{fundId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/funds/11 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
    "fundId": 2
    "fundName": "TF Sustainable Green Fund",
    "reportingCurrency": "GBP",
    "reportingUnit": "FT2",
    "yearStart": 1,
    "organisationId": 3
  }
```

> Response (200)

**Summary:** Updates an existing fund by ID

### HTTP Request 
`PUT /api/v1/funds/{fundId}` 

**Parafunds**

| Name   | Located in | Description                               | Required | Type        |
| ------ | ---------- | ----------------------------------------- | -------- | ----------- |
| fundId | path       | The id of the fund to be updated in SIERA | Yes      | **integer** |

**Request body**

| Attribute           | Type and description                                                                                                                          |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `fundId`            | **integer**<br/>The SIERA-generated id of the fund                                                                                            |
| `fundName`          | **string**<br/>The name of the fund                                                                                                           |
| `reportingCurrency` | **string**<br/>The 3-letter code of the currency used for reporting in the fund                                                               |
| `reportingUnit`     | **string**<br/>The floor area measurement unit used in the fund, M2 or FT2                                                                    |
| `yearStart`         | **integer**<br/>The month considered the start of the year for the fund, 1 for a calendar start (January), 4 for financial year start (April) |
| `organisationId`    | **integer**<br/>The id of the associated [organisation](#organisations)                                                                       |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 201  | Created                                                                           |
| 400  | Validation failure, one or more of the enumerations were not correctly identified |
| 401  | Not found, the specified fund id was not found                                    |
| 500  | Server error                                                                      |

## Delete a fund 

```shell
```

> DELETE /api/v1/funds/{fundId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/funds/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing fund by ID

### HTTP Request 
`DELETE /api/v1/funds/{fundId}` 

**Parafunds**

| Name   | Located in | Description                               | Required | Type        |
| ------ | ---------- | ----------------------------------------- | -------- | ----------- |
| fundId | path       | The id of the fund to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                    |
| ---- | ---------------------------------------------- |
| 200  | Success                                        |
| 401  | Not found, the specified fund id was not found |
| 500  | Server error                                   |