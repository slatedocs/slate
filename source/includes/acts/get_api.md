## Retrieve data from Database Table

This section outlines the various GET APIs available for fetching data from different tables. Each API provides the capability to retrieve specific data based on provided parameters. Pagination support is available for managing large datasets effectively.The user can pass the set of parameters of same or different filter options at once .

### 1. Attribute Type Table 

This section outlines the process of retrieving data from the Attribute Type table using the dedicated API endpoint. The endpoint facilitates the retrieval of all data from the Attribute Type table or enables the selection of specific information by including Attribute Ids and Attribute Types. Additionally, the Attribute Type endpoint supports pagination to effectively manage larger datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/attributetype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/attributetype");
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
attributeTypeIds | int | Attribute ID is one of the filter parameter is a integer data type
attributeTypes | string | Attribute Types is for the project detail type

### 2. Compound API Table

This section guides you through the process of fetching data from the Compound table using the dedicated API endpoint. The endpoint offers the flexibility to retrieve all data from the Compound table or selectively acquire information by including Compound Ids, Compound Type Ids, Compound Status Ids, Compound Names, External Identifiers, or CAS Numbers. Additionally, the Compound endpoint is equipped with pagination capabilities to facilitate efficient management of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/compound' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/compound");
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
compoundIds | int | Compound ID is one of the unique identifier for this compound record 
compoundTypeIds | int | Compound Type Ids is the associated compound type and is a second filter parameter option
compoundstatusIds | int | Compound Status Ids is associated with compound status
compoundNames | string | Compound Names The name of the compound which is a string type data and is one among the parameter for filter option
externalIdentifier | int | External Identifiers is a unique identifier for this record to an external data system
CAS | string | CAS Number is a Chemical Abstract Service number for the compound 

### 3. Emission Category Table

This section elaborates on how to obtain data from the Emission Category table using the designated API endpoint. The endpoint allows you to retrieve all data from the Emission Category table or selectively acquire information by providing the Emission Category ID. Moreover, the Emission Category endpoint features pagination to facilitate efficient management of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/emissioncategory' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/emissioncategory");
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
emissionCategoryIds | int | Emission Category ID is one of the unique identifier for this emission category record and is one of the filter option provided for Emission Category
emissionCategoryTypes | string | Emission Category Types is for the project to emission category detail types

### 4. Emission Type Table

This section guides you through the process of fetching data from the Emission Type table using the dedicated API endpoint. The endpoint enables you to retrieve data from the entire Emission Type table or selectively obtain information by including Emission Type Ids. Additionally, the Emission Type endpoint is equipped with pagination capabilities to facilitate the handling of extensive datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/emissiontype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/emissiontype");
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
emissionTypeIds | int | Emission Type ID is one of the type of emissions and is the one of the filter option provided for Emission Type
emissionTypes | string | Emission Types is for the project to emission detail types


### 5. Equipment Table

This section provides guidance on retrieving data from the Equipment table using the designated API endpoint. The endpoint allows you to retrieve all data from the Equipment table or specify specific data based on equipment Ids. Additionally, the Equipment endpoint offers pagination support to facilitate the handling of substantial datasets.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipment' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipment");
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
equipmentIds | int | Equipment ID is one of the unique identifier for this equipment record
equipmentTypeIds | int | Equipment Type ID is one of the unique identifier for this equipment type record
equipmentStatusIds | int | Equipment Status ID is one of the unique identifier for this equipment status record
facilityIds | int | Facility ID is one of the unique identifier for this equipment status record
sourceNames | string | Source Names is one of the unique identifier for this equipment record
internalNames | string | Internal Names is one of the unique identifier for this equipment record
alternateNames | string | Alternate Names is one of the unique identifier for this equipment record
lastModifiedStartDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"


### 6. Equipment Status Table

All data from the Equipment Status table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment status ID and equipment status value. The Equipment Status endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipmentstatus' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipmentstatus");
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
equipmentStatusIds | int | Equipment Status ID is one of the unique identifier for this equipment status record
equipmentStatus | string | Equipment Status is one of the identifier for the status of the equipment


### 7. Equipment Attribute Table

