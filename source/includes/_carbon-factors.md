# Carbon Factors

Carbon Factors in SIERA indicate how much carbon is emitted per unit of energy. As an example, carbon emission factors for electricity meters allow SIERA to display a kgCO2 for a given kWh of consumption. 

SIERA provides default carbon factors which can be used in place of custom carbon factors. These default values were created by EVORA consultants, and can only be selected on meters. They cannot be changed or deleted. The default carbon factors are also purposefully valid from the beginning of 2021 until 2099. SIERA can contain multiple annual rates for each carbon factor. Each rate must have a valid date range over which the factor can be applied. The date ranges of each rate must not overlap, so that given a date a single factor can be chosen.

The default carbon factors are:

| Default name                                          | Meter Type       | Valid from | Valid to | Rate   |
| ----------------------------------------------------- | ---------------- | ---------- | -------- | ------ |
| EVORA default electricity carbon emission factor      | Electricity      | 1/1/2021   | 1/1/2099 | 0.2123 |
| EVORA default gas carbon emission factor              | Gas              | 1/1/2021   | 1/1/2099 | 0.184  |
| EVORA default district heating carbon emission factor | District Heating | 1/1/2021   | 1/1/2099 | 0.247  |
| EVORA default district cooling carbon emission factor | District Cooling | 1/1/2021   | 1/1/2099 | 0.247  |
| EVORA default oil carbon emission factor              | Oil              | 1/1/2021   | 1/1/2099 | 0.268  |
| EVORA default water carbon emission factor            | Water            | 1/1/2021   | 1/1/2099 | 0      |

## Get all carbon factors

```shell
```

> GET /api/v1/carbonfactors

```shell
curl https://api.sieraglobal.com/api/v1/carbonfactors \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
      "carbonFactorId": 1,
      "description": "EVORA default electricity carbon emission factor",
      "meterType": "Electricity",
      "tariffType": "LocationBased",    
      "isDefault": true,
      "carbonFactorRates": [
        {
          "carbonFactorRateId": 5,          
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.12
        }
      ]
    },
    {
      "carbonFactorId": 2,
      "description": "EVORA default gas carbon emission factor",
      "meterType": "Gas",
      "tariffType": "MarketBased",    
      "isDefault": true,
      "carbonFactorRates": [
        {
          "carbonFactorRateId": 6,          
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.12
        }
      ]
    }
]
```

**Summary:** Provides a list of all the carbon factors in the API caller's instance in SIERA, and the SIERA default carbon factors.

### HTTP Request 
`GET /api/v1/carbonfactors` 


**Response Body**

The response body will be a list of carbon factors in the API caller's instance, and the SIERA default carbon factors.

