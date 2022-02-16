# Waste Records

Waste records in SIERA follow a similar pattern to utility consumption of meters. They both have an endpoint for a monthly summary of waste, and an endpoint to manage records with start and end dates. Just like consumption, the monthly summary is read-only and is automatically updated whenever waste records change.


## Get waste summary of a waste destination 

```shell
```

> GET /api/v1/wasterecord/summary/{wasteDestinationId}

```shell
curl https://api.sieraglobal.com/api/v1/wasterecord/summary/4 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[  
  {
    "wasteId": 4,
    "wasteDestinationId": 4,
    "wasteDate": "1/1/2022",
    "tonnes": 5.34214,
    "landfill": 0,
    "incinerated": 0,
    "recycled": 5.34214,
    "reuse": 0,
    "anaerobic": 0,
    "hazardous": 0,
    "mrFunknown": 0,
    "incineratedWer": 0
  },  
  {
    "wasteId": 5,
    "wasteDestinationId": 4,
    "wasteDate": "2/1/2022",
    "tonnes": 3.4123,
    "landfill": 0,
    "incinerated": 0,
    "recycled": 3.4123,
    "reuse": 0,
    "anaerobic": 0,
    "hazardous": 0,
    "mrFunknown": 0,
    "incineratedWer": 0
  },  
    
  ...

  {
    "wasteId": 6,
    "wasteDestinationId": 4,
    "wasteDate": "12/1/2022",
    "tonnes": 2.15475,
    "landfill": 0,
    "incinerated": 0,
    "recycled": 2.15475,
    "reuse": 0,
    "anaerobic": 0,
    "hazardous": 0,
    "mrFunknown": 0,
    "incineratedWer": 0
  }
]
```

**Summary:** Provides a list of monthly summaries of waste for the specified waste destination

Waste monthly summaries are populated and updated when waste records are added or changed to SIERA. The values in each attribute of the waste summary are updated based upon the type of waste destination. For example, if the waste destination is a `recycled` then the waste added to that destination will be added to the `tonnes` attribute and also the to `recycled` attribute. Likewise if the destination is `MRFIncinerator` and the `mrfOptions.recycled` value of the uploaded waste record is set to `0.5` when uploaded, then the waste value will go to `tonnes` and half will go to `recycled` and half to `incinerated`.

The following explains the details of which attribute is updated when waste is uploaded or changed:

**tonnes**  
Any change to waste will result in the total value being updated to reflect the overall total. All other attributes excluding `hazardous` added together should equal `tonnes`.

**landfill**  
Any waste on destinations set to `Landfill` or `MRFLandfill` will update this attribute. `MRFLandfill` will take into account the `mrfOptions.recycled` option on the waste record, and the amount left after the percentage of mrf recycled indicated is sent to `Recycled` will be added to `Landfill`.

**incinerated**  
Any waste on destinations set to `Incinerated` or `MRFIncinerated` will update this attribute. `MRFIncinerated` will take into account the `mrfOptions.Recycled` option on the waste record, and the amount left after the percentage of mrf recycled indicated is sent to `Recycled` will be added to `Incinerated`. Additionally, if a waste record is uploaded with `Wer` set to `true`, the waste will go to `IncineratedWer` instead of `Incinerated`.

**recycled**  
Any waste on destinations set to `Recycled` will update this attribute. Additionally `MRFIncinerated`, `MRFLandfill` or `MRFUnknown` will update this attribute if the `mrfOption.recycled` is set to a number over `0`. For example, `mrfOption.recycled` set to `0.5` will mean half the waste uploaded to an MRF destination will go recycled and the other half to the respective main destionation, incinerator, landfill or unknown.

**reuse**  
Any waste on destinations set to `Reuse` will update this attribute.

**anaerobic**  
Any waste on destinations set to `AnaerobicDigestion` will update this attribute.

**hazardous**  
Any waste uploaded on a waste record with `isHazardous` set to `true` will update this attribute in addition to the target waste destination.

**mrFunknown**  
Any waste on destinations set to `MRFUnknown` will update this attribute. `MRFUnknown` will take into account the `mrfOptions.recycled` option on the waste record, and the amount left after the percentage of mrf recycled indicated is sent to `Recycled` will be added to `mrFunknown`.