All data from the Equipment Attribute table will be returned from the endpoint below. You can optionally fetch specific data by including the facility attribute Ids, facility names, emission type Ids, facility type Ids, unit Ids, equipment Ids, last modified start date and last modified end date. The facility attribute endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipmentattribute' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipmentattribute");
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
            "EquipmentAttributeId": "number",
            "EquipmentId": "number",
            "AttributeTypeId": "number",
            "EquipmentAttribute":"string",
            "DataLockTypeId": "number",
            "LastModifiedDate": "datetime",
            "ExternalIdentifier": "string",
            "Comments":"string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/equipmentattribute

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
equipmentAttributeIds | int | EquipmentAttributeId one of the unique identifier for this Equipment record
equipmentIds | int |  EquipmentId accepts the numbers as input 
attributetypeIds | int | AttributeTypeId accepts the numbers as input
equipmentattributes | string | Equipment Attribute is one of the filter option and the parameter is for the Equipment Attribute Type 
datalocktypeIds | int | Data Lock Type ID the unique identifier of the associated data lock type
lastModifiedStartDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
externalidentifier | string | External Identifier a unique identifier for this record to an external data system
comments | string | Comments any comments associated with this record


### 8. Equipment Type Table

All data from the Equipment Type table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment type ID and equipment types value. The Equipment type endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipmenttype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipmenttype");
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
equipmentTypeIds | int | Equipment Type ID is one of the unique identifier for this equipment type record
equipmentTypes | string | Equipment Types is one of the filter option and the parameter is for the type of the equipment


### 9. Facility Table

All data from the Facility table will be returned from the endpoint below. You can optionally fetch specific data by including the facility Ids, facility names, emission type Ids, facility type Ids, facility status Ids, county Ids, last modified start date and last modified end date. The facility endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/facility' };
request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/facility");
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
            "facilityId": "number",
            "facilityName": "string",
            "emissionTypeId": "number",
            "areaId": "number",
            "facilityTypeId": "number",
            "facilityStatusId": "number",
            "sortOrder": "number",
            "facilityOwnershipId": "number",
            "facilityOwnerId": "number",
            "landOwnerId": "number",
            "operatorId": "number",
            "countryId": "number",
            "countyId": "number",
            "offshoreBlockId": "number",
            "meteorologicalId": "number",
            "businessEntityId": "number",
            "businessUnitId": "number",
            "alternateName": "string",
            "purchaseDate": "2023-06-25T04:00:00Z",
            "previousOwnerId": "number",
            "soldDate": "2023-06-25T04:00:00Z",
            "soldToId": "number",
            "activeDate": "2023-06-25T04:00:00Z",
            "inactiveDate": "2023-06-25T04:00:00Z",
            "dataLockTypeId": "number",
            "lastModifiedDate": "2023-06-25T04:00:00Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/facility

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
facilityIds | int | Facility ID is one of the unique identifier for this Facility record
facilityTypeIds | int | Facility Type ID is one of the unique identifier for this Facility record
facilityStatusIds | int | Facility Status ID is one of the unique identifier for this Facility record
countyIds | int | County ID is one of the unique identifier for this Facility record
facilityNames | string | Facility Name is the unique identifier of the associated facility type
alternateNames | string | Alternate Name is the unique identifier of the associated facility 
externalidentifier | string | External Identifier a unique identifier for this record to an external data system
areaIds | int | Area ID is one of the unique identifier for this Facility record to determine the region 
lastModifiedStartDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"


### 10. Facility Attribute Table

All data from the Facility Attribute table will be returned from the endpoint below. You can optionally fetch specific data by including the facility attribute Ids, facility names, emission type Ids, facility type Ids, facility attribute and last modified end date. The facility attribute endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/facilityattribute' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/facilityattribute");
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
          "FacilityAttributeId": "number",
          "FacilityId": "number",
          "AttributeTypeId": "number",
          "FacilityAttribute":"string",
          "DataLockTypeId": "number",
          "LastModifiedDate": "2023-03-30T07:27:06.295Z",
          "ExternalIdentifier": "string",
          "Comments":"string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/facilityattribute

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
facilityAttributeIds | int | Facility ID is one of the unique identifier for this Facility record
facilityIds | int | Facility Name is the unique identifier of the associated facility type
attributetypeIds | int | Attribute Type ID is the unique identifier of the associated attribute type
facilityattributes | string | Facility Attribute is one of the filter option and the parameter is for the Facility Attribute Type 
datalocktypeIds | int | Data Lock Type ID the unique identifier of the associated data lock type
lastModifiedStartDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
externalidentifier | string | External Identifier a unique identifier for this record to an external data system
comments | string | Comments any comments associated with this record


### 11. Operation Table

