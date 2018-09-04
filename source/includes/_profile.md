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

Updates the given user’s profile data. Acts as a create in case there is no data associated with the use identifier.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
function | integer | the user’s function input identifier
sector | integer | the user’s sector input identifier
seniority | integer | the user’s seniority input identifier

<aside class="success">
Returns — Profile Model - the user’s updated profile data
</aside>

## Get

```shell
curl --data-binary '{"id":"5", "method":"profile.Get", "params":[], "jsonrpc":"2.0"}'
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

Retrieves an user’s profile information.

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
curl --data-binary '{"id":"3", "method":"profile.GetInputOptions", "params":[], "jsonrpc":"2.0"}'
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
