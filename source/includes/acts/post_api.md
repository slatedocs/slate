## Add or Modify Database Table

This section outlines the available POST APIs designed for modifying ACTS data. These APIs offer options for updating existing records and inserting new ones. 

* To insert new records, set the primary key to 0
* To updates to existing records, use the primary key of the record. 

<aside class="notice">
For efficient handling of larger data inserts, it is recommended to perform batch POSTs containing up to 500 rows each. 

Note that excessively large batch POSTs may encounter throttling or failure, depending on system resources.
</aside>

In the current release, four POST APIs End points are provided to add or update following table 

* Equipment
* Equipment Attribute
* Facility
* Facility Attribute
* Operation
 
POST requests to these endpoints should be formatted in JSON.

### 1. Equipment Table 

This section guides you through the process of modifying existing equipment records or adding new entries to the Equipment table using the designated API endpoint.

**Equipment POST endpoint**

`POST` api/v1/equipment

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipment',
  headers: { 'content-type': 'application/json' },
  body:
    { EquipmentID: 'number',
      areaId: '2017-02-13T22:15:30.203Z',
      facilityId: 'number',
      equipmentTypeId: 0,
      sourceName: 'string',
      equipmentStatusId: 'number' ,
      modelId: 'number',
      ownershipId: 'number',
      ownerId: 'number',
      facilityTypeId: 'number',
      serialNumber: 'number',
      manufactureDate: '2023-06-25T04:00:00Z',
      internalName: 'string',
      alternateName: 'string',
      design: 'string',
      originalSurveyDate: '2023-06-25T04:00:00Z',
      activeDate: '2023-08-25T04:00:00Z',
      inactiveDate: '2023-08-25T04:00:00Z',
      dataLockTypeId: 'number',
      lastModifiedDate: '2023-06-25T04:00:00Z',
      externalIdentifier: 'string',
     comments: 'string'
	 },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipment");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"EquipmentID\": \"number\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body

```json
[
  {
    "equipmentID": "number",
    "areaId": "number",
    "facilityId": "number",
    "equipmentTypeId": "number",
    "sourceName": "string ",
    "equipmentStatusId": "number",
    "modelId": "number",
    "ownershipId": "number",
    "ownerId": "number",
    "facilityTypeId": "number",
    "serialNumber": "number",
    "manufactureDate": "2023-06-25T04:00:00Z",
    "internalName": "string",
    "alternateName": "string",
    "design": "string",
    "originalSurveyDate": "2023-06-25T04:00:00Z",
    "activeDate": "2023-06-25T04:00:00Z",
    "inactiveDate": "2023-06-25T04:00:00Z",
	  "dataLockTypeId": "number",
    "lastModifiedDate": "2023-06-25T04:00:00Z",
    "externalIdentifier": "string",
    "comments": "string"
	}
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "Equipment ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```

### 2. Equipment Attribute Table 

This section outlines the process of adding new entries or modifying existing records within the Equipment Attribute table using the dedicated API endpoint.

**Equipment Attribute POST Endpoint**

`POST` api/v1/equipmentattribute

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/equipmentattribute',
  headers: { 'content-type': 'application/json' },
  body:
      { 
          EquipmentAttributeId: 'number',
          EquipmentId: 'number',
          AttributeTypeId: 'number',
          EquipmentAttribute:"string",
          DataLockTypeId: 'number',
          LastModifiedDate: '2023-03-30T07:27:06.295Z',
          ExternalIdentifier: 'string',
          Comments:'string'},
          json: true };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/equipmentattribute");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"EquipmentAttributeId\": \"number\",\r\n    \"EquipmentId\": \"number\",\r\n    \"AttributeTypeId\": \"number\",\r\n    \"EquipmentAttribute\": \"string\",\r\n    \"DataLockTypeId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  { 
	  "EquipmentAttributeId": "number",
    "EquipmentId": "number",
    "AttributeTypeId": "number",
    "EquipmentAttribute":"string",
    "DataLockTypeId": "number",
    "LastModifiedDate": "2023-03-30T07:27:06.295Z",
    "ExternalIdentifier": "string",
    "Comments":"string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "EquipmentAttribute ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```

### 3. Facility Table 

This section outlines the process of adding new entries or modifying existing records within the Facility table using the dedicated API endpoint.

**Facility POST Endpoint**

`POST` api/v1/facility

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/facility',
  headers: { 'content-type': 'application/json' },
  body:
   { ActionsTaken: 'string',
     Date: '2017-02-13T22:15:30.203Z',
     Description: 'string',
     IncidentNo: 0,
     ReportedDate: '2017-02-13T22:15:30.203Z',
     SuspectedCause: 'string' },
     json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/operation");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"ActionsTaken\": \"string\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
      "facilityId": "number",
      "facilityName": "number",
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
```

> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "Facility ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```

### 4. Facility Attribute Table 

This section outlines the process of adding new entries or modifying existing records within the Facility Attribute table using the dedicated API endpoint.

**Facility Attribute POST Endpoint**

`POST` api/v1/facilityattribute

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/facilityattribute',
  headers: { 'content-type': 'application/json' },
  body:
   { 
      FacilityAttributeId: 'number',
      FacilityId: 'number',
      AttributeTypeId: 'number',
      FacilityAttribute:"string",
      DataLockTypeId: 'number',
      LastModifiedDate: '2023-03-30T07:27:06.295Z',
      ExternalIdentifier: 'string',
      Comments:'string'},
      json: true };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/facilityattribute");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"FacilityAttributeId\": \"number\",\r\n    \"FacilityId\": \"number\",\r\n    \"AttributeTypeId\": \"number\",\r\n    \"FacilityAttribute\": \"string\",\r\n    \"DataLockTypeId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
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
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "FacilityAttribute ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```

### 5. Operation Table 

This section outlines the process of adding new entries or modifying existing records within the Operation table using the dedicated API endpoint.

**Operation POST Endpoint**

`POST` api/v1/operation

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/operation',
  headers: { 'content-type': 'application/json' },
  body:
   { operationId: 'number',
     equipmentId: 'number',
     emissionTypeId: 'number',
	   emissionCategoryId: 'number',
     operationTypeId: 'number',
     activeDate: '2023-06-25T04:00:00Z',
     unitId: 'number',
     controlledInd: 'string',
     estimatedInd: 'string',
     invalidInd: 'string',
     calculateEmissionsInd: 'string',
     collectionDate: '2023-06-25T04:00:00Z',
     fieldEventId: 'number',
     inactiveDate: "2023-06-25T04:00:00Z",
     dataLockTypeId: 'number',
     lastModifiedDate: "2023-06-25T04:00:00Z",
     externalIdentifier: 'string',
     comments: 'string',
     badDataFlag: 'number(1,0)',
     operationAmount: 'number' },
     json: true };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/operation");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"ActionsTaken\": \"string\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```
> Input JSON Body

```json
[
  {
    "operationId": "number",
    "equipmentId": "number",
    "emissionTypeId": "number",
    "emissionCategoryId": "number",
    "operationTypeId": "number",
    "activeDate": "2023-06-25T04:00:00Z",
    "unitId": "number",
    "controlledInd": "string",
    "estimatedInd": "string",
    "invalidInd": "string",
    "calculateEmissionsInd": "string",
    "collectionDate": "2023-06-25T04:00:00Z",
    "fieldEventId": "number",
    "inactiveDate": "2023-06-25T04:00:00Z",
    "dataLockTypeId": "number",
    "lastModifiedDate": "2023-06-25T04:00:00Z",
    "externalIdentifier": "string",
    "comments": "string",
    "badDataFlag": "number(1,0)",
    "operationAmount": "number"
  } 
]

```

> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "Operation ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### 6. Workflow Table 

This section outlines the process of adding new entries or modifying existing records within the Workflow table using the dedicated API endpoint.

**Workflow POST Endpoint**

`POST` api/v1/workflow

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflow',
  headers: { 'content-type': 'application/json' },
  body:
      {
        "workflowId": "number",
        "workflowTypeId": "number",
        "workflowDate": "2024-01-03T08:16:24.155Z",
        "dataLockTypeId": "number",
        "lastModifiedDate": "2024-01-03T08:16:24.155Z",
        "externalIdentifier": "string",
        "comments": "string"
      };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflow");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"WorkflowId\": \"number\",\r\n    \"WorkflowTypeId\": \"number\",\r\n    \"WorkflowDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"DataLockTypeId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
        "WorkflowId": "number",
        "WorkflowTypeId": "number",
        "WorkflowDate": "2024-01-03T08:16:24.155Z",
        "DataLockTypeId": "number",
        "LastModifiedDate": "2024-01-03T08:16:24.155Z",
        "ExternalIdentifier": "string",
        "Comments": "string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "Workflow Id : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### 7. Workflow Answer Table 