All data from the Operation table will be returned from the endpoint below. You can optionally fetch specific data by including the operation Ids, operation type Ids, emission type Ids, emission category Ids, unit Ids, equipment Ids, last modified start date and last modified end date. The Operation endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/operation' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/operation");
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
operationIds | int | Operation Ids are unique identifier for this operation type record
operationTypeIds | string | Operation Type Ids is one of the filter option and the parameter is for the type of the Operation Type
emissionTypeIds | int | The unique identifier of the associated emission type
emissionCategoryIds | int | The unique identifier of the associated emission category
unitIds | int | The unique identifier of the associated unit 
equipmentIds | int | The unique identifier of the associated equipment
lastModifiedStartDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | string | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"


### 12. Operation Type Table

All data from the Operation Type table will be returned from the endpoint below. You can optionally fetch specific data by including the operation type ids, operation types . The Operation Type endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/operationtype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/operationtype");
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
            "operationTypeId": "number",
            "operationType": "string",
            "parentOperationTypeId": "number",
            "compoundId": "number",
            "applicabilityFormula": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2020-09-01T15:55:25",
            "externalIdentifier": "number",
            "comments": "number",
            "refId": "number"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/operationtype

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
operationTypeIDs | int | The unique identifier for this operation type record
operationTypes | int | The type of operational data


### 13. Unit Table

All data from the Operation Type table will be returned from the endpoint below. You can optionally fetch specific data by including the operation type Ids, operation types . The Operation Type endpoint supports pagination.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/operationtype' };
request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/operationtype");
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
            "operationTypeId": "number",
            "operationType": "string",
            "parentOperationTypeId": "number",
            "compoundId": "number",
            "applicabilityFormula": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2020-09-01T15:55:25",
            "externalIdentifier": "number",
            "comments": "number",
            "refId": "number"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/operationtype

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
operationTypeIds | int | The unique identifier for this operation type record
operationTypes | string | The type of operational data

### 14. Workflow Table

This section outlines how to retrieve data from the Workflow table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Ids, workflow type Ids, workflow date for both start date and end date along with the last modified date. The workflow endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflow' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflow");
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
            "workflowId": "number",
            "workflowTypeId": "number",
            "workflowDate": "2017-02-13T22:15:30.203Z",
            "dataLockTypeId": "1",
            "alternateNames": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflow

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowIds | int | Unit ID is one of the unique identifier for this Unit record
workflowTypeIds | int | Unit Type Ids is the unique identifier of the associated unit type
workflow | string | Units is one of the filter option and the parameter is for the Name of the Unit


### 15. Workflow Answer Table

This section outlines how to retrieve data from the Workflow Answer table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Answer Ids, workflow Ids, workflow question Ids, category Answer Index, category Revision Index, question Answer Index, question Revision Index, workflow Answer, lastModifiedStartDate and lastModifiedEndDate. The Unit type endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowanswer' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowanswer");
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
            "workflowAnswerId": "number",
            "workflowId": "number",
            "workflowQuestionId": "number",
            "categoryAnswerIndex": "number",
            "categoryRevisionIndex": "number",
            "questionAnswerIndex": "number",
            "questionRevisionIndex": "number",
            "workflowAnswer": "2016-03-23",
            "dataLockTypeId": "number",
            "personId": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflowanswer

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowAnswerIds | int | Workflow Answer Id is the unique identifier of the associated workflow type.
workflowIds | int | Workflow ID is one of the unique identifier of the associated workflow.
workflowQuestionIds | int | Wokflow Question Ids is the unique identifier of the associated workflow question.
categoryAnswerIndex | int | Category Answer Index is one of the index of the answer for the category (used for categories that repeat).
categoryRevisionIndex | int | Category Revision Index is one of the revision index of the answer for the category (used for categories that can be revised).
questionAnswerIndex | int | Question Answer Index is one of the index of the answer (used for questions with multiple responses).
questionRevisionIndex | int | Question Revision Index is one of the revision index of the answer (used for questions that can be revised).
workflowAnswer | string | Wokflow Answer is the answer to the question..
lastModifiedStartDate | dateTime | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"
lastModifiedEndDate | dateTime | Date time format "yyyy/mm/dd T hours:min:secZ - Ex : 2017-02-13T22:15:30Z"

### 16. Workflow Equipment Table

This section outlines how to retrieve data from the Workflow Equipment table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Equipment Ids, workflow Ids, and Equipment Ids. The Workflow Equipment endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowEquipment' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowEquipment");
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
            "workflowEquipmentId": "number",
            "workflowId": "number",
            "equipmentId": "number",
            "workflowQuestionId": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflowEquipment

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowEquipmentIds | int | Workflow Equipment ID is one of the unique identifier for this workflow equipment record.
workflowIds | int | Workflow Ids is the unique identifier of the associated workflow.
equipmentIds | string | Equipment Id one of the filter option and the unique identifier of the associated equipment.

