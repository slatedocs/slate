# Profile

## Update

```shell
curl --data-binary '{"id":"10", "method":"profile.Update", "params":{"function":5, "sector":8, "seniority":1}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"function": 5,
		"sector": 8,
		"seniority": 1
	},
	"id": "10"
}
```

Updates the user’s profile data. Acts as a create in case there is no data associated with the user.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
function (optional) | integer | the user’s function input identifier
sector (optional) | integer | the user’s sector input identifier
seniority (optional) | integer | the user’s seniority input identifier

<aside class="notice">
Although all parameters are optional, it's necessary for at least one to be set for a successful call
</aside>

<aside class="success">
Returns — Profile Model — the user’s updated profile data
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32610 | Unsupported function input
-32609 | Unsupported seniority input
-32608 | Unsupported sector input
-32016 | Profile input is empty

## Get

```shell
curl --data-binary '{"id":"5", "method":"profile.Get", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
    "jsonrpc": "2.0",
	"result": {
		"function": 5,
		"sector": 8,
		"seniority": 1
	},
	"id": "5"
}
```

Retrieves a user’s profile information.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Profile Model - the user’s profile data
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32604 | The requested user profile does not exist


## GetInputOptions

```shell
curl --data-binary '{"id":"3", "method":"profile.GetInputOptions", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"seniority": [{
			"id": 1,
			"label": "CEO/C-suite",
			"sort": 1
		}, {
			"id": 2,
			"label": "Senior Manager",
			"sort": 2
		}, {
			"id": 3,
			"label": "Middle Manager",
			"sort": 3
		}, {
			"id": 4,
			"label": "Junior Manager",
			"sort": 4
		}],
		"sector": [{
			"id": 5,
			"label": "Beverages",
			"sort": 5
		}, {
			"id": 6,
			"label": "Building and Materials",
			"sort": 6
		}, {
			"id": 7,
			"label": "Domestic Goods",
			"sort": 7
		}, {
			"id": 8,
			"label": "Education",
			"sort": 8
		}],
		"function": [{
			"id": 9,
			"label": "Purchasing",
			"sort": 9
		}, {
			"id": 10,
			"label": "R&D",
			"sort": 10
		}, {
			"id": 11,
			"label": "Sales",
			"sort": 11
		}, {
			"id": 12,
			"label": "Senior Management",
			"sort": 12
		}]
	},
	"id": "3"
}
```

Retrieves available inputs afferent to an organisation.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Lists of InputOption Model - the organisation’s <code>seniority</code>, <code>function</code> and <code>sector</code> options
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object

## SetFavouriteAsset

```shell
curl --data-binary '{"id":"3", "method":"profile.SetFavouriteAsset", "params":{"id":1, "saved":true}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
    "jsonrpc": "2.0",
	"result": "success",
	"id": "3"
}
```

Mark an asset as <code>favourite</code> for an user.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
id | integer | the asset to be favourited's id
saved | boolean | the true/false status

<aside class="success">
Returns — Message - a success message
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32014 | Unsupported asset

## SetCompleteAsset

```shell
curl --data-binary '{"id":"3", "method":"profile.SetCompleteAsset", "params":{"id":1, "completedStatus":"useful"}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
    "jsonrpc": "2.0",
	"result": "success",
	"id": "3"
}
```

Mark an asset as <code>completed</code> for an user.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
id | integer | the asset to be completed's id
completedStatus | string | must be equal one of this strings: ("already_know", "useful", "not_relevant")

<aside class="success">
Returns — Message - a success message
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32014 | Unsupported asset
-32017 | Invalid completed status


## FetchCompetencies

```shell
curl --data-binary '{"id":"7","method":"profile.FetchCompetencies","jsonrpc": "2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"competencies": [{
			"id": 15,
			"name": "Project Management"
		}, {
			"id": 13,
			"name": "Data Analysis"
		}, {
			"id": 4,
			"name": "Productivity"
		}, {
			"id": 3,
			"name": "Research"
		}, {
			"id": 11,
			"name": "Personal Development"
		}, {
			"id": 6,
			"name": "Spreadsheeting"
		}, {
			"id": 9,
			"name": "Communication, Influence \u0026 Teamwork"
		}, {
			"id": 12,
			"name": "Problem Solving \u0026 Decision Making"
		}, {
			"id": 1,
			"name": "Planning \u0026 Organizing"
		}, {
			"id": 5,
			"name": "Writing"
		}, {
			"id": 8,
			"name": "Email"
		}, {
			"id": 17,
			"name": "Organisational Management"
		}, {
			"id": 2,
			"name": "Maths"
		}, {
			"id": 16,
			"name": "Client Focus"
		}, {
			"id": 10,
			"name": "Digital Collaboration"
		}, {
			"id": 7,
			"name": "MS Office"
		}, {
			"id": 14,
			"name": "Business \u0026 Organisational Savvy"
		}, {
			"id": 19,
			"name": "Using Financials"
		}, {
			"id": 20,
			"name": "Ethics \u0026 Compliance"
		}, {
			"id": 18,
			"name": "People Management"
		}, {
			"id": 22,
			"name": "Mindfulness"
		}, {
			"id": 21,
			"name": "Resilience \u0026 Adaptability"
		}]
	},
	"id": "7"
}
```

Retrieve organisation afferent competencies.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Lists of Competency Model - the organisation’s competencies
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
