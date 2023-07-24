# ALL GET API's 

The following GET APIs are used to fetch the data from the respective tables. 

## 1. Attribute Type API GET Endpoint 

All data from the Attribute Type table will be returned from the endpoint below. You can optionally fetch specific data by including Attribute ID’s and Attribute Types. The Attribute Type endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/AttributeType
```

> Example GET Endpoint With Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/AttributeType?PageNumber=1&PageSize=500&attributeTypeIDs="int data"&attributeTypes="string data" 
```

## 2.Compound API GET Endpoint

All data from the Compound table will be returned from the endpoint below. You can optionally fetch specific data by including compound ID’s, compound Type IDs, compound status IDs, compound Names, external identifiers, or CAS number. The Compound endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/Compound
```

> Example GET Endpoint With Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/Compound? PageNumber=1&PageSize=500&compoundIDs="int data"&compoundTypeIDs="int data"&compoundstatusIDs="int data"&compoundNames="string data"&externalIdentifier="int"&CAS="string data"
```

## 3.Emission Category API GET Endpoint 

All data from the Emission Category table will be returned from the endpoint below. You can optionally fetch specific data by including the emission category ID. The Emission Category endpoint supports pagination.


> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionCategory
```
> Example GET Endpoint With Pagination and Filter Option:

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionCategory/{int data – Emission Category ID}
```

## 4.Emission Type API GET Endpoint

All data from the Emission type table will be returned from the endpoint below. You can optionally fetch specific data by including the emission type ID. The Emission Type endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionType
```

> Example GET Endpoint With Pagination and Filter Option:

```
https: //*actsapi.intelex.com/API-develop/v1/EmissionType?PageNumber=1&PageSize=500&emissionTypeID={int data value}
```

## 5.Equipment API GET Endpoint 

All data from the Equipment table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment ID. The Equipment endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/Equipment
``` 

> Example GET Endpoint With Pagination and Filter Option:

```
https: //*actsapi.intelex.com/API-develop/v1/Equipment?PageNumber=1&PageSize=500&equipmentID={int data value}
```

## 6.Equipment Status API GET Endpoint

All data from the Equipment Status table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment status ID and equipment status value. The Equipment Status endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentStatus
```

> Example GET Endpoint With Pagination and Filter Option:

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentStatus?PageNumber=1&PageSize=500&EquipmentStatusIDs="int data"&EquipmentStatus="string data"
```

## 7.Equipment Type API GET Endpoint

All data from the Equipment Type table will be returned from the endpoint below. You can optionally fetch specific data by including the equipment type ID and equipment types value. The Equipment type endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentType
```

> Example GET Endpoint With Pagination and Filter Option:

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentType?PageNumber=1&PageSize=500&EquipmentTypeIDs="int data"&EquipmentType="string data"
```

## 8.Operation API GET Endpoint 

All data from the Operation table will be returned from the endpoint below. You can optionally fetch specific data by including the operation ids, operation type ids, emission type ids, emission category ids, unit ids, equipment ids, last modified start date and last modified end date. The Operation endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/Operation
```

> Example GET Endpoint With Pagination and Filter Option:

```
https: // *actsapi.intelex.com/API-develop/v1/ Operation?PageNumber =1&PageSize=500&OperationIDs="int data"&OperationTypeIDs=”string data "&EmissionTypeIDs="int data”&EmissionCategoryIDs="int data”&UnitIDs="int data"&EquipmentIDs="int data"&LastModifiedStartDate=”string format – date time data"&LastModifiedEndDate="string format – date time data" 
```

## 9.Unit API GET Endpoint 

All data from the Unit table will be returned from the endpoint below. You can optionally fetch specific data by including the unit ids, unit type ids and units. The Unit type endpoint supports pagination.

> Example GET Endpoint Without Pagination: 

```
https: // *actsapi.intelex.com/API-develop/v1/Unit
```

> Example GET Endpoint With Pagination and Filter Option:

```
https: // *actsapi.intelex.com/API-develop/v1/Unit?PageNumber=1&PageSize=500&UnitIDs="int data"&UnitTypeIDs="int data" &Units="string data"
```

## Sample Result Set Of One Of the API Endpoint 

> Example Output Response

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
