# Quote

## Create quote

This endpoint will create a new quote.

```shell
# HTTP REQUEST BODY

{ 
  	"quoteid":"0",
	"title": "High-range firewall",
	"lineitems": 
	[ 
		{ 
			"itemtype":"Product", 
			"itemcode":"001", 
			"itemname":"Terminator 1", 
			"lineitemunit":"perpiece", 
			"quantity":1, 
			"priceperquantity":125400, 
			"groupname":"H/W Firewall", 
			"requiredas":"required"
		},
		{ 
			"itemtype":"Product", 
			"itemcode":"001", 
			"itemname":"Terminator 1", 
			"lineitemunit":"perpiece", 
			"quantity":1, 
			"priceperquantity":125400, 
			"groupname":"H/W Firewall", 
			"requiredas":"required"
		},
		{ 
			"itemtype":"Product", 
			"itemcode":"001", 
			"itemname":"Terminator 1", 
			"lineitemunit":"perpiece", 
			"quantity":1, 
			"priceperquantity":125400, 
			"groupname":"H/W Firewall", 
			"requiredas":"required"
		}
		 ...
	],
	"noteitems":
	[
		{
			"title":"terms & conditions",
			"description":"loreum ipsum, loreum upsum, lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum"
		}
	],	
	"recipients":
	[ 
		{ 
			"firstname":"Hardik", 
			"lastname":"Mistry",  
			"email":"mistryhardik.05@gmail.com", 
			"isto":true 
		} ...
	],
	"pricing": 
	{ 
		"currency":"INR" 
	},
	"expireson": "10/10/2014 12:00:00 AM"
}
```

> The above request should return following header

```shell

Location: http://path_to_api/api/Quote?id=5392dcf623aea51b4cded7c6

```

### HTTP Request

`POST api/Quote/Create`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
quoteid | **required** <i>- 0 for a new quote or a valid id to update an existing one </i> <br> id of the quote
title | **required** <i>- 3 to 50 characters long </i> <br> title of the quote
pricing | **optional** <br> model for pricing information related to quote
lineitems | **required** <i>- minimum 1 line item is required </i> <br> model for list of line items within the quote
noteitems | **optional** <br> model for list of note items within the quote
recipients | **required** <i>- minimum 1 recipient is required </i> <br> model for list of recipients of the quote
expireson | **required** <br> date time of expiry of the quote
tocompanyid | **optional** <br> id of company of recipient
tocompanyname | **optinal** <br> name of company of recipient
accesscode | **optional** <i>- 6 characters long, only if secure mode is one </i> <br> access code required by the recipient of the quote to get access to the quote

### PRICING PARAMETERS

Parameter | Description
-------------- | --------------
discount | **optional** <br> model to represent discount applied to the quote 
taxes | **optional** <br> model for list of taxes applied to the quote
currency | **required** <br> currency in which amount would be computed and displayed on quote sent to the recipient

### QUOTE LINE ITEM PARAMETERS

Parameter | Description
-------------- | -------------- 
itemtype | **required** <br> type of line item <br><br> ***supported input:*** product, subscription, service
itemcode | **required** <i>- 3 to 20 characters long </i> <br> code to identify the line item
itemname | **required** <i>- 5 to 50 characters long </i> <br> name or title of line item
itemdescription | **optional** <i>- 3 to 150 characters long </i> <br> description for the line item
quantity | **optional** ***- decimanl*** <i>, default is 0 </i> <br> quantity of line item
lineitemunit | **optional** <i>- default is on basis of item type selected </i> <br> unit of line item
priceperquantity | **optional** ***- decimal*** <i>, default is 0 </i> <br> per per unit of line item
pricing | **optional** <br> model of pricing applied per line item
attachments | **optional** <br> model for list of attachment items per line item
requiredas | **optional** <i>- default is required </i> <br> by default the line item would be set as required line item
accountcode | **optional** <i>- default account code is set via settings of the account </i> <br> account code applicable per line
groupname | **optional** <i>- 4 to 25 characters long </i> <br> name of group to which the line item belongs to

