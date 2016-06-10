# Hosts


> The above command returns JSON structured like this:

```json
{
    "Total": "int",
    "Items":
    [
      {

           "Id": "int",
           "Email": "string",
           "SuperUserId": "int",
           "ReceiveNews": "bool allow null",
           "Cash": "double",
           "CreationDate": "datetime",
           "FeedbackCount": "int",
           "Logo": "string",
           "Description": "string",
           "ContactName": "string",
           "ContactGender": "bool allow null",
           "ContactPhone": "string",
           "RequisiteName": "string",
           "RequisiteINN": "string",
           "RequisiteBanking": "string",
           "Approved": "true",
           "ApproveDate": "datetime allow null",
           "FeePercent": "decimal",
           "SubscriberCount": "int",
           "Amount": "decimal allow null",
           "Title": "string",
           "Deleted": "bool"
      }
    ]
}
```

This endpoint retrieves all hosts.

### HTTP Request

`GET http://radario.co/backoffice/hosts`

### Query Parameters

Parameter | Required | Description
--------- | -------  | -----------
sortfield |   NO     | sort hosts by field. string
sortorder |   NO     | sort order. 1 - ASC, 2 - DESC
take      |   NO     | number of results that should be returned, defaults to 10
skip      |   NO     | number of initial results that should be skipped, defaults to 0



## Get a Specific Host


> The above command returns JSON structured like this:

```json
{
     "Id": "int",
     "Email": "string",
     "SuperUserId": "int",
     "ReceiveNews": "bool allow null",
     "Cash": "double",
     "CreationDate": "datetime",
     "FeedbackCount": "int",
     "Logo": "string",
     "Description": "string",
     "ContactName": "string",
     "ContactGender": "bool allow null",
     "ContactPhone": "string",
     "RequisiteName": "string",
     "RequisiteINN": "string",
     "RequisiteBanking": "string",
     "Approved": "true",
     "ApproveDate": "datetime allow null",
     "FeePercent": "decimal",
     "SubscriberCount": "int",
     "Amount": "decimal allow null",
     "Title": "string",
     "Deleted": "bool"
}
```

This endpoint retrieves a specific host.

### HTTP Request

`GET http://radario.co/backoffice/hosts/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Host to retrieve

## Amount per period for Host

`GET http://radario.co/backoffice/host/amount/period/<ID>`

### URL Parameters

> The above command returns number:

```
38886700.900604248
```

This endpoint retrieves amount for a specific host.

Parameter | Description
--------- | -----------
ID        | The ID of the Host to retrieve


### Query Parameters

Parameter | Required | Description
--------- | -------  | -----------
day       |   NO     | start period from  day
year      |   NO     | year
month     |   NO     | month
offset    |   NO     | period in months

## Amount differents per period for host

`GET http://radario.co/backoffice/host/amount/diff/<ID>`

> The above command returns number:

```json
[
    {
        "Month": "int",
        "Year": "int",
        "Amount" : "int",
        "PreviousMonthDiff": "int"
    }
]
```

### URL Parameters

Parameter | Description
--------- | -----------
ID        | The ID of the Host to retrieve


### Query Parameters

Parameter | Required | Description
--------- | -------  | -----------
day       |   NO     | start period from  day
year      |   NO     | year
month     |   NO     | month
offset    |   NO     | period in months


##  Orders for Host

> The above command returns JSON structured like this:

```json
{
    "Total": "int",
    "Items":
    [
      {

           "Id": "int",
           "Email": "string",
           "EventId": "int",
           "Amount": "decimal allow null",
           "Title": "string",
           "Deleted": "bool",
           "PaymentReceived": "bool"
      }
    ]
}
```

This endpoint retrieves all for host.

### HTTP Request

`GET http://radario.co/backoffice/host/orders<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID        | The ID of the Host to retrieve

### Query Parameters

Parameter | Required | Description
--------- | -------  | -----------
sortfield |   NO     | sort hosts by field. string
sortorder |   NO     | sort order. 1 - ASC, 2 - DESC
take      |   NO     | number of results that should be returned, defaults to 10
skip      |   NO     | number of initial results that should be skipped, defaults to 0