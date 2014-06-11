# Recipient

## Create or update recipient

This endpoint will create or update a recipient

```shell
# HTTP REQUEST BODY

{ 
	"firstname":"Jeniffer",
	"lastname":"Mathews",
	"companyname":"ca associates",
	"email":"some@email.com",
	"phones":
	[
		{
			"type":"primary",
			"value":"+910123456789"
		}
	],
	"address":
	[
		{
			"addressline1":"stree1",
			"addressline2":"street2",
			"city":"New York",
			"zip":"10001",
			"addresstype":"primary",
			"country":"USA"
		}
	],
	"tags":
	[
		"ny contacts",
		"ca"
	]
}
```

> The above request should return following header

```shell

Location: http://path_to_api/api/recipient?id=5392dcf623aea51b4cded7c6&type=recipient

```

### HTTP Request

`POST api/Recipient/CreateUpdate`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
email | **required** <i>- 10 to 65 characters long </i> <br> email of recipient
firstname | **required** <i>- 3 to 25 characters long </i> <br> first name of the recipient
lastname | **optional** <i>- 3 to 25 characters long </i> <br> last name of the recipient
phones | **optional** <br> model for list of phone numbers associated with the recipient
addresses | **optional** <br> model for list of addresses associated with the recipient
tags | **optional** <br> model for list of tags associated with the recipient

### HTTP Response

<aside class="success">
201 Created
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Get recipient

This endpoint will get a recipient.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"Id":"539551e223aea51824e933d3",
	"FirstName":"Hiren",
	"LastName":"Dhanani",
	"CompanyName":"BinaryGarage",
	"CompanyId":null,
	"QuoteIds":null,
	"Email":"binarygarage1@yahoo.in",
	"EmailHash":null,
	"Phones":
	[
		{
			"Type":0,
			"Value":"+910123456789"
		}
	],
	"Addresses":
	[
		{
			"AddressLine1":"710, Center Point",
			"AddressLine2":null,
			"City":"Vadodara",
			"StateProvinceId":0,
			"Zip":"390001",
			"AddressType":1,
			"Country":
			"India"
		}
	],
	"Audit":null,
	"Tags":[],
	"Errors":[]
}

```

### HTTP REQUEST

`GET api/Recipient/Get?id=5380700d995ba3047cc5eded&type=recipient`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
id | **required** <br> id of the note item to get
type | **required** <br> type of recipient requested <br> **supported inputs:** - recipient, company

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Archive recipient

This endpoint will archive recipient(s).

```shell
# HTTP REQUEST BODY

{
	"recipientids":
	[
		"537d82b423aea5226cc52e65",
		"537d82b323aea5226cc52e64",
		...
	]
}
```

### HTTP REQUEST

`POST api/Recipient/Archive`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
recipientids | **minimum 1 recipient id required** <br> list of recipient ids to archive

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Search recipient

This endpoint will search a recipient with advanced filters (if applied)

```shell
# HTTP REQUEST BODY

{
	"key":"terms",
	"isarchived":false,
	"pagingoptions":
	{
		"pagesize":10,
		"pagenumber":1,
		"isdescending":true
	},
	"gettags":true
}

```

> The above request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"Recipients":
	[
		{
			"Id":"53955d0d23aea518a8476c9a",
			"FullName":null,
			"CompanyName":"BinaryGarage",
			"IsCompany":false,
			"Email":"hardik.pc@outlook.com",
			"EmailHash":null,
			"QuoteCount":0
		}
	],
	"Tags":[],
	"Errors":[],
	"PageNumber":1,
	"PageSize":10,
	"TotalCount":1,
	"TotalPages":1,
	"HasPreviousPage":false,
	"HasNextPage":false
}

```

### HTTP REQUEST

`POST api/Recipient/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
key | **optional** <br> keyword to search the note item
isarchived | **optional** ***- boolean*** <i>, default false </i> <br> property to get only archived note items
pagingoptions | **optional** <br> model to specify paging related options
getrecipient | **optional** ***- boolean*** <i>, default false, true if want to fetch list of recipients </i> <br> property to get recipients associated with an account.
gettags | **optional** ***- boolean*** <i>, default false, true if want to fetch list of tags associated with a recipient </i> <br> property to get tags associated with a recipient associated with an account

### PAGING OPTIONS PARAMETERS

Parameter | Description
-------------- | --------------
pagesize | **optional** <i>- default 10 <i> <br> count of items per page
pagenumber | **optional** <i>- default 1 <i> <br> current page index
isdescending | **optional** <i>- default is true </i> <br> property to sort items in descending or ascending order

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Clean up recipient(s)

This endpoint will delete all recipients associated with an account which has no quotes associated with itself.

```shell
# HTTP REQUEST BODY

{}

```

>  The above request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"deletedrecipientcount":8,
	"deletecompaniescount":0
}

```

### HTTP REQUEST

`POST api/Recipient/CleanUp`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside> 