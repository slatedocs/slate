# Assets

The Assets endpoints allow you to download asset data from SIERA. You can also upload new assets, update assets or delete them from a given instance in SIERA.

## Get all assets

```shell
```

> GET /api/v1/assets

```shell
curl https://api.sieraglobal.com/api/v1/assets \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[
  {
    "assetId": 2,
    "assetName": "Chelsea House, London",
    "assetReference": "CHL-2",
    "country": "United Kingdom",
    "controlledBy": "Landlord",
    "sector": "Retail",
    "organisationId": 2,
    "fundId": 3,
    "gia": 1234,
    "nla": 1100,
    "measurementType": "m2",
    "address": "1, The Way",
    "city": "Townington",
    "postcode": "AB12 3DC",
    "status": "MajorRefurbishment",
    "dateOfPurchase": "1999-01-01T00:00:00.000Z",
    "dateOfSale": "2021-03-14T00:00:00.000Z",
    "yearOfConstruction": 1985,
    "yearOfRefurbishment": 2006,
    "currentAssetValue": 1200000,
    "longitude": 51.507351,
    "latitude": -0.127758,
    "targetCarbon": 5,
    "targetEnergy": 1,
    "targetElectricity": 3,
    "targetFuelsAndThermals": 4,
    "targetWater": 6,
    "gresbSector": "Office",
    "carParkingSpaces": 14,
    "fri": true,
    "cpa": 15,
    "ext": 100,
    "assetImageUri": "https://api.sieraglobal.com/api/v1/assets/2/assetimage"
  },
  {
    "assetId": 3,
    "assetName": "2-4 Sharwalk Building, Birmingham",
    "assetReference": "CHL-3",
    "country": "United Kingdom",
    "controlledBy": "Landlord",
    "sector": "Retail",
    "organisationId": 2,
    "fundId": 3,
    "gia": 1640,
    "nla": 1530,
    "measurementType": "m2",
    "address": "2, The Way",
    "city": "Townington",
    "postcode": "AB12 3DC",
    "status": "MajorRefurbishment",
    "dateOfPurchase": "2000-01-01T00:00:00.000Z",
    "dateOfSale": "2021-03-19T00:00:00.000Z",
    "yearOfConstruction": 1985,
    "yearOfRefurbishment": 2007,
    "currentAssetValue": 1250000,
    "longitude": 51.507351,
    "latitude": -0.127758,
    "targetCarbon": 4,
    "targetEnergy": 3,
    "targetElectricity": 5,
    "targetFuelsAndThermals": 1,
    "targetWater": 6,
    "gresbSector": "Office",
    "carParkingSpaces": 18,
    "fri": false,
    "cpa": 14,
    "ext": 121,
    "assetImageUri": "https://api.sieraglobal.com/api/v1/assets/3/assetimage"
  }
]
```

**Summary:** Provides a list of all assets in the API caller's instance in SIERA.

### HTTP Request 
`GET /api/v1/assets` 


**Response Body**

The response body will include a list of all assets in the API caller's instance in SIERA.

