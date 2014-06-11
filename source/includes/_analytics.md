# Analytics

## Get recent activities

This endpoint will get recent list of quotes for the associated account.

> The request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"RecentQuoteList": 
	[ 
		{ 
			"quoteid":"533c004323aea50668594d3d", 
			"title":"Mid range gaming PC", 
			"author":"John Doe", 
			"toname":"Jennifer Mathews", 
			"status":"draft", 
			"label":"draft", 
			"indiscussion":false
		}, ... 
	],  
	"RecentCommentList": 
	[ 
		{ 
			"quoteid":"533c004323aea506685944354", 
			"who":"Jhonny Deep", 
			"notifyto":"John Doe", 
			"commenttext":"Can we revise the pricing", 
			"on":"06/06/2014 10:22 AM", 
			"isclient":true, 
			"isprivate":false 
		}, ... 
	], 
	"DashboardSummaryList": 
	[ 
		{ 
			"status":"draft", 
			"totalamount":"2342", 
			"count":"3" 
		},
		{ 
			"status":"sent", 
			"totalamount":"1234", 
			"count":"2" 
		}, ... 
	]
}
```

### HTTP REQUEST

`POST api/Account/RecentActivities`

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

## Get analytics

This endpoint will get analytical meta data.

```shell
# HTTP REQUEST BODY

{
	"timeline":"year",
	"startdate":"01/01/2013 10:00 AM",
	"enddate":"01/01/2014 10:00 AM"
}
```

> The above request should return following JSON

```shell
# HTTP RESPONSE OBJECT

{
	"AnalyticsLineChart": 
	[ 
		{ 
			"nettotal":1000, 
			"count":21, 
			"group": 
			{ 
				"groupby": 
				{ 
					"dt":0, 
					"st": "draft" 
				}, 
				"user":"user_id" 
			} 
		}, ... 
	],  
	"AnalyticsBulletChart": 
	[ 
		{ 
			"totalamountprevious":2000, 
			"countprevious":20, 
			"percentageprevious":35, 
			"group": 
			{ 
				"groupby": 
				{ 
					"dt":0, 
					"st":"sent" 
				}, 
				"user":"user_id" 
			} 
			"totalamount":3420, 
			"count":22, 
			"precentage":37, 
			"isup":false 
		}, ... 
	]
}
```

### HTTP REQUEST

`POST api/Account/Analytics`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
timeline | **required** <br> timeline to get analytic data <br><br> ***supported input:*** today, week, month, quarter, year, custom
startdate | **optional** <br> get analytic data from date time
enddate | **optional** <br> get analytic data till date time

### HTTP RESPONSE

<aside class="success">
200 OK - with following json object
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

