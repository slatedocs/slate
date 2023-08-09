# ALL POST API's 

The following POST APIs are used to modify ACTS data. Options include updating existing records and inserting new records, and you can complete both in the same POST. To insert new records, the primary key is set to 0, while for updates to existing records, the primary key for the existing record is used. You can see an example for this in 4. Facility Attribute Table POST API Endpoint below. 

For large data inserts, we recommend you break data into batch POSTs of up to 500 rows. Large batch POSTs may be throttled or failed, depending on system resources. 

In the current release we have 4 POST API’s available, for the Equipment, Operation, Facility, and Facility Attribute tables. POSTs to these endpoints must be JSON format. 

As described above, to insert to a table, the primary key should be zero – 0. When the record is added to the table it will be assigned the next available incremental primary key.

## 1.Equipment POST API Endpoint 

Equipment records can be updated, or new records added at the following endpoint:

> Equipment POST endpoint: 

```
https: // {tenant}.actsapi.intelex.com/API-staging/DEVELOPMENT/v1/Equipment
```

## 2.Operation POST API endpoint 

Operation records can be updated, or new records added at the following endpoint:

> Operation POST Endpoint: 

```
https: // {tenant}.actsapi.intelex.com/API-staging/DEVELOPMENT/v1/Operation
```

## 3.Facility POST API endpoint 

Facility records can be updated, or new records added at the following endpoint:

> Facility POST Endpoint : 

```
https: // {tenant}.actsapi.intelex.com/API-staging/DEVELOPMENT/v1/Facility
```

## 4.Facility Attribute POST API endpoint 

Facility Attribute records can be updated, or new records added at the following endpoint:

> Facility Attribute POST Endpoint: 

```
https: // {tenant}.actsapi.intelex.com/API-staging/DEVELOPMENT/v1/FacilityAttribute 
```

## JSON body for both Insert & Update 

If the primary id is zero - "0" then the data we are passing is handled as an insert, shown in the example below, where "EquipmentAttributeId" is passed as "0". 

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

If the primary id is an existing ID - "#####" then the data we are passing is handled as an update, shown in the example below, where "EquipmentAttributeId" is passed as "164". 


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

> Example Output For Both Update and Insert 
```
{
	"insertedRowCount" : 2 , 
	"updatedRowCount" : 3 ,
	"failureCount" : 0 ,
	"errorMessage" : []

}

```

> Example Output For When Data Get's Failed To Insert or Update
```
{
	"insertedRowCount" : 0 , 
	"updatedRowCount" : 1 ,
	"failureCount" : 1 ,
	"errorMessage" : [
	 "Operation ID : 0, Error: An error occurred while saving the entity changes. See the inner exception for details "
	]
}

```