| Attribute | Type and description |
| ---- | ----------- |
| `assetId` | **integer**<br/>The SIERA-generated id of the asset |
| `assetName` | **string**<br/>The name of the asset |
| `assetReference` | **string**<br/>The user-specified asset reference, unique within the API caller's SIERA instance |
| `country` | **enumeration**<br/>A valid country from the [country](#country) enumeration |
| `controlledBy` | **enumeration**<br/>A valid item from the [controlled by](#controlled-by) enumeration showing who primarily is responsible for the asset, the landlord or the tenant |
| `sector` | **enumeration**<br/>A valid item from the [sector](#sector) enumeration indicating the property sector this asset belongs to |
| `organisationId` | **integer**<br/>The id value of an organisation which exists in the API-caller's SIERA instance |
| `fundId` | **integer**<br/>The id value of a fund which exists in the authorised user or API-caller's SIERA instance |
| `gia` | **integer**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement type |
| `nla` | **integer**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement type |
| `measurementType` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `address` | **string**<br/> The address of the asset |
| `city` | **string**<br/> The city of the asset |
| `postcode` | **string**<br/> The postcode of the asset |
| `status` | **enumeration**<br/> A valid item from the [asset status](#asset-status) enumeration indicates the current state of the asset in relation to its ability to be commercially occupied. |
| `dateOfPurchase` | **datetime**<br/> The date which the asset was purchased |
| `dateOfSale` | **datetime**<br/> The date which the asset was sold |
| `yearOfConstruction` | **integer**<br/> The year that the asset was built |
| `yearOfRefurbishment` | **integer**<br/> The year that the asset was refurbished |
| `currentAssetValue` | **integer**<br/> The current value of the asset in Great British Pounds (GBP) |
| `longitude` | **decimal**<br/> The decimal longitude coordinates of the asset location (to 6 decimal places) |
| `latitude` | **decimal**<br/> The decimal latitude coordinates of the asset location (to 6 decimal places) |
| `targetCarbon` | **float**<br/> The target percentage for the annual reduction of carbon usage for all meters on the asset |
| `targetEnergy` | **float**<br/> The target percentage for the annual reduction of energy usage for all meters on the asset |
| `targetElectricity` | **float**<br/> The target percentage for the annual reduction of electricity usage for all meters on the asset |
| `targetFuelsAndThermals` | **float**<br/> The target percentage for the annual reduction of fuels & thermals usage for all meters on the asset |
| `targetWater` | **float**<br/> The target percentage for the annual reduction of water usage for all meters on the asset |
| `gresbSector` | **enumeration**<br/> A valid item from the [GRESB sector](#gresb-sector) enumeration indicating how the asset is classified |
| `carParkingSpaces` | **integer**<br/> The number of car parking spaces available at the asset |
| `fri` | **boolean**<br/> A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `cpa` | **integer**<br/> The *Common Part Areas* (CPA) of the asset, measured in units indicated by the measurement type. For example, entrance lobbies, hallways and toilets |
| `ext` | **integer**<br/> The external areas of the asset, measured in units indicated by the measurement type. For example, car parks, outside eating areas and greenspace |
| `assetImageUri` | **string**<br/> A URI of a downloadable image for the asset |

## Upload a new asset

```shell
```

> POST /api/v1/assets

```shell
curl POST https://api.sieraglobal.com/api/v1/assets \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  { 
    "assetName": "Chelsea House, London",
    "assetReference": "CHL-2",
    "country": "United Kingdom",
    "controlledBy": "Landlord",
    "sector": "Retail",
    "organisationId": 2,
    "fundId": 3,
    "gia": 1234,
    "nla": 1100,
    "measurementType": "m2",
    "address": "1, The Way",
    "city": "Townington",
    "postcode": "AB12 3DC",
    "status": "MajorRefurbishment",
    "dateOfPurchase": "1999-01-01T00:00:00.000Z",
    "dateOfSale": "2021-03-14T00:00:00.000Z",
    "yearOfConstruction": 1985,
    "yearOfRefurbishment": 2006,
    "currentAssetValue": 1200000,
    "longitude": 51.507351,
    "latitude": -0.127758,
    "targetCarbon": 5,
    "targetEnergy": 1,
    "targetElectricity": 3,
    "targetFuelsAndThermals": 4,
    "targetWater": 6,
    "gresbSector": "Office",
    "carParkingSpaces": 14,
    "fri": true,
    "cpa": 15,
    "ext": 100
  }
```

> Response (201)

**Summary:** Uploads a new asset

### HTTP Request 
`POST /api/v1/assets` 


**Request body**

| Attribute | Type and description |
| ---- | ----------- |
| `assetName` | **string**<br/>The name of the asset |
| `assetReference` | **string**<br/>The user-specified asset reference, unique within the API caller's SIERA instance |
| `country` | **enumeration**<br/>A valid country from the [country](#country) enumeration |
| `controlledBy` | **enumeration**<br/>A valid item from the [controlled by](#controlled-by) enumeration showing who primarily is responsible for the asset, the landlord or the tenant |
| `sector` | **enumeration**<br/>A valid item from the [sector](#sector) enumeration indicating the property sector this asset belongs to |
| `organisationId` | **integer**<br/>The id value of an organisation which exists in the API-caller's SIERA instance |
| `fundId` | **integer**<br/>The id value of a fund which exists in the authorised user or API-caller's SIERA instance |
| `gia` | **float**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement type. This may be null |
| `nla` | **float**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement type. This may be null |
| `measurementType` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `address` | **string**<br/> The address of the asset |
| `city` | **string**<br/> The city of the asset |
| `postcode` | **string**<br/> The postcode of the asset |
| `status` | **enumeration**<br/> A valid item from the [asset status](#asset-status) indicates the current state of the asset in relation to its ability to be commercially occupied. |
| `dateOfPurchase` | **datetime**<br/> The date which the asset was purchased |
| `dateOfSale` | **datetime**<br/> The date which the asset was sold |
| `yearOfConstruction` | **integer**<br/> The year that the asset was built |
| `yearOfRefurbishment` | **integer**<br/> The year that the asset was refurbished |
| `currentAssetValue` | **integer**<br/> The current value of the asset in Great British Pounds (GBP) |
| `longitude` | **decimal**<br/> The decimal longitude coordinates of the asset location (to 6 decimal places) |
| `latitude` | **decimal**<br/> The decimal latitude coordinates of the asset location (to 6 decimal places) |
| `targetCarbon` | **float**<br/> The target percentage for the annual reduction of carbon usage for all meters on the asset |
| `targetEnergy` | **float**<br/> The target percentage for the annual reduction of energy usage for all meters on the asset |
| `targetElectricity` | **float**<br/> The target percentage for the annual reduction of electricity usage for all meters on the asset |
| `targetFuelsAndThermals` | **float**<br/> The target percentage for the annual reduction of fuels & thermals usage for all meters on the asset |
| `targetWater` | **float**<br/> The target percentage for the annual reduction of water usage for all meters on the asset |
| `gresbSector` | **enumeration**<br/> A valid item from the [GRESB sector](#gresb-sector) enumeration indicating how the asset is classified |
| `carParkingSpaces` | **integer**<br/> The number of car parking spaces available at the asset |
| `fri` | **boolean**<br/> A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `cpa` | **integer**<br/> The *Common Part Areas* (CPA) of the asset, measured in units indicated by the measurement type. For example, entrance lobbies, hallways and toilets |
| `ext` | **integer**<br/>  The external areas of the asset, measured in units indicated by the measurement type. For example, car parks, outside eating areas and greenspace |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Created |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Get an asset

```shell
```

> GET /api/v1/assets/{assetId}

```shell
curl https://api.sieraglobal.com/api/v1/assets/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
{
  "assetId": 2,
  "assetName": "Chelsea House, London",
  "assetReference": "CHL-2",
  "country": "United Kingdom",
  "controlledBy": "Landlord",
  "sector": "Retail",
  "organisationId": 2,
  "fundId": 3,
  "gia": 1234,
  "nla": 1100,
  "measurementType": "m2",
  "address": "1, The Way",
  "city": "Townington",
  "postcode": "AB12 3DC",
  "status": "MajorRefurbishment",
  "dateOfPurchase": "1999-01-01T00:00:00.000Z",
  "dateOfSale": "2021-03-14T00:00:00.000Z",
  "yearOfConstruction": 1985,
  "yearOfRefurbishment": 2006,
  "currentAssetValue": 1200000,
  "longitude": 51.507351,
  "latitude": -0.127758,
  "targetCarbon": 5,
  "targetEnergy": 1,
  "targetElectricity": 3,
  "targetFuelsAndThermals": 4,
  "targetWater": 6,
  "gresbSector": "Office",
  "carParkingSpaces": 14,
  "fri": true,
  "cpa": 15,
  "ext": 100,
  "assetImageUri": "https://myapi.com/api/v1/Assets/2/AssetImage"
}
```

> Response (201)

**Summary:** Provides a single asset given an ID

### HTTP Request 
`GET /api/v1/assets/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | A valid id of an asset stored in SIERA | Yes | **integer** |

**Response Body**

The response body will the specified asset which matches the assetId given as a parameter.

| Attribute | Type and description |
| ---- | ----------- |
| `assetId` | **integer**<br/>The SIERA-generated id of the asset |
| `assetName` | **string**<br/>The name of the asset |
| `assetReference` | **string**<br/>The user-specified asset reference, unique within the API caller's SIERA instance |
| `country` | **enumeration**<br/>A valid country from the [country](#country) enumeration |
| `controlledBy` | **enumeration**<br/>A valid item from the [controlled by](#controlled-by) enumeration showing who primarily is responsible for the asset, the landlord or the tenant |
| `sector` | **enumeration**<br/>A valid item from the [sector](#sector) enumeration indicating the property sector this asset belongs to |
| `organisationId` | **integer**<br/>The id value of an organisation which exists in the API-caller's SIERA instance |
| `fundId` | **integer**<br/>The id value of a fund which exists in the authorised user or API-caller's SIERA instance |
| `gia` | **integer**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement type |
| `nla` | **integer**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement type |
| `measurementType` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `address` | **string**<br/> The address of the asset |
| `city` | **string**<br/> The city of the asset |
| `postcode` | **string**<br/> The postcode of the asset |
| `status` | **enumeration**<br/> A valid item from the [asset status](#asset-status) enumeration indicates the current state of the asset in relation to its ability to be commercially occupied. |
| `dateOfPurchase` | **datetime**<br/> The date which the asset was purchased |
| `dateOfSale` | **datetime**<br/> The date which the asset was sold |
| `yearOfConstruction` | **integer**<br/> The year that the asset was built |
| `yearOfRefurbishment` | **integer**<br/> The year that the asset was refurbished |
| `currentAssetValue` | **integer**<br/> The current value of the asset in Great British Pounds (GBP) |
| `longitude` | **integer**<br/> The decimal longitude coordinates of the asset location (to 6 decimal places) |
| `latitude` | **integer**<br/> The decimal latitude coordinates of the asset location (to 6 decimal places) |
| `targetCarbon` | **float**<br/> The target percentage for the annual reduction of carbon usage for all meters on the asset |
| `targetEnergy` | **float**<br/> The target percentage for the annual reduction of energy usage for all meters on the asset |
| `targetElectricity` | **float**<br/> The target percentage for the annual reduction of electricity usage for all meters on the asset |
| `targetFuelsAndThermals` | **float**<br/> The target percentage for the annual reduction of fuels & thermals usage for all meters on the asset |
| `targetWater` | **float**<br/> The target percentage for the annual reduction of water usage for all meters on the asset |
| `gresbSector` | **enumeration**<br/> A valid item from the [GRESB sector](#gresb-sector) enumeration indicating how the asset is classified |
| `carParkingSpaces` | **integer**<br/> The number of car parking spaces available at the asset |
| `fri` | **boolean**<br/> A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `cpa` | **integer**<br/> The *Common Part Areas* (CPA) of the asset, measured in units indicated by the measurement type. For example, entrance lobbies, hallways and toilets |
| `ext` | **integer**<br/>  The external areas of the asset, measured in units indicated by the measurement type. For example, car parks, outside eating areas and greenspace |
| `assetImageUri` | **string**<br/> A URI of a downloadable image for the asset |

## Update an asset

```shell
```

> PUT /api/v1/assets/{assetId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/assets/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  { 
    "assetName": "Birmingham House, London",
    "assetReference": "CHL-3",
    "country": "United Kingdom",
    "controlledBy": "Landlord",
    "sector": "Retail",
    "organisationId": 2,
    "fundId": 3,
    "gia": 1234,
    "nla": 1100,
    "measurementType": "m2",
    "address": "2, The Way",
    "city": "Townington",
    "postcode": "AB12 3DC",
    "status": "MajorRefurbishment",
    "dateOfPurchase": "2000-01-01T00:00:00.000Z",
    "dateOfSale": "2021-03-19T00:00:00.000Z",
    "yearOfConstruction": 1985,
    "yearOfRefurbishment": 2007,
    "currentAssetValue": 1250000,
    "longitude": 51.507351,
    "latitude": -0.127758,
    "targetCarbon": 4,
    "targetEnergy": 3,
    "targetElectricity": 5,
    "targetFuelsAndThermals": 1,
    "targetWater": 6,
    "gresbSector": "Office",
    "carParkingSpaces": 18,
    "fri": false,
    "cpa": 14,
    "ext": 121
  }
```

> Response (200)

**Summary:** Updates an existing asset by ID

### HTTP Request 
`PUT /api/v1/assets/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset to be updated in SIERA | Yes | **integer** |

**Request body**

| Attribute | Type and description |
| ---- | ----------- |
| `assetName` | **string**<br/>The name of the asset |
| `assetReference` | **string**<br/>The user-specified asset reference, unique within the API caller's SIERA instance |
| `country` | **enumeration**<br/>A valid country from the [country](#country) enumeration |
| `controlledBy` | **enumeration**<br/>A valid item from the [controlled by](#controlled-by) enumeration showing who primarily is responsible for the asset, the landlord or the tenant |
| `sector` | **enumeration**<br/>A valid item from the [sector](#sector) enumeration indicating the property sector this asset belongs to |
| `organisationId` | **integer**<br/>The id value of an organisation which exists in the API-caller's SIERA instance |
| `fundId` | **integer**<br/>The id value of a fund which exists in the authorised user or API-caller's SIERA instance |
| `gia` | **integer**<br/>The *Gross Internal Area* (GIA) of the asset, measured in units indicated by the measurement type |
| `nla` | **integer**<br/>The *Net Lettable Area* (NLA) of the asset, measured in units indicated by the measurement type |
| `measurementType` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `address` | **string**<br/> The address of the asset |
| `city` | **string**<br/> The city of the asset |
| `postcode` | **string**<br/> The postcode of the asset |
| `status` | **enumeration**<br/> A valid item from the [asset status](#asset-status) enumeration indicates the current state of the asset in relation to its ability to be commercially occupied. |
| `dateOfPurchase` | **datetime**<br/> The date which the asset was purchased |
| `dateOfSale` | **datetime**<br/> The date which the asset was sold |
| `yearOfConstruction` | **integer**<br/> The year that the asset was built |
| `yearOfRefurbishment` | **integer**<br/> The year that the asset was refurbished |
| `currentAssetValue` | **integer**<br/> The current value of the asset in Great British Pounds (GBP) |
| `longitude` | **decimal**<br/> The decimal longitude coordinates of the asset location (to 6 decimal places) |
| `latitude` | **decimal**<br/> The decimal latitude coordinates of the asset location (to 6 decimal places) |
| `targetCarbon` | **float**<br/> The target percentage for the annual reduction of carbon usage for all meters on the asset |
| `targetEnergy` | **float**<br/> The target percentage for the annual reduction of energy usage for all meters on the asset |
| `targetElectricity` | **float**<br/> The target percentage for the annual reduction of electricity usage for all meters on the asset |
| `targetFuelsAndThermals` | **float**<br/> The target percentage for the annual reduction of fuels & thermals usage for all meters on the asset |
| `targetWater` | **float**<br/> The target percentage for the annual reduction of water usage for all meters on the asset |
| `gresbSector` | **enumeration**<br/> A valid item from the [GRESB sector](#gresb-sector) enumeration indicating how the asset is classified |
| `carParkingSpaces` | **integer**<br/> The number of car parking spaces available at the asset |
| `fri` | **boolean**<br/> A boolean flag indicating if the current lease is [Full Repairing and Insuring (FRI)](https://www.herrington-carmichael.com/full-repairing-and-insuring-lease/) or not |
| `cpa` | **integer**<br/> The *Common Part Areas* (CPA) of the asset, measured in units indicated by the measurement type. For example, entrance lobbies, hallways and toilets |
| `ext` | **integer**<br/>  The external areas of the asset, measured in units indicated by the measurement type. For example, car parks, outside eating areas and greenspace |
| `assetImageUri` | **string**<br/> This URI is for the endpoint where the asset image can be downloaded |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Created |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Delete an asset 

```shell
```

> DELETE /api/v1/assets/{assetId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/assets/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing asset by ID

### HTTP Request 
`DELETE /api/v1/assets/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | The id of the asset to be deleted in SIERA | Yes | **integer** |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Get all meters for an asset

```shell
```

> GET /api/v1/assets/{assetId}/meters

```shell
curl https://api.sieraglobal.com/api/v1/assets/2/meters \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[
  {
    "meterId": 11,
    "propertyId": 2,
    "unitId": 1,
    "mpan": "S018011012261305588165",
    "serialNumber": "1875258102",
    "comment": "",
    "supplier": "EON",
    "areaCovered": "SharedServices",
    "controlledBy": "Landlord",
    "floorAreaServed": 730,
    "meterType": "Electricity",
    "generationType": "NationalGrid",
    "measurementType": "m2",
    "locationCarbonFactorId": 0,
    "marketCarbonFactorId": 0,
    "unitRateId": 1,
    "isActive": true,
    "isAMR": false,
    "isSubmeter": false,
    "isValidated": true,
    "isROC": false,
    "isFIT": false,
    "isCCA": false,
    "isEUETS": false,
    "hasHalfHourData": false
  },
  {
    "meterId": 12,
    "propertyId": 2,
    "unitId": 2,
    "mpan": "S018005012341305549165",
    "serialNumber": "1815248121",
    "comment": "",
    "supplier": "EON",
    "areaCovered": "WholeBuilding",
    "controlledBy": "Gas",
    "floorAreaServed": 1100,
    "meterType": "Gas",
    "generationType": "NationalGrid",
    "measurementType": "m2",
    "locationCarbonFactorId": 0,
    "marketCarbonFactorId": 0,
    "unitRateId": 2,
    "isActive": true,
    "isAMR": false,
    "isSubmeter": false,
    "isValidated": false,
    "isROC": false,
    "isFIT": false,
    "isCCA": false,
    "isEUETS": false,
    "hasHalfHourData": false
  }
]
```

**Summary** Provides meters for all assets given an ID

### HTTP Request 
`GET /api/v1/assets/{assetId}/meters` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | A valid id of an asset stored in SIERA | Yes | **integer** |


**Response Body**

The response body will be a list of meters which are associated with the asset specified by the assetId parameter.

| Attribute | Type and description |
| ---- | ----------- |
| `meterId` | **integer**<br/>The SIERA-generated id of the meter |
| `assetId` | **integer**<br/>The SIERA-generated id of the associated asset |
| `unitId` | **integer**<br/>The SIERA-generated id of any associated unit |
| `mpan` | **string**<br/>The meter point administration number (MPAN) of the meter |
| `serialNumber` | **string**<br/>The serial number of the meter |
| `comment` | **string**<br/>A free-text description relating to the meter |
| `supplier` | **string**<br/>Any utilities supplier related to the meter |
| `areaCovered` | **enumeration**<br/>A valid area of the property which this meter covers, from the [area covered](#area-covered) enumeration |
| `controlledBy` | **enumeration**<br/>A valid item from the [controlled by](#controlled-by) enumeration showing who primarily pays for the energy from this meter, the landlord or the tenant |
| `floorAreaServed` | **integer**<br/>The floor area covered by this meter |
| `meterType` | **enumeration**<br/>A valid utility of the meter from the [meter type](#meter-type) enumeration |
| `generationType` | **enumeration**<br/>A valid generation type of the meter from the [generation type](#generation type) enumeration |
| `measurementType` | **enumeration**<br/>The unit of measurement used to indicate floor area of this asset. Must be a valid item from the [measurement unit](#measurement-unit) enumeration (m<sup>2</sup> or ft<sup>2</sup>) |
| `locationCarbonFactorId` | **integer**<br/>The id value of an location-based carbon factor Id which exists in the API-caller's SIERA instance, or one of the [default carbon factors](#default-carbon-factors) provided by Evora |
| `marketCarbonFactorId` | **integer**<br/>The id value of an market-based carbon factor Id which exists in the API-caller's SIERA instance, or one of the [default carbon factors](#default-carbon-factors) provided by Evora |
| `unitRateId` | **integer**<br/>The id value of a cost unit rate Id which exists in the API-caller's SIERA instance, or one of the [default unit rates](#default-unit-rates) provided by Evora |
| `isActive` | **boolean**<br/>A boolean flag indicating if this meter is considered active and currently in use or not.|
| `isAMR` | **boolean**<br/>A boolean flag indicating if this meter's readings are being retrieved by automatic meter reading or not.|
| `isSubmeter` | **boolean**<br/>A boolean flag indicating if this meter isa sub-meter or not|
| `isValidated` | **boolean**<br/>A boolean flag indicating if this meter has been validated or not.|
| `isROC` | **boolean**<br/>A boolean flag indicating if this meter has an [Renewables Obligation Certificate](https://www.ofgem.gov.uk/environmental-and-social-schemes/renewables-obligation-ro) generation meter which measures total electricity produced by solar panel or not.|
| `isFIT` | **boolean**<br/>A boolean flag indicating if this meter is a Feed-In-Time tariff (relating to solar panels) or not.|
| `isCCA` | **boolean**<br/>A boolean flag indicating if this meter is part of a [Community Choice Aggregation](https://en.wikipedia.org/wiki/Community_Choice_Aggregation) or not.|
| `isEUETS` | **boolean**<br/>A boolean flag indicating if this meter is part of the [EU Energy Trading System](https://ec.europa.eu/clima/policies/ets_en) or not.|
| `hasHalfHourData` | **boolean**<br/>A boolean flag indicating if this meter has received half-hourly data or not.|


**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## Get an asset image

**Summary** The response will return a file, if one is found for the given asset ID.

### HTTP Request 
`GET /api/v1/assets/{assetId}/assetimage` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path | A valid id of an asset stored in SIERA | Yes | **integer** |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success      |
| 404 | Not Found    |