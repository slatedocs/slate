# User Profile

## Get user profile

This endpoint will get profile details of the user.

```shell
# HTTP REQUEST OBJECT

{
	"userid":"53734c354ac4891304f1429f"
}
```

> The above request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"userid":"53734c354ac4891304f1429f", 
	"email":"john@company.com", 
	"phonenumber":"012345678", 
	"firstname":"john", 
	"lastname":"doe", 
	"islockout":true 
	"lastlogindate":"01/06/2014 12:32 PM", 
	"joineddate":"05/10/2013 10:21 AM", 
	"usertype":"administrator", 
	"timezone":"+5:30 GMT" 
}
```

### HTTP REQUEST

`POST api/Account/UserProfile`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

Parameter | Description 
-------------- | -------------- 
userid | **required** <br> id associated with an user

### HTTP RESPONSE

<aside class="success">
200 OK - with following object
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Update user profile

This endpoint will update profile details of the user.

```shell
# HTTP REQUEST BODY

{
	"email":"jane@company.com", 
	"phonenumber":"012345678", 
	"firstname":"jane", 
	"lastname":"doe",
	"timezone":"+5:30 GMT" 
}
```

### HTTP REQUEST

`POST api/Account/UpdateUserProfile`

### HTTP REQUEST BODY PARAMETERS

Parameter | Description 
-------------- | -------------- 
email | **required** <i>- 10 to 65 characters long</i> <br> email of the user
phonenumber | **optional** <i>- only digits allowed</i> <br> contact number of the user
firstname | **required** <i>- 3 to 25 characters long</i> <br> first name of the user
lastname  | **required** <i>- 3 to 25 characters long</i> <br> last name of the user
timezone | **required** <br> time zone of the user

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>