# Template

## Create or update template

This endpoint will create or update a template.

```shell
# HTTP REQUEST BODY

{ 
	"title": "High-range firewall",
	"lineitems": 
	[ 
		{ 
			"id":"53916ee223aea518b44ab428",
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
			"id":"53916ee223aea518b44ae328",
			"id":"53916ee223aea518b44ae328",
			"itemtype":"Product", 
			"itemcode":"001", 
			"itemname":"Terminator 1", 
			"lineitemunit":"perpiece", 
			"quantity":1, 
			"priceperquantity":125400, 
			"groupname":"H/W Firewall", 
			"requiredas":"required"
		}, ...
	],
	"noteitems":
	[
		{
			"title":"terms & conditions",
			"description":"loreum ipsum, loreum upsum, lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum"
		}
	],
	"tags":
	[
		"hardware",
		"IT infrastructure",
		"sample"
	],
	"pricing": 
	{ 
		"currency":"INR" 
	}
}
```

> The above request should return following header

```shell
 
Location: http://path_to_api/api/Template?id=5392dcf623aea51b4cded7c6

```

### HTTP Request

`POST api/Template/CreateOrUpdate`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
id | **optional** <br> id of template to update, ***pass a valid id to update an existing template***
title | **required** <i>- 3 to 50 characters long </i> <br> title of the template
pricing | **optional** <br> model for pricing information related to template
lineitems | **required** <i>- minimum 1 line item is required </i> <br> model for list of line items within the template
noteitems | **optional** <br> model for list of note items within the template
tags | **optional** <br> model for list of tags applied to the template

### PRICING PARAMETERS

Parameter | Description
-------------- | --------------
discount | **optional** <br> model to represent discount applied to the template 
taxes | **optional** <br> model for list of taxes applied to the template
currency | **required** <br> currency in which amount would be computed and displayed on template sent to the recipient

### TEMPLATE LINE ITEM PARAMETERS

Parameter | Description
-------------- | -------------- 
id | id of line item to set as reference to the template <br> **required** - if want to refer to an existing line item in Content <br> **not required** if want to create a new line item within the template
itemtype | **required** <br> type of line item <br> ***supported input:*** product, subscription, service
itemcode | **required** <i>- 3 to 20 characters long </i> <br> code to identify the line item
itemname | **required** <i>- 5 to 50 characters long </i> <br> name or title of line item
itemdescription | **optional** <i>- 3 to 150 characters long </i> <br> description for the line item
quantity | **optional** ***- decimal*** <i>, default is 0 </i> <br> quantity of line item
lineitemunit | **optional** <i>- default is on basis of item type selected </i> <br> unit of line item
priceperquantity | **optional** ***- decimal*** <i>, default is 0 </i> <br> per per unit of line item
pricing | **optional** <br> model of pricing applied per line item
attachments | **optional** <br> model for list of attachment items per line item
requiredas | **optional** <i>- default is required </i> <br> by default the line item would be set as required line item
accountcode | **optional** <i>- default account code is set via settings of the account </i> <br> account code applicable per line
groupname | **optional** <i>- 4 to 25 characters long </i> <br> name of group to which the line item belongs to

### template NOTE ITEM PARAMETERS

Parameter | Description
-------------- | --------------
id | id of note item to set as reference to the template <br> **required** - if want to refer to an existing note item in Content <br> **not required** if want to create a new note item within the template
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

## Get template

This endpoint will get a template.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"TemplateId":"5392eced23aea52050b9c718",
	"Title":"Mid range gaming PC",
	"Pricing":
	{
		"Discount":null,
		"Taxes":null,
		"SubscriptionUnit":null,
		"Currency":null,
		"NetTotal":0.0,
		"SubTotal":0.0,
		"DiscountTotal":0.0,
		"TaxTotal":0.0,
		"LineItems":
		[
			{
				"CreatedOn":"0001-01-01T00:00:00Z",
				"ModifiedOn":"0001-01-01T00:00:00Z",
				"Audit":
				[
					{
						"On":"2014-06-07T10:43:57.867Z",
						"Text":"Line item created by Specflow"
					}
				],
				"Tags":
				[
					"MB AM3+"
				],
				"Id":"5392eced23aea52050b9c70a",
				"ItemType":0,
				"ItemCode":"001",
				"ItemName":"Asus M8N-V8LE",
				"ItemDescription":"Mid range motherboard",
				"Quantity":1.0,
				"LineItemUnit":"",
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
					"NetTotal":0.0,
					"SubTotal":0.0,
					"TaxTotal":0.0,
					"DiscountTotal":0.0
				},
				"Attachments":null,
				"RequiredAs":0,
				"AccountCode":"A01",
				"GroupName":""
			} ...
		],
		"NoteItems":[]
		,"AnyOneGroups":null,
		"Tags":[],
		"Errors":[]
	}

```

### HTTP REQUEST

`GET api/Template/Get?id=5380700d995ba3047cc5ff1d`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
id | **required** <br> id of the template to get
ispreview | **optional** ***- boolean*** <i>, default false, set to true to get edit view </i> <br> toggle if you need editable meta data for template or only preview meta data

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Archive template

This endpoint will set template as archived.

```shell
# HTTP REQUEST BODY

{
	"templateidlist":
	[
		"537d82b423aea5226cc52e65",
		"537d82b323aea5226cc52e64",
		...
	]
}
```

### HTTP REQUEST

`POST api/Template/Archive`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
templateidlist | **minimum 1 template id required** <br> list of template ids to archive

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Search template

This endpoint will search a template with advanced filters (if applied)

```shell
# HTTP REQUEST BODY

{
	"key":"gaming pc",
	"isarchived":false,
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
	"Templates":
	[
		{
			"Id":"5392fb2923aea50c60e610e0",
			"Title":"High range gaming PC",
			"CreatedOn":"0001-01-01T00:00:00Z",
			"LastModifiedOn":"0001-01-01T00:00:00Z",
			"NetTotal":0.0
		},
		{
			"Id":"5392fb2923aea50c60e610e1",
			"Title":"Mid range laptop",
			"CreatedOn":"0001-01-01T00:00:00Z",
			"LastModifiedOn":"0001-01-01T00:00:00Z",
			"NetTotal":0.0
		}, ...
	],
	"Tags":null,
	"Errors":[],
	"PageNumber":1,
	"PageSize":10,
	"TotalCount":4,
	"TotalPages":1,
	"HasPreviousPage":false,
	"HasNextPage":false
}

```

### HTTP REQUEST

`POST api/template/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
key | **optional** <br> keyword to search the template
isarchived | **optional** ***- boolean*** <i>, default false </i> <br> property to get only archived templates
pagingoptions | **optional** <br> model to specify paging related options
gettags | **optional** ***- boolean*** <i>, default false, true if want to fetch list of tags associated with templates </i> <br> property to get tags associated with all templates associated with an account

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

## Delete template

This endpoint will delete a template

### HTTP REQUEST

`DELETE api/Template/Delete?id=5392fb2923aea50c60e870e1`

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

## Multidelete template

This endpoint will allow you to delete multiple templates in single request

```shell
# HTTP REQUEST BODY

{
	"templateidlist":
	[
		"5392fb2923aea50c60e610r3",
		"5392fb2923aea50c60e610r4",
		...
	]
}

```

### HTTP REQUEST

`POST api/template/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
templateidlist | **minimum 1 template id is required** <br> model for list of template id(s) to delete

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Make default template

This endpoint will allow you to mark the template as a default template.

```shell
# HTTP REQUEST BODY

{
	"templateid": "5392fb2923aea50c60e610r3",
}

```

### HTTP REQUEST

`POST api/Template/MakeDefault`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
templateid | **required** <br> id of template to mark as default template

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>