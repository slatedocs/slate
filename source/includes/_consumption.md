# Consumption

Consumption in SIERA is available in two forms. The first is a monthly summary of consumption for each meter. The second is a a list of consumption records with a start and end date which capture utility invoices. The monthly summary is read-only and automatically generated and updated as consumption records for a meter are changed. 

## Get consumption summary of a meter

```shell
```

> GET /api/v1/consumption/consumptionsummary/{assetId}/{meterId}

```shell
curl https://api.sieraglobal.com/api/v1/consumption/consumptionsummary/2/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[  
  {
    "consumptionId": 10523180,
    "meterId": 2,
    "consumptionDate": "1/1/2020",
    "consumption": null,
    "cost": null,
    "co2": null,
    "daysActual": null,
    "daysEstimate": null
  },
  {
    "consumptionId": 10523181,
    "meterId": 2,
    "consumptionDate": "2/1/2020",
    "consumption": 356626,
    "cost": 35662.6,
    "co2": 83.12952,
    "daysActual": 29,
    "daysEstimate": 0
  },
  {
    "consumptionId": 10523182,
    "meterId": 2,
    "consumptionDate": "3/1/2020",
    "consumption": 310568,
    "cost": 31056.8,
    "co2": 72.3934,
    "daysActual": 0,
    "daysEstimate": 31
  },
  
  ...

  {
    "consumptionId": 10523183,
    "meterId": 2,
    "consumptionDate": "12/1/2020",
    "consumption": 365502,
    "cost": 36550.2,
    "co2": 85.19852,
    "daysActual": 0,
    "daysEstimate": 31
  }
]
```

**Summary:** Provides a list of monthly summaries of consumption for the specified meter

The monthly consumption total is calculated by calculating a daily amount from any consumption records with days in a given month. The monthly total is the daily amount times the number of days in the month. Where consumption records don't cover part of the month, the daily amount is multipled by the number of days covered by any consumption records available for a meter.

As an example, given an uploaded consumption record of `10,000 kWh from 1st September to the 15th October`, the monthly consumption values would be calculated as such:

`daily rate = 10,0000 / (30 + 15) = 222.22`  
`September = daily rate * 30 = 6666.6`  
`October = daily rate * 15 = 3333.3`


As the consumption record only includes 15 days of October, there are 16 days without consumption which leave a gap in the month. The 16 day gap in consumption for October would be represented in the fields `daysActual` or `daysEstimated` which would show `15`. The choice of which field would contain the `15` would be based on the `consumptionType` of the associated consumption records.

### HTTP Request 
`GET /api/v1/consumption/consumptionsummary/{assetId}/{meterId}` 

**Parameters**

| Name    | Located in | Description                            | Required | Type        |
| ------- | ---------- | -------------------------------------- | -------- | ----------- |
| assetId | path       | A valid id of an asset stored in SIERA | Yes      | **integer** |
| meterId | path       | A valid id of a meter stored in SIERA  | Yes      | **integer** |

**Response Body**

The response body will include a list of all assets in the API caller's instance in SIERA.

