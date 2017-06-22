# Task API - Beta

The Task API gives you the ability to retrieve your Intelex tasks. These tasks can be found in the My Tasks Summary application in your Intelex platform. Tasks are object data records that are assigned to an employee in the Intelex system. You can create tasks by [creating records](#create-a-record) and setting the workflow's person responsible or re-assign tasks by [updating a record's person responsible](#updating-person-responsible)

The Task API is currently in beta. This means that we might make changes to the data returned or how requests are made with future Intelex releases.  Once the beta tag is removed, breaking changes to this API will be [versioned](#versioning).

## Metadata
> Example response with record metadata

```json
{
	"value": {
		"@odata.type": "#Intelex.IncidentsObject",
		"@odata.id": "https://intelex_url/api/v2/object/IncidentsObject(UID)",
	}
}
```

Records returned from the API will contain a few properties that provide some useful information.

Property | Description
--------- | -----------
@odata.type|The the entity type of the record. Also contains the object system name the record belongs to
@odata.id|A URL that can be used to access the record via the [Object Data API](#object-data-api)

## Pagination
> Example response with pagination link

```json
{
	"value": {
        "@odata.nextLink": "https://intelex_url/api/v2/task/mytasks?$skip=500"
	}
}
```

We've provided a convenient way to access more data in any request for sequential data where the number of records exceeds 500. Simply call the url in the nextLink parameter and we'll respond with the next set of data.

## Relational Data
Tasks resources have relations to Employees or Locations. These relations are accessible via the API as navigation properties. 

Each task resource will have navigation properties that can be used to access its related data in either the Employee or Location objects:

Resource | Available Navigation Properties
--------- | -----------
mytasks | Employee
stafftasks | Employee
locationtasks | Employee, Location
alltasks | Employee

You can use these navigation properties in [$expand]() queries to return the related data in-line with your tasks.

## Requesting Tasks

The following resources are similar to the application tabs you find in the My Tasks Summary application.  You will only be able to access the following resources if you have the correct permissions set for the 'Use Application Tab' security setting on the associated application tab in Intelex.

### Requesting Task Resources

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

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

Returns the task resource endpoints that you can access

#### GET /api/v2/task

Attribute | Description
--------- | -----------
name | The entity type of the record
kind | Entity set or function
url | Endpoint for resource

### Requesting My Tasks

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/mytasks");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"RespEmployeeName": "string",
		"DueDateType": "string",
		"LocationId": "string",
		"LocationName": "string",
		"NetObjectId": "string",
		"NetObjectType": "string",
		"NetTaskId": "string",
		"NextDate": "2017-06-25T04:00:00Z",
		"RecordDescription": "string",
		"Stage": "string",
		"TaskType": "string",
		"LegacyRecordId": "string",
		"LegacyRecordIdname": "string",
		"LegacyRespEmployeeId": "string",
		"LegacyTaskId": "string"
	  }
	]
}
```

Returns your tasks

#### GET /api/v2/task/mytasks

Attribute | Description
--------- | -----------
Id | Task ID
RespEmployeeName | Peron Responsible for Task
DueDateType | Overdue, Upcoming, None
LocationId | Location ID
LocationName | Location Name
NetObjectId | Object ID
NetObjectType | System name of object
NetTaskId | Object record ID
NextDate | Next assigned due date for task
RecordDescription | Task description
Stage | Workflow stage name
TaskType | Type of task
LegacyRecordId | Intelex v5 task ID
LegacyRecordIdName | Intelex v5 task name
LegacyRespEmployeeId | Intelex v5 employee ID
LegacyTaskId | Intelex v5 record ID

### Requesting My Staff's Tasks

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/stafftasks' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/stafftasks");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"RespEmployeeName": "string",
		"DueDateType": "string",
		"LocationId": "string",
		"LocationName": "string",
		"NetObjectId": "string",
		"NetObjectType": "string",
		"NetTaskId": "string",
		"NextDate": "2017-06-25T04:00:00Z",
		"RecordDescription": "string",
		"Stage": "string",
		"TaskType": "string",
		"LegacyRecordId": "string",
		"LegacyRecordIdname": "string",
		"LegacyRespEmployeeId": "string",
		"LegacyTaskId": "string"
	  }
	]
}
```

Returns all tasks assigned to employees that the user is supervisor of

