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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "attribute_type_id": "number",
            "attribute_type": "string",
            "data_type_id": "number",
            "data_type_size": "number",
			"data_type_precision": "number",
			"data_type_filter": "string",
			"readonly_ind": "string",
			"searchable_ind": "string",
			"remote_ind": "string",
			"default_value": "string",
			"always_evaluate_default_ind": "string",
			"display_condition": "string",
			"disabled_condition": "string",
			"validation_condition": "string",
			"validation_error_text": "string",
			"view_column_name": "string",
            "activedate": "2011-07-04t17:42:43",
			"inactive_date": "2010-07-04t17:42:43",
			"lastmodifieddate": "2020-09-10t10:01:19",
            "externalidentifier": "string",
            "comments": "string",
            "refid": "string"
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "compoundId": "number",
            "compound": "string",
            "compoundTypeId": "number",
            "compoundStatusId": "number",
            "activeDate": "2011-07-04T17:42:43",
            "description": "string",
            "alternateNames": "string",
            "cas": "string",
            "formula": "string",
            "molecularWeight": "number",
            "vpMolecularWeight": "number",
            "vp40": "number",
            "vp50": "number",
            "vp60": "number",
            "vp70": "number",
            "vp80": "number",
            "vp90": "number",
            "vp100": "number",
            "vpCoefA": "number",
            "vpCoefB": "number",
            "vpCoefC": "number",
            "vp2A": "number",
            "vp2B": "number",
            "reid": "number",
            "astmSlope": "number",
            "vpA": "number",
            "vpB": "number",
            "vpXMin": "number",
            "vpXMax": "number",
            "density": "number",
            "specificGravity": "number",
            "supplier": "string",
            "manufacturerId": "number",
            "epaTanksCategory": "string",
            "epaTanksId": "number",
            "inactiveDate": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2020-09-10T10:01:19",
            "externalIdentifier": "string",
            "comments": "string",
            "refId": "string"
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "emission_category_id": "number",
            "emission_category": "string",
            "sort_order": "number",
            "last_modified_date": "2020-09-10t10:01:19",
			"external_identifier": "string",
			"comments": "string",
			"ref_id": "string"
			
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "emission_type_id": "number",
            "emission_type": "string",
            "sort_order": "number",
            "last_modified_date": "2020-09-10t10:01:19",
			"external_identifier": "string",
			"comments": "string",
			"ref_id": "string"
			
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "equipment_id": "number",
			"area_id": "number",
			"facility_id": "number",
			"equipment_type_id": "number",
			"source_name": "string",
			"equipment_status_id": "number",
			"model_id": "number",
			"ownership_id": "number",
			"owner_id": "number",
			"serial_number": "string",
			"manufacture_date": "2019-09-10t10:01:19",
			"internal_name": "string",
			"alternate_name": "string",
			"design": "string",
			"original_survey_date": "2021-09-10t10:01:19",
			"active_date": "2022-09-10t10:01:19",
			"inactive_date": "2023-09-10t10:01:19",
			"data_lock_type_id": "number",
			"last_modified_date": "2023-09-11t10:01:19",
			"external_identifier": "string",
			"comments": "string"
			
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "emission_status_id": "number",
            "emission_status": "string",
			"color_id": "number",
            "sort_order": "number",
            "last_modified_date": "2020-09-10t10:01:19",
			"external_identifier": "string",
			"comments": "string"
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
    "currentPage": 1,
    "totalPages": 3,
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": 1346,
    "hasPrevious": false,
    "hasNext": true,
    "data": [
        {
            "equipment_type_id": "number",
			"equipment_type": "string",
			"visible_ind": "string",
			"equipment_attributes_ind": "string",
			"emission_calculations_ind": "string",
			"containment_ind": "string",
			"geometry_ind": "string",
			"emission_factors_ind": "string",
			"sample_locations_ind": "string",
			"equipment_associations_ind": "string",
			"facility_associations_ind": "string",
			"location_information_ind": "string",
			"fuel_use_ind": "string",
			"people_associations_ind": "string",
			"service_schedule_ind": "string",
			"service_history_ind": "string",
			"operational_data_collectn_ind": "string",
			"pte_operational_data_ind": "string",
			"schedule_ind": "string",
			"correspondence_ind": "string",
			"requirements_ind": "string",
			"file_attachments_ind": "string",
			"view_name": "string",
			"sort_order": "number", 
			"last_modified_date": "2020-09-10t10:01:19",
			"external_identifier": "string",
			"comments": "string",
			"ref_id": "string"
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