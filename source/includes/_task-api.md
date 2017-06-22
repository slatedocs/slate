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

## Querying Tasks

You can use the following query options on any of the Task API resources

### Query option: $select

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks',
  qs: { '$select': 'RecordDescription' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/mytasks?$select=RecordDescription");
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
		"RecordDescription": "string"
	  }
	]
}
```

The $select system query option allows clients to request a limited set of fields for each task.

#### GET /task/mytasks?$select={field_name}

Option | Example Values
--------- | -----------
Select a single field | $select=RecordDescription
Select mutliple fields | $select=RecordDescription, RespEmployeeName

##### URL Parameters

Parameter | Description
--------- | -----------
field_name | Field name(s) to include in response

### Query option: $count

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks',
  qs: { '$count': 'true' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/mytasks?$count=true");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.count": 1,
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

The $count system query option with a value of true specifies that the total count of items within a collection matching the request be returned along with the result.

#### GET /task/mytasks?$count=true

### Query option: $top and $skip

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks',
  qs: { '$skip': '10', '$top': '5' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/mytasks?$skip=10&$top=5");
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

The $top system query option requests the number of items in the queried collection to be included in the result. The $skip query option requests the number of items in the queried collection that are to be skipped and not included in the result.

#### GET /task/mytasks?$top={top_n}&$skip={skip_n}

##### Query Parameters
Parameter | Description
--------- | -----------
top_n | Number of items to be included in the response
skip_n| Number of items to be skipped

### Query option: $orderby

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks',
  qs: { '$orderby': 'NextDate desc' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/mytasks?$orderby=NextDate desc");
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

The $orderby system query option allows clients to request tasks in either ascending order using 'asc' or descending order using 'desc'. Default is ascending. The request below sorts the collection by date in descending order.

#### GET /task/mytasks?$orderby={field_name}

Option | Example Values
-------- | --------
Sort by descending|$orderby=NextDate desc
Sort by ascending|$orderby=NextDate asc
Sort by drop-down value |$orderby=RespEmployeeName
Sort by multiple fields|$orderby=NextDate, RecordDescription

##### Query Parameters

Parameter | Description
--------- | -----------
field_name | Fields that you want to sort by

### Query option: $filter

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/mytasks',
  qs: { '$filter': 'RespEmployeeName eq \'Steve Rogers\'' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("http://cloud3.intelex.com/wabouchalha/api/v2/task/mytasks?%24filter=RespEmployeeName%20eq%20'Steve%20Rogers'");
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


The $filter system query option allows clients to filter a collection of task. The expression specified with $filter is evaluated for each task in the collection, and only items where the expression evaluates to true are included in the response. There are built-in filter operators that can be used in order to retrieve the data you need

#### GET /task/mytasks?$filter={filter_expression}

##### Query Parameters

Parameter | Description
--------- | -----------
filter_expression | Filter expression used to query data

##### Comparison Operators:
|Name|Description|Example Values|
|---|---|---|
|eq|Equal|DueDateType eq Enum.DueDateType'Overdue'
|ne|Not equal|RecordDescription ne null
|gt|Greater than|NextDate gt 2017-01-01
|ge|Greater than or equal|NextDate ge 2017-01-01
|lt|Less than|NextDate lt 2017-01-01
|le|Less than or equal|NextDate le 2014-11-24T12:55:05.35-05:00

##### Logical Operators:
|Name|Description|Example Values|
|---|---|---|
|and|Logical and|RecordDescription ne null and RespEmployeeName eq 'Steve Rogers'
|or|Logical or|RecordDescription eq null or NextDate gt 2017-01-01
|not|Logical not|not(contains(RecordDescription, 'accident'))

##### Grouping Operators:
|Name|Description|Example Values|
|---|---|---|
|(   )|Precedence grouping|RespEmployeeName eq 'Steve Rogers' and (contains(TaskType, 'Safety') or contains(RecordDescription, 'Safety'))

##### Functions:
|Name|Description|Example Values|
|---|---|---|
|contains(Field, Value)|Sub-string search|contains(RecordDescription, 'accident'))

##### Filtering using Relation Fields:
|Description|Example Values|
|---|---|
|Filtering by Employee name |Employee/Name eq 'Steve Rogers'
|Filtering by Location name|Location/Name eq 'Toronto'

### Query option: $expand

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/task/locationtasks',
  qs: { '$expand': 'Location' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/task/locationtasks?$expand=Location");
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
		"LegacyTaskId": "string",
		"Location": {
			"@odata.type": "string",
			"@odata.id": "string",
			"@odata.editLink": "string",
			"Id": "string",
			"DateCreated": "2015-01-28T16:24:19.63-05:00",
			"DateModified": "2016-04-21T15:02:38.723-04:00",
			"Address1": null,
			"Address2": null,
			"Area": null,
			"BusinessUnits": null,
			"City": null
		}
	  }
	]
}
```

The $expand system query option specifies the related object records to be included in-line with requested tasks. The parameter accepts a comma-separated list of relation field names. Use the system name of the relation type field or lookup type field in your query.

#### GET /task/mytasks?$expand={relation_field}

|Option|Example Values|
| -------- | -------- |
|Expand Employee|$expand=Employee|
|Expand Employee and Location|$expand=Employee, Location|
|Expand all relations|$expand=*|
|Select expanded fields|$expand=Location($select=Name)|
|Sort expanded collection|$expand=Location($orderby=Name)|

##### Query Parameters

Parameter | Description
--------- | -----------
relation_field | Relation field used to request related object data