---
title: Intelex API Reference

language_tabs:
  - javascript: JavaScript
  - csharp: C#
  
includes:
  - support
  
search: true
---

# API Reference

The Intelex API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

## Getting Started

> API Endpoint - replace **intelex_url** with the full URL path to your Intelex system

```
https://intelex_url/api/v2/
```

To begin using the Intelex API you will need:

* Your own instance of the Intelex platform with the REST API enabled
* A valid Intelex system user account
* The full URL to your Intelex system

## Authentication

> Example Request - make sure to replace **hello** with your credentials.

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

Authentication to the API is performed via HTTP Basic Auth and your Intelex user credentials. All API requests must be made over HTTPS and API requests without authentication will fail. Security on data is managed by the platform security configuration. API requests will maintain the same security settings you have configured in the platform for each user. 

## Response Codes

> Example error response

```json
{
  "error": {
    "code": "string",
    "message": "string"
  }
}
```

The Intelex REST API will respond with the following HTTP status codes:

Response Code | Meaning
---------- | -------
200 | Success -- Enjoy your data!
201 | Created -- We created the record!
204 | No Content -- Your request was successful, but we don't have anything more to tell you.
400 | Bad Request -- Something is wrong with your request
401 | Unauthorized -- Your credentials are wrong
403 | Forbidden -- You do not have permission to access the resource
404 | Not Found -- The object or navigation property you are trying to access doesn't exist
405 | Method Not Allowed -- We won't let you do that
500 | Internal Server Error -- We had a problem with our server. Try again later
501 | Not Implemented -- What you are trying to do doesn't work...yet.

## Versioning