### QUOTE NOTE ITEM PARAMETERS

Parameter | Description
-------------- | --------------
title | **optional** <i>- 3 to 50 characters long </i> <br> title of note item
description | **optional** <i>- 3 to 250 characters long </i> <br> description of note item 
attachments | **optional** <br> model for list of attachment items per note item
groupname | **optional** <i>- 4 to 25 characters long </i> <br> name of group to which the note item belongs to

### HTTP Response

<aside class="success">
201 Created
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Client accept or decline quote

This endpoint will allow a client to accept or decline a quote

```shell
# HTTP REQUEST BODY

{ 
  	"quoteaction":"accepted",
	"key":"2270912302132140681661241340940041440111312381670 ... ",
	"quoteresponse":
	{
		"clientemail":"tony@stark.com",
		"referencenumber":"QT-01",
		"selecteitemids":
		[
			1,
			2,
			5
		]
	}
}
```


### HTTP Request <i>- is annonymous request </i>

`POST api/Quote/ClientQuoteAction`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
quoteaction | **required** <br> action to indicate if the quote was accepted or rejected <br><br> ***supported inputs:*** accepted, declined
key | **required** <br> key to authenticate the client and the associated quote to perfom the action (available from link sent to recipient as an email)
quoteresponse | **required** <br> model for metadata required to process the request

### Quote respnse parameters

Parameter | Description
-------------- | --------------
clientemail | **optional** <i>- 10 to 65 characters long</i> <br> email of client
comment | **required** - if quote is declined by the client else optional
referencenumber | **optional** <br> reference number of the quote being accepted or declined
selecteitemids | **optional** - if all line items are required or **at 1 line item** - should be selected to accept the quote <br><br> list of index of line items selected while accepting the quote


### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Create discussion

This endpoint will create a discussion within the quote.

```shell
# HTTP REQUEST BODY

{ 
  	"fromname":"John Doe",
	"fromemail":"john@company.com",
	"notifytoemail":"jane@company.com",
	"notifytoname":"Jane Doe",
	"commenttext":"Hey this is a comment from Quotebox",
	"isprivate":false
}
```

### HTTP REQUEST

`POST api/Quote/Discussion`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
fromname | **optional** <br> name of creator of the discussion
fromemail | **optional** <br> email of creator of the discussion
notifytoemail | **optional** <br> email of intended recipient of the discussion
notifytoname | **optional** <br> name of intended recipient of the discussion
notifytophone | **optional** <br> contact of intended recipient of the discussion
commenttext | **required** <br> text to display in discussion
isprivate | **optional** ***-boolean*** <i>, default false, true if it is a priavte note</i> <br>

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Get quote