| Attribute                              | Type and description                                                                                                                            |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `carbonFactorId`                       | **integer**<br/>The SIERA-generated id of the carbon factor                                                                                     |
| `description`                          | **string**<br/>The name of the carbon factor                                                                                                    |
| `meterType`                            | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                                                              |
| `tariffType`                           | **enumeration**<br/>A valid tariff type of this factor, either market-based or location-based, from the (tariff type)[#tariff-type] enumeration |
| `isDefault`                            | **boolean**<br/>A boolean flag indicating if this factor is a SIERA default carbon factor or not                                                |
| `carbonFactorRates.carbonFactorRateId` | **integer**<br/>The SIERA-generated id of the rate                                                                                              |
| `carbonFactorRates.fromDate`           | **datetime**<br/>The start date the carbon factor rate is valid from                                                                            |
| `carbonFactorRates.toDate`             | **datetime**<br/>The date the carbon factor rate is valid until                                                                                 |
| `carbonFactorRates.rate`               | **float**<br/>The carbon factor rate value                                                                                                      |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new carbon factor

```shell
```

> POST /api/v1/carbonfactors

```shell
curl POST https://api.sieraglobal.com/api/v1/carbonfactors \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
      "description": "Custom German carbon emission factor",
      "meterType": "Electricity",
      "tariffType": "LocationBased",    
      "carbonFactorRates": [
        {
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.12
        }
      ]
    }
```

> Response (201)

**Summary:** Upload a new carbon factor

### HTTP Request 
`POST /api/v1/carbonfactors` 


**Request body**

| Attribute                    | Type and description                                                                                                                            |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `description`                | **string**<br/>The name of the carbon factor                                                                                                    |
| `meterType`                  | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                                                              |
| `tariffType`                 | **enumeration**<br/>A valid tariff type of this factor, either market-based or location-based, from the (tariff type)[#tariff-type] enumeration |
| `carbonFactorRates.fromDate` | **datetime**<br/>The start date the carbon factor rate is valid from                                                                            |
| `carbonFactorRates.toDate`   | **datetime**<br/>The date the carbon factor rate is valid until                                                                                 |
| `carbonFactorRates.rate`     | **float**<br/>The carbon factor rate value                                                                                                      |

**Responses**

| Code | Description                                                                        |
| ---- | ---------------------------------------------------------------------------------- |
| 201  | Created                                                                            |
| 400  | Validation failure, one or more of the enumerations were not correctly identified. |
| 500  | Server error                                                                       |


## Get a carbon factor

```shell
```

> GET /api/v1/carbonfactors/{carbonFactorId}

```shell
curl https://api.sieraglobal.com/api/v1/carbonfactors/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

{
  "carbonFactorId": 2,
  "description": "EVORA default gas carbon emission factor",
  "meterType": "Gas",
  "tariffType": "MarketBased",    
  "isDefault": true,
  "carbonFactorRates": [
    {
      "carbonFactorRateId": 6,          
      "fromDate": "2021-01-01T12:00:00.000Z",
      "toDate": "2099-01-01T12:00:00.000Z",
      "rate": 0.12
    }
  ]
}
```

**Summary:** Provides a single carbon factor given an ID

### HTTP Request 
`GET /api/v1/carbonfactors/{carbonFactorId}` 

**Parameters**

| Name           | Located in | Description                                   | Required | Type        |
| -------------- | ---------- | --------------------------------------------- | -------- | ----------- |
| carbonFactorId | path       | A valid id of a carbon factor stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will the specified carbon factor which matches the carbonFactorId given as a parameter.

| Attribute                              | Type and description                                                                                                                            |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `carbonFactorId`                       | **integer**<br/>The SIERA-generated id of the carbon factor                                                                                     |
| `description`                          | **string**<br/>The name of the carbon factor                                                                                                    |
| `meterType`                            | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                                                              |
| `tariffType`                           | **enumeration**<br/>A valid tariff type of this factor, either market-based or location-based, from the (tariff type)[#tariff-type] enumeration |
| `isDefault`                            | **boolean**<br/>A boolean flag indicating if this factor is a SIERA default carbon factor or not                                                |
| `carbonFactorRates.carbonFactorRateId` | **integer**<br/>The SIERA-generated id of the rate                                                                                              |
| `carbonFactorRates.fromDate`           | **datetime**<br/>The start date the carbon factor rate is valid from                                                                            |
| `carbonFactorRates.toDate`             | **datetime**<br/>The date the carbon factor rate is valid until                                                                                 |
| `carbonFactorRates.rate`               | **float**<br/>The carbon factor rate value                                                                                                      |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Update a carbon factor

```shell
```

> PUT /api/v1/carbonfactors/{carbonFactorId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/carbonfactors/11 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
      "description": "Custom France carbon emission factor",
      "meterType": "Electricity",
      "tariffType": "LocationBased",    
      "carbonFactorRates": [
        {
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.22
        }
      ]
    }
```

> Response (200)

**Summary:** Updates an existing carbon factor by ID

### HTTP Request 
`PUT /api/v1/carbonfactors/{carbonFactorId}` 

**Parameters**

| Name           | Located in | Description                                        | Required | Type        |
| -------------- | ---------- | -------------------------------------------------- | -------- | ----------- |
| carbonFactorId | path       | The id of the carbon factor to be updated in SIERA | Yes      | **integer** |

**Request body**

| Attribute                              | Type and description                                                                                                                            |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `carbonFactorId`                       | **integer**<br/>The id of the carbon factor                                                                                                     |
| `description`                          | **string**<br/>The name of the carbon factor                                                                                                    |
| `meterType`                            | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                                                              |
| `tariffType`                           | **enumeration**<br/>A valid tariff type of this factor, either market-based or location-based, from the (tariff type)[#tariff-type] enumeration |
| `carbonFactorRates.carbonFactorRateId` | **integer**<br/>The id of the rate                                                                                                              |
| `carbonFactorRates.fromDate`           | **datetime**<br/>The start date the carbon factor rate is valid from                                                                            |
| `carbonFactorRates.toDate`             | **datetime**<br/>The date the carbon factor rate is valid until                                                                                 |
| `carbonFactorRates.rate`               | **float**<br/>The carbon factor rate value                                                                                                      |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 201  | Created                                                                           |
| 400  | Validation failure, one or more of the enumerations were not correctly identified |
| 401  | Not found, the specified carbon factor id was not found                           |
| 500  | Server error                                                                      |

## Delete a carbon factor 

```shell
```

> DELETE /api/v1/carbonfactors/{carbonFactorId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/carbonfactors/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing carbon factor by ID

### HTTP Request 
`DELETE /api/v1/carbonfactors/{carbonFactorId}` 

**Parameters**

| Name           | Located in | Description                                        | Required | Type        |
| -------------- | ---------- | -------------------------------------------------- | -------- | ----------- |
| carbonFactorId | path       | The id of the carbon factor to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                             |
| ---- | ------------------------------------------------------- |
| 200  | Success                                                 |
| 401  | Not found, the specified carbon factor id was not found |
| 500  | Server error                                            |


## Upload a new carbon factor rate 

```shell
```

> POST /api/v1/carbonfactors/{carbonFactorId}/rates/

```shell
curl POST https://api.sieraglobal.com/api/v1/carbonfactors/11/rates \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "carbonFactorId": 11,
    "rate": 0.13,
    "fromDate": "2022-01-01T12:00:00.000Z",
    "toDate": "2099-01-01T12:00:00.000Z"          
  }
```

> Response (201)

**Summary:** Upload a new carbon factor rate

### HTTP Request 
`POST /api/v1/carbonfactors/{carbonFactorId}/rates` 


**Request body**

| Attribute        | Type and description                                   |
| ---------------- | ------------------------------------------------------ |
| `carbonFactorId` | **integer**<br/>The id of the parent carbon factor     |
| `rate`           | **float**<br/>The rate value                           |
| `fromDate`       | **datetime**<br/>The start date the rate is valid from |
| `toDate`         | **datetime**<br/>The date the rate is valid until      |

**Responses**

| Code | Description                                             |
| ---- | ------------------------------------------------------- |
| 201  | Created                                                 |
| 401  | Not found, the specified carbon factor id was not found |
| 500  | Server error                                            |


## Update a new carbon factor rate 

```shell
```

> PUT /api/v1/carbonfactors/{carbonFactorId}/rates/

```shell
curl PUT https://api.sieraglobal.com/api/v1/carbonfactors/11/rates/3 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "carbonFactorId": 11,
    "carbonFactorRateId": 3,
    "rate": 0.27,
    "fromDate": "2022-01-01T12:00:00.000Z",
    "toDate": "2099-01-01T12:00:00.000Z"          
  }
```

> Response (201)

**Summary:** Update a carbon factor rate

### HTTP Request 
`PUT /api/v1/carbonfactors/{carbonFactorId}/rates/{carbonFactorRateId}` 

**Parameters**

| Name               | Located in | Description                                                          | Required | Type        |
| ------------------ | ---------- | -------------------------------------------------------------------- | -------- | ----------- |
| carbonFactorId     | path       | The parent id of the carbon factor of the rate to be update in SIERA | Yes      | **integer** |
| carbonFactorRateId | path       | The id of the rate to be updated in SIERA                            | Yes      | **integer** |

**Request body**

| Attribute            | Type and description                                   |
| -------------------- | ------------------------------------------------------ |
| `carbonFactorId`     | **integer**<br/>The id of the parent carbon factor     |
| `carbonFactorRateId` | **integer**<br/>The id of the rate                     |
| `rate`               | **float**<br/>The rate value                           |
| `fromDate`           | **datetime**<br/>The start date the rate is valid from |
| `toDate`             | **datetime**<br/>The date the rate is valid until      |

**Responses**

| Code | Description                                             |
| ---- | ------------------------------------------------------- |
| 200  | Success                                                 |
| 401  | Not found, the specified carbon factor id was not found |
| 500  | Server error                                            |


## Delete a carbon factor rate

```shell
```

> DELETE /api/v1/carbonfactors/{carbonFactorId}/rates/{carbonFactorRateId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/carbonfactors/11/rates/3 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing carbon factor by ID

### HTTP Request 
`DELETE /api/v1/carbonfactors/{carbonFactorId}/rates/{carbonFactorRateId}` 

**Parameters**

| Name               | Located in | Description                                                           | Required | Type        |
| ------------------ | ---------- | --------------------------------------------------------------------- | -------- | ----------- |
| carbonFactorId     | path       | The parent id of the carbon factor of the rate to be deleted in SIERA | Yes      | **integer** |
| carbonFactorRateId | path       | The id of the carbon factor rate to be deleted in SIERA               | Yes      | **integer** |

**Responses**

| Code | Description                                             |
| ---- | ------------------------------------------------------- |
| 200  | Success                                                 |
| 401  | Not found, the specified carbon factor id was not found |
| 500  | Server error                                            |