### 17. Workflow Facility Table

This section outlines how to retrieve data from the Workflow Facility table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Facility Ids, workflow Ids and facility Ids. The Unit type endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowfacility' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowfacility");
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
            "workflowFacilityId": "number",
            "workflowId": "number",
            "facilityId": "number",
            "workflowQuestionId": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string",
            "refId": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflowfacility

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowFacilityIds | int | workflow Facility ID is one of the unique identifier for this workflow facility record.
workflowIds | int | Unit Type Ids is the unique identifier of the associated workflow.
facilityIds | int | Units is one of he unique identifier of the associated facility.



### 18. Workflow Person Table

This section outlines how to retrieve data from the Workflow Person table using the provided endpoint. You have the flexibility to fetch specific data by including worfflow person Ids, workflow Ids and person Ids. The Unit type endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowperson' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowperson");
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
            "workflowPersonId": "number",
            "workflowId": "number",
            "personId": "number",
            "workflowQuestionId": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflowperson

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowPersonIds | int | Workflow Person ID is one of the unique identifier for this workflow person record.
workflowIds | int | workflow Ids is the unique identifier of the associated workflow.
personIds | int | Person Ids is one of the filter option and is the unique identifier of the associated person.

### 19. Workflow Question Table

This section outlines how to retrieve data from the Workflow Question table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Question Ids, workflow question categoy Ids, data type Ids, required Inds and questions. The Workflow Question endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowquestion' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowquestion");
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
            "workflowQuestionId": "number",
            "workflowQuestionCategoryId": "number",
            "question": "string",
            "dataTypeId": "number",
            "dataTypeSize": "number",
            "dataTypePrecision": "number",
            "dataTypeFilter": "string",
            "workflowAnswerListId": "number",
            "workflowAnswerList": "string",
            "defaultValue": "string",
            "alwaysEvaluateDefaultInd": "string",
            "displayInd": "string",
            "displayCondition": "string",
            "disabledInd": "string",
            "disabledCondition": "string",
            "requiredInd": "string",
            "validationCondition": "string",
            "validationErrorText": "string",
            "repeatInd": "string",
            "repeatDeleteInd": "string",
            "repeatDeleteConfirmInd": "string",
            "reviseInd": "string",
            "associateEntityInd": "string",
            "allowCopyInd": "string",
            "workflowTypeId": "number",
            "viewColumnName": "string",
            "sensitiveDataInd": "string",
            "xmlDescription": "string",
            "sortOrder": "number",
            "lastModifiedDate": "2017-02-13T22:15:30.203Z",
            "externalIdentifier": "string",
            "comments": "string"
        }
	]
}

```

**API Endpoints**

`GET` /api/v1/workflowquestion

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowQuestionIds | int | workflow Question ID is one of the unique identifier for this workflow question record.
workflowQuestionCategoryIds | int | workflow Question Category Ids is the unique identifier of the associated workflow question category.
dataTypeIds | int | Data Type Ids is the unique identifier of the associated data type.
requiredInds | string | Required Inds is the value If an answer is required before saving the form.
questions | string | questions is one of the form Question


### 20. Workflow Type Table

This section outlines how to retrieve data from the Workflow Type table using the provided endpoint. You have the flexibility to fetch specific data by including workflow Ids, workflow type Ids, and workflows. The Unit type endpoint also supports pagination for managing large datasets effectively.

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowtype' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowtype");
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
           "workflowTypeId": "number",
            "workflowType": "string",
            "workflowCategoryId": "number",
            "remoteInd": "string",
            "addCondition": "string",
            "openCondition": "string",
            "workflowAssociationsInd": "string",
            "fileAttachmentsInd": "string",
            "allowCopyInd": "string",
            "viewName": "string",
            "xmlDescription": "string",
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

`GET` /api/v1/workflowtype

**Query parameters**

Attribute | Type | Description
--------- | ---- | -----------
PageNumber | int | Page number of the results to fetch.
PageSize | int | The number of results per page
workflowTypeIds | int | Workflow Type ID is one of the unique identifier for this workflow type record.
workflowCategoryIds | int | Wokflow Category Ids is he unique identifier of the associated workflow category.
workflowTypes | string | Workflow Types is one of the filter option and the type of form.



