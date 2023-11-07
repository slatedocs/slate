## Remove or Delete data from Database Table

This section outlines the available Delete APIs designed for modifying ACTS data by deleteing or removing the data. These APIs offer options for removing existing records from the mentioned tables. 

* To remove the existing records, use the primary key of the record.

In the current release, one DELETE API End point is provided to remove or delete from the following table 

* Operation

DELETE requests to these endpoints should be formatted in JSON.

### 1. Operation Table 

This section guides you through the process of removing/deleting the existing records from the Operation table using the designated API endpoint.

**Operation DELETE endpoint**

`DELETE` /api/v1/operation

> Example Request & JSON Input Body 

```javascript
var request = require("request");

var options = { method: 'DELETE',
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
var request = new RestRequest(Method.DELETE);
request.AddHeader("content-type", "application/json");
request.AddParameter("application/json", "{\r\n    \"ActionsTaken\": \"string\",\r\n    \"Date\": \"2017-02-13T22:15:30.203Z\",\r\n    \"Description\": \"string\",\r\n    \"IncidentNo\": 0,\r\n    \"ReportedDate\": \"2017-02-13T22:15:30.203Z\",\r\n    \"SuspectedCause\": \"string\"\r\n}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```
