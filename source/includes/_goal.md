# Goal

## Update

```shell
curl --data-binary '{"id":"5", "method":"goal.Update", "params":{"id":1, "importance":0.1, "confidence":0.7}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
    "jsonrpc": "2.0",
	"result": {
		"id": 1,
		"importance": 0.1,
		"confidence": 0.7
	},
	"id": "5"
}
```

Update a user’s goal inputs for a given competency.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
id | integer | the competency’s identifier
importance (optional) | float | the importance value (must be between 0.1 and 0.9)
confidence (optional) | float | the confidence value (must be between 0.1 and 0.9)

<aside class="success">
Goal Model - a user’s inputs on an organisation goal
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | "Internal Server Error"
-32003 | "Mandatory JWT Claim missing"
-32011 | "No goals set"
-32013 | "Unsupported competency"
-32014 | "Value is out of range"

## FetchAll

```shell
curl --data-binary '{"id":"3", "method":"goal.FetchAll", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"goals": [{
			"id": "1",
			"importance": 0.1,
			"confidence": 0.1
		}, {
			"id": "2",
			"importance": 0.8,
			"confidence": 0.5
		}]
	},
	"id": "3"
}
```

Retrieve a user’s goal inputs.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — List of Goal Models - a user’s inputs on organisation goals
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | "Internal Server Error"
-32003 | "Mandatory JWT Claim missing"
-32011 | "No goals set"

## FetchByCompetencyID

```shell
curl --data-binary '{"id":"6", "method":"goal.FetchByCompetencyID", "params":{"id":2}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"id": "2",
		"importance": 0.8,
		"confidence": 0.5
	},
	"id": "6"
}
```

Retrieve a user’s goal inputs for a given competency

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
id | integer | the competency’s identifier

<aside class="success">
Goal Model - a user’s inputs on an organisation goal
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | "Internal Server Error"
-32003 | "Mandatory JWT Claim missing"
-32011 | "No goals set"
-32013 | "Unsupported competency"
-32012 | "Goal is not set"
