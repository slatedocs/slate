# Users

## Registration

```shell
curl "http://example.com/api/users/register"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 201,
  "message": "User created",
  "body": {
    "user_id": 1,
    "token": "9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2"
  }
}
```

This endpoint registers user with basic details.

### HTTP Request

`POST http://example.com/api/users/register`

### Body Parameters

Parameter      | Data Type | Description
---------------|-----------|--------------
email          | String    | The email of the user to register
password       | String    | The password of the user to register
mobile_number  | String    | The mobile number of the user to register

<aside class="success">
201 - User created
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## User Verification

```shell
curl "http://example.com/api/users/verify"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "user_id": 1,
    "token": "9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2"
  }
}
```

This endpoint verifies the user's account through a verification code sent via email.

### HTTP Request

`POST http://example.com/api/users/verify`

### Body Parameters

Parameter      | Data Type | Description
---------------|-----------|--------------
user_id        | Integer   | The user_id of the user to register
code           | String    | The verification code received by the user

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>


## PIN Creation

```shell
curl "http://example.com/api/users/register/pin"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 201,
  "message": "PIN created",
  "body": {
    "user_id": 1,
    "token": "9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2"
  }
}
```

This endpoint completes the registraion with PIN code.

### HTTP Request

`POST http://example.com/api/users/register/pin`

### Body Parameters

Parameter      | Data Type | Description
---------------|-----------|--------------
user_id        | Integer   | The user_id of the user to register
pin_code       | String    | The pin code of the user to register

<aside class="success">
201 - PIN created
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Login

```shell
curl "http://example.com/api/users/login"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "user_id": 1,
    "token": "9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2"
  }
}
```

This endpoint retrieves token for user.

### HTTP Request

`POST http://example.com/api/users/login`

### Body Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
mobileNo  | String    | The mobile number of the user to login
password  | String    | The password of the user to login

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Login via PIN

```shell
curl "http://example.com/api/users/login/pin"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "user_id": 1,
    "token": "9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2"
  }
}
```

This endpoint retrieves token for user.

### HTTP Request

`POST http://example.com/api/users/login/pin`

### Body Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
pin_code  | String    | The pin code of the user to login
user_id   | Integer   | The user id of the user to login

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Change Password

```shell
curl "http://example.com/api/users/password"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success"
}
```

This endpoint changes the password of user.

### HTTP Request

`POST http://example.com/api/users/password`

### Body Parameters

Parameter         | Data Type | Description
------------------|-----------|--------------
user_id           | Integer   | The user id of the user logged in
current_password  | String    | The current password of the user logged in
new_password      | String    | The new password of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Change PIN

```shell
curl "http://example.com/api/users/pin"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success"
}
```

This endpoint changes the pin of user.

### HTTP Request

`POST http://example.com/api/users/pin`

### Body Parameters

Parameter    | Data Type | Description
-------------|-----------|--------------
user_id      | Integer   | The user id of the user logged in
current_pin  | String    | The current pin of the user logged in
new_pin      | String    | The new pin of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Get a Specific User

```shell
curl "http://example.com/api/users/1"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "user_id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@gmail.com",
    "mobile_number": "0917XXXXXXX",
    "pin_code": "0000"
  }
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET http://example.com/api/users/<ID>`

### URL Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
ID        | Integer   | The user id of the user to retrieve

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Logout

```shell
curl "http://example.com/api/users/logout"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success"
}
```

This endpoint logouts the user.

### HTTP Request

`POST http://example.com/api/users/logout`

### Body Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
ID        | Integer   | The user id of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>