This endpoint will get the quote.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"QuoteId":"53916ee223aea518b44ab467",
	"ReferenceNumber":null,
	"Title":"Quote #57",
	"Recipients":
	[
		{
			"Id":"53916ee223aea518b44ab428",
			"FirstName":"Hiren",
			"LastName":null,
			"FullName":"Hiren ",
			"Email":"search@email.com",
			"Phone":null,
			"IsTo":true,
			"ToAddress":null
		},
		{
			"Id":"53916ee223aea518b44ab42f",
			"FirstName":"Dhiraj",
			"LastName":null,
			"FullName":"Dhiraj ",
			"Email":"binarygarage1@yahoo.in",
			"Phone":null,
			"IsTo":false,
			"ToAddress":null
		}
	],
	"ClientName":null,
	"LineItems":
	[
		{
			"LineItemId":0,
			"SelectedByClient":false,
			"IsEdited":false,
			"Id":null,
			"ItemType":0,
			"ItemCode":"P001",
			"ItemName":"Asus M8N-V8LE",
			"ItemDescription":"Mid range motherboard",
			"Quantity":1.0,
			"LineItemUnit":"Per piece",
			"PricePerQuantity":12300.0,
			"Pricing":
			{
				"Discount":
				{
					"DiscountType":0,"DiscountValue":5.0
				},
				"Tax":
				{
					"Id":0,
					"Description":"CST",
					"Value":5.5
				},
				"NetTotal":12971.22,
				"SubTotal":12300.0,
				"TaxTotal":676.22,
				"DiscountTotal":5.0
			},
			"Attachments":null,
			"RequiredAs":1,
			"AccountCode":"A01",
			"GroupName":null
	],
	"Status":10,
	"CreatedOn":"2014-06-06T07:33:54.572Z",
	"ExpiresOn":"2014-02-19T18:30:00Z",
	"SentOn":"2014-06-06T07:33:54.572Z",
	"ModifiedOn":"2014-06-06T07:33:59.674Z",
	"AccessCodeSent":false,
	"Author":
	{
		"FullName":null,
		"Email":null,
		"CompanyName":"Contoso Corp",
		"CompanyAddress":null,
		"Phone":"0123456789",
		"CompanyWebsite":"www.contoso.com"
	},
	"Audit":
	[
		{
			"On":"2014-06-06T07:33:54.572Z",
			"Text":"Quote created by Quotebox"
		},
		{
			"On":"2014-06-06T07:33:59.674Z",
			"Text":"Quote Expired."
		}
	],
	"Discussions":
	[],
	"QuoteStatusAudit":
	[
		{
			"On":"2014-06-06T07:33:59.674Z",
			"By":null,
			"Status":10
		}
	],
	"Analytics":null,
	"ToCompanyId":"1122334455",
	"ToCompanyName":"Universal Sales"
}

```

### HTTP REQUEST

`Get api/Quote/Get?id=5380700d995ba3047cc5ff1d&isPreivew=false`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
id | **required** <br> id of the quote to get
ispreview | **optional** ***- boolean*** <i>, default false, set to true to get edit view </i> <br> toggle if you need editable meta data for quote or only preview meta data

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Get quote for client

This endpoint will get the quote.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"QuoteId":"53916ee223aea518b44ab467",
	"ReferenceNumber":null,
	"Title":"Quote #57",
	"Recipients":
	[
		{
			"Id":"53916ee223aea518b44ab428",
			"FirstName":"Hiren",
			"LastName":null,
			"FullName":"Hiren ",
			"Email":"search@email.com",
			"Phone":null,
			"IsTo":true,
			"ToAddress":null
		},
		{
			"Id":"53916ee223aea518b44ab42f",
			"FirstName":"Dhiraj",
			"LastName":null,
			"FullName":"Dhiraj ",
			"Email":"binarygarage1@yahoo.in",
			"Phone":null,
			"IsTo":false,
			"ToAddress":null
		}
	],
	"ClientName":null,
	"LineItems":
	[
		{
			"LineItemId":0,
			"SelectedByClient":false,
			"IsEdited":false,
			"Id":null,
			"ItemType":0,
			"ItemCode":"P001",
			"ItemName":"Asus M8N-V8LE",
			"ItemDescription":"Mid range motherboard",
			"Quantity":1.0,
			"LineItemUnit":"Per piece",
			"PricePerQuantity":12300.0,
			"Pricing":
			{
				"Discount":
				{
					"DiscountType":0,"DiscountValue":5.0
				},
				"Tax":
				{
					"Id":0,
					"Description":"CST",
					"Value":5.5
				},
				"NetTotal":12971.22,
				"SubTotal":12300.0,
				"TaxTotal":676.22,
				"DiscountTotal":5.0
			},
			"Attachments":null,
			"RequiredAs":1,
			"AccountCode":"A01",
			"GroupName":null
	],
	"Status":10,
	"CreatedOn":"2014-06-06T07:33:54.572Z",
	"ExpiresOn":"2014-02-19T18:30:00Z",
	"SentOn":"2014-06-06T07:33:54.572Z",
	"ModifiedOn":"2014-06-06T07:33:59.674Z",
	"AccessCodeSent":false,
	"Author":
	{
		"FullName":null,
		"Email":null,
		"CompanyName":"Contoso Corp",
		"CompanyAddress":null,
		"Phone":"0123456789",
		"CompanyWebsite":"www.contoso.com"
	},
	"Audit":
	[
		{
			"On":"2014-06-06T07:33:54.572Z",
			"Text":"Quote created by Quotebox"
		},
		{
			"On":"2014-06-06T07:33:59.674Z",
			"Text":"Quote Expired."
		}
	],
	"Discussions":
	[],
	"QuoteStatusAudit":
	[
		{
			"On":"2014-06-06T07:33:59.674Z",
			"By":null,
			"Status":10
		}
	],
	"Analytics":null,
	"ToCompanyId":"1122334455",
	"ToCompanyName":"Universal Sales"
}

```

