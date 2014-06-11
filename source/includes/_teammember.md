# Team Member

## Invite team member

This endpoint will send an invitation to join Quotebox.

```shell
# HTTP REQUEST BODY

{
	"email":"jane@company.com", 
	"phonenumber":"012345678", 
	"firstname":"jane", 
	"lastname":"doe",
	"timezone":"+5:30 GMT",
	"isadmin":false,
	"accountname":"GolboMantics Corp"
}
```

### HTTP REQUEST

`POST api/Account/Invite`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
firstname | **required** <i>- 3 to 25 characters long</i> <br> first name of the user
lastname | **required** <i>- 3 to 25 characters long</i> <br> last name of the user
email | **required** <i>- 10 to 65 characters long</i> <br> email of the user
phonenumber | **optional** <i>- only digits allowed </i> <br> phone number of the user
isadmin | **optional** ***- boolean*** <i>, false by default </i> <br> true if the intended user is an administrator for the associated account
accountname | **optional** <br> name of the account to invite the user in Quotebox

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Get invited team member

This endpoint will get the details of a invited team member.

```shell
# HTTP REQUEST BODY

{
	"invitekey":"2270912302132140681661241340940041440111312381670 ... "
}
```

### HTTP REQUEST

`POST api/Account/InvitedTeamMember`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
invitekey | **required** <br> invitation key to get details of invited team member (available from link sent via email of invitation sent to the user)

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Delete invitation

This endpoint will delete an invitation.

```shell
# HTTP REQUEST BODY

{
	"teammemberid":"5380700d995ba3047cc5ff1c"
}
```

### HTTP REQUEST

`POST api/Account/DeleteInvite`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
teammemberid | **required** <br> id of team member to delete invitation for

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Accept invitation

This endpoint will accept the invitation to join an account with Quotebox.

```shell
# HTTP REQUEST BODY

{
	"invitekey":"2270912302132140681661241340940041440111312381670 ... ",
	"password":"P@ssw0rd",
	"confirmpassword":"P@ssw0rd"
}
```

### HTTP REQUEST

`POST api/Account/AcceptInvite`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
password | **required** <i>- 8 to 16 characters long</i> <br> password required to authorize login
confirmpassword | **required** <i>- 8 to 16 characters long</i> <br> retype password required to authorize login
invitekey | **required** <br> invitation key required to verify the invitation request (available from link sent via email of invitation sent to the user)

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Fetch team member

This endpoint will find a team member.

```shell
# HTTP REQUEST BODY

{
	"teammemberid":"5380700d995ba3047cc5ff1c"
}
```

> The above request should return following JSON

```shell
# HTTP RESPOSNE OBJECT

{
	"teammemberid":"5380700d995ba3047cc5ff1c", 
	"teammemberemail":"jane@company.com", 
	"isadmin": true
}
```

### HTTP REQUEST

`POST api/Account/FetchTeamMember`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
teammemberid | **required** <br> id of team member to fetch

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Search team member

This endpoint will search amongst team members.

> The search request should return following JSON

```shell
# HTTP RESPOSNE OBJECT

{
	"TeamMembers": 
	[ 
		{ 
			"id":"5380700d995ba3047cc5ff1c", 
			"email":"jane@company.com", 
			"firstname":"jane", 
			"lastname":"john", 
			"isadmin":false, 
			"fullname":"jane doe", 
			"expireson":"05/09/2020 10:10 AM" 
		} ... 
	]
}
```

### HTTP REQUEST

`POST api/Account/SearchTeamMember`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Remove team member

This endpoint will remove a team member from associated account.

```shell
# HTTP REQUEST BODY

{
	"teammemberid":"5380700d995ba3047cc5ff1c"
}
```

### HTTP REQUEST

`POST api/Account/RemoveTeamMember`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
teammemberid | **required** <br> id of team member to be removed

### HTTP RESPONSE

<aside class="success">
200 OK 
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Update team member

This endpoint will update alternate email and rights for a team member associated with an account.

```shell
# HTTP REQUEST BODY

{
	"teammemberid":"5380700d995ba3047cc5ff1c",
	"isadmin":true,
	"alternateemail":"john@company.com"
}
```

### HTTP REQUEST

`POST api/Account/UpdateTeamMember`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
teammemberid | **required** <br> id of team member to update
isadmin | **optional** ***- boolean*** <i>, false by default </i> <br> true if the intended user is an administrator for the associated account
alternateemail | **optional** <br> alternate email of team member

### HTTP RESPONSE

<aside class="success">
200 OK 
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>