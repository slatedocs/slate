# Types Of API's and General URL 

1.	GET API’s In the current ACTS – API release overall there have been planned for 11 GET API’s 

> Example GET API Endpoint : https : // {tenant}.actsapi.intelex.com/API-develop/v1/{Table Object}/{Fetch_Based_On_ID’s} 

2.  POST API’s in the current release we are including 4 POST API’s . 
    These API’s helps to edit and make updates in the respective tables.
    In the POST API the user needs to pass on the input in JSON Format  . The Input JSON body would be something like this 

 >Example Input JSON Body

```json

[
    {
        "EquipmentAttributeId": "int",
        "EquipmentId": "int",
        "AttributeTypeId": "int",
		"EquipmentAttribute":"string",
        "DataLockTypeId": "datetime",
        "LastModifiedDate": "datetime",
        "ExternalIdentifier": "string",
		"Comments":"string"
    }
]
```

> Example POST API Endpoint : https : // {tenant}.actsapi.intelex.com/API-develop/v1/{Table Object}

{Table Object} : Unit , Operation , Emission , Emission Category tables etc 

{API-develop} : develop is the environment 

v1 : Version , First version of the ACTS - API


3. GET API's With Pagination Option 
In this case user can specify the page number and page size where 500 is maximum size of the page. Example output with the page number and page size 

> Example GET API Endpoint : https ://{tenant}.actsapi.intelex.com/API-develop/v1/{Table Object}/{Fetch_Based_On_ID’s}/ ?PageNumber=1&PageSize=50 

{Table Object} : Unit , Operation , Emission , Emission Category tables etc 

{API-develop} : develop is the environment 

v1 : Version , First version of the ACTS - API

{Fetched_Based_On_ID's} : User can specify the mentioned specific ID to get that particular data

{Page Number} and {Page Size} : User can specify the page number and page size 

> Example OutPut Response 

```json
{
    "currentPage": 1,
    "totalPages": "int",
    "currentPageSize": 500,
    "maxAPIPageSize": 500,
    "totalCount": "int",
    "hasPrevious": "boolean",
    "hasNext": "boolean",
    "data":
[
    {
        "EquipmentAttributeId": "int",
        "EquipmentId": "int",
        "AttributeTypeId": "int",
		"EquipmentAttribute":"string",
        "DataLockTypeId": "datetime",
        "LastModifiedDate": "datetime",
        "ExternalIdentifier": "string",
		"Comments":"string"
    }
]
}
```