| Attribute         | Type and description                                                                                                                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `consumptionId`   | **integer**<br/>The SIERA-generated id of the consumption month of the meter                                                                                                                                                    |
| `meterId`         | **integer**<br/>The id of the associated meter                                                                                                                                                                                  |
| `consumptionDate` | **string**<br/>The date of the consumption month, in the format *m/d/yyyy*. The day value will always be the first of the month                                                                                                 |
| `consumption`     | **float**<br/>The amount of consumption for the month                                                                                                                                                                           |
| `cost`            | **float**<br/>The amount of consumption represented as a financial cost. The factor used to convert energy units to money is indicated by setting a [unit rate](#unit-rates) on the meter associated with this consumption      |
| `co2`             | **float**<br/>The amount of consumption represented kgCO2 of carbon. The factor used to convert energy units to carbon is indicated by setting a [carbon factor](#carbon-factors) on the meter associated with this consumption |
| `daysActual`      | **integer**<br/>The number of days consumption in the month with a `consumptionType` of `actual`                                                                                                                                |
| `daysEstimate`    | **integer**<br/>The number of days consumption in the month with a `consumptionType` of `estimated`                                                                                                                             |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Get consumption records for a meter

```shell
```

> GET /api/v1/consumption/consumptionrecord/{assetId}/{meterId}

```shell
curl https://api.sieraglobal.com//api/v1/consumption/consumptionrecord/2/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[   
  {
    "recordId": 3053526,
    "meterId": 2,
    "fromDate": "9/1/2022",
    "toDate": "9/30/2022",
    "consumption": 356573,
    "consumptionType": "Actual",
    "energySource": "NationalGridStandard"
  },
  {
    "recordId": 3053584,
    "meterId": 2,
    "fromDate": "6/1/2022",
    "toDate": "6/30/2022",
    "consumption": 296150,
    "consumptionType": "Actual",
    "energySource": "NationalGridStandard"
  },
  {
    "recordId": 3053666,
    "meterId": 2,
    "fromDate": "10/1/2022",
    "toDate": "10/31/2022",
    "consumption": 353664,
    "consumptionType": "Estimate",
    "energySource": "NationalGridStandard"
  },
  {
    "recordId": 3053680,
    "meterId": 2,
    "fromDate": "4/1/2022",
    "toDate": "4/30/2022",
    "consumption": 321949,
    "consumptionType": "Actual",
    "energySource": "NationalGridStandard"
  }
]
```

**Summary:** Provides a list of consumption records for the specified meter

### HTTP Request 
`GET /api/v1/consumption/consumptionrecord/{assetId}/{meterId}` 

**Parameters**

| Name    | Located in | Description                            | Required | Type        |
| ------- | ---------- | -------------------------------------- | -------- | ----------- |
| assetId | path       | A valid id of an asset stored in SIERA | Yes      | **integer** |
| meterId | path       | A valid id of a meter stored in SIERA  | Yes      | **integer** |

**Response Body**

The response body will include a list of all assets in the API caller's instance in SIERA.

| Attribute         | Type and description                                                                                                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `recordId`        | **integer**<br/>The SIERA-generated id of the consumption record                                                                                                                                              |
| `meterId`         | **integer**<br/>The id of the associated meter                                                                                                                                                                |
| `fromDate`        | **string**<br/>The start date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                     |
| `toDate`          | **float**<br/>The end date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                        |
| `consumption`     | **float**<br/>The amount of consumption                                                                                                                                                                       |
| `consumptionType` | **enumeration**<br/>The type of consumption, actual or estimated. This must be a valid item from the enumeration [consumption type](#meter-consumption-type)                                                  |
| `energySource`    | **enumeration**<br/>The source of the energy, for example from renewables or the national energy grid. This must be a valid item from the enumeration [consumption energy source](#consumption-energy-source) |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Upload consumption records

Consumption uploads represent utility invoices and so they all have start and end dates. The endpoint returns a collection of result models indicating which records were successfully uploaded and which failed to upload and the reason.

The result models are organised into the following lists:

**Successful Uploads**  
Consumption records which were successfully uploaded into SIERA

**Exact Matches**  
Consumption records which were rejected as an existing consumption record had the same start and end date. If the parameter `forceExactMatchUpload` is set to true, then these records will overwrite the existing records and appear in the Successful Uploads list.

**Overlap Matches**  
Consumption records which were rejected as existing records overlap the start and end dates of existing consumption records.

**Other Errors**  
Consumption records which were rejected along with the reason for the rejection.

```shell
```

> POST /api/v1/consumption/consumptionrecord/{forceExactMatchUpload}

```shell
curl POST https://api.sieraglobal.com/api/v1/consumption/consumptionrecord/false \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON    
  [
      {
        "meterId": 2,
        "fromDate": "4/1/2022",
        "toDate": "4/30/2022",
        "consumption": 321949,
        "consumptionType": "Actual",
        "energySource": "NationalGridStandard"
      },
      {
        "meterId": 2,
        "fromDate": "5/1/2022",
        "toDate": "4/31/2022",
        "consumption": 301231,
        "consumptionType": "Actual",
        "energySource": "NationalGridStandard"
      }
  ]
```

> Response (201)

```json
{
  "success": [
    {
      "recordId": 0,
      "meterId": 2,
      "fromDate": "4/1/2022",
      "toDate": "4/30/2022",
      "consumption": 321949,
      "consumptionType": "Actual",
      "energySource": "NationalGridStandard"
    }
  ],
  "exactMatch": [],
  "overlapErrors": [
    {
      "recordId": 0,
      "meterId": 2,
      "fromDate": "5/1/2022",
      "toDate": "5/31/2022",
      "consumption": 301231,
      "consumptionType": "Actual",
      "energySource": "NationalGridStandard"
    }
  ],
  "instanceErrors": [],
  "errors": []
}
```

**Summary:** Upload consumption records

### HTTP Request 
`POST /api/v1/consumption/consumptionrecord/{forceExactMatchUpload}`

**Parameters**

| Name                  | Located in | Description                                                                                                     | Required | Type        |
| --------------------- | ---------- | --------------------------------------------------------------------------------------------------------------- | -------- | ----------- |
| forceExactMatchUpload | path       | A boolean flag instructing the API to overwrite existing consumption records with a matching start and end date | Yes      | **boolean** |

**Request body**

| Attribute         | Type and description                                                                                                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `meterId`         | **integer**<br/>The id of the associated meter                                                                                                                                                                |
| `fromDate`        | **string**<br/>The start date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                     |
| `toDate`          | **float**<br/>The end date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                        |
| `consumption`     | **float**<br/>The amount of consumption                                                                                                                                                                       |
| `consumptionType` | **enumeration**<br/>The type of consumption, actual or estimated. This must be a valid item from the enumeration [consumption type](#meter-consumption-type)                                                  |
| `energySource`    | **enumeration**<br/>The source of the energy, for example from renewables or the national energy grid. This must be a valid item from the enumeration [consumption energy source](#consumption-energy-source) |

**Response Body**

The response body will include a collection of result models indicating which records were successfully uploaded and which failed to upload and the reason.

| Attribute         | Type and description                                                                                                                                                               |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `recordId`        | **integer**<br/>The SIERA-generated id of the consumption record                                                                                                                   |
| `meterId`         | **integer**<br/>The id of the associated meter                                                                                                                                     |
| `fromDate`        | **string**<br/>The start date of the consumption uploaded, in the format *m/d/yyyy*                                                                                                |
| `toDate`          | **float**<br/>The end date of the consumption uploaded, in the format *m/d/yyyy*                                                                                                   |
| `consumption`     | **float**<br/>The amount of consumption uploaded                                                                                                                                   |
| `consumptionType` | **enumeration**<br/>The type of consumption, actual or estimated from the enumeration [consumption type](#meter-consumption-type)                                                  |
| `energySource`    | **enumeration**<br/>The source of the energy, for example from renewables or the national energy grid from the enumeration [consumption energy source](#consumption-energy-source) |
| `errors`          | **string**<br/>A description of any other error which has occured when the upload was attempted                                                                                    |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Delete consumption 

```shell
```

> DELETE /api/v1/consumption/consumptionrecord

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/consumption/consumptionrecord \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
  -V "Content-Type: application/json" \
  -d @- <<JSON    
  [
      2, 3, 4
  ]
```

> Response (200)

```json
{
  "success": [ 3 ],
  "instanceerror": [ 4 ],
  "error": [
    {
      "recordId": 2,
      "error": "Meter does not exist."
    }
  ]
}
```

Consumption delete requests return a list of result models. 

The result models are organised into the following lists:

**Successful Deletions**  
Consumption records which were successfully deleted

**Instance Errors**  
Consumption records which failed to delete because the associated meter or asset does not exist in the API-caller's SIERA instance

**Errors**  
Consumption records which failed to delete and an error description explaining the error message

**Summary:** Deletes consumption records by ID

### HTTP Request 
`DELETE /api/v1/consumption/consumptionrecord` 

**Request body**

The request body is a json array of the consumption record IDs to be deleted

**Response Body**

The response body will include a list of result models: successful uploads, instance errors or general errors. Successful uploads and instance errors will only contain the related recordId, whilst the general errors will also contain a description of the error.

| Attribute  | Type and description                                         |
| ---------- | ------------------------------------------------------------ |
| `recordId` | **integer**<br/>The id of the consumption record             |
| `error`    | **string**<br/>A description of the error which has occurred |

**Responses**

| Code | Description                                                  |
| ---- | ------------------------------------------------------------ |
| 200  | Success                                                      |
| 401  | Not found, the specified consumption record id was not found |
| 500  | Server error                                                 |



## Legacy consumption import 

```shell
```

> POST /api/v1/consumptionbulkimport/{forceExactMatchUpload}

```shell
curl -X POST https://api.sieraglobal.com/api/v1/consumptionbulkimport/false \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
  -V "Content-Type: application/json" \
  -d @- <<JSON    
  {
    "mpan": 2,
    "organisationId": 1
    "fromDate": "4/1/2022",
    "toDate": "4/30/2022",
    "consumption": 321949,
    "consumptionType": "Actual",
    "energySource": "NationalGridStandard"
  }
```

> Response (201)

```json
{
  "success": [
    {
      "recordId": 3103512,
      "meterId": 2,
      "organisationId": 1,
      "fromDate": "4/1/2022",
      "toDate": "4/30/2022",
      "consumption": 321949,
      "consumptionType": "Actual",
      "energySource": "NationalGridStandard"
    }
  ],
  "exactMatch": [],
  "overlapErrors": [
    {
      "recordId": 0,
      "meterId": 2,
      "fromDate": "5/1/2022",
      "toDate": "5/31/2022",
      "consumption": 301231,
      "consumptionType": "Actual",
      "energySource": "NationalGridStandard"
    }
  ],
  "instanceErrors": [],
  "errors": []
}
```

Legacy consumption import is a consumption uploading method which does not require an API caller to belong to the SIERA instance where the target assets and meters are located. This provides a method for 3rd party companies to upload consumption on behalf of assets which they may not directly own or manage in SIERA. 

The only requirements for a valid consumption upload is a matching meter point administration number (`MPAN`) and the correct `organisationId` of the owner of the target asset. Similar to using standard endpoints above, the endpoint will return a list of result models which show successful uploads and any errors.

<aside class="notice">
This endpoint only allows uploads. It has no GET method, and the <code>MPAN</code> and <code>organisationId</code> cannot be used to read, change or delete existing consumption.
</aside>

The result models are organised into the following lists:

**Successful Uploads**  
Consumption records which were successfully uploaded into SIERA

**Exact Matches**  
Consumption records which were rejected as an existing consumption record had the same start and end date. If the parameter `forceExactMatchUpload` is set to true, then these records will overwrite the existing records and appear in the Successful Uploads list.

**Overlap Matches**  
Consumption records which were rejected as existing records overlap the start and end dates of existing consumption records.

**Other Errors**  
Consumption records which were rejected along with the reason for the rejection.

**Summary:** Uploads consumption to meters without limiting to SIERA instances 

### HTTP Request 
`POST /api/v1/consumptionbulkimport/{forceExactMatchUpload}` 

**Parameters**

| Name                  | Located in | Description                                                                                                     | Required | Type        |
| --------------------- | ---------- | --------------------------------------------------------------------------------------------------------------- | -------- | ----------- |
| forceExactMatchUpload | path       | A boolean flag instructing the API to overwrite existing consumption records with a matching start and end date | Yes      | **boolean** |

**Request body**

| Attribute         | Type and description                                                                                                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `mpan`            | **string**<br/>The meter point administration number (`MPAN`) of the associated meter                                                                                                                         |
| `organisationId`  | **integer**<br/>The id of the associated organisation which manages the asset in SIERA                                                                                                                        |
| `fromDate`        | **string**<br/>The start date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                     |
| `toDate`          | **float**<br/>The end date of the consumption being recorded, in the format *m/d/yyyy*                                                                                                                        |
| `consumption`     | **float**<br/>The amount of consumption                                                                                                                                                                       |
| `consumptionType` | **enumeration**<br/>The type of consumption, actual or estimated. This must be a valid item from the enumeration [consumption type](#meter-consumption-type)                                                  |
| `energySource`    | **enumeration**<br/>The source of the energy, for example from renewables or the national energy grid. This must be a valid item from the enumeration [consumption energy source](#consumption-energy-source) |


**Response Body**

The response body will include a collection of result models indicating which records were successfully uploaded and which failed to upload and the reason.

| Attribute         | Type and description                                                                                                                                                               |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `recordId`        | **integer**<br/>The SIERA-generated id of the consumption record                                                                                                                   |
| `mpan`            | **string**<br/>The meter point administration number (`MPAN`) of the associated meter                                                                                              |
| `organisationId`  | **integer**<br/>The id of the associated organisation which manages the asset in SIERA                                                                                             |
| `meterId`         | **integer**<br/>The id of the associated meter                                                                                                                                     |
| `fromDate`        | **string**<br/>The start date of the consumption uploaded, in the format *m/d/yyyy*                                                                                                |
| `toDate`          | **float**<br/>The end date of the consumption uploaded, in the format *m/d/yyyy*                                                                                                   |
| `consumption`     | **float**<br/>The amount of consumption uploaded                                                                                                                                   |
| `consumptionType` | **enumeration**<br/>The type of consumption, actual or estimated from the enumeration [consumption type](#meter-consumption-type)                                                  |
| `energySource`    | **enumeration**<br/>The source of the energy, for example from renewables or the national energy grid from the enumeration [consumption energy source](#consumption-energy-source) |
| `errors`          | **string**<br/>A description of any other error which has occured when the upload was attempted                                                                                    |