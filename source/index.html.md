---
title: Intelex REST API

language_tabs:
  - javascript: JavaScript
  - csharp: C#

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction
> **API Base Path**

```
https://intelex_url/api/v2/
```

The Intelex REST API has predictable, resource-oriented URLs, and uses HTTP response codes
to indicate API errors.  We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients.

Each API endpoint has the following base path:
```
https://YourIntelexSiteURL/api/v2/
```
<aside class="notice">
You must replace <code>YourIntelexSiteURL</code> with the URL for your Intelex platform instance
</aside>

For example, if your Intelex Platform instance URL is:
```
https://clients.intelex.com/Login/YourCompanyName
```

Then your API endpoint base path will be:
```
https://clients.intelex.com/Login/YourCompanyName/api/v2/
```

# Authentication

> To authorize, use this code:

```javascript
var request = require("request");

var options = {
  headers: { authorization: 'Basic hello' }
  };
});
```

```csharp
var request = new RestRequest(Method.GET);
request.AddHeader("authorization", "Basic hello");
```

> Make sure to replace `hello` with your credentials.

Authentication to the API is performed via HTTP Basic Auth and your Intelex user credentials. All API requests must be made over HTTPS. API requests without authentication will fail.

Exception Type | Exception Message
-------------- | --------------
1001|The user [username] wasn't found. Please check the user name and try again. If you continue to encounter this error, please contact your support team
1002|Your account is locked. Please try again later or contact your system administrator
1003|Authentication failed. Password is incorrect
1004|Password doesn't match current account policy. Please change the password
1005|Your password is expired

# Object Data Service

> **API Endpoint**

```
https://intelex_url/api/v2/object
```
The Intelex Object Data Service is a RESTful service that provides read/write access to object data records. Each Intelex object is a resource that can be accessed via an API Endpoint.  Use the system name of the object as your resource.

Example:
```
https://intelex_url/api/v2/object/IncidentsObject
```
<aside class="notice">
You must replace <code>IncidentsObject</code> with the system name of the object you want to access
</aside>

### Record Metadata
> Metadata properties in responses

```json
{
	"value": {
		"@odata.type": "#Intelex.IncidentsObject",
		"@odata.id": "https://intelex_url/api/v2/object/IncidentsObject(UID)",
		"@odata.editLink": "https://intelex_url/api/v2/object/IncidentsObject(UID)"
	}
}
```

Each record returned from the API will contain a few standard properties that provide some useful information.

Property | Description
--------- | -----------
@odata.type|The entity type of the record. Useful when requesting records from parent objects
@odata.id|A URL that can be used to access the record
@odata.editLink|Denotes if the record can be modified by the user making the request. Same as @odata.id link

### Pagination
> Pagination response

```json
{
	"value": {
        "@odata.nextLink": "https://intelex_url/api/v2/object/IncidentsObject?$skip=500"
	}
}
```

We've provided a convenient way to access more data in any request for sequential data where the number of records exceeds 500. Simply call the url in the nextLink parameter and we'll respond with the next set of data.

## Request records

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```

Returns all records from the Incidents object that the user is authorized to view

### GET /api/v2/object/{intelex_object}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

## Request a specific record

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"@odata.type": "string",
	"@odata.id": "string",
	"@odata.editLink": "string",
	"Id": "string",
	"ActionsTaken": "string",
	"Date": "2017-02-13T22:15:30.203Z",
	"Description": "string",
	"IncidentNo": 0,
	"ReportedDate": "2017-02-13T22:15:30.203Z",
	"SuspectedCause": "string"
}
```

Returns an individual record from the Incidents object by referencing the UID of the record

### GET /object/{intelex_object}({id})

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record being requested


## Request related records

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```

Navigating to related records allows clients to request only the relational data belonging to a parent record. This includes relation type fields, lookup type fields, private document attachments, and workflow.

### GET /object/{intelex_object}({id})/{navigation_property}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record being requested
navigation_property|The Intelex system name of the relation type or lookup type field

## Request a specific related record

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents(UID)' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents(UID)");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"@odata.type": "string",
	"@odata.id": "string",
	"@odata.editLink": "string",
	"Id": "string",
	"ActionsTaken": "string",
	"Date": "2017-02-13T22:15:30.203Z",
	"Description": "string",
	"IncidentNo": 0,
	"ReportedDate": "2017-02-13T22:15:30.203Z",
	"SuspectedCause": "string"
}
```

Navigating to related records allows clients to request only the relational data belonging to a parent record. This includes relation type fields, lookup type fields, private document attachments, and workflow.

### GET /object/{intelex_object}({id})/{navigation_property}({id})

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record being requested
navigation_property|The Intelex system name of the relation type or lookup type field

## Query option: $select

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
  qs: { '$select': 'IncidentNo' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?$select=IncidentNo");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"IncidentNo": 0
	  }
	]
}
```

The $select system query option allows clients to request a limited set of fields for each record.

### GET /object/{intelex_object}?$select={field_name}

Option | Example Values
--------- | -----------
Select a single field | $select=IncidentNo
Select mutliple fields | $select=IncidentNo, Description

### URL Parameters

Parameter | Description
--------- | -----------
field_name | Field name(s) to include in response

## Query option: $count

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
  qs: { '$count': 'true' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?$count=true");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"@odata.count": 1,
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```

