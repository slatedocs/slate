# EPCs

[Energy Performance Certificates (EPCs)](https://en.wikipedia.org/wiki/Energy_performance_certificate) exist in SIERA in 2 forms:  
1. the list of EPC schemes and their ratings which are defined in a SIERA instance  
2. the record of an EPC rating given to an asset or asset unit for a given EPC scheme.  

The EPC endpoints allow a user to upload the record of an EPC for an asset and define any EPC scheme along with the rating bands it uses. This way, SIERA can accomodate any kind of EPC.

The EPC endpoints allow a user to upload the record of an EPC for an asset or asset unit whcih can be stored by referencing an EPC scheme which exists in the API caller's SIERA instance. When recording asset or unit EPCs, it's important to record the floor area they relate to. Many areas use the floor area of EPCs on asset units, to calculate an aggregated weighted average for unit EPCs to produce an overall asset rating.

## Get all EPC records

```shell
```

> GET /api/v1/epcs

```shell
curl https://api.sieraglobal.com/api/v1/epcs \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
    "id": 12,
    "assetId": 3,
    "rating": "A",
    "certificateReferenceNumber": "EPC1",
    "score": 10,
    "date": "2021-12-22T09:14:12.784Z",
    "expiry": "2021-12-22T09:14:12.784Z",
    "scheme": {
      "id": 1,
      "description": "EVORA standard EPC scheme",
      "invertedScoring": false,
      "ratings": [
        {
            "id": 1,
            "schemeId": 1,
            "rating": "A+",
            "from": 0,
            "to": 29
        },
        {
            "id": 2,
            "schemeId": 1,
            "rating": "A",
            "from": 30,
            "to": 49
        }
        ...
        {
            "id": 8,
            "schemeId": 1,
            "rating": "G",
            "from": 200,
            "to": 999
        }
      ],
      "isDefault": true
    },
    "scope": "Unit",
    "unit": {
      "unitId": 12,
      "unitName": "Unit A",
      "unitReference": "TAC-234",
      "occupier": "Pets At Home",
      "actionNotes": "",
      "gia": 1100,
      "nla": 900,
      "measurementUnit": "M2",
      "vacant": false,
      "leaseStart": "2020-12-17T12:00:00.000Z",
      "leaseLength": 24,
      "leaseExpiry": "2022-12-17T12:00:00.000Z",
      "leaseBreak": "",
      "erv": 1200,
      "fri": false,
      "epcExempt": false
    },
    "comment": "[2021-11-09] I'm a comment!"
  },
  {
    "id": 13,
    "assetId": 4,
    "rating": "A",
    "certificateReferenceNumber": "EPC2",
    "score": 15,
    "date": "2021-12-22T09:14:12.784Z",
    "expiry": "2021-12-22T09:14:12.784Z",
    "scheme": {
      "id": 1,
      "description": "EVORA standard EPC scheme",
      "invertedScoring": false,
      "ratings": [
        {
            "id": 1,
            "schemeId": 1,
            "rating": "A+",
            "from": 0,
            "to": 29
        },
        {
            "id": 2,
            "schemeId": 1,
            "rating": "A",
            "from": 30,
            "to": 49
        }
        ...
        {
            "id": 8,
            "schemeId": 1,
            "rating": "G",
            "from": 200,
            "to": 999
        }
      ],
      "isDefault": true
    },
    "scope": "WholeBuilding",
    "unit": null,
    "comment": "[2021-11-09] I'm a comment!"
  }
]
```

**Summary:** Provides a list of all the EPC records in the API caller's instance in SIERA.

### HTTP Request 
`GET /api/v1/epcs` 

**Response Body**

The response body will be a list of all the EPC records in the API caller's instance in SIERA.

| Attribute                    | Type and description                                                                                                                                          |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                         | **integer**<br/>The SIERA-generated id of the EPC record                                                                                                      |
| `assetId`                    | **integer**<br/>The id of the asset this EPC record relates to                                                                                                |
| `rating`                     | **string**<br/>A rating generated from the EPC scheme the EPC record relates to                                                                               |
| `certificateReferenceNumber` | **string**<br/>The certificate reference number of the EPC if one is available                                                                                |
| `score`                      | **integer**<br/>The score achieved of the EPC record                                                                                                          |
| `date`                       | **datetime**<br/>The date of the EPC certificate                                                                                                              |
| `expiry`                     | **datetime**<br/>The expiry date of the EPC certificate stored in SIERA                                                                                       |
| `scheme.id`                  | **integer**<br/>The SIERA-generated id of the EPC scheme                                                                                                      |
| `scheme.description`         | **string**<br/>The name of the related EPC scheme                                                                                                             |
| `scheme.invertedScoring`     | **boolean**<br/>A boolean flag indicating if the scoring of the scheme considers 0 the lowest rating or the highest; true if 0 is the lowest, false otherwise |
| `scheme.isDefault`           | **enumeration**<br/>A boolean flag indicating if a scheme is a SIERA default scheme or not                                                                    |
| `scheme.ratings.id`          | **integer**<br/>The SIERA-generated id of an EPC scheme rating                                                                                                |
| `scheme.ratings.schemeId`    | **integer**<br/>The id of the parent EPC ccheme                                                                                                               |
| `scheme.ratings.rating`      | **datetime**<br/>The letter given to an EPC scheme rating                                                                                                     |
| `scheme.ratings.from`        | **datetime**<br/>The lower bound value of an EPC scheme rating                                                                                                |
| `scheme.ratings.to`          | **float**<br/>The upper bound value of an EPC scheme rating                                                                                                   |
| `scope`                      | **enumeration**<br/>Indicates if the EPC is related to a unit or whole building. Must be a valid item from the [EPC scope](#epc-scope) enumeration |
| `unit.unitId`                | **integer**<br/>The SIERA-generated id of the asset unit |
| `unit.unitName`              | **string**<br/>The name of the asset unit |
| `unit.unitReference`         | **string**<br/>The asset unit reference |
| `unit.occupier`              | **string**<br/>The name of the current occupier of the unit |
| `unit.gia`                   | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `unit.nla`                   | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `unit.measurementUnit`       | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `unit.leaseStart`            | **datetime**<br/>The start date of the tenant of this unit's lease |
| `unit.leaseLength`           | **integer**<br/>The length in months of the tenant of this unit's lease |
| `unit.leaseExpiry`           | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `unit.leaseBreak`            | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `unit.erv`                   | **float**<br/>The estimated rental value (ERV) of this unit |
| `unit.fri`                   | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `unit.epcExempt`             | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |
| `comment`                    | **string**<br/>The latest comment that has been recorded on the EPC record |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Upload a new EPC record

```shell
```

> POST /api/v1/epcs

```shell
curl POST https://api.sieraglobal.com/api/v1/epcs \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "assetId": 4,   
    "certificateReferenceNumber": "EPC3",
    "score": 17,
    "date": "2021-12-22T09:14:12.784Z",
    "schemeId": 2,
    "scope": "WholeBuilding",
    "unitId": null
  }
```

> Response (201)

**Summary:** Upload a new EPC record

### HTTP Request 
`POST /api/v1/epc` 


**Request body**

| Attribute                    | Type and description                                                           |
| ---------------------------- | ------------------------------------------------------------------------------ |
| `assetId`                    | **integer**<br/>The id of the asset this EPC record relates to                 |
| `certificateReferenceNumber` | **string**<br/>The certificate reference number of the EPC if one is available |
| `score`                      | **integer**<br/>The score achieved of the EPC record                           |
| `date`                       | **datetime**<br/>The date of the EPC certificate                               |
| `schemeId`                   | **integer**<br/>The ID of the related scheme                         |
| `scope`                      | **enumeration**<br/>Indicates if the EPC is related to a unit or whole building. Must be a valid item from the [EPC scope](#epc-scope) enumeration                               |
| `unitId`                     | **integer**<br/>The ID of the related unit. This is mandatory when scope is set to "Unit"     |


**Responses**

| Code | Description  |
| ---- | ------------ |
| 201  | Created      |
| 500  | Server error |

## Update an EPC record

```shell
```

> PUT /api/v1/epcs

```shell
curl PUT https://api.sieraglobal.com/api/v1/epcs \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
    "id": 13
    "assetId": 4,   
    "certificateReferenceNumber": "EPC12",
    "score": 20,
    "date": "2021-11-07T08:11:23.813Z",
    "schemeId": 2,
    "scope": "Unit",
    "unitId": 43
  }
```

> Response (200)

**Summary:** Updates an existing EPC scheme by ID

### HTTP Request 
`PUT /api/v1/epcs/schemes`

**Request body**

| Attribute                    | Type and description                                                           |
| ---------------------------- | ------------------------------------------------------------------------------ |
| `id`                         | **integer**<br/>The id of EPC record to be updated                             |
| `assetId`                    | **integer**<br/>The id of the asset this EPC record relates to                 |
| `certificateReferenceNumber` | **string**<br/>The certificate reference number of the EPC if one is available |
| `score`                      | **integer**<br/>The score achieved of the EPC record                           |
| `date`                       | **datetime**<br/>The date of the EPC certificate                               |
| `schemeId`                   | **integer**<br/>The ID of the related scheme                         |
| `scope`                      | **enumeration**<br/>Indicates if the EPC is related to a unit or whole building. Must be a valid item from the [EPC scope](#epc-scope) enumeration                               |
| `unitId`                     | **integer**<br/>The ID of the related unit. This is mandatory when scope is set to "Unit"     |

**Responses**

| Code | Description                                          |
| ---- | ---------------------------------------------------- |
| 200  | Success                                              |
| 401  | Not found, the specified EPC record id was not found |
| 500  | Server error                                         |

## Get an EPC record

```shell
curl https://api.sieraglobal.com/api/v1/epcs/12 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

{
    "id": 12,
    "assetId": 3,
    "rating": "A",
    "certificateReferenceNumber": "EPC1",
    "score": 10,
    "date": "2021-12-22T09:14:12.784Z",
    "expiry": "2021-12-22T09:14:12.784Z",
    "scheme": {
      "id": 1,
      "description": "EVORA standard EPC scheme",
      "invertedScoring": false,
      "ratings": [
        {
            "id": 1,
            "schemeId": 1,
            "rating": "A+",
            "from": 0,
            "to": 29
        },
        {
            "id": 2,
            "schemeId": 1,
            "rating": "A",
            "from": 30,
            "to": 49
        }
        ...
        {
            "id": 8,
            "schemeId": 1,
            "rating": "G",
            "from": 200,
            "to": 999
        }
      ],
      "isDefault": true
    },
    "scope": "Unit",
    "unit": {
      "unitId": 12,
      "unitName": "Unit A",
      "unitReference": "TAC-234",
      "occupier": "Pets At Home",
      "actionNotes": "",
      "gia": 1100,
      "nla": 900,
      "measurementUnit": "M2",
      "vacant": false,
      "leaseStart": "2020-12-17T12:00:00.000Z",
      "leaseLength": 24,
      "leaseExpiry": "2022-12-17T12:00:00.000Z",
      "leaseBreak": "",
      "erv": 1200,
      "fri": false,
      "epcExempt": false
    },
    "comment": "[2021-11-09] I'm a comment!"
  }
```

### HTTP Request 
`GET /api/v1/epcs/{epcId}` 

**Parameters**

| Name  | Located in | Description                                 | Required | Type        |
| ----- | ---------- | ------------------------------------------- | -------- | ----------- |
| epcId | path       | A valid id of an EPC record stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will the specified EPC record which matches the epcId given as a parameter.

| Attribute                    | Type and description                                                                                                                                          |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                         | **integer**<br/>The SIERA-generated id of the EPC record                                                                                                      |
| `assetId`                    | **integer**<br/>The id of the asset this EPC record relates to                                                                                                |
| `rating`                     | **string**<br/>A rating generated from the EPC scheme the EPC record relates to                                                                               |
| `certificateReferenceNumber` | **string**<br/>The certificate reference number of the EPC if one is available                                                                                |
| `score`                      | **integer**<br/>The score achieved of the EPC record                                                                                                          |
| `date`                       | **datetime**<br/>The date of the EPC certificate                                                                                                              |
| `expiry`                     | **datetime**<br/>The expiry date of the EPC certificate stored in SIERA                                                                                       |
| `scheme.id`                  | **integer**<br/>The SIERA-generated id of the EPC scheme                                                                                                      |
| `scheme.description`         | **string**<br/>The name of the related EPC scheme                                                                                                             |
| `scheme.invertedScoring`     | **boolean**<br/>A boolean flag indicating if the scoring of the scheme considers 0 the lowest rating or the highest; true if 0 is the lowest, false otherwise |
| `scheme.isDefault`           | **enumeration**<br/>A boolean flag indicating if a scheme is a SIERA default scheme or not                                                                    |
| `scheme.ratings.id`          | **integer**<br/>The SIERA-generated id of an EPC scheme rating                                                                                                |
| `scheme.ratings.schemeId`    | **integer**<br/>The id of the parent EPC ccheme                                                                                                               |
| `scheme.ratings.rating`      | **datetime**<br/>The letter given to an EPC scheme rating                                                                                                     |
| `scheme.ratings.from`        | **datetime**<br/>The lower bound value of an EPC scheme rating                                                                                                |
| `scheme.ratings.to`          | **float**<br/>The upper bound value of an EPC scheme rating                                                                                                   |
| `scope`                      | **enumeration**<br/>Indicates if the EPC is related to a unit or whole building. Must be a valid item from the [EPC scope](#epc-scope) enumeration |
| `unit.unitId`                | **integer**<br/>The SIERA-generated id of the asset unit |
| `unit.unitName`              | **string**<br/>The name of the asset unit |
| `unit.unitReference`         | **string**<br/>The asset unit reference |
| `unit.occupier`              | **string**<br/>The name of the current occupier of the unit |
| `unit.gia`                   | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `unit.nla`                   | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `unit.measurementUnit`       | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `unit.leaseStart`            | **datetime**<br/>The start date of the tenant of this unit's lease |
| `unit.leaseLength`           | **integer**<br/>The length in months of the tenant of this unit's lease |
| `unit.leaseExpiry`           | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `unit.leaseBreak`            | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `unit.erv`                   | **float**<br/>The estimated rental value (ERV) of this unit |
| `unit.fri`                   | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `unit.epcExempt`             | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |
| `comment`                    | **string**<br/>The latest comment that has been recorded on the EPC record |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |

## Delete an EPC record


```shell
```

> DELETE /api/v1/epcs/{epcId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/epcs/12 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing EPC record by ID

### HTTP Request 
`DELETE /api/v1/epcs/{epcId}` 

**Parameters**

| Name  | Located in | Description                                 | Required | Type        |
| ----- | ---------- | ------------------------------------------- | -------- | ----------- |
| epcId | path       | A valid id of an EPC record stored in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                          |
| ---- | ---------------------------------------------------- |
| 200  | Success                                              |
| 401  | Not found, the specified EPC record id was not found |
| 500  | Server error                                         |

# EPC Schemes 

[Energy Performance Certificates (EPCs)](https://en.wikipedia.org/wiki/Energy_performance_certificate) exist in SIERA in 2 forms:  
1. the list of EPC schemes and their ratings which are defined in a SIERA instance  
2. the record of an EPC rating given to an asset or asset unit for a given EPC scheme.  

SIERA provides a standard EPC which is generic in nature and defined by EVORA consultants. The EPC Scheme endpoints allow an API caller to define any EPC scheme along with the rating bands it uses. The scheme may then be referenced and used to upload an EPC record for an asset whose rating will be mapped to an EPC scheme's rating boundaries to produce a letter grading.

The *EVORA standard EPC scheme* is defined as : 

| Rating letter | Lower bound | Upper bound |
| ------------- | ----------- | ----------- |
| A+            | 0           | 29          |
| A             | 30          | 49          |
| B             | 50          | 74          |
| C             | 75          | 99          |
| D             | 100         | 129         |
| E             | 130         | 159         |
| F             | 160         | 199         |
| G             | 200         | 999         |

As an example of an EPC record using this scheme, an asset having an *whole building* EPC with a rating of 36 would be classed as an *A*.

As EPC Schemes are country-specific, it's recommended to upload appropriate EPC schemes for the assets in an instance.

## Get all schemes

```shell
```

> GET /api/v1/epcs/schemes

```shell
curl https://api.sieraglobal.com/api/v1/epcs/schemes \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
  {
    "id": 1,
    "description": "EVORA standard EPC scheme",
    "invertedScoring": false,
    "ratings": [
      {
        "id": 1,
        "schemeId": 1,
        "rating": "A+",
        "from": 0,
        "to": 29
      },
      {
        "id": 2,
        "schemeId": 1,
        "rating": "A",
        "from": 30,
        "to": 49
      }
      ...
      {
        "id": 8,
        "schemeId": 1,
        "rating": "G",
        "from": 200,
        "to": 999
      }
    ],
    "isDefault": true
  }
]
```

**Summary:** Provides a list of all the EPC schemes in the API caller's instance in SIERA, and the EVORA standard EPC scheme.

### HTTP Request 
`GET /api/v1/epcs/schemes` 

**Response Body**

The response body will be a list of all the EPC schemes in the API caller's instance in SIERA, and the EVORA standard EPC scheme.

| Attribute          | Type and description                                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`               | **integer**<br/>The SIERA-generated id of the EPC scheme                                                                                                      |
| `description`      | **string**<br/>The name of the EPC scheme                                                                                                                     |
| `invertedScoring`  | **boolean**<br/>A boolean flag indicating if the scoring of the scheme considers 0 the lowest rating or the highest; true if 0 is the lowest, false otherwise |
| `isDefault`        | **enumeration**<br/>A boolean flag indicating if a scheme is a SIERA default scheme or not                                                                    |
| `ratings.id`       | **integer**<br/>The SIERA-generated id of the EPC scheme rating                                                                                               |
| `ratings.schemeId` | **integer**<br/>The id of the parent EPC ccheme                                                                                                               |
| `ratings.rating`   | **datetime**<br/>The letter given to an EPC scheme rating                                                                                                     |
| `ratings.from`     | **datetime**<br/>The lower bound value of an EPC scheme rating                                                                                                |
| `ratings.to`       | **float**<br/>The upper bound value of an EPC scheme rating                                                                                                   |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |

## Upload a new scheme


```shell
```

> POST /api/v1/epcs/schemes

```shell
curl POST https://api.sieraglobal.com/api/v1/epcs/schemes \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "description": "Custom EPC scheme",
    "invertedScoring": false,
    "ratings": [
      {
        "rating": "A+",
        "from": 0,
        "to": 29
      },
      {
        "rating": "A",
        "from": 30,
        "to": 49
      }
      ...
      {
        "rating": "G",
        "from": 200,
        "to": 999
      }
    ]
  }
```

> Response (201)

**Summary:** Upload a new EPC scheme

### HTTP Request 
`POST /api/v1/epcs/schemes` 


**Request body**

| Attribute         | Type and description                                                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description`     | **string**<br/>The name of the EPC scheme                                                                                                                     |
| `invertedScoring` | **boolean**<br/>A boolean flag indicating if the scoring of the scheme considers 0 the lowest rating or the highest; true if 0 is the lowest, false otherwise |
| `ratings.rating`  | **datetime**<br/>The letter given to an EPC scheme rating                                                                                                     |
| `ratings.from`    | **datetime**<br/>The lower bound value of an EPC scheme rating                                                                                                |
| `ratings.to`      | **float**<br/>The upper bound value of an EPC scheme rating                                                                                                   |


**Responses**

| Code | Description  |
| ---- | ------------ |
| 201  | Created      |
| 500  | Server error |

## Update a scheme


```shell
```

> PUT /api/v1/epcs/schemes/

```shell
curl PUT https://api.sieraglobal.com/api/v1/epcs/schemes \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON 
  {
    "id": 7,
    "description": "Custom EPC scheme",
    "invertedScoring": false
  }
```

> Response (200)

**Summary:** Updates an existing EPC scheme by ID

### HTTP Request 
`PUT /api/v1/epcs/schemes`

**Request body**

| Attribute         | Type and description                                                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`              | **integer**<br/>The SIERA-generated id of the EPC scheme                                                                                                      |
| `description`     | **string**<br/>The name of the EPC scheme                                                                                                                     |
| `invertedScoring` | **boolean**<br/>A boolean flag indicating if the scoring of the scheme considers 0 the lowest rating or the highest; true if 0 is the lowest, false otherwise |

**Responses**

| Code | Description                                          |
| ---- | ---------------------------------------------------- |
| 200  | Success                                              |
| 401  | Not found, the specified EPC scheme id was not found |
| 500  | Server error                                         |

## Delete a scheme

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/epcs/schemes/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing EPC scheme by ID

### HTTP Request 
`DELETE /api/v1/epcs/schemes/{schemeId}` 

**Parameters**

| Name     | Located in | Description                                     | Required | Type        |
| -------- | ---------- | ----------------------------------------------- | -------- | ----------- |
| schemeId | path       | The id of the EPC scheme to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                          |
| ---- | ---------------------------------------------------- |
| 200  | Success                                              |
| 401  | Not found, the specified EPC ccheme id was not found |
| 500  | Server error                                         |

## Upload a new scheme rating


```shell
```

> POST /api/v1/epcs/schemes

```shell
curl POST https://api.sieraglobal.com/api/v1/epcs/schemes \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "schemeId": 1,
    "rating": "A+",
    "from": 0,
    "to": 29
  }
```

> Response (201)

**Summary:** Upload a new EPC scheme rating

### HTTP Request 
`POST /api/v1/epcs/schemes` 


**Request body**

| Attribute          | Type and description                                           |
| ------------------ | -------------------------------------------------------------- |
| `ratings.schemeId` | **integer**<br/>The id of the parent EPC ccheme                |
| `ratings.rating`   | **datetime**<br/>The letter given to an EPC scheme rating      |
| `ratings.from`     | **datetime**<br/>The lower bound value of an EPC scheme rating |
| `ratings.to`       | **float**<br/>The upper bound value of an EPC scheme rating    |

**Responses**

| Code | Description                                         |
| ---- | --------------------------------------------------- |
| 201  | Created                                             |
| 401  | Not found, the specified unit rate id was not found |
| 500  | Server error                                        |

## Update a scheme rating


```shell
```

> PUT /api/v1/epcs/schemes

```shell
curl PUT https://api.sieraglobal.com/api/v1/epcs/schemes \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "id": 1,
    "schemeId": 1,
    "rating": "A+",
    "from": 0,
    "to": 10
  }
```

> Response (200)

**Summary:** Update an EPC scheme rating

### HTTP Request 
`PUT /api/v1/epcs/schemes`

**Request body**

| Attribute          | Type and description                                           |
| ------------------ | -------------------------------------------------------------- |
| `ratings.id`       | **integer**<br/>The id of the EPC scheme rating to be updated  |
| `ratings.schemeId` | **integer**<br/>The id of the parent EPC ccheme                |
| `ratings.rating`   | **datetime**<br/>The letter given to an EPC scheme rating      |
| `ratings.from`     | **datetime**<br/>The lower bound value of an EPC scheme rating |
| `ratings.to`       | **float**<br/>The upper bound value of an EPC scheme rating    |

**Responses**

| Code | Description                                                 |
| ---- | ----------------------------------------------------------- |
| 200  | Success                                                     |
| 401  | Not found, the specified EPC scheme rating id was not found |
| 500  | Server error                                                |


## Delete a scheme rating


```shell
```

> DELETE /api/v1/epcs/schemes/{schemeId}/ratings/{ratingId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/epcs/schemes/1/ratings/1 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing EPC scheme rating by ID

### HTTP Request 
`DELETE /api/v1/epcs/schemes/{schemeId}/ratings/{ratingId}` 

**Parameters**

| Name     | Located in | Description                                                                 | Required | Type        |
| -------- | ---------- | --------------------------------------------------------------------------- | -------- | ----------- |
| schemeId | path       | The parent id of the EPC scheme rating of the rating to be deleted in SIERA | Yes      | **integer** |
| ratingId | path       | The id of the parent EPC scheme                                             | Yes      | **integer** |

**Responses**

| Code | Description                                                 |
| ---- | ----------------------------------------------------------- |
| 200  | Success                                                     |
| 401  | Not found, the specified EPC scheme rating id was not found |
| 500  | Server error                                                |