# ALL GET API's 

The following GET APIs are used to fetch the data from the respective tables 

## 1.Attribute Type API GET Endpoint 

The data from the attribute type table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the Attribute ID’s  and Attribute Types. In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/AttributeType
```

> Example GET Endpoint With Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/AttributeType?PageNumber=1&PageSize=500&attributeTypeIDs="int data"&attributeTypes="string data" 
```

## 2.Compound API GET Endpoint

The data from the compound table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter options compound ID’s , compound Type IDs ,compound status IDs, compound Names , external identifiers along with the CAS as well . In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/Compound
```

> Example GET Endpoint With Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/Compound? PageNumber=1&PageSize=500&compoundIDs=”int data”&compoundTypeIDs="int data"& compoundstatusIDs ="int data"& compoundNames=”string data”&externalIdentifier=”int”&cAS=”string data”
```

## 3.Emission Category API GET Endpoint 

The data from the emission category table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter emission category id. In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionCategory
```
> Example GET Endpoint With Pagination and Filter Option :

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionCategory/{int data – Emission Category ID}
```

```
https: // *actsapi.intelex.com/API-develop/v1/Compound? PageNumber=1&PageSize=500&compoundIDs=”int data”&compoundTypeIDs="int data"& compoundstatusIDs ="int data"& compoundNames=”string data”&externalIdentifier=”int”&cAS=”string data”
```

## 4.Emission Type API GET Endpoint

The data from the emission type table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter emission type id. In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/EmissionType
```

> Example GET Endpoint With Pagination and Filter Option :

```
https: //*actsapi.intelex.com/API-develop/v1/EmissionType?PageNumber=1&PageSize=500&emissionTypeID={int data value}
```

## 5.Equipment API GET Endpoint 

The data from the equipment table can be fetched all at once by using the below-mentioned endpoint .In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/Equipment
``` 

> Example GET Endpoint With Pagination and Filter Option :

```
https: //*actsapi.intelex.com/API-develop/v1/Equipment?PageNumber=1&PageSize=500
```

## 6.Equipment Status API GET Endpoint

The data from the equipment status table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter equipment status id and equipment status. In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentStatus
```

> Example GET Endpoint With Pagination and Filter Option :

```
https: // *actsapi.intelex.com/API-develop/v1/ EquipmentStatus? PageNumber=1&PageSize=500&EquipmentStatusIDs=”int data” &EquipmentStatus=”string data”
```

## 7.Equipment Type API GET Endpoint

The data from the equipment type table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter equipment type ids and equipment types. In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/EquipmentType
```

> Example GET Endpoint With Pagination and Filter Option :

```
https: // *actsapi.intelex.com/API-develop/v1/ EquipmentType? PageNumber=1&PageSize=500&EquipmentTypeIDs=”int data” &EquipmentTypes=”string data”
```

## 8.Operation API GET Endpoint 

The data from the operation type table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter operation ids , operation type ids , emission type ids , emission category ids , unit ids , equipment ids , last modified start date  and last modified end date  . In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/Operation
```

> Example GET Endpoint With Pagination and Filter Option :

```
https: // *actsapi.intelex.com/API-develop/v1/ Operation?PageNumber =1&PageSize=500&OperationIDs=”int data”&OperationTypeIDs=”string data “&EmissionTypeIDs=”int data”&EmissionCategoryIDs=”int data”&	UnitIDs=”int data”&EquipmentIDs=”int data”&LastModifiedStartDate=”string format – date time data”&LastModifiedEndDate=” string format – date time data” 
```

## 9.Unit API GET Endpoint 

The data from the unit table can be fetched all at once by using the below-mentioned endpoint and even we can fetch the specific data by mentioning the following filter unit ids, unit type ids and units . In general, all the APIs are provided with the option of pagination.

> Example GET Endpoint Without Pagination : 

```
https: // *actsapi.intelex.com/API-develop/v1/Unit
```

> Example GET Endpoint With Pagination and Filter Option :

```
https: // *actsapi.intelex.com/API-develop/v1/Unit?PageNumber =1&PageSize=500&UnitIDs=”int data”&UnitTypeIDs=”int data” &Units =”string data”
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
]
}
```