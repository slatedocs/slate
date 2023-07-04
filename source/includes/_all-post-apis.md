# ALL POST API's 

The following POST APIs are used to modify the data like update the existing records with latest values and insert a new set of records for the respective tables which are covered in the following release.

And here as we are dealing with a huge amount of data to be inserted and updated so we are doing it in a batch wise. For example, we are trying to insert in a form of 50 rows a batch at once.We can alter the batch size at any time. In the current release we have 4 POST API’s included which would help in update & insert of the records to the following tables Equipment, Operation, Facility and Facility Attribute tables.

When we are going for insert operation then we need to pass the primary key as zero – 0 as it is unique key and is auto increment in table. When new row gets added and a new primary would be assigned to the newly added rows .

The data on the equipment, Operation , Facility and Facility Attribute table can be updated with new set of values and even we can add new set of records to it by using the below-mentioned endpoint. The inputs are passed as JSON format data.

## 1.Equipment Table POST API Endpoint 

Equipment Table Can be updated and a new set of data can be added by using the following endpoint .

> General URL Of POST Endpoint : 

```
https: // *.intelex.com/API-staging/DEVELOPMENT/v1/Equipment
```

## 2.Operation Table POST API Endpoint 

Operation Table Can be updated and a new set of data can be added by using the following endpoint .

> General URL Of POST Endpoint : 

```
https: // *.intelex.com/API-staging/DEVELOPMENT/v1/Operation
```

## 3.Facility Table POST API Endpoint 

Facility Table Can be updated and a new set of data can be added by using the following endpoint .

> General URL Of POST Endpoint : 

```
https: // *.intelex.com/API-staging/DEVELOPMENT/v1/Facility
```

## 4.Facility Attribute Table POST API Endpoint 

Facility Attribute Table Can be updated and a new set of data can be added by using the following endpoint .

> General URL Of POST Endpoint : 

```
https: // *.intelex.com/API-staging/DEVELOPMENT/v1/FacilityAttribute 
```

## One of the Endpoints Input Json body for both Insert & Update 

The primary id is zero - "0" then the data we are passing is considered as the insert option , like in the below example option 
"EquipmentAttributeId" is passed as "0" then this data would be added as new row in the respective table [Insert Option] . 

> Example Input JSON Body For Insert 

```json

[
    {
        "EquipmentAttributeId": 0,
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

> Example Input JSON Body For Update 

```json

[
    {
        "EquipmentAttributeId": 164,
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

The primary id is "164" which is predefined existing ID in the table then the data we are passing is considered as the update option , 
"EquipmentAttributeId" is passed as "164" then row which has the following ID would be updated with new values. 