When we make backwards-incompatible changes to the API, we release new versions. The current version is **v2** and can be determined with our API base path **/api/v2/**. Read our [Intelex platform release notes](https://community.intelex.com/library/knowledgebase/release-notes) to see our API changelog.

## Metadata
> Example response with record metadata

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

## Pagination
> Example response with pagination link

```json
{
	"value": {
        "@odata.nextLink": "https://intelex_url/api/v2/object/IncidentsObject?$skip=500"
	}
}
```

We've provided a convenient way to access more data in any request for sequential data where the number of records exceeds 500. Simply call the url in the nextLink parameter and we'll respond with the next set of data.

## Relational Data

Many Intelex objects have relations to other objects. These relations are configured as relation type or lookup type fields.  These fields are accessible via the API as navigation properties. 
Every object will have navigation properties that can be used to access its related data in another object.  You'll need to use the system name of the field configured with the related object in order to access related data.  

You can access related data by using the [$expand](#query-option-expand) query option or you can [navigate to related data](#requesting-related-records) using a URL path. You can traverse multiple levels of relational data by navigating through the URL path or with nested $expand queries.

Please note: Trying to access or modify relation fields that are self-referencing will not work (i.e. A relation type field on an object that is a relation to itself) 


# Requesting Object Data

## Requesting records

> Example Request

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

> Example Response

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

Returns all records from an Intelex object that the user is authorized to view

### GET /api/v2/object/{intelex_object}

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

## Requesting a specific record

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record being requested


## Requesting related records

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record being requested
navigation_property|The Intelex system name of the relation type or lookup type field

## Requesting a specific related record

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id | The Intelex UID of the record or related record being requested
navigation_property|The Intelex system name of the relation type or lookup type field

# Querying Object Data

## Query option: $select

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
field_name | Field name(s) to include in response

## Query option: $count

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

## Query option: $top and $skip

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

#### Query Parameters
Parameter | Description
--------- | -----------
top_n | Number of items to be included in the response
skip_n| Number of items to be skipped

## Query option: $orderby

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

#### Query Parameters

Parameter | Description
--------- | -----------
field_name | Fields that you want to sort by

## Query option: $filter

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

#### Query Parameters

Parameter | Description
--------- | -----------
filter_expression | Filter expression used to query data


#### Comparison Operators:
|Name|Description|Example Values|
|---|---|---|
|eq|Equal|Severity/Value eq 'Moderate'
|ne|Not equal|Description ne null
|gt|Greater than|IncidentNo gt 1000
|ge|Greater than or equal|DateCreated ge 2017-01-01
|lt|Less than|IncidentNo lt 1000
|le|Less than or equal|DateCreated le 2014-11-24T12:55:05.35-05:00

#### Logical Operators:
|Name|Description|Example Values|
|---|---|---|
|and|Logical and|Description ne null and Workflow/PersonResponsible/Name eq 'AC Slater'
|or|Logical or|Cause eq true or IncidentNo gt 1000
|not|Logical not|not(contains(Description, 'accident'))

#### Grouping Operators:
|Name|Description|Example Values|
|---|---|---|
|(   )|Precedence grouping|IncidentNo gt 1000 and (Severity/Value eq 'Moderate' or contains(Description, 'fall'))

#### Functions:
|Name|Description|Example Values|
|---|---|---|
|contains(Field, Value)|Sub-string search|contains(Description, 'accident'))

#### Filtering using Relation Fields:
|Description|Example Values|
|---|---|
|Filtering by drop-down value |Severity/Value eq 'Moderate'
|Filtering by sub-record values|SubIncidents/any(x:x/SubIncidentId gt 1000)

#### Filtering using Workflow:
|Description|Example Values|
|---|---|
|Filter based on person responsible|Workflow/PersonResponsible/Name eq 'AC Slater'
|Filter based on workflow status (enum)|Workflow/WorkflowStatus eq Enum.WorkflowStatusType'Completed'

#### Filter alias
@me is an alias that can be used in expressions to filter based on your identity'

|Description|Example Values|
|---|---|
|Filter where you are the person responsible|$filter=Workflow/PersonResponsible eq @me|

## Query option: $expand

> Example Request

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

> Example Response

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
|Filter expanded collection|$expand=SubIncidents($filter=Description ne null)|
|Filter and select expanded collection|$expand=SubIncidents($filter=Description ne null;$select=Description)|

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject

#### Query Parameters

Parameter | Description
--------- | -----------
relation_field | Relation field used to request related object data

# Modifying Object Data

## Create a record

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject

#### Header Parameters

When you create a record you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is created. In order to execute a workflow stage action within a create request, you'll need to provide a  header parameter.


Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab

> Example request of creating a record and setting a location value:

```json
{
	"Location@odata.bind": "https://intelex_url/api/v2/object/SysLocationEntity(Id)"
}
```

> Example request of creating a record and setting a lookup type value:

```json
{
	"Severity@odata.bind": "https://intelex_url/api/v2/object/SeverityLookupObject(Id)"
}
```

> Example request of creating a record and set workflow recurrence or person responsible:

```json
{
	"Workflow": {
		"PersonResponsible@odata.bind": "https://intelex_url/api/v2/object/Employees(UID)",
		"RecurringSeries": {
			"Frequency": "RRULE:FREQ=HOURLY",
			"StartDate": "2017-06-06T02:30:00-05:00",
			"EndDate": "2017-07-07T02:30:00-05:00"
		}
	}
}
```

> Example request of creating a record and attaching related records:

```json
{
	"RelatedIncidents@odata.bind": [
		"https://intelex_url/api/v2/object/RelatedIncidentObject(Id)",
		"https://intelex_url/api/v2/object/RelatedIncidentObject(Id)"
	]
}
```

## Create a sub-record

> Example Request

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

> Example Response

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id| The Intelex UID of the parent record
navigation_property|The Intelex system name of the relation type field that supports sub-records i.e. "Has a list of attached"

#### Header Parameters

When you create related records you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is created. In order to execute a workflow stage action within a create request, you'll need to provide a  header parameter.

Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab

## Update a record

> Example Request

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being updated

> Example of updating a location value:

```json
{
	"Location@odata.bind": "https://intelex_url/api/v2/object/SysLocationEntity(UID)"
}
```

> Example of updating a lookup type value:

```json
{
	"Severity@odata.bind": "https://intelex_url/api/v2/object/SeverityLookupObject(UID)"
}
```

> Example of attaching related records:

```json
{
	"RelatedIncidents@odata.bind": [
		"https://intelex_url/api/v2/object/RelatedIncidentObject(UID)",
		"https://intelex_url/api/v2/object/RelatedIncidentObject(UID)"
	]
}
```


#### Header Parameters

When you update a record you also have the opportunity to execute an available workflow action within the same request. This is useful if you'd like a record to move to stage when it is updated. In order to execute a workflow stage action within an update request, you'll need to provide a  header parameter.

Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
ActionToExecute | UID of the workflow stage action|No|Id=797bbb3b-b485-4e73-a21c-2b9d5454f8ab

## Delete a record

> Example Request

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

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id|The Intelex UID of the record being updated

## Delete a sub-record

> Example Request

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents(UID)' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/SubIncidents(UID)");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

Deletes an individual sub-record in the Intelex object specified in the path. If SoftDelete is enabled for the object then the record will be archived instead.

### DELETE /object/{intelex_object}({id})/{navigation_property}({id})

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object being requested eg. IncidentsObject
id|The Intelex UID of the record or related record being accessed
navigation_property|The Intelex system name of the relation type field

## Removing a single value reference

> Example Request

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Severity/$ref' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Severity/$ref");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

Sets the value in a drop-down to null. This call is useful if you need to remove a value that's been set for a record.

### DELETE /object/{intelex_object}({id})/{navigation_property}/$ref

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record
navigation_property|The Intelex system name of the relation type field - must be a drop-down relation type field

## Removing a multi-value reference

> Example Request

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/RelatedIncidents(UID)/$ref' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/RelatedIncidents(UID)/$ref");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

This request detaches a related records. It deletes the relationship, but does not delete the related record itself. 

### DELETE /object/{intelex_object}({id})/{navigation_property}({id})/$ref

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or related record
navigation_property|The Intelex system name of the relation type field - must be references associated relation type field

# Object Workflow Data

## Requesting Workflow Data

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.context": "string",
	"@odata.type": "string",
	"@odata.id": "string",
	"Id": "string",
	"DateModified": "2016-07-14T14:32:05.44-04:00",
	"DateCreated": "2016-04-25T12:54:18.563-04:00",
	"DateNotRequired": null,
	"DueDate": null,
	"DueDateType": "string",
	"EntityId": "string",
	"EntityName": "",
	"IsVirtual": false,
	"LocationId": "string",
	"ObjectId": "string",
	"WorkflowStatus": "string"
}
```

This request allows you to retrieve the workflow information for a given record.  

### GET /object/{intelex_object}({id})/Workflow

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Requesting Status

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/Status' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/Status");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.context": "string",
	"@odata.type": "string"
	"@odata.id": "string",
	"Id": "string",
	"DateCreated": "2017-03-08T11:52:49.723-05:00",
	"DateModified": "2017-03-08T11:52:49.723-05:00",
	"Description": "Draft",
	"DueDateExpression": null,
	"DueDateLengthType": null,
	"DueDateLengthValue": null,
	"InheritedPermission": true,
	"IsFirstStage": true,
	"IsStandardPermission": true,
	"Name": "Draft",
	"RecipientExpression": null,
	"RecipientType": "string",
	"StageAction": null,
	"StayInEditMode": false,
	"SystemName": "Draft",
	"TaskType": "Action"
}
```

This request allows you to retrieve the information about the workflow status that the record is currently in.

### GET /object/{intelex_object}({id})/Workflow/Status

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Requesting Current Stage

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.context": "string",
	"@odata.type": "string",
	"@odata.id": "string",
	"Id": "string",
	"DateCreated": "2017-03-08T11:52:49.723-05:00",
	"DateModified": "2017-03-08T11:52:49.723-05:00",
	"Description": "Draft",
	"DueDateExpression": null,
	"DueDateLengthType": null,
	"DueDateLengthValue": null,
	"InheritedPermission": true,
	"IsFirstStage": true,
	"IsStandardPermission": true,
	"Name": "Draft",
	"RecipientExpression": null,
	"RecipientType": "string",
	"StageAction": null,
	"StayInEditMode": false,
	"SystemName": "Draft",
	"TaskType": "Action"
}
```

This request allows you to retrieve the information about the workflow stage that the record is currently in.

### GET /object/{intelex_object}({id})/Workflow/CurrentStage

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Requesting Stage Actions

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage/Actions' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage/Actions");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
  "@odata.context": "string",
  "value": [
    {
		"@odata.type": "string",
		"@odata.id": "string",
		"Id": "string",
		"DateModified": "2017-03-08T11:52:49.927-05:00",
		"DateCreated": "2017-03-08T11:52:49.927-05:00",
		"Confirmation": "string",
		"FlowDefinition": "string",
		"IsHidden": false,
		"MobileCaption": null,
		"Name": "string",
		"NavigateBackEnabled": true,
		"Order": 1,
		"RequireSignature": true,
		"SystemName": "string",
		"Tooltip": null,
		"TriggerCondition": "",
		"UrlIcon": "",
		"UserActionsRequired": true
    }
  ]
}
```

This request allows you to retrieve the information about the workflow stage actions available for a record in the current stage. Note: When a workflow is published, the action IDs are created. If someone updates a workflow, they have to re-publish it for the changes to take effect, and all the action IDs change. Typically, you don't need to worry about this, but if your action IDs stop working, you should check them by running a dummy record through the workflow.

### GET /object/{intelex_object}({id})/Workflow/CurrentStage/Actions

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Requesting Person Responsible

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/PersonResponsible' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/PersonResponsible");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.context": "string",
	"@odata.type": "string"
	"@odata.id": "string",
	"Id": "string",
	"DateCreated": "2010-06-20T20:00:00-04:00",
	"DateModified": "2015-06-17T15:21:51.813-04:00",
	"CustomField": null,
	"IsSystem": false,
	"Name": "string"
}
```

This request allows you to retrieve the individual assigned to the workflow stage of the record. **Workflow** and **PersonResponsible** are  navigation properties that can be accessed using the $expand system query option as well.

### GET /object/{intelex_object}({id})/Workflow/PersonResponsible

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Requesting Frequency

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/RecurringSeries' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/RecurringSeries");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.context": "string",
	"@odata.type": "string"
	"@odata.id": "string",
	"Id": "string",
	"DateCompleted": null,
	"EndDate": "2017-07-07T03:30:00-04:00",
	"EntityId": "string",
	"Frequency": "RRULE:FREQ=HOURLY",
	"GracePeriod": 0,
	"IsActive": true,
	"NextScheduledDate": "2017-06-06T04:30:00-04:00",
	"OriginalStartDate": "2017-06-06T03:30:00-04:00",
	"StartDate": "2017-06-06T03:30:00-04:00"
}
```

This request allows you to retrieve the workflow frequency applied to the record.  The frequency property value is in iCal format.

### GET /object/{intelex_object}({id})/Workflow/RecurringSeries

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed

## Executing a Stage Action

> Example Request

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage/Actions(UID)/Action.ExecuteStageAction' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow/CurrentStage/Actions(UID)/Action.ExecuteStageAction");
var request = new RestRequest(Method.POST);
IRestResponse response = client.Execute(request);
```

This request allows you to push a record through its workflow stages. Note: When a workflow is published, the action IDs are created. If someone updates a workflow, they have to re-publish it for the changes to take effect, and all the action IDs change. Typically, you don't need to worry about this, but if your action IDs stop working, you should check them by running a dummy record through the workflow.

### POST /object/{intelex_object}({id})/Workflow/CurrentStage/Actions(id)/Action.ExecuteStageAction

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or action being accessed 

## Updating Frequency

> Example Request

```javascript
var request = require("request");

var options = { method: 'PATCH',
  url: 'https://intelex_url/api/v2/object/IncidentsObject%28UID%29/Workflow/RecurringSeries',
  headers: { 'content-type': 'application/json' },
  body: 
   { Frequency: 'RRULE:FREQ=HOURLY',
     StartDate: '2017-06-06T03:30:00-04:00' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject%28UID%29/Workflow/RecurringSeries");
var request = new RestRequest(Method.PATCH);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\n  \"Frequency\": \"RRULE:FREQ=HOURLY\",\n  \"StartDate\": \"2017-06-06T03:30:00-04:00\"\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

This request allows you to modify the workflow frequency for a given record.  The Frequency property will only accept iCal formatted strings.

### PATCH /object/{intelex_object}({id})/Workflow/RecurringSeries

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or action being accessed 

## Updating Person Responsible

> Example Request

```javascript
var request = require("request");

var options = { method: 'PATCH',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow',
  headers: { 'content-type': 'application/json' },
  body: { 'PersonResponsible@odata.bind': 'https://intelex_url/api/v2/object/Employees(UID)' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/Workflow");
var request = new RestRequest(Method.PATCH);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\n\t\"PersonResponsible@odata.bind\": \"https://intelex_url/api/v2/object/Employees(UID)\"\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

This request allows you to modify the workflow person responsible for a given record. This is the method used to re-assign tasks for a given record. 

### PATCH /object/{intelex_object}({id})/Workflow

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or action being accessed 

# Object Attachments

## Requesting Private Doc Attachments

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject%28UID%29/ILX.Attachments' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject%28UID%29/ILX.Attachments");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		  "@odata.id": "string",
		  "@odata.mediaContentType": "string",
		  "Id": "string",
		  "AttachmentName": "string",
		  "Bytes": 0,
		  "IsDraft": true,
		  "ObjectRecordId": "string",
		  "Uri": "string",
		  "Attachment@odata.mediaReadLink": "string"
	  }
	]
}
```

This request returns a list of all private document attachments belonging to a given record. ILX.Attachments is a system reserved property for working with private document attachments. Any object that has private document attachments enabled will be able to access this property and request the private documents that belong to a record.

### GET /object/{intelex_object}({id})/ILX.Attachments

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed 

## Downloading Attachments

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/ILX.Attachments(UID)',
  headers: 
   { prefer: 'attachment=thumbnail',
     accept: 'application/octet-stream' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject%28UID%29/ILX.Attachments(UID)");
var request = new RestRequest(Method.GET);
request.AddHeader("prefer", "attachment=thumbnail");
request.AddHeader("accept", "application/octet-stream");
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.id": "string",
	"@odata.mediaContentType": "string",
	"Id": "string",
	"AttachmentName": "string",
	"Bytes": 0,
	"IsDraft": true,
	"ObjectRecordId": "string",
	"Uri": "string",
	"Attachment@odata.mediaReadLink": "string"
}
```

By default, this request returns the metadata of a specific private document attachment. When you provide the Accept header value of octet-stream, then the file will be downloaded instead.  If it is an image, you also have the ability to request it in a thumbnail size.

### GET /object/{intelex_object}({id})/ILX.Attachments({id})

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or document being accessed

#### Header Parameters

Parameter | Description | Example Value
--------- | ------------| -----------
Accept|Provide the content type in order to download the file|application/octet-stream
Prefer|Used to request a thumbnail version of an image file|attachment=thumbnail

## Attaching Files

> Example Request

```javascript
var fs = require("fs");
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/ILX.Attachments',
  headers: { 'content-type': 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' },
  formData: 
   { '': 
      { value: 'fs.createReadStream("C:\\Document.docx")',
        options: 
         { filename: 'C:\\Document.docx',
           contentType: null } } } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/ILX.Attachments");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW");
request.AddParameter("multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW", "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"\"; filename=\"C:\\Document.docx\"\r\nContent-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document\r\n\r\n\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"@odata.id": "string",
	"@odata.mediaContentType": "string",
	"Id": "string",
	"AttachmentName": "string",
	"Bytes": 0,
	"IsDraft": true,
	"ObjectRecordId": "string",
	"Uri": "string",
	"Attachment@odata.mediaReadLink": "string"
}
```

This request attaches a private document to a record.  The file must be attached to the request as form-data. Files that exceed 10MB will not be attached. If the UID of the record does not exist, the file will be attached in draft mode.  Once a record is created with the same record UID in the attach request, then the attachment will be associated to the record and will no longer be in draft mode.

### POST /object/{intelex_object}({id})/ILX.Attachments

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record being accessed 

#### Body Parameters

Parameter | Type |
--------- | -----------
formData | file | 

## Detaching Documents

> Example Request

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://intelex_url/api/v2/object/IncidentsObject(UID)/ILX.Attachments(UID)' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});

```

```csharp
var client = new RestClient("https://intelex_url/api/v2/object/IncidentsObject(UID)/ILX.Attachments(UID)");
var request = new RestRequest(Method.DELETE);
IRestResponse response = client.Execute(request);
```

This request deletes the specified document attached to a given record. ILX.Attachments is a system reserved property for working with private document attachments. Any object that has private document attachments enabled will be able to access this property and request the private documents that belong to a record.

### DELETE /object/{intelex_object}({id})/ILX.Attachments({id})

#### URL Parameters

Parameter | Description
--------- | -----------
intelex_object | The Intelex system name of the object eg. IncidentsObject
id|The Intelex UID of the record or document being accessed

# Batch Requests

## Object Batch Requests

> Example Batch Request Body: The following example includes a batch with a unique identifier of AAA123 and a change set with a unique identifier of BBB456. The request creates a record then updates the record that was just created

```
--batch_AAA123
Content-type: multipart/mixed; boundary=changeset_BBB456

--changeset_BBB456
Content-Type: application/http
Content-Transfer-Encoding: binary
Content-ID:1

POST IncidentsObject HTTP/1.1
Content-Type: application/json

 { "ActionsTaken": "string", "Date": "string", "Description": "string", "IncidentNo": 0, "ReportedDate": "2017-02-13T22:15:30.203Z", "SuspectedCause": "string" }

--changeset_BBB456
Content-Type: application/http
Content-Transfer-Encoding: binary
Content-ID:2

PATCH $1 HTTP/1.1
Content-Type: application/json

{"Description":"string"}

--changeset_BBB456--

--batch_AAA123--
```

> The above batch request returns the following response with a 200 OK status:

```
--batchresponse_20a3a5a7-2df7-435e-9c62-ead3472499e7
Content-Type: multipart/mixed; boundary=changesetresponse_18666d72-dd34-46dc-8cae-2f0ff8208f7c

--changesetresponse_18666d72-dd34-46dc-8cae-2f0ff8208f7c
Content-Type: application/http
Content-Transfer-Encoding: binary
Content-ID: 1

HTTP/1.1 201 Created
Location: https://intelex_url/api/v2/object/IncidentsObject(UID)
Content-Type: application/json; odata.metadata=minimal
OData-Version: 4.0

{
    "@odata.type": "string", "@odata.id": "string", "@odata.editLink": "string", "Id": "string",  "ActionsTaken": "string", "Date": "2017-02-13T22:15:30.203Z", "Description": "string", "IncidentNo": 0,
    "ReportedDate": "2017-02-13T22:15:30.203Z", "SuspectedCause": "string"
}
--changesetresponse_18666d72-dd34-46dc-8cae-2f0ff8208f7c
Content-Type: application/http
Content-Transfer-Encoding: binary
Content-ID: 2

HTTP/1.1 204 No Content


--changesetresponse_18666d72-dd34-46dc-8cae-2f0ff8208f7c--
--batchresponse_20a3a5a7-2df7-435e-9c62-ead3472499e7--

```



Use a POST request to submit a batch operation that contains multiple requests. A batch request can include GET, POST, PATCH, and DELETE requests as well as change sets.  To use transactional capabilities of batch requests, only operations that will change data can be included within a change set. GET requests must not be included in the change set.  

The POST request containing the batch must have a Content-Type header with a value set to multipart/mixed with a boundary set to include the identifier of the batch using this pattern:

`
--batch_<unique_identifier>
`

The unique identifier doesn't need to be a GUID, but should be unique. Each item within the batch must be preceded by the batch identifier with a Content-Type and Content-Transfer-Encoding header:

`
--batch_AAA123
`

`
Content-Type: application/http
`

`
Content-Transfer-Encoding:binary
`

The end of the batch must contain a termination indicator:

`
--batch_AAA123--
`

By default, processing batch requests will stop on the first error unless the **odata.continue-on-error** preference is specified in the Prefer header.  Also, the responses returned are essentially text documents rather than objects that can easily be parsed into JSON. You'll need to parse the text in the response.


### POST /object/$batch


#### Header Parameters

Parameter | Description |Required | Example Value
--------- | ----------- |--------- | -----------
Content-Type | Content type for entire batch request |Yes|multipart/mixed;boundary=batch_AAA123
Prefer|Preference to continue if error is encountered|No|odata.continue-on-error

#### Change sets

When multiple operations are contained in a change set, all the operations are considered atomic, which means that if any one of the operations fail, any completed operations will be rolled back. Like a batch requests, change sets must have a Content-Type header with a value set to multipart/mixed with a boundary set to include the identifier of the change set using this pattern:

`
--changeset_<unique_identifier>
`

The unique identifier doesn't need to be a GUID, but should be unique. Each item within the change set must be preceded by the change set identifier with a Content-Type and Content-Transfer-Encoding header like the following:


`
--changeset_BBB456
`

`
Content-Type: application/http
`

`
Content-Transfer-Encoding:binary
`

Change sets can also include a Content-ID header with a unique value. This value, when prefixed with $, represents a variable that contains the URI for any entity created in that operation. For example, when you set the value of 1, you can refer to that entity using $1 later in your change set.  

The end of the change set must contain a termination indicator like the following:

`
--changeset_BBB456---
`
