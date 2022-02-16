# Asset Units

In SIERA asset units represent sub-units of assets, properties or sites, for example shops in a shopping centre. The assets units endpoints allow you to download asset unit data from SIERA. You can also upload new asset unit, update asset units or delete them from a given instance in SIERA. 

An asset unit must be associated with a valid asset in the API-caller's SIERA instance.

## Get all asset units

```shell
```

> GET /api/v1/assetunits/{assetId}

```shell
curl https://api.sieraglobal.com/api/v1/assetsunits/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[
  {
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
  {
    "unitId": 13,
    "unitName": "Unit B",
    "unitReference": "TAC-235",
    "occupier": "Asda Home",
    "actionNotes": "",
    "gia": 1050,
    "nla": 800,
    "measurementUnit": "M2",
    "vacant": false,
    "leaseStart": "2021-11-21T12:00:00.000Z",
    "leaseLength": 24,
    "leaseExpiry": "2023-12-21T12:00:00.000Z",
    "leaseBreak": "2022-12-17T12:00:00.000Z",
    "erv": 900,
    "fri": false,
    "epcExempt": false
  }
]
```

**Summary:** Provides a list of all asset units associated with a specified assetId

### HTTP Request 
`GET /api/v1/assetunits` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset associated with the unit | Yes | **integer** |

**Response Body**

The response body will include a list of all assets in the API caller's instance in SIERA.

| Attribute | Type and description |
| ---- | ----------- |
| `unitId` | **integer**<br/>The SIERA-generated id of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitReference` | **string**<br/>The asset unit reference |
| `occupier` | **string**<br/>The name of the current occupier of the unit |
| `gia` | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `nla` | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `measurementUnit` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `leaseStart` | **datetime**<br/>The start date of the tenant of this unit's lease |
| `leaseLength` | **integer**<br/>The length in months of the tenant of this unit's lease |
| `leaseExpiry` | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `leaseBreak` | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `erv` | **float**<br/>The estimated rental value (ERV) of this unit |
| `fri` | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `epcExempt` | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |

## Upload a new asset unit

```shell
```

> POST /api/v1/assetunits/{assetId}

```shell
curl POST https://api.sieraglobal.com/api/v1/assetunits/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  {
    "unitId": 14
    "unitName": "Unit C",
    "unitReference": "TAC-236",
    "occupier": "Next",
    "actionNotes": "",
    "gia": 2000,
    "nla": 1900,
    "measurementUnit": "M2",
    "vacant": false,
    "leaseStart": "2020-11-21T12:00:00.000Z",
    "leaseLength": 36,
    "leaseExpiry": "2023-12-21T12:00:00.000Z",
    "leaseBreak": "",
    "erv": 1600,
    "fri": false,
    "epcExempt": false
  }
```

> Response (201)

**Summary:** Uploads a new asset unit

### HTTP Request 
`POST /api/v1/assetunits/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset associated with the unit | Yes | **integer** |

**Request body**

| Attribute | Type and description |
| ---- | ----------- |
| `unitId` | **integer**<br/>The SIERA-generated id of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitReference` | **string**<br/>The asset unit reference |
| `occupier` | **string**<br/>The name of the current occupier of the unit |
| `gia` | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `nla` | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `measurementUnit` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `leaseStart` | **datetime**<br/>The start date of the tenant of this unit's lease |
| `leaseLength` | **integer**<br/>The length in months of the tenant of this unit's lease |
| `leaseExpiry` | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `leaseBreak` | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `erv` | **float**<br/>The estimated rental value (ERV) of this unit |
| `fri` | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `epcExempt` | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Created |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Update an asset unit

```shell
```

> PUT /api/v1/assetunits/{assetId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/assetunits/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  [
    {
      "unitId": 14
      "unitName": "Unit C",
      "unitReference": "TAC-236",
      "occupier": "Next",
      "actionNotes": "",
      "gia": 2000,
      "nla": 1900,
      "measurementUnit": "M2",
      "vacant": false,
      "leaseStart": "2020-11-21T12:00:00.000Z",
      "leaseLength": 36,
      "leaseExpiry": "2023-12-21T12:00:00.000Z",
      "leaseBreak": "",
      "erv": 1900,
      "fri": false,
      "epcExempt": false
    }
  ]
```

