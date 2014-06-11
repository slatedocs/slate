# Note item

## Create or update note item

This endpoint will create or update a note item.

```shell
# HTTP REQUEST BODY

{ 
	"title":"a note item",
	"description":"a description for the note",
	"tags":
	[
		"sample",
		"tags"
	]
}
```

> The above request should return following header

```shell

Location: http://path_to_api/api/noteitem?id=5392dcf623aea51b4cded7c6

```

### HTTP Request

`POST api/noteItem/CreateOrUpdate`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

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

## Get note item

This endpoint will get a note item.

> The request should return the following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"noteitemId":"5392eced23aea52050b9c718",
	"Title":"Terms & Conditions",
	"Description":"loreum ipsum loreum ipsum loreum ipsum ... ",
	"Tags":
	[
		"sample",
		"note item"
	]
}

```

### HTTP REQUEST

`GET api/NoteItem/Get?id=5380700d995ba3047cc5eded`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST ARGUMENTS

Argument | Description
-------------- | --------------
id | **required** <br> id of the note item to get

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Archive note item

This endpoint will set note item as archived.

```shell
# HTTP REQUEST BODY

{
	"noteitemids":
	[
		"537d82b423aea5226cc52e65",
		"537d82b323aea5226cc52e64",
		...
	]
}
```

### HTTP REQUEST

`POST api/NoteItem/Archive`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
noteitemids | **minimum 1 note item id required** <br> list of note item ids to archive

### HTTP Response 

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Search note item

This endpoint will search a note item with advanced filters (if applied)

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
	"note items":
	[
		{
			"Id":"5392fb2923aea50c60e61420",
			"Title":"Terms & conditions",
			"CreatedOn":"0001-01-01T00:00:00Z",
			"LastModifiedOn":"0001-01-01T00:00:00Z",
		},
		{
			"Id":"5392fb2923aea50c60e61431",
			"Title":"Terms & conditions II",
			"CreatedOn":"0001-01-01T00:00:00Z",
			"LastModifiedOn":"0001-01-01T00:00:00Z",
		}, ...
	],
	"Tags":null,
	"Errors":[],
	"PageNumber":1,
	"PageSize":10,
	"TotalCount":2,
	"TotalPages":1,
	"HasPreviousPage":false,
	"HasNextPage":false
}

```

### HTTP REQUEST

`POST api/NoteItem/Search`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST PARAMETERS

Parameter | Description
-------------- | --------------
key | **optional** <br> keyword to search the note item
isarchived | **optional** ***- boolean*** <i>, default false </i> <br> property to get only archived note items
pagingoptions | **optional** <br> model to specify paging related options
gettags | **optional** ***- boolean*** <i>, default false, true if want to fetch list of tags associated with note items </i> <br> property to get tags associated with all note items associated with an account

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

## Delete note item

This endpoint will delete a note item

### HTTP REQUEST

`DELETE api/NoteItem/Delete?id=5392fb2923aea50c60e870e1`

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

## Find note item

This endpoint will find note item(s) as per the key word (used to fetch note items as autocomplete result)

```shell
# HTTP REQUEST BODY

{
	"title":"terms"
}

```

> The above request should return following JSON

```shell

# HTTP RESPONSE OBJECT

{
	"id":"5392fb2923aea50c60e61545",
	"title":"terms & conditions",
	"description":"loreum ipsum loreum ipsum loreum ipsum"
	"tags":
	[
		"terms",
		"policies"
	],
	"attachments":null,
	"attachmentcount":0
}

```

### HTTP REQUEST

`POST api/NoteItem/Find`

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