The $count system query option with a value of true specifies that the total count of items within a collection matching the request be returned along with the result.

### GET /object/{intelex_object}?$count=true

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

## Query option: $top and $skip

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
  qs: { '$skip': '10', '$top': '5' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?Rskip=10&$top=5");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```

The $top system query option requests the number of items in the queried collection to be included in the result. The $skip query option requests the number of items in the queried collection that are to be skipped and not included in the result.

### GET /object/{intelex_object}?$top={top_n}&$skip={skip_n}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

### Query Parameters
Parameter | Description
--------- | -----------
top_n | Number of items to be included in the response
skip_n| Number of items to be skipped

## Query option: $orderby

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://clients.intelex.com/IntelexTechnologies/api/v2/object/IncidentsObject',
  qs: { '$orderby': 'DateCreateddesc' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?$orderby=DateCreateddesc");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```

The $orderby system query option allows clients to request records in either ascending order using 'asc' or descending order using 'desc'. Default is ascending. The request below sorts the collection by date in descending order.

### GET /object/{intelex_object}?$orderby={field_name}

Option | Example Values
-------- | --------
Sort by descending|$orderby=DateCreated desc
Sort by ascending|$orderby=DateCreated asc
Sort by drop-down value |$orderby=Severity/Caption
Sort by multiple fields|$orderby=DateCreated, Severity/Caption
Sort by workflow person responsible|$orderby=Workflow/PersonResponsible/Name

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

### Query Parameters

Parameter | Description
--------- | -----------
field_name | Fields that you want to sort by

## Query option: $filter

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
  qs: { '$filter': 'IncidentNo eq 1000' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?$filter=IncidentNo eq 10");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string"
	  }
	]
}
```


The $filter system query option allows clients to filter a collection of records. The expression specified with $filter is evaluated for each record in the collection, and only items where the expression evaluates to true are included in the response. There are built-in filter operators that can be used in order to retrieve the data you need

### GET /object/{intelex_object}?$filter={filter_expression}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

### Query Parameters

Parameter | Description
--------- | -----------
filter_expression | Filter expression used to query data


### Comparison Operators:
|Name|Description|Example Values|
|---|---|---|
|eq|Equal|Severity/Value eq 'Moderate'
|ne|Not equal|Workflow/PersonResponsible/Name ne 'AC Slater'
|gt|Greater than|IncidentNo gt 1000
|ge|Greater than or equal|DateCreated ge 2017-01-01
|lt|Less than|IncidentNo lt 1000
|le|Less than or equal|DateCreated le 2014-11-24T12:55:05.35-05:00

### Logical Operators:
|Name|Description|Example Values|
|---|---|---|
|and|Logical and|Description ne null and Workflow/PersonResponsible/Name eq 'AC Slater'
|or|Logical or|Cause eq true or IncidentNo gt 1000
|not|Logical not|not(contains(Description, 'accident'))

### Grouping Operators:
|Name|Description|Example Values|
|---|---|---|
|(   )|Precedence grouping|IncidentNo gt 1000 and (Severity/Value eq 'Moderate' or contains(Description, 'fall'))

### Functions:
|Name|Description|Example Values|
|---|---|---|
|contains(Field, Value)|Sub-string search|contains(Description, 'accident'))

### Filtering using Relation Fields:
|Description|Example Values|
|---|---|
|Filtering by drop-down value |Severity/Value eq 'Moderate'
|Filtering by sub-record values|SubIncidents/any(x:x/SubIncidentId gt 1000)

### Filtering using Workflow:
|Description|Example Values|
|---|---|
|Filter based on person responsible|Workflow/PersonResponsible/Name eq 'AC Slater'
|Filter based on workflow status (enum)|Workflow/WorkflowStatus eq Enum.WorkflowStatusType'Completed'

### Filter alias
@me is an alias that can be used in expressions to filter based on your identity'

|Description|Example Values|
|---|---|
|Filter where you are the person responsible|$filter=Workflow/PersonResponsible eq @me|



## Query option: $expand

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
  qs: { '$expand': 'Location' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject?$expand=Location");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"value": [
	  {
		"@odata.type": "string",
		"@odata.id": "string",
		"@odata.editLink": "string",
		"Id": "string",
		"ActionsTaken": "string",
		"Date": "2017-02-13T22:15:30.203Z",
		"Description": "string",
		"IncidentNo": 0,
		"ReportedDate": "2017-02-13T22:15:30.203Z",
		"SuspectedCause": "string",
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

The $expand system query option specifies the related object records and lookup object records to be included in-line with requested records. The parameter accepts a comma-separated list of relation field names. Use the system name of the relation type field or lookup type field in your query.

### GET /object/{intelex_object}?$expand={relation_field}

|Option|Example Values|
| -------- | -------- |
|Expand a single relation field|$expand=Severity|
|Expand multiple relation fields|$expand=Severity, Workflow|
|Expand all relations|$expand=*|
|Nested expand|$expand=Workflow($expand=PersonResponsible)|
|Select expanded fields|$expand=Severity($select=Name)|
|Sort expanded collection|$expand=SubIncidents($orderby=DateCreated)|

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

### Query Parameters

Parameter | Description
--------- | -----------
relation_field | Relation field used to request related object data

## Create a record

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/object/IncidentsObject',
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
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"ActionsTaken\": \"string\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"@odata.type": "string",
	"@odata.id": "string",
	"@odata.editLink": "string",
	"Id": "string",
	"ActionsTaken": "string",
	"Date": "2017-02-13T22:15:30.203Z",
	"Description": "string",
	"IncidentNo": 0,
	"ReportedDate": "2017-02-13T22:15:30.203Z",
	"SuspectedCause": "string"
}
```