> Response (200)

**Summary:** Updates an existing asset unit by ID

### HTTP Request 
`PUT /api/v1/assetunits/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset associated with the unit | Yes | **integer** |

**Request body**

The body is a list of one or more units to be updated.

| Attribute | Type and description |
| ---- | ----------- |
| `unitId` | **integer**<br/>The SIERA-generated id of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitReference` | **string**<br/>The asset unit reference |
| `occupier` | **string**<br/>The name of the current occupier of the unit |
| `gia` | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `nla` | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `measurementUnit` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `leaseStart` | **datetime**<br/>The start date of the tenant of this unit's lease |
| `leaseLength` | **integer**<br/>The length in months of the tenant of this unit's lease |
| `leaseExpiry` | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `leaseBreak` | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `erv` | **float**<br/>The estimated rental value (ERV) of this unit |
| `fri` | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `epcExempt` | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |


## Get an asset unit

```shell
```

> GET /api/v1/assetunits/{assetId}/units/{unitId}

```shell
curl https://api.sieraglobal.com/api/v1/assetunits/2/units/13 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
{
  "unitId": 13,
  "unitName": "Unit B",
  "unitReference": "TAC-235",
  "occupier": "Asda Home",
  "actionNotes": "",
  "gia": 1050,
  "nla": 800,
  "measurementUnit": "M2",
  "vacant": false,
  "leaseStart": "2021-11-21T12:00:00.000Z",
  "leaseLength": 24,
  "leaseExpiry": "2023-12-21T12:00:00.000Z",
  "leaseBreak": "2022-12-17T12:00:00.000Z",
  "erv": 900,
  "fri": false,
  "epcExempt": false
}
```

**Summary:** Provides a single asset unit given an assetId and a unitId

### HTTP Request 
`GET /api/v1/assetunits/{assetId}/units/{unitId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset associated with the unit | Yes | **integer** |
| unitId | path | A valid id of an asset unit stored in SIERA | Yes | **integer** |

**Response Body**

The response body will the specified asset unit which matches the assetId given as a parameter.

| Attribute | Type and description |
| ---- | ----------- |
| `unitId` | **integer**<br/>The SIERA-generated id of the asset unit |
| `unitName` | **string**<br/>The name of the asset unit |
| `unitReference` | **string**<br/>The asset unit reference |
| `occupier` | **string**<br/>The name of the current occupier of the unit |
| `gia` | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `nla` | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement unit. This may be null |
| `measurementUnit` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `leaseStart` | **datetime**<br/>The start date of the tenant of this unit's lease |
| `leaseLength` | **integer**<br/>The length in months of the tenant of this unit's lease |
| `leaseExpiry` | **datetime**<br/>The expiry date of the tenant of this unit's lease |
| `leaseBreak` | **datetime**<br/>The start date of a break in the tenant of this unit's lease |
| `erv` | **float**<br/>The estimated rental value (ERV) of this unit |
| `fri` | **boolean**<br/>A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `epcExempt` | **boolean**<br/>A boolean flag indicating if this unit has an [EPC exemption](https://www.gov.uk/energy-performance-certificate-commercial-property/exemptions) or not |

## Delete an asset unit

```shell
```

> DELETE /api/v1/assetunits/{assetId}/units/{unitId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/assetunits/2/units/13 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing asset unit by ID

### HTTP Request 
`DELETE /api/v1/assets/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset associated with the unit | Yes | **integer** |
| unitId | path | A valid id of an asset unit stored in SIERA | Yes | **integer** |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |