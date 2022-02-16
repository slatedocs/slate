# Unit Rates

Unit rates in SIERA indicate how much a unit of energy costs in financial terms. As an example, unit rates for electricity meters allow SIERA to display a cost for a given kWh of consumption. It's important to bear in mind that unit rates only provide a rough estimation of the cost. When calculating actual costs, per-minute unit rates are used which vary throughout the day. SIERA simply applies a single factor for all consumption on a meter, irrespective of time.

SIERA provides default unit rates which can be used in place of custom unit rates. These default values were created by EVORA consultants, and can only be selected on meters. They cannot be changed or deleted. The default rates are also purposefully valid from the beginning of 2021 until 2099. SIERA can contain multiple annual rates for each unit rate. Each rate must have a valid date range over which the rate can be applied. The date ranges of each rate must not overlap, so that given a date a single rate can be chosen.

The default unit rates are:

| Default name                          | Currency | Units | Valid from | Valid to | Rate |
| ------------------------------------- | -------- | ----- | ---------- | -------- | ---- |
| EVORA standard electricity rate (GBP) | GBP      | kWh   | 1/1/2021   | 1/1/2099 | 0.12 |
| EVORA standard fuel rate (GBP)        | GBP      | kWh   | 1/1/2021   | 1/1/2099 | 0.03 |
| EVORA standard water rate (GBP)       | GBP      | kWh   | 1/1/2021   | 1/1/2099 | 2.1  |
| EVORA standard electricity rate (USD) | USD      | kWh   | 1/1/2021   | 1/1/2099 | 0.15 |
| EVORA standard fuel rate (USD)        | USD      | kWh   | 1/1/2021   | 1/1/2099 | 0.4  |
| EVORA standard water rate (USD)       | USD      | kWh   | 1/1/2021   | 1/1/2099 | 3    |
| EVORA standard electricity rate (EUR) | EUR      | kWh   | 1/1/2021   | 1/1/2099 | 0.22 |
| EVORA standard fuel rate (EUR)        | EUR      | kWh   | 1/1/2021   | 1/1/2099 | 0.05 |
| EVORA standard water rate (EUR)       | EUR      | kWh   | 1/1/2021   | 1/1/2099 | 3.75 |

## Get all unit rates

```shell
```

> GET /api/v1/unitrates

```shell
curl https://api.sieraglobal.com/api/v1/unitrates \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
    "unitRateID": 1,
    "description": "EVORA standard electricity rate (GBP)",
    "currency": "BritishPound",
    "unit": "kWh",
    "meterType": "Electricity",
    "rates": [
        {
          "rateID": 1,
          "unitRateID": 1,
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.12
        }
      ]
    },
    {
    "unitRateID": 2,
    "description": "EVORA standard fuel rate (GBP)",
    "currency": "BritishPound",
    "unit": "kWh",
    "meterType": null,
    "rates": [
        {
          "rateID": 2,
          "unitRateID": 2,
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.03
        }
      ]
    }
]
```

**Summary:** Provides a list of all the unit rates in the API caller's instance in SIERA, and the SIERA default unit rates.

### HTTP Request 
`GET /api/v1/unitrates` 


**Response Body**

The response body will be a list of unit rates in the API caller's instance, and the SIERA default unit rates.

| Attribute          | Type and description                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `unitRateID`       | **integer**<br/>The SIERA-generated id of the unit rate                                                          |
| `description`      | **string**<br/>The name of the unit rate                                                                         |
| `currency`         | **enumeration**<br/>The currency used for reporting in the unit rate, from the [currency](#currency) enumeration |
| `unit`             | **string**<br/>The units of energy the rate relates to                                                           |
| `meterType`        | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                               |
| `rates.rateID`     | **integer**<br/>The SIERA-generated id of the rate                                                               |
| `rates.unitRateID` | **integer**<br/>The id of the parent unit rate                                                                   |
| `rates.fromDate`   | **datetime**<br/>The start date the rate is valid from                                                           |
| `rates.toDate`     | **datetime**<br/>The date the rate is valid until                                                                |
| `rates.rate`       | **float**<br/>The rate value                                                                                     |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new unit rate

```shell
```

> POST /api/v1/unitrates

```shell
curl POST https://api.sieraglobal.com/api/v1/unitrates \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "description": "Custom electricity rate",
    "currency": "BritishPound",
    "unit": "kWh",
    "meterType": "Electricity",
    "rates": [
      {
        "rate": 0.12,
        "fromDate": "2021-01-01T12:00:00.000Z",
        "toDate": "2099-01-01T12:00:00.000Z"          
      }
    ]
  }
```

> Response (201)

**Summary:** Upload a new unit rate

### HTTP Request 
`POST /api/v1/unitrates` 


**Request body**

| Attribute        | Type and description                                                                                             |
| ---------------- | ---------------------------------------------------------------------------------------------------------------- |
| `description`    | **string**<br/>The name of the unit rate                                                                         |
| `currency`       | **enumeration**<br/>The currency used for reporting in the unit rate, from the [currency](#currency) enumeration |
| `unit`           | **string**<br/>The units of energy the rate relates to                                                           |
| `meterType`      | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                               |
| `rates.rate`     | **float**<br/>The rate value                                                                                     |
| `rates.fromDate` | **datetime**<br/>The start date the rate is valid from                                                           |
| `rates.toDate`   | **datetime**<br/>The date the rate is valid until                                                                |

**Responses**

| Code | Description                                                                        |
| ---- | ---------------------------------------------------------------------------------- |
| 201  | Created                                                                            |
| 400  | Validation failure, one or more of the enumerations were not correctly identified. |
| 500  | Server error                                                                       |


## Get a unit rate

```shell
```

> GET /api/v1/unitrates/{unitRateId}

```shell
curl https://api.sieraglobal.com/api/v1/unitrates/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

{
    "unitRateID": 2,
    "description": "EVORA standard fuel rate (GBP)",
    "currency": "BritishPound",
    "unit": "kWh",
    "meterType": null,
    "rates": [
        {
          "rateID": 2,
          "unitRateID": 2,
          "fromDate": "2021-01-01T12:00:00.000Z",
          "toDate": "2099-01-01T12:00:00.000Z",
          "rate": 0.03
        }
      ]
    }
```

**Summary:** Provides a single unit rate given an ID

### HTTP Request 
`GET /api/v1/unitrates/{unitRateId}` 

**Parameters**

| Name       | Located in | Description                               | Required | Type        |
| ---------- | ---------- | ----------------------------------------- | -------- | ----------- |
| unitRateId | path       | A valid id of a unit rate stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will the specified unit rate which matches the unitRateId given as a parameter.

| Attribute          | Type and description                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `unitRateID`       | **integer**<br/>The SIERA-generated id of the unit rate                                                          |
| `description`      | **string**<br/>The name of the unit rate                                                                         |
| `currency`         | **enumeration**<br/>The currency used for reporting in the unit rate, from the [currency](#currency) enumeration |
| `unit`             | **string**<br/>The units of energy the rate relates to                                                           |
| `meterType`        | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                               |
| `rates.rateID`     | **integer**<br/>The SIERA-generated id of the rate                                                               |
| `rates.unitRateID` | **integer**<br/>The id of the parent unit rate                                                                   |
| `rates.fromDate`   | **datetime**<br/>The start date the rate is valid from                                                           |
| `rates.toDate`     | **datetime**<br/>The date the rate is valid until                                                                |
| `rates.rate`       | **float**<br/>The rate value                                                                                     |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Update a unit rate

```shell
```

> PUT /api/v1/unitrates/{unitRateId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/unitrates/11 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
    "unitRateID": 11,
    "description": "Custom electricity rate",
    "currency": "BritishPound",
    "unit": "kWh",
    "meterType": "Electricity",
    "rates": [
      {
        "unitRateID": 11,
        "rateID": 2,        
        "rate": 0.12,
        "fromDate": "2021-01-01T12:00:00.000Z",
        "toDate": "2099-01-01T12:00:00.000Z"          
      }
    ]
  }
```

> Response (200)

**Summary:** Updates an existing unit rate by ID

### HTTP Request 
`PUT /api/v1/unitrates/{unitRateId}` 

**Parameters**

| Name       | Located in | Description                                    | Required | Type        |
| ---------- | ---------- | ---------------------------------------------- | -------- | ----------- |
| unitRateId | path       | The id of the unit rate to be updated in SIERA | Yes      | **integer** |

**Request body**

| Attribute          | Type and description                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `unitRateID`       | **integer**<br/>The id of the unit rate to be updated                                                            |
| `description`      | **string**<br/>The name of the unit rate                                                                         |
| `currency`         | **enumeration**<br/>The currency used for reporting in the unit rate, from the [currency](#currency) enumeration |
| `unit`             | **string**<br/>The units of energy the rate relates to                                                           |
| `meterType`        | **enumeration**<br/>A valid utility from the [meter type](#meter-type) enumeration                               |
| `rates.rateID`     | **integer**<br/>The id of the rate to be updated                                                                 |
| `rates.unitRateID` | **integer**<br/>The id of the parent unit rate                                                                   |
| `rates.fromDate`   | **datetime**<br/>The start date the rate is valid from                                                           |
| `rates.toDate`     | **datetime**<br/>The date the rate is valid until                                                                |
| `rates.rate`       | **float**<br/>The rate value                                                                                     |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 200  | Success                                                                           |
| 400  | Validation failure, one or more of the enumerations were not correctly identified |
| 401  | Not found, the specified unit rate id was not found                               |
| 500  | Server error                                                                      |

## Delete a unit rate 

```shell
```

> DELETE /api/v1/unitrates/{unitRateId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/unitrates/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing unit rate by ID

### HTTP Request 
`DELETE /api/v1/unitrates/{unitRateId}` 

**Parameters**

| Name       | Located in | Description                                    | Required | Type        |
| ---------- | ---------- | ---------------------------------------------- | -------- | ----------- |
| unitRateId | path       | The id of the unit rate to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                         |
| ---- | --------------------------------------------------- |
| 200  | Success                                             |
| 401  | Not found, the specified unit rate id was not found |
| 500  | Server error                                        |


## Upload a new rate 

```shell
```

> POST /api/v1/unitrates/{unitRateId}/rates/

```shell
curl POST https://api.sieraglobal.com/api/v1/unitrates/11/rates \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "unitRateID": 11,
    "rate": 0.13,
    "fromDate": "2022-01-01T12:00:00.000Z",
    "toDate": "2099-01-01T12:00:00.000Z"          
  }
```

> Response (201)

**Summary:** Upload a new rate

### HTTP Request 
`POST /api/v1/unitrates/{unitRateId}/rates` 


**Request body**

| Attribute    | Type and description                                   |
| ------------ | ------------------------------------------------------ |
| `unitRateID` | **integer**<br/>The id of the parent unit rate         |
| `rate`       | **float**<br/>The rate value                           |
| `fromDate`   | **datetime**<br/>The start date the rate is valid from |
| `toDate`     | **datetime**<br/>The date the rate is valid until      |

**Responses**

| Code | Description                                         |
| ---- | --------------------------------------------------- |
| 201  | Created                                             |
| 401  | Not found, the specified unit rate id was not found |
| 500  | Server error                                        |


## Update a rate 

```shell
```

> PUT /api/v1/unitrates/{unitRateId}/rates/

```shell
curl PUT https://api.sieraglobal.com/api/v1/unitrates/11/rates/3 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "unitRateID": 11,
    "rateID": 3,
    "rate": 0.27,
    "fromDate": "2022-01-01T12:00:00.000Z",
    "toDate": "2099-01-01T12:00:00.000Z"          
  }
```

> Response (201)

**Summary:** Update a rate

### HTTP Request 
`PUT /api/v1/unitrates/{unitRateId}/rates/{rateId}` 

**Parameters**

| Name       | Located in | Description                                                      | Required | Type        |
| ---------- | ---------- | ---------------------------------------------------------------- | -------- | ----------- |
| unitRateId | path       | The parent id of the unit rate of the rate to be update in SIERA | Yes      | **integer** |
| rateId     | path       | The id of the rate to be updated in SIERA                        | Yes      | **integer** |

**Request body**

| Attribute    | Type and description                                   |
| ------------ | ------------------------------------------------------ |
| `unitRateID` | **integer**<br/>The id of the parent unit rate         |
| `rateID`     | **integer**<br/>The id of the rate                     |
| `rate`       | **float**<br/>The rate value                           |
| `fromDate`   | **datetime**<br/>The start date the rate is valid from |
| `toDate`     | **datetime**<br/>The date the rate is valid until      |

**Responses**

| Code | Description                                         |
| ---- | --------------------------------------------------- |
| 200  | Success                                             |
| 401  | Not found, the specified unit rate id was not found |
| 500  | Server error                                        |


## Delete a rate 

```shell
```

> DELETE /api/v1/unitrates/{unitRateId}/rates/{rateId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/unitrates/11/rates/3 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing unit rate by ID

### HTTP Request 
`DELETE /api/v1/unitrates/{unitRateId}/rates/{rateId}` 

**Parameters**

| Name       | Located in | Description                                                       | Required | Type        |
| ---------- | ---------- | ----------------------------------------------------------------- | -------- | ----------- |
| unitRateId | path       | The parent id of the unit rate of the rate to be deleted in SIERA | Yes      | **integer** |
| rateId     | path       | The id of the rate to be deleted in SIERA                         | Yes      | **integer** |

**Responses**

| Code | Description                                         |
| ---- | --------------------------------------------------- |
| 200  | Success                                             |
| 401  | Not found, the specified unit rate id was not found |
| 500  | Server error                                        |