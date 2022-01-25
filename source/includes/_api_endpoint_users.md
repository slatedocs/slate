## Users
Use this endpoint to obtain details on Mautic's users (administrators).

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$userApi  = $api->newApi("users", $auth, $apiUrl);
```

### Get User
```php
<?php

//...
$user = $userApi->get($id);
```
```json
{  
  "user":{  
    "isPublished":true,
    "dateAdded":"2016-11-09T14:23:44+00:00",
    "createdBy":1,
    "createdByUser":"John Doe",
    "dateModified":null,
    "modifiedBy":null,
    "modifiedByUser":null,
    "id":6,
    "username":"apitest",
    "firstName":"John",
    "lastName":"Doe",
    "email":"john@doe.com",
    "position":null,
    "role":{  
      "createdByUser":null,
      "modifiedByUser":null,
      "id":1,
      "name":"Administrator",
      "description":"Full system access",
      "isAdmin":true,
      "rawPermissions":null
    },
    "timezone":null,
    "locale":null,
    "lastLogin":null,
    "lastActive":null,
    "onlineStatus":"offline",
    "signature":null
  }
}
```
Get an individual user by ID.

#### HTTP Request

`GET /users/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**User Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the contact
dateAdded|datetime|Date/time contact was created
createdBy|int|ID of the user that created the contact
createdByUser|string|Name of the user that created the contact
dateModified|datetime/null|Date/time contact was last modified
lastActive|datetime/null|Date/time when the user last active
modifiedBy|int|ID of the user that last modified the contact
modifiedByUser|string|Name of the user that last modified the contact
username|string|Username which can be used for log in to Mautic.
firstName|string|First Name of the user
lastName|string|Last Name of the user
email|string|Email of the user
position|string|User's position title
role|object|Role details
timezone|string|Timezone of the user
onlineStatus|string|Online status of the user
signature|string|Signature of the user which can be used in the emails


### List Contact Users

```php
<?php

//...
$users = $userApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
  "total":2,
  "users":[  
    {  
      "isPublished":true,
      "dateAdded":"2016-08-01T11:52:15+00:00",
      "createdBy":null,
      "createdByUser":" ",
      "dateModified":"2016-09-26T15:02:32+00:00",
      "modifiedBy":null,
      "modifiedByUser":" ",
      "id":2,
      "username":"test",
      "firstName":"John",
      "lastName":"Doe",
      "email":"john@doe.com",
      "position":null,
      "role":{  
        "createdByUser":"John Doe",
        "modifiedByUser":null,
        "id":4,
        "name":"edit own contacts",
        "description":null,
        "isAdmin":false,
        "rawPermissions":{  
          "lead:leads":[  
            "viewown",
            "editown",
            "create",
            "deleteown"
          ],
          "lead:lists":[  
            "viewother"
          ]
        }
      },
      "timezone":null,
      "locale":null,
      "lastLogin":"2016-09-26T15:03:25+00:00",
      "lastActive":"2016-09-26T15:19:15+00:00",
      "onlineStatus":"offline",
      "signature":"Best regards,&#10;Yours&#10;|FROM_NAME|"
    },
    [...]
  ]
}
```

#### HTTP Request

`GET /users`

#### Response

`Expected Response Code: 200`

See JSON code example.

**User Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the contact
dateAdded|datetime|Date/time contact was created
createdBy|int|ID of the user that created the contact
createdByUser|string|Name of the user that created the contact
dateModified|datetime/null|Date/time contact was last modified
lastActive|datetime/null|Date/time when the user last active
modifiedBy|int|ID of the user that last modified the contact
modifiedByUser|string|Name of the user that last modified the contact
username|string|Username which can be used for log in to Mautic.
firstName|string|First Name of the user
lastName|string|Last Name of the user
email|string|Email of the user
position|string|User's position title
role|array|List of roles of the user
timezone|string|Timezone of the user
onlineStatus|string|Online status of the user
signature|string|Signature of the user which can be used in the emails

### Create User
```php
<?php 

$data = array(
    'username' => 'apitest',
    'firstName' => 'John',
    'lastName' => 'Doe',
    'email' => 'john@doe.com',
    'plainPassword' => array(
        'password' => 'topSecret007',
        'confirm' => 'topSecret007',
    ),
    'role' => 1,
);

$user = $userApi->create($data);
```
Create a new user.

#### HTTP Request

`POST /users/new`

**Post Parameters**

Name|Description
----|-----------
username|string|Username which can be used for log in to Mautic.
firstName|string|First Name of the user
lastName|string|Last Name of the user
email|string|Email of the user
position|string|User's position title
role|int|Role ID
timezone|string|Timezone of the user
onlineStatus|string|Online status of the user
signature|string|Signature of the user which can be used in the emails
plainPassword|array|array of plain password as in the example

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get User](#get-user).

### Edit User
```php
<?php

$id   = 1;
$data = array(
    'lastName' => 'Doeboe',
);

// Create new a user of ID 1 is not found?
$createIfNotFound = true;

$user = $userApi->edit($id, $data, $createIfNotFound);
```
Edit a new user. User that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a user if the given ID does not exist and clears all the user information, adds the information from the request.
**PATCH** fails if the user with the given ID does not exist and updates the user field values with the values form the request.

#### HTTP Request

To edit a user and return a 404 if the user is not found:

`PATCH /users/ID/edit`

To edit a user and create a new one if the user is not found:

`PUT /users/ID/edit`

**Post Parameters**

Name|Description
----|-----------
username|string|Username which can be used for log in to Mautic.
firstName|string|First Name of the user
lastName|string|Last Name of the user
email|string|Email of the user
position|string|User's position title
role|int|Role ID
timezone|string|Timezone of the user
signature|string|Signature of the user which can be used in the emails

#### Response

If `PUT`, the expected response code is `200` if the user was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get User](#get-user).

### Delete User
```php
<?php

$user = $userApi->delete($id);
```
Delete a user.

#### HTTP Request

`DELETE /users/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get User](#get-user).

### Get Self User
```php
<?php

$user = $userApi->getSelf();
```
Get a self user.

#### HTTP Request

`GET /users/self`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get User](#get-user).

### Check User Permissions
```php
<?php
$permission = array('user:users:create', 'user:users:edit');
$user = $userApi->checkPermission($id, $permission);
```
Get a self user.

#### HTTP Request

`GET /users/ID/permissioncheck`

#### Response

`Expected Response Code: 200`
```json
{
  "user:users:create":true,
  "user:users:edit":true
}
```

**Properties**

array of requested permissions of string in case of just one