This section outlines the process of adding new entries or modifying existing records within the Workflow Answer table using the dedicated API endpoint.

**Workflow Answer POST Endpoint**

`POST` api/v1/workflowAnswer

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowAnswer',
  headers: { 'content-type': 'application/json' },
  body:
      {
       "workflowAnswerId": "number",
        "workflowId": "number",
        "workflowQuestionId": "number",
        "categoryAnswerIndex": "number",
        "categoryRevisionIndex": "number",
        "questionAnswerIndex": "number",
        "questionRevisionIndex": "number",
        "workflowAnswer": "string",
        "dataLockTypeId": "number",
        "personId": "number",
        "lastModifiedDate": "2024-01-03T08:16:24.155Z",
        "externalIdentifier": "string",
        "comments": "string"
      };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowAnswer");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"WorkflowAnswerId\": \"number\",\r\n    \"WorkflowId\": \"number\",\r\n    \"WorkflowQuestionId\": \"number\",\r\n    \"CategoryAnswerIndex\": \"number\",\r\n    \"CategoryRevisionIndex\": \"number\",\r\n     \"QuestionAnswerIndex\": \"number\",\r\n     \"QuestionRevisionIndex\": \"number\",\r\n     \"WorkflowAnswer\": \"string\",\r\n    \"DataLockTypeId\": \"number\",\r\n    \"PersonId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
        "WorkflowAnswerId": "number",
        "WorkflowId": "number",
        "WorkflowQuestionId": "number",
        "CategoryAnswerIndex": "number",
        "CategoryRevisionIndex": "number",
        "QuestionAnswerIndex": "number",
        "QuestionRevisionIndex": "number",
        "WorkflowAnswer": "string",
        "DataLockTypeId": "number",
        "PersonId": "number",
        "LastModifiedDate": "2024-01-03T08:16:24.155Z",
        "ExternalIdentifier": "string",
        "Comments": "string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "Workflow Answer Id : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### 8. Workflow Equipment Table 

This section outlines the process of adding new entries or modifying existing records within the Workflow Equipment table using the dedicated API endpoint.

**Workflow Equipment POST Endpoint**

`POST` api/v1/workflowEquipment

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowEquipment',
  headers: { 'content-type': 'application/json' },
  body:
      {
        "workflowEquipmentId": "number",
        "workflowId": "number",
        "equipmentId": "number",
        "workflowQuestionId": "number",
        "lastModifiedDate": "2024-01-03T08:16:24.155Z",
        "externalIdentifier": "string",
        "comments": "string"
      };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowEquipment");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"WorkflowEquipmentId\": \"number\",\r\n    \"WorkflowId\": \"number\",\r\n    \"EquipmentId\": \"number\",\r\n    \"WorkflowQuestionId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
        "WorkflowEquipmentId": "number",
        "WorkflowId": "number",
        "EquipmentId": "number",
        "WorkflowQuestionId": "number",
        "LastModifiedDate": "2024-01-03T08:16:24.155Z",
        "ExternalIdentifier": "string",
        "Comments": "string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "Workflow Equipment Id : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### 9. Workflow Facility Table 

This section outlines the process of adding new entries or modifying existing records within the Workflow Facility table using the dedicated API endpoint.

**Workflow Facility POST Endpoint**

`POST` api/v1/workflowFacility

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowFacility',
  headers: { 'content-type': 'application/json' },
  body:
      {
        "workflowFacilityId": "number",
        "workflowId": "number",
        "facilityId": "number",
        "workflowQuestionId": "number",
        "lastModifiedDate": "2024-01-03T08:16:24.155Z",
        "externalIdentifier": "string",
        "comments": "string"
      };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/workflowFacility");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"WorkflowFacilityId\": \"number\",\r\n    \"WorkflowId\": \"number\",\r\n    \"FacilityId\": \"number\",\r\n    \"WorkflowQuestionId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
        "WorkflowFacilityId": "number",
        "WorkflowId": "number",
        "FacilityId": "number",
        "WorkflowQuestionId": "number",
        "LastModifiedDate": "2024-01-03T08:16:24.155Z",
        "ExternalIdentifier": "string",
        "Comments": "string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json

