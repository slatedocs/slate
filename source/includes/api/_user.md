# User


## View 

> Returns JSON structured like this:

```json
{
    "data": {
        "id": 142968,
        "username": "nbieuser",
        "name": "Newbie Custy",
        "email": "evelynl@zylun.com",
        "department": 26,
        "profile": "513485010000008",
        "profile_type": 6,
        "profile_type_name": "Customer",
        "recent_login": null,
        "master": 0,
        "enabled": null,
        "date_added": "2017-06-28 22:20:05"
    }
}
```

This endpoint retrieves customer's user account.

### HTTP Request

`GET customers/<CUSTID>/user`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

## Create

> Returns JSON structured like this:

```json
{
    "data": {
        "id": 142968,
        "username": "nbieuser",
        "name": "Newbie Custy",
        "email": "evelynl@zylun.com",
        "department": 26,
        "profile": "513485010000008",
        "profile_type": 6,
        "profile_type_name": "Customer",
        "recent_login": null,
        "master": 0,
        "enabled": null,
        "date_added": "2017-06-28 22:20:05"
    }
}
```

This endpoint creates new customer's user account.

### HTTP Request

`POST customers/<CUSTID>/user`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.

### Query Parameters

Field Name | Required | Type | Description
---------|-----|------|------
firstname | yes | string | 
lastname | yes | string |
email | yes | string | Should be email
username | yes | string | Should be unique
password | yes | string |

## Delete

> Returns `true` on successful

This method lets you remove customer's user account.

### HTTP Request

`DELETE customers/<CUSTID>/user/<USERID>`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTID | The ID of the customer.
USERID | User ID.
