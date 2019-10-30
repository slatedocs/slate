# User Endpoints

## User Lookup
<a id="opIdlookUpUser"></a>

This endpoint looks up a user by email address or employee number; both are not required.

```shell
$ curl -i -X GET -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/users/lookup?apikey=your_key_here&email=sender%40example.com'
Or
$ curl -i -X GET -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/users/lookup?apikey=your_key_here&employeeNumber=123'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/users/lookup?email=sender%40example.com',
  method: 'GET',
  headers: {
    "apikey": "your_key_here"
  }
};

Or

var options = {
  uri: 'https://api-client.kudosnow.com/v1/users/lookup?employeeNumber=123',
  method: 'GET',
  headers: {
    "apikey": "your_key_here"
  }
};

request(options, function (error, response, body) {
  ...
});
```

### HTTP Request 
`GET /users/lookup` 

**Parameters**

|Name|Located In|Type|Required|Description|
|---|---|---|---|---|
|email|query|string|false|Email Address|
|employeeNumber|query|string|false|Employee Number|

**Responses**

> 200 Response

```json
{
  "data": {
    "id": 0,
    "email": "string",
    "pointsBalance": 0,
    "employeeNumber": "string"
  }
}
```

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

Status Code **200**

| Attribute | Description | Required | Type |
|---|---|---|---|
|data|User object|true|[User](#lookup_user_object)|