**incineratedWer**  
Any waste on destinations set to `incinerated` or `MRFIncinerated` will update this attribute if the waste record uploaded has `wer` set to `true`. `MRFIncinerated` will take into account the `mrfOptions.recycled` option on the waste record, and the amount left after the percentage of mrf recycled indicated is sent to `recycled` will be added to `incineratedWer`.

### HTTP Request 
`GET /api/v1/wasterecord/summary/{wasteDestinationId}` 

**Parameters**

| Name               | Located in | Description                                       | Required | Type        |
| ------------------ | ---------- | ------------------------------------------------- | -------- | ----------- |
| wasteDestinationId | path       | A valid id of a waste destination stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will include a list of all assets in the API caller's instance in SIERA.

| Attribute            | Type and description                                                            |
| -------------------- | ------------------------------------------------------------------------------- |
| `wasteId`            | **integer**<br/>The id of a valid asset in the API caller's SIERA instance      |
| `wasteDestinationId` | **string**<br/>A description of the waste destination                           |
| `wasteDate`          | **string**<br/>Comments relating to the waste destination                       |
| `tonnes`             | **float**<br/>The total waste in tonnes sent to the waste destination           |
| `landfill`           | **float**<br/>The amount of landfill waste sent to the waste destination        |
| `incinerated`        | **float**<br/>The amount of incinerated waste sent to the waste destination     |
| `recycled`           | **float**<br/>The amount of recycled waste sent to the waste destination        |
| `reuse`              | **float**<br/>The amount of reuse waste sent to the waste destination           |
| `anaerobic`          | **float**<br/>The amount of anaerobic waste sent to the waste destination       |
| `hazardous`          | **float**<br/>The amount of hazardous waste sent to the waste destination       |
| `mrFunknown`         | **float**<br/>The amount of waste sent to the waste destination                 |
| `incineratedWer`     | **float**<br/>The amount of incinerated WER waste sent to the waste destination |



**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Get waste records for a waste destination

```shell
```

> GET /api/v1/wasterecord/{wasteDestinationId}

```shell
curl https://api.sieraglobal.com/api/v1/wasterecord/4 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json
[   
  {
    "wasteRecordId": 343,
    "wasteDestinationId": 4,
    "fromDate": "1/1/2022",
    "toDate": "1/31/2022",
    "wasteStream": "Plastics",
    "tonnes": 1.2343,
    "incineratedWer": false,
    "mrfOptions": {
      "recycled": 0
    }
  },
  {
    "wasteRecordId": 344,
    "wasteDestinationId": 4,
    "fromDate": "2/1/2022",
    "toDate": "2/28/2022",
    "wasteStream": "Plastics",
    "tonnes": 1.1013,
    "incineratedWer": false,
    "mrfOptions": {
      "recycled": 0
    }
  },
  ...
  {
    "wasteRecordId": 354,
    "wasteDestinationId": 4,
    "fromDate": "12/1/2022",
    "toDate": "12/31/2022",
    "wasteStream": "Plastics",
    "tonnes": 0.9863,
    "incineratedWer": false,
    "mrfOptions": {
      "recycled": 0
    }
  }
]
```

**Summary:** Provides a list of waste records for the specified waste destination

### HTTP Request 
`GET /api/v1/wasterecord/{wasteDestinationId}` 

**Parameters**

| Name               | Located in | Description                       | Required | Type        |
| ------------------ | ---------- | --------------------------------- | -------- | ----------- |
| wasteDestinationId | path       | A valid id of a waste destination | Yes      | **integer** |

**Response Body**

The response body will include a list of all waste records associated with the specified waste destination.

| Attribute             | Type and description                                                                                                                                                                                                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `wasteRecordId`       | **integer**<br/>The SIERA-generated id of the waste destination                                                                                                                                                                                                                                                                                              |
| `wasteDestinationId`  | **integer**<br/>The specified waste destination id                                                                                                                                                                                                                                                                                                           |
| `fromDate`            | **string**<br/>The start date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                  |
| `toDate`              | **string**<br/>The end date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                    |
| `wasteStream`         | **enumeration**<br/>A valid stream type from the [waste stream](#waste-stream) enumeration                                                                                                                                                                                                                                                                   |
| `tonnes`              | **float**<br/>The total amount of waste moved to the waste destination                                                                                                                                                                                                                                                                                       |
| `incineratedWer`      | **boolean**<br/>A boolean flag indicating if the waste being uploaded passed through a [waste energy recycling (WER)](https://www.primaryenergy.com/energy-recycling/) facility. This only applies to `Incinerator` and `MRFIncinerator` waste destinations. Any waste uploaded with this flag set will appear in the `incineratedWer` field of the summary. |
| `mrfOptions.recycled` | **float**<br/>A decimal percentage reflecting the amount of waste which was recycled at the waste detination. This only applies to `MRFIncinerator`, `MRFLandfill` or `MRFUnknown` waste destinations                                                                                                                                                        |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Upload waste records

Like consumption utility invoices, waste record uploads represent periods in time and so have start and end dates. The endpoint returns a collection of result models indicating which records were successfully uploaded and which failed to upload and the reason.

The result models are organised into the following lists:

**Successful Uploads**  
Waste records which were successfully uploaded into SIERA

**Exact Matches**  
Waste records which were rejected as an existing waste record had the same start and end date. If the parameter `forceExactMatchUpload` is set to true, then these records will overwrite the existing records and appear in the Successful Uploads list.

**Overlap Matches**  
Waste records which were rejected as existing records overlap the start and end dates of existing waste records.

**Other Errors**  
Waste records which were rejected along with the reason for the rejection.

```shell
```

> POST /api/v1/wasterecord/{forceExactMatchUpload}

```shell
curl POST https://api.sieraglobal.com/api/v1/wasterecord/false \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON    
  [
    {
      "wasteDestinationId": 4,
      "fromDate": "2/1/2022",
      "toDate": "2/28/2022",
      "wasteStream": "Plastics",
      "tonnes": 1.1013,
      "incineratedWer": false,
      "mrfOptions": {
        "recycled": 0
      }
    },
    {
      "wasteDestinationId": 4,
      "fromDate": "1/1/2022",
      "toDate": "12/31/2020",
      "wasteStream": "Plastics",
      "tonnes": 12.2743,
      "incineratedWer": false,
      "mrfOptions": {
        "recycled": 0
      }
    }
  ]
```

> Response (201)

```json
{
  "success": [
    {
      "wasteRecordId": 351,
      "wasteDestinationId": 4,
      "fromDate": "1/1/2022",
      "toDate": "12/31/2020",
      "wasteStream": "Plastics",
      "tonnes": 12.2743,
      "incineratedWer": false,
      "mrfOptions": {
        "recycled": 0
      }
    }
  ],
  "exactMatch": [
    {
      "wasteRecordId": 0,
      "wasteDestinationId": 4,
      "fromDate": "2/1/2022",
      "toDate": "2/28/2022",
      "wasteStream": "Plastics",
      "tonnes": 1.1013,
      "incineratedWer": false,
      "mrfOptions": {
        "recycled": 0
      }
    }
  ],
  "overlapErrors": [],
  "instanceErrors": [],
  "errors": []
}
```

**Summary:** Upload waste records

### HTTP Request 
`POST /api/v1/wasterecord/{forceExactMatchUpload}`

**Parameters**

| Name                  | Located in | Description                                                                                               | Required | Type        |
| --------------------- | ---------- | --------------------------------------------------------------------------------------------------------- | -------- | ----------- |
| forceExactMatchUpload | path       | A boolean flag instructing the API to overwrite existing waste records with a matching start and end date | Yes      | **boolean** |

**Request body**

| Attribute             | Type and description                                                                                                                                                                                                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `wasteDestinationId`  | **integer**<br/>The specified waste destination id                                                                                                                                                                                                                                                                                                           |
| `fromDate`            | **string**<br/>The start date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                  |
| `toDate`              | **string**<br/>The end date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                    |
| `wasteStream`         | **enumeration**<br/>A valid stream type from the [waste stream](#waste-stream) enumeration                                                                                                                                                                                                                                                                   |
| `tonnes`              | **float**<br/>The total amount of waste moved to the waste destination                                                                                                                                                                                                                                                                                       |
| `incineratedWer`      | **boolean**<br/>A boolean flag indicating if the waste being uploaded passed through a [waste energy recycling (WER)](https://www.primaryenergy.com/energy-recycling/) facility. This only applies to `Incinerator` and `MRFIncinerator` waste destinations. Any waste uploaded with this flag set will appear in the `incineratedWer` field of the summary. |
| `mrfOptions.recycled` | **float**<br/>A decimal percentage reflecting the amount of waste which was recycled at the waste detination. This only applies to `MRFIncinerator`, `MRFLandfill` or `MRFUnknown` waste destinations                                                                                                                                                        |

**Response Body**

The response body will include a collection of result models indicating which records were successfully uploaded and which failed to upload and the reason.

| Attribute             | Type and description                                                                                                                                                                                                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `wasteRecordId`       | **integer**<br/>The SIERA-generated id of the waste destination                                                                                                                                                                                                                                                                                              |
| `wasteDestinationId`  | **integer**<br/>The specified waste destination id                                                                                                                                                                                                                                                                                                           |
| `fromDate`            | **string**<br/>The start date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                  |
| `toDate`              | **string**<br/>The end date of the waste record, in the format *m/d/yyyy*                                                                                                                                                                                                                                                                                    |
| `wasteStream`         | **enumeration**<br/>A valid stream type from the [waste stream](#waste-stream) enumeration                                                                                                                                                                                                                                                                   |
| `tonnes`              | **float**<br/>The total amount of waste moved to the waste destination                                                                                                                                                                                                                                                                                       |
| `incineratedWer`      | **boolean**<br/>A boolean flag indicating if the waste being uploaded passed through a [waste energy recycling (WER)](https://www.primaryenergy.com/energy-recycling/) facility. This only applies to `Incinerator` and `MRFIncinerator` waste destinations. Any waste uploaded with this flag set will appear in the `incineratedWer` field of the summary. |
| `mrfOptions.recycled` | **float**<br/>A decimal percentage reflecting the amount of waste which was recycled at the waste detination. This only applies to `MRFIncinerator`, `MRFLandfill` or `MRFUnknown` waste destinations                                                                                                                                                        |
| `errors`              | **string**<br/>A description of any other error which has occured when the upload was attempted                                                                                                                                                                                                                                                              |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |


## Delete waste records 

```shell
```

> DELETE /api/v1/wasterecord

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/wasterecord \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
  -V "Content-Type: application/json" \
  -d @- <<JSON    
  [
      343, 374, 345
  ]
```

> Response (200)

```json
{
  "success": [ 343 ],
  "instanceerror": [ 374 ],
  "error": [
    {
      "recordId": 345,
      "error": "Waste destination does not exist."
    }
  ]
}
```

Waste record delete requests return a list of result models. 

The result models are organised into the following lists:

**Successful Deletions**  
Waste records which were successfully deleted

**Instance Errors**  
Waste records which failed to delete because the associated meter or asset does not exist in the API-caller's SIERA instance

**Errors**  
Waste records which failed to delete and an error description explaining the error message

**Summary:** Deletes waste records by ID

### HTTP Request 
`DELETE /api/v1/wasterecord` 

**Request body**

The request body is a json array of the waste record IDs to be deleted

**Response Body**

The response body will include a list of result models: successful uploads, instance errors or general errors. Successful uploads and instance errors will only contain the related recordId, whilst the general errors will also contain a description of the error.

| Attribute  | Type and description                                         |
| ---------- | ------------------------------------------------------------ |
| `recordId` | **integer**<br/>The id of the waste record                   |
| `error`    | **string**<br/>A description of the error which has occurred |

**Responses**

| Code | Description                                            |
| ---- | ------------------------------------------------------ |
| 200  | Success                                                |
| 401  | Not found, the specified waste record id was not found |
| 500  | Server error                                           |
