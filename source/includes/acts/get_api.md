## Retrieve data from Database Table

This section outlines the various GET APIs available for fetching data from different tables. Each API provides the capability to retrieve specific data based on provided parameters. Pagination support is available for managing large datasets effectively.

### 1. Attribute Type Table 

This section outlines the process of retrieving data from the Attribute Type table using the dedicated API endpoint. The endpoint facilitates the retrieval of all data from the Attribute Type table or enables the selection of specific information by including Attribute IDs and Attribute Types. Additionally, the Attribute Type endpoint supports pagination to effectively manage larger datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/attributetype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/attributetype");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/AttributeType

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
attributeTypeIDs | int | Attribute ID is one of the filter parameter is a integer data type
attributeTypes | string | Attribute Types is for the project detail type

### 2. Compound API Table

This section guides you through the process of fetching data from the Compound table using the dedicated API endpoint. The endpoint offers the flexibility to retrieve all data from the Compound table or selectively acquire information by including Compound IDs, Compound Type IDs, Compound Status IDs, Compound Names, External Identifiers, or CAS Numbers. Additionally, the Compound endpoint is equipped with pagination capabilities to facilitate efficient management of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/compound' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/compound");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/compound

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
compoundIDs | int | Compound ID is one of the unique identifier for this compound record 
compoundTypeIDs | int | Compound TYpe IDs is the associated compound type and is a second filter parameter option
compoundstatusIDs | int | Compound Status IDs is associated with compound status
compoundNames | string | Compound Names The name of the compound which is a string type data and is one among the parameter for filter option
externalIdentifier | int | External Identifiers is a unique identifier for this record to an external data system
CAS | string | CAS Number is a Chemical Abstract Service number for the compound 

### 3. Emission Category Table

This section elaborates on how to obtain data from the Emission Category table using the designated API endpoint. The endpoint allows you to retrieve all data from the Emission Category table or selectively acquire information by providing the Emission Category ID. Moreover, the Emission Category endpoint features pagination to facilitate efficient management of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/emissioncategory' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/emissioncategory");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/emissioncategory

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
emissionCategoryID | int | Emission Category ID is one of the unique identifier for this emission category record and is one of the filter option provided for Emission Category

### 4. Emission Type Table

This section guides you through the process of fetching data from the Emission Type table using the dedicated API endpoint. The endpoint enables you to retrieve data from the entire Emission Type table or selectively obtain information by including Emission Type IDs. Additionally, the Emission Type endpoint is equipped with pagination capabilities to facilitate the handling of extensive datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/emissiontype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/emissiontype");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/emissiontype

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
emissionTypeID | int | Emission Type ID is one of the type of emissions and is the one of the filter option provided for Emission Type

### 5. Equipment Table

This section provides guidance on retrieving data from the Equipment table using the designated API endpoint. The endpoint allows you to retrieve all data from the Equipment table or specify specific data based on equipment IDs. Additionally, the Equipment endpoint offers pagination support to facilitate the handling of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/equipment' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/equipment");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/equipment

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
equipmentID | int | Equipment ID is one of the unique identifier for this equipment record


### 6. Equipment Status Table

All data from the Equipment Status table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment status ID and equipment status value. The Equipment Status endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/equipmentstatus' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/equipmentstatus");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/equipmentstatus

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
equipmentStatusIDs | int | Equipment Status ID is one of the unique identifier for this equipment status record
equipmentStatus | string | Equipment Status is one of the identifier for the status of the equipment

### 7. Equipment Type Table

All data from the Equipment Type table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment type ID and equipment types value. The Equipment type endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/equipmenttype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/equipmenttype");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	"value": [
	  {
		"name": "string",
		"kind": "string",
		"url": "string"
	  }
	]
}
```

**API Endpoints**

`GET` /api/v1/equipmenttype

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
equipmentTypeIDs | int | Equipment Type ID is one of the unique identifier for this equipment type record
equipmentType | string | Equipment Types is one of the filter option and the parameter is for the type of the equipment

### 8. Operation Table

All data from the Operation table will be returned from the endpoint below. You can optionally fetch specific data by including the operation ids, operation type ids, emission type ids, emission category ids, unit ids, equipment ids, last modified start date and last modified end date. The Operation endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/operation' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/operation");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
	 "currentPage": 1,
    "totalPages": 1,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 337,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "operationId": "number",
			"equipmentId": "number",
			"emissionTypeId": "number",
			"emissionCategoryId": "number",
			"operationTypeId": "number",
			"activeDate": "2023-06-25T04:00:00Z",
			"unitId": "number",
			"controlledInd": "string 1 Byte Y or N",
			"estimatedInd": "string 1 Byte Y or N",
			"invalidInd": "string 1 Byte Y or N",
			"calculateEmissionsInd": "string 1 Byte Y or N",
			"collectionDate": "2023-06-25T04:00:00Z",
			"fieldEventId": "number",
			"inactiveDate": "2023-06-25T04:00:00Z",
			"dataLockTypeId": "number",
			"lastModifiedDate": "2023-06-25T04:00:00Z",
			"externalIdentifier": "string",
			"comments": "string",
			"badDataFlag": "number(0,1)",
			"operationAmount": "number"
        }
		    ]
}
```

**API Endpoints**

`GET` /api/v1/operation

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
operationIDs | int | Operation Ids are unique identifier for this operation type record
operationTypeIDs | string | Operation Type IDs is one of the filter option and the parameter is for the type of the Operation Type
emissionTypeIDs | int | The unique identifier of the associated emission type
emissionCategoryIDs | int | The unique identifier of the associated emission category
unitIDs | int | The unique identifier of the associated unit 
equipmentIDs | int | The unique identifier of the associated equipment
lastModifiedStartDate | string | Date time format "mm/dd/yyyy"
lastModifiedEndDate | string | Date time format "mm/dd/yyyy"

### 9. Unit Table

This section outlines how to retrieve data from the Unit table using the provided endpoint. You have the flexibility to fetch specific data by including unit IDs, unit type IDs, and units. The Unit type endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_acts_api_url/api/v1/unit' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_acts_api_url/api/v1/unit");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Response Schema

```json
{
    "currentPage": 1,
    "totalPages": 1,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 337,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "unitId": "number",
            "unit": "string",
            "unitTypeId": 0,
            "description": "string",
            "alternateNames": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string",
            "refId": "string"
        }
		    ]
}

```

**API Endpoints**

`GET` /api/v1/unit

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
unitIDs | int | Unit ID is one of the unique identifier for this Unit record
unitTypeIDs | int | Unit Type IDs is the unique identifier of the associated unit type
units | string | Units is one of the filter option and the parameter is for the Name of the Unit