#### GET /api/v2/task/stafftasks

Attribute | Description
--------- | -----------
Id | Task ID
RespEmployeeName | Peron Responsible for Task
DueDateType | Overdue, Upcoming, None
LocationId | Location ID
LocationName | Location Name
NetObjectId | Object ID
NetObjectType | System name of object
NetTaskId | Object record ID
NextDate | Next assigned due date for task
RecordDescription | Task description
Stage | Workflow stage name
TaskType | Type of task
LegacyRecordId | Intelex v5 task ID
LegacyRecordIdName | Intelex v5 task name
LegacyRespEmployeeId | Intelex v5 employee ID
LegacyTaskId | Intelex v5 record ID

### Requesting Location Tasks

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/locationtasks' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/locationtasks");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"RespEmployeeName": "string",
		"DueDateType": "string",
		"LocationName": "string",
		"NetObjectId": "string",
		"NetObjectType": "string",
		"NetTaskId": "string",
		"NextDate": "2017-06-25T04:00:00Z",
		"RecordDescription": "string",
		"Stage": "string",
		"TaskType": "string",
		"LegacyRecordId": "string",
		"LegacyRecordIdname": "string",
		"LegacyRespEmployeeId": "string",
		"LegacyTaskId": "string"
	  }
	]
}
```

Returns all tasks for a location. Default location is the user's logon location set in their user profile. Tasks returned will belong to the default location and its child locations.


#### GET /api/v2/task/locationtasks

Attribute | Description
--------- | -----------
Id | Task ID
RespEmployeeName | Peron Responsible for Task
DueDateType | Overdue, Upcoming, None
LocationName | Location Name
NetObjectId | Object ID
NetObjectType | System name of object
NetTaskId | Object record ID
NextDate | Next assigned due date for task
RecordDescription | Task description
Stage | Workflow stage name
TaskType | Type of task
LegacyRecordId | Intelex v5 task ID
LegacyRecordIdName | Intelex v5 task name
LegacyRespEmployeeId | Intelex v5 employee ID
LegacyTaskId | Intelex v5 record ID

##### Header Parameters

Parameter | Description
--------- | -----------
ActiveLocation | Provide the ID of the location you want to use as the active location for your request. Records returned will belong to the active location and its child locations


### Requesting All Tasks

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/alltasks' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/alltasks");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"RespEmployeeName": "string",
		"DueDateType": "string",
		"LocationId": "string",
		"LocationName": "string",
		"NetObjectId": "string",
		"NetObjectType": "string",
		"NetTaskId": "string",
		"NextDate": "2017-06-25T04:00:00Z",
		"RecordDescription": "string",
		"Stage": "string",
		"TaskType": "string",
		"LegacyRecordId": "string",
		"LegacyRecordIdname": "string",
		"LegacyRespEmployeeId": "string",
		"LegacyTaskId": "string"
	  }
	]
}
```

Returns all tasks in Intelex

#### GET /api/v2/task/alltasks

Attribute | Description
--------- | -----------
Id | Task ID
RespEmployeeName | Peron Responsible for Task
DueDateType | Overdue, Upcoming, None
LocationId | Location ID
LocationName | Location Name
NetObjectId | Object ID
NetObjectType | System name of object
NetTaskId | Object record ID
NextDate | Next assigned due date for task
RecordDescription | Task description
Stage | Workflow stage name
TaskType | Type of task
LegacyRecordId | Intelex v5 task ID
LegacyRecordIdName | Intelex v5 task name
LegacyRespEmployeeId | Intelex v5 employee ID
LegacyTaskId | Intelex v5 record ID

### Requesting Task Types

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/types' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/types");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"Caption": "string",
		"Name": "string",
		"Description",
		"Module": {
			"@odata.type": "string",
			"@odata.id": "string",
			"Id": "string",
			"Caption": "string",
			"UrlCaption": "string",
			"Description": "string"
		}
	  }
	]
}
```

Returns types of tasks you can create. This data is used to determine which objects have 'quick task creation' enabled

#### GET /api/v2/task/types

Attribute | Description
--------- | -----------
Id | Task type ID
Caption | System caption of object
Name | System name of object
Description | Description of object
Module.Captiom | System caption of application
Module.UrlCaptions | Navigation caption of application
Module.Description | Description of application