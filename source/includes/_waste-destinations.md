# Waste Destinations

Waste destinations are the waste equivalent of [meters](#meters). They represent the final destination for waste disposed of at an asset. Destinations can be places like a landfill, a recycling point or a [materials recovery facility](https://en.wikipedia.org/wiki/Materials_recovery_facility). Just as meters have consumption records, waste destinations have [waste records](#waste-records), which in turn have both a summary and a record version.

## Get waste destinations

```shell
```

> GET /api/v1/wastedestination/{assetId}

```shell
curl https://api.sieraglobal.com/api/v1/wastedestination/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
    {
      "assetId": 2,
      "wasteDestinationId": 2,
      "wasteDestinationDescription": "Mixed Recycleables",
      "comments": "Recycling for Chelsea House, London",
      "contractor": "Veolia",
      "reference": "Reference 1000022",
      "wasteDestination": "Recycled"
    },
    {
      "assetId": 2,
      "wasteDestinationId": 3,
      "wasteDestinationDescription": "General Waste",
      "comments": "General Waste for Chelsea House, London",
      "contractor": "Veolia",
      "reference": "Reference 1000023",
      "wasteDestination": "Landfill"
    }
]
```

**Summary:** Provides a list of all the waste destinations associated with the specified asset.

### HTTP Request 
`GET /api/v1/wastedestination/{assetId}` 


**Response Body**

The response body will be a list of waste destimatinos which are associated with the asset specified by the assetId parameter.

| Attribute                     | Type and description                                                                                      |
| ----------------------------- | --------------------------------------------------------------------------------------------------------- |
| `assetId`                     | **integer**<br/>The id of the asset                                                                       |
| `wasteDestinationId`          | **integer**<br/>The SIERA-generated id of the waste destination                                           |
| `wasteDestinationDescription` | **string**<br/>A description of the waste destination                                                     |
| `comments`                    | **string**<br/>Comments relating to the waste destination                                                 |
| `contractor`                  | **string**<br/>The name of the contractor providing the waste service                                     |
| `reference`                   | **string**<br/>A reference for the waste destination on the asset                                         |
| `wasteDestination`            | **enumeration**<br/>A valid destination type from the [waste destination](#waste-destination) enumeration |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new waste destination

```shell
```

> POST /api/v1/wastedestination

```shell
curl POST https://api.sieraglobal.com/api/v1/wastedestination \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
    "assetId": 2,    
    "wasteDestinationDescription": "Glass Recycling",
    "comments": "Glass recycling for Chelsea House, London",
    "contractor": "Veolia",
    "reference": "Reference 1000024",
    "wasteDestination": "Recycled"
  }
```

> Response (201)

**Summary:** Upload a new waste destination

### HTTP Request 
`POST /api/v1/meters` 


**Request body**

| Attribute                     | Type and description                                                                                      |
| ----------------------------- | --------------------------------------------------------------------------------------------------------- |
| `assetId`                     | **integer**<br/>The id of a valid asset in the API caller's SIERA instance                                |
| `wasteDestinationDescription` | **string**<br/>A description of the waste destination                                                     |
| `comments`                    | **string**<br/>Comments relating to the waste destination                                                 |
| `contractor`                  | **string**<br/>The name of the contractor providing the waste service                                     |
| `reference`                   | **string**<br/>A reference for the waste destination on the asset                                         |
| `wasteDestination`            | **enumeration**<br/>A valid destination type from the [waste destination](#waste-destination) enumeration |

**Responses**

| Code | Description                                                                                        |
| ---- | -------------------------------------------------------------------------------------------------- |
| 201  | Created                                                                                            |
| 400  | Validation failure, one or more of the enumerations were not correctly identified.                 |
| 401  | Not found, the specified asset or unit id does not exist in the caller's instance or was not found |
| 500  | Server error                                                                                       |



## Update a waste destination

```shell
```

> PUT /api/v1/wastedestination

```shell
curl PUT https://api.sieraglobal.com/api/v1/wastedestination/ \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  {
    "assetId": 2,    
    "wasteDestinationId": 4,  
    "wasteDestinationDescription": "Plastic Recycling",
    "comments": "Plastic recycling for Chelsea House, London",
    "contractor": "Veolia",
    "reference": "Reference 1000025",
    "wasteDestination": "Recycled"
  }
```

> Response (200)

**Summary:** Updates an existing waste destination by ID

### HTTP Request 
`PUT /api/v1/wastedestination` 

**Request body**

| Attribute                     | Type and description                                                                                      |
| ----------------------------- | --------------------------------------------------------------------------------------------------------- |
| `assetId`                     | **integer**<br/>The id of the asset                                                                       |
| `wasteDestinationId`          | **integer**<br/>The SIERA-generated id of the waste destination                                           |
| `wasteDestinationDescription` | **string**<br/>A description of the waste destination                                                     |
| `comments`                    | **string**<br/>Comments relating to the waste destination                                                 |
| `contractor`                  | **string**<br/>The name of the contractor providing the waste service                                     |
| `reference`                   | **string**<br/>A reference for the waste destination on the asset                                         |
| `wasteDestination`            | **enumeration**<br/>A valid destination type from the [waste destination](#waste-destination) enumeration |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 201  | Created                                                                           |
| 400  | Validation failure, one or more of the enumerations were not correctly identified |
| 401  | Not found, the specified meter id was not found                                   |
| 500  | Server error                                                                      |

## Delete a waste destination 

```shell
```

> DELETE /api/v1/wastedestination/{wasteDestinationId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/wastedestination/4 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing waste destination by ID

### HTTP Request 
`DELETE /api/v1/wastedestination/{wasteDestinationId}` 

**Parameters**

| Name               | Located in | Description                                            | Required | Type        |
| ------------------ | ---------- | ------------------------------------------------------ | -------- | ----------- |
| wasteDestinationId | path       | The id of the waste destination to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                                 |
| ---- | ----------------------------------------------------------- |
| 200  | Success                                                     |
| 401  | Not found, the specified waste destination id was not found |
| 500  | Server error                                                |