{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "Workflow Facility Id : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### 10. Workflow Person Table 

This section outlines the process of adding new entries or modifying existing records within the Workflow Person table using the dedicated API endpoint.

**Workflow Person POST Endpoint**

`POST` api/v1/workflowPerson

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://[tenant].actsapi.intelex.com/v1/workflowPerson',
  headers: { 'content-type': 'application/json' },
  body:
      {
        "workflowPersonId": "number",
        "workflowId": "number",
        "personId": "number",
        "workflowQuestionId": "number",
        "lastModifiedDate": "2024-01-03T08:16:24.155Z",
        "externalIdentifier": "string",
        "comments": "string"
      };


request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://[tenant].actsapi.intelex.com/v1/WorkflowPerson");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"WorkflowPersonId\": \"number\",\r\n    \"WorkflowId\": \"number\",\r\n    \"PersonId\": \"number\",\r\n    \"WorkflowQuestionId\": \"number\",\r\n    \"LastModifiedDate\": \"2023-03-30T07:27:06.295Z\",\r\n    \"ExternalIdentifier\": \"string\",\r\n    \"Comments\": \"string\"}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Input JSON Body 

```json
[
  {
        "WorkflowPersonId": "number",
        "WorkflowId": "number",
        "PersonId": "number",
        "WorkflowQuestionId": "number",
        "LastModifiedDate": "2024-01-03T08:16:24.155Z",
        "ExternalIdentifier": "string",
        "Comments": "string"
  }
]
```
> Example Response

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json

{
    "insertedRowCount" : 0 , 
    "updatedRowCount" : 1 ,
    "failureCount" : 1 ,
    "errorMessage" : [
	 "Workflow Person Id : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
### JSON body for both Insert & Update 

#### JSON Input body for Insert 

If the primary id is zero - "0" then the data we are passing is handled as an insert, shown in the example below, where "EquipmentAttributeId" is passed as "0". 

Parameter | Description
--------- | -----------
EquipmentAttributeId  | EquipmentAttributeId for insert we do pass the input as zero "0"
EquipmentId  | EquipmentId accepts the numbers as input 
AttributeTypeId  | AttributeTypeId accepts the numbers as input 
EquipmentAttribute  | EquipmentAttribute accepts the string data as input 
DataLockTypeId | DataLockTypeId accepts the numbers as input 
LastModifiedDate  | LastModifiedDate is given in a date and time format 
ExternalIdentifier  | ExternalIdentifier accepts the string data as input
Comments  | Comments accepts the string data as input

> Example Input JSON Body For Insert 

```json
[
    {
        "EquipmentAttributeId": 0,
        "EquipmentId": "number",
        "AttributeTypeId": "number",
		    "EquipmentAttribute":"string",
        "DataLockTypeId": "number",
        "LastModifiedDate": "datetime",
        "ExternalIdentifier": "string",
		    "Comments":"string"
    }
]
```

> Example Input JSON Body For Update 

#### JSON Input body for Update

If the primary id is an existing ID - "#####" then the data we are passing is handled as an update, shown in the example below, where "EquipmentAttributeId" is passed as "164". 

Parameter | Description
--------- | -----------
EquipmentAttributeId  | EquipmentAttributeId for insert we do pass the input as integer like "164"
EquipmentId  | EquipmentId accepts the numbers as input 
AttributeTypeId  | AttributeTypeId accepts the numbers as input 
EquipmentAttribute  | EquipmentAttribute accepts the string data as input 
DataLockTypeId | DataLockTypeId accepts the numbers as input 
LastModifiedDate  | LastModifiedDate is given in a date and time format 
ExternalIdentifier  | ExternalIdentifier accepts the string data as input
Comments  | Comments accepts the string data as input


```json
[
    {
        "EquipmentAttributeId": 164,
        "EquipmentId": "number",
        "AttributeTypeId": "number",
		    "EquipmentAttribute":"string",
        "DataLockTypeId": "number",
        "LastModifiedDate": "datetime",
        "ExternalIdentifier": "string",
		    "Comments":"string"
    }
]
```

> Example Output For Both Update and Insert 

```json
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update

```json
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "Operation ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```