Creates a record with values in the object specified in the path. A client generated GUID can be used when creating records. Creating a record also supports setting a value for related fields, lookup types, or workflow person responsible. You can do this by binding the @odata.id property of the related record to the field.

### POST /object/{intelex_object}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject

### Header Parameters

When you create a record you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is created. In order to execute a workflow stage action within a create request, you'll need to provide a  header parameter.


Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab


> Creating a record:

```json
{
	"ActionsTaken": "string",
	"Date": "2017-02-13T22:15:30.203Z",
	"Description": "string",
	"IncidentNo": 0,
	"ReportedDate": "2017-02-13T22:15:30.203Z",
	"SuspectedCause": "string"
}
```

> Creating a record and setting a location value:

```json
{
	"Location@odata.bind": "https://intelex_url/api/v2/object/SysLocationEntity(Id)"
}
```

> Creating a record and setting a lookup type value:

```json
{
	"Severity@odata.bind": "https://intelex_url/api/v2/object/SeverityLookupObject(Id)"
}
```

> Creating a record and setting person responsible:

```json
{
	"Workflow": {
		"PersonResponsible@odata.bind": "https://intelex_url/api/v2/object/SysEmployeeEntity(Id)"
	}
}
```

> Creating a record and attaching related records:

```json
{
	"RelatedIncidents@odata.bind": [
		"https://intelex_url/api/v2/object/RelatedIncidentObject(Id)",
		"https://intelex_url/api/v2/object/RelatedIncidentObject(Id)"
	]
}
```

## Create a sub-record

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents',
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
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"ActionsTaken\": \"string\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> The above command returns JSON structured like this:

```json
{
	"@odata.type": "string",
	"@odata.id": "string",
	"@odata.editLink": "string",
	"Id": "string",
	"ActionsTaken": "string",
	"Date": "2017-02-13T22:15:30.203Z",
	"Description": "string",
	"IncidentNo": 0,
	"ReportedDate": "2017-02-13T22:15:30.203Z",
	"SuspectedCause": "string"
}
```

You can also create related records by sending POST requests to navigation properties. This request will create the record in the related object referenced by the navigation_property. Setting location,person responsible, and attaching related records is also supported when creating related records.

### POST /object/{intelex_object}({id})/{navigation_property}

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id| The Intelex UID of the parent record
navigation_property|The Intelex system name of the relation type field that supports sub-records i.e. "Has a list of attached"

### Header Parameters

When you create related records you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is created. In order to execute a workflow stage action within a create request, you'll need to provide a  header parameter.

Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab

## Update a record

```javascript
var request = require("request");

var options = { method: 'PATCH',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)',
  headers: { 'content-type': 'application/json' },
  body: { Description: 'string' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)");
var request = new RestRequest(Method.PATCH);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"Description\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

Updates a record in the object specified in the path. You can update values for related fields, lookup types by binding the @odata.id property of the related record to the field.

### PATCH /object/{intelex_object}({id})

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being updated

> Updating a record:

```json
{
	"Description": "string"
}
```

> Updating a location value:

```json
{
	"Location@odata.bind": "https://intelex_url/api/v2/object/SysLocationEntity(UID)"
}
```

> Updating a lookup type value:

```json
{
	"Severity@odata.bind": "https://intelex_url/api/v2/object/SeverityLookupObject(UID)"
}
```

> Attaching related records:

```json
{
	"RelatedIncidents@odata.bind": [
		"https://intelex_url/api/v2/object/RelatedIncidentObject(UID)",
		"https://intelex_url/api/v2/object/RelatedIncidentObject(UID)"
	]
}
```


### Header Parameters

When you update a record you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is updated. In order to execute a workflow stage action within an update request, you'll need to provide a  header parameter.

Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab

## Delete a record

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

Deletes an individual record in the Intelex object specified in the path. If SoftDelete is enabled for the object then the record will be archived instead.

### DELETE /object/{intelex_object}({id})

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id|The Intelex UID of the record being updated

## Delete a sub-record

```javascript

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents(UID)");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

Deletes an individual record in the Intelex object specified in the path. If SoftDelete is enabled for the object then the record will be archived instead.

### DELETE /object/{intelex_object}({id})/{navigation_property}({id})

### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id|The Intelex UID of the record being accessed
navigation_property|The Intelex system name of the relation type field






