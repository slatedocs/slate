# Line item

## Create or update line item

This endpoint will create or update a line item.

```shell
# HTTP REQUEST BODY

{ 
	"itemtype":"product",
	"itemcode":"I001",
	"itemname":"quotebox line item",
	"accountcode":"200-sales",
	"pricing":
	{
		"discount":
		{
			"discountype":"fixed",
			"discountvalue":5
		},
		"tax":
		{
			"description":"5.5 % CST",
			"value":5.5
		}
	},
	"tags":
	[
		"sample",
		"tags"
	]
}
```

> The above request should return following header

```shell

Location: http://path_to_api/api/LineItem?id=5392dcf623aea51b4cded7c6

```

### HTTP Request

`POST api/LineItem/CreateOrUpdate`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
lineitemid | **optional** <br> id of line item to update, ***pass a valid id to update an existing line item***
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

### PRICING PARAMETERS

Parameter | Description
-------------- | --------------
discount | **optional** <br> model to represent discount applied to the line item 
taxes | **optional** <br> model for list of taxes applied to the line item
currency | **required** <br> currency in which amount would be computed and displayed on line item sent to the recipient

### HTTP Response

<aside class="success">
201 Created
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Get line item

This endpoint will get a line item.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"lineitemId":"5392eced23aea52050b9c718",
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

`GET api/LineItem/Get?id=5380700d995ba3047cc5ff1d`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
id | **required** <br> id of the line item to get

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Archive line item

This endpoint will set line item as archived.

```shell
# HTTP REQUEST BODY

{
	"lineitemids":
	[
		"537d82b423aea5226cc52e65",
		"537d82b323aea5226cc52e64",
		...
	]
}
```

### HTTP REQUEST

`POST api/LineItem/Archive`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
lineitemids | **minimum 1 line item id required** <br> list of line item ids to archive

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Search line item

This endpoint will search a line item with advanced filters (if applied)

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
	},
	"gettags":true
}

```

> The above request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"line items":
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

`POST api/LineItem/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
key | **optional** <br> keyword to search the line item
isarchived | **optional** ***- boolean*** <i>, default false </i> <br> property to get only archived line items
pagingoptions | **optional** <br> model to specify paging related options
gettags | **optional** ***- boolean*** <i>, default false, true if want to fetch list of tags associated with line items </i> <br> property to get tags associated with all line items associated with an account

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

## Delete line item

This endpoint will delete a line item

### HTTP REQUEST

`DELETE api/LineItem/Delete?id=5392fb2923aea50c60e870e1`

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

## Find line item

This endpoint will find line item(s) as per the key word (used to fetch line items as autocomplete result)

```shell
# HTTP REQUEST BODY

{
	"itemcode":"001",
	"itemname":"processor"
}

```

> The above request should return following JSON

```shell

# HTTP RESPONSE OBJECT

{
	"id":"5392fb2923aea50c60e61545",
	"itemtype":"product",
	"itemcode":"001",
	"itemname":"processor amd",
	"tags":
	[
		"processor",
		"amd"
	],
	"pricing":
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
		"DiscountTotal":0.0,
		"attachments":null,
		"attachmentcount":0
	}
}

```

### HTTP REQUEST

`POST api/LineItem/Find`

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