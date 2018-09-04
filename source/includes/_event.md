# Event

## Create

```shell
curl --data-binary '{"id":"7", "method":"event.Create", "params":{"data":{}, "name":"launch_assetpage"}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": "success",
	"id": "7"
}
```

Creates a new event

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
name | string | the name of the event to be sent (list of events attach link)
data | json | the event data to be recorded (link to event attach link)

<aside class="success">
Returns — Message - <code>success</code>
</aside>

### Errors

 Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32606 | "Invalid arguments"
-32011 | "Invalid event"