### HTTP REQUEST

`GET api/Quote/GetForClient?key=some_key&accesscode=""`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
key | **required** <br> key to authorize access to the intended quote
accesscode | **optional** - if quote is not secure, else **required** - if quote is secured

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Archive quote

This endpoint will set quote as archived.

```shell
# HTTP REQUEST BODY

{
	"quoteidlist":
	[
		"537d82b423aea5226cc52e65",
		"537d82b323aea5226cc52e64",
		...
	]
}
```

### HTTP REQUEST

`POST api/Quote/Archive`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
quoteidlist | **minimum 1 quote id required** <br> list of quote ids to archive

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Copy quote

This endpoint will set create a copy of the quote.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"ReferenceNumber":"1",
	"Title":"Mid range gaming PC #1",
	"Recipients":
	[
		{
			"Id":"539174ac23aea50e4cf9fcf5",
			"FirstName":"Hiren",
			"LastName":null,
			"FullName":"Hiren ",
			"Email":"search@email.com",
			"IsTo":true,
			"IsDeleted":false
		},
		{
			"Id":"539174ac23aea50e4cf9fcfc",
			"FirstName":
			"Dhiraj",
			"LastName":null,
			"FullName":"Dhiraj ",
			"Email":"binarygarage1@yahoo.in",
			"IsTo":false,
			"IsDeleted":false
		}
	],
	"LineItems":
	[
		{
			"LineItemId":0,
			"SelectedByClient":false,
			"IsEdited":false,
			"Id":null,
			"ItemType":0,
			"ItemCode":"P001",
			"ItemName":
			"Asus M8N-V8LE",
			"ItemDescription":
			"Mid range motherboard",
			"Quantity":1.0,
			"LineItemUnit":"Per piece",
			"PricePerQuantity":12300.0,
			"Pricing":
			{
				"Discount":
				{
					"DiscountType":0,
					"DiscountValue":5.0
				},
				"Tax":
				{
					"Id":0,
					"Description":"CST",
					"Value":5.5
				},
				"NetTotal":12971.22,
				"SubTotal":12300.0,
				"TaxTotal":676.22,
				"DiscountTotal":5.0
			},
			"Attachments":null,
			"RequiredAs":1,
			"AccountCode":"A01",
			"GroupName":null
		}
	],		
	"Status":0,
	"CreatedOn":"0001-01-01T00:00:00",
	"ExpiresOn":"0001-01-01T00:00:00",
	"ToCompanyId":"1122334455",
	"ToCompanyName":"Specflow company",
	"AnyOneGroups":null,
	"Errors":[]
} 

```

### HTTP REQUEST

`GET api/Quote/CopyQuote?id=5380700d995ba3047cc5ff1d`

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

## Search quote

This endpoint will search a quote with advanced filters (if applied)

```shell
# HTTP REQUEST BODY

{
	"key":"gaming pc",
	"isarchived":false,
	"status":"pending",
	"teammemberid":"539174ac23aea5032cf9fcf5",
	"isindiscussion":false,
	"opened":false,
	"companyid":"539174ac23aea50e4cf9fc5f",
	"recipientid":"533274ac23aea50e4cf9fcf5",
	"timeline":"today",
	"startdate":"01/10/2013 10:00 AM",
	"enddate":"01/10/2014 10:00 AM",
	"pagingoptions":
	{
		"pagesize":10,
		"pagenumber":1,
		"isdescending":true
	}
}

```

> The above request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"Quotes":
	[
		{
			"Id":"5392ad5423aea51c54fc43fc",
			"QuoteReferenceNumber":null,
			"Title":"Mid range gaming PC - search",
			"Author":"TestEngineer",
			"LastModifiedOn":"2014-06-07T06:12:35.955Z",
			"AccessCode":"",
			"QuoteTotal":55977.9,
			"Label":"Un Opened",
			"Status":0,
			"InDiscussion":false,
			"ToName":"Specflow company",
			"CurrencyCode":"INR"
		},
		{
			"Id":"5392ad5423aea51c54fc4411",
			"QuoteReferenceNumber":null,
			"Title":"Search Quote #12",
			"Author":"TestEngineer",
			"LastModifiedOn":"2014-06-07T06:12:35.956Z",
			"AccessCode":"",
			"QuoteTotal":55977.9,
			"Label":"Un Opened",
			"Status":10,
			"InDiscussion":false,
			"ToName":"Specflow company",
			"CurrencyCode":"INR"
		}, ...
	],
	"Errors":[],
	"PageNumber":1,
	"PageSize":10,
	"TotalCount":22,
	"TotalPages":3,
	"HasPreviousPage":false,
	"HasNextPage":true
}

```

### HTTP REQUEST

`POST api/Quote/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
key | **optional** <br> keyword to search the quote
isarchived | **optional** ***- boolean*** <i>, default false </i> <br> search only quotes those are archived or not
status | **optional** <br> recent status of the quote <br> ***supported input*** - draft, pending, accepted, declined, revoked, inrevision, withdrawn, expired
teammemberid | **optional** <br> id of team member who created the quote
isindiscussion | **optional** ***- boolean*** <br> field to find quotes which are in discussion
opened | **optional** ***- boolean*** <br> field to find viewed quotes
companyid | **optional** <br> id of company to the recipient of which the quote was sent
recipientid | **optional** <br> id of recipient to which the quote was sent
timeline | **optional** <br> timeline to find quote in range of <br> ***supported input*** - today, week, month, year, custom, quarter
startdate | **optional** <br> start date of range to find quotes within
enddate | **optional** <br> end date of range to find quotes within
pagingoptions | **optional** <br> model to specify paging related options

### PAGING OPTIONS PARAMETERS

Parameter | Description
-------------- | --------------
pagesize | **optional** <i>- default 10 <i> <br> count of items per page
pagenumber | **optional** <i>- default 1 <i> <br> current page index
isdescending | **optional** <i>- default is true </i> <br> sort the items in descending or ascending order

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Update quote analytics

This endpoint update the analytic meta data when a client views an attachment associated with a quote.

```shell
# HTTP REQUEST BODY

{
	"attachmentid": "537d82b423aea5548cc52e65",
	"duration":200
}
```

### HTTP REQUEST

`POST api/Quote/UpdateQuoteAnalytics`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
attachmentid | **required** <br> id of attachment to update analytic for
duration | **optional** ***- integer*** <i>, in miliseconds </i> <br> duration of the attachment being watched by the client

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Quote action

This endpoint will update the quote meta data as per the action taken on the quote either by the user and/or the client(recipient) of the quote.

```shell
# HTTP REQUEST BODY

{
	"quoteid": "537d58b423aea5548cc52e65",
	"quoteaction":"sent",
	"quoteresponse":
	{
		"clientemail":"jeniffer@somedomain.com",
	}
}
```

### HTTP REQUEST

`POST api/Quote/QuoteAction`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
quoteid | **required** <br> id of the quote on which the action is performed
quoteaction | **required** <br> action to perform on the quote <br><br> **supported actions:** sent, sentnotemailed, accepted, acceptedonbehalf, declined, markdeclined, revoked, inrevision, updateonly, withdrawn, acceptedundo, declineundo, revokeundo, withdrawundo, delete, clientdiscussion, teammemberdiscussion
quoteresponse | **required** <br> model for metadata required to process the request
primaryphonelist | model for list of primary phone number of recipient(s) of the quote <br><br> **not required** <i>, if the quote is secured</i> <br><br> **required** <i>, if the quote secured </i>


### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>