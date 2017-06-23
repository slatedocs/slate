# Invoice Customers User 

Invoice Customers User handles the adding of customer user account for customer portal to support multiple customers in a single user account. 

## View

> Returns JSON structured like this:

```json
{
    "data": {
        "id": 142965,
        "username": "joannedoe",
        "name": "Joanne Doe",
        "email": "evelynl@zylun.com",
        "department": 26,
        "profile": "513485010000008",
        "profile_type": 6,
        "profile_type_name": "Customer",
        "recent_login": null,
        "master": 0,
        "enabled": null,
        "date_added": "2017-06-21 23:38:12"
    }
}
```

This method lets you view a specific customer user.

### HTTP Request

`GET invoicecustomersuser/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The id of the customer user.

## Create

> Returns JSON structured like this:

```json
{
    "data": {
        "id": 142965,
        "username": "joannedoe",
        "name": "Joanne Doe",
        "email": "evelynl@zylun.com",
        "department": 26,
        "profile": "513485010000008",
        "profile_type": 6,
        "profile_type_name": "Customer",
        "recent_login": null,
        "master": 0,
        "enabled": null,
        "date_added": "2017-06-21 23:38:12"
    }
}
```

This method lets you create new invoice customer user.

### HTTP Request

`POST invoicecustomersuser`


### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
firstname | yes | string | 
lastname | yes | string |
email | yes | string | Should be email
username | yes | string | Should be unique
password | yes | string |

##Update

> Returns JSON structured like this:

```json
{
    "data": {
        "id": 142965,
        "username": "joannedoe",
        "name": "Joanne Doe",
        "email": "evelynl@zylun.com",
        "department": 26,
        "profile": "513485010000008",
        "profile_type": 6,
        "profile_type_name": "Customer",
        "recent_login": null,
        "master": 0,
        "enabled": null,
        "date_added": "2017-06-21 23:38:12"
    }
}
```

This method lets you update existing invoice customer user.

### HTTP Request

`PUT invoicecustomersuser/{id}`

### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
firstname | yes | string | 
lastname | yes | string |
email | yes | string | Should be email
username | yes | string | Should be unique

##Remove

> Returns true if successfull:

```json
true
```

This method lets you remove a specific invoice customer user.

### HTTP Request

`DELETE invoicecustomersuser/{id}`