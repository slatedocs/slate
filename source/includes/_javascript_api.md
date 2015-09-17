Visitor Javascript API
==========

## Requirements and general usage

```javascript
// Asynchronous API call
_giosg('visitor', 'submit', { username: 'John Doe' });
```

```javascript
// Normal API call
function success() {
	console.log('Success!');
};
function error(e) {
	console.log('Error: ', e);
};

// Wait for giosg client to fully load
_giosg(function () {
	// Following is equivalent of:
	// _giosg('visitor', 'submit', { username: 'John Doe' });
	giosg.api.visitor.submit({ username: 'John Doe' })
		.then(success, error);
});
```

To use giosg visitor javascript api you need to be using latest version of [giosg script tag][] on the site.

The best practice is to include giosg script at the start of the HTML document. This is not necessary but is advised so that the `_giosg object is
available as soon as possible.

Javascript api can be used in two ways. Asynchronously with `_giosg` object or calling api method's directly. `_giosg` object is available right after
[giosg script tag][] so you don't need to wait for giosg to be fully loaded before calling api.


Sometimes it is however useful to know when the api calls complete. For that reason you can also call giosg api methods directly and receive jQuery
promise as return value. When you want to call api methods directly it is important to wrap your code inside `_giosg(function () { ... });` to make sure that
giosg client is fully loaded before the call is made.

**Following api calls are identical:**

`_giosg('visitor', 'submit', <visitor_data>, <signing_algorithm>, <replace_existing>, <room_information>);`

AND

`_giosg(function () { giosg.api.visitor.submit({ username: 'John Doe' }).then(success, error); });`

This documentation uses only asynchronous versions of API's as examples from this point on. To "convert" asynchronous call to normal api call
use following pattern:

`_giosg('module', 'method', arg1, arg2, ..)` translates to `giosg.api.<module>.<method>(arg1, arg2, ..);`

## Visitor data API

You can attach key value pairs to visitor with giosg javascript api. This data is then available to operators in giosg console and also in reporting.
Data can also be signed so that you can trust that the submitted data originated from you and was not tampered by visitor.

### Submit visitor data

```javascript
// Attach data to visitor
_giosg('visitor', 'submit', {
	username: 'John Doe',
	age: 29,
	has_car:true
}, 'plain', true, { name: 'My room' });
```

Javascript call:

`_giosg('visitor', 'submit', <visitor_data>, <signing_algorithm>, <replace_existing>, <room_information>);`


Attribute   | Type   | Required | Description
------------|--------|----------|--------------
`visitor_data` | Object | **required** | JSON serializable object containing key value pairs. Object can contain attributes of any names. `username` attribute has special meaning. It is displayed as visitor's name in chat dialog and reports. Example: `{ username: 'John Doe' }`
`signing_algorithm` | String | optional | String identifying which algorithm is used for signing. Default is 'plain' which means no signing. See full list of supported algorithms below.
`replace_existing` | Bool | optional | If set to `true` will replace existing data that was attached to visitor. Otherwise existing data will be extended with new values. Default is `false`.
`room_information` | Array | optional | Array of room information objects. This parameter controls the room where the data will be connected. If not set, it will default to domain room. Room info object has to contain either `id` or `name` attribute. Example: `[{ name: 'My custom room' }]`


### Submit visitor data to multiple rooms at once


```javascript
// Attach data to visitor and make it available on multiple rooms.
var roomInfo = [{
	id: 'kbio5de27gjo767wcqaafh7g6mpluvar4ofiausuac7acbam',
}, {
	name: 'Another room'
}];
_giosg('visitor', 'submit', {
	username: 'John Doe',
	age: 29,
	has_car:true
}, 'plain', true, roomInfo);
```

It is possible to submit data to multiple rooms at once by passing array as `<room_information>` parameter.

Javascript call:

`_giosg('visitor', 'submit', <visitor_data>, <signing_algorithm>, <replace_existing>, [<room_information>]);`


### Signing visitor data

```javascript
// Example of submitting JWT signed visitor data
var jwt_payload = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21pY191cmwiOiJodHRwOi8veGtjZC5jb20vMTM2MC8ifQ.BsjBt9a9imoj9P5_7aIAe5nuhPd5jb8HGvAJKPCwm6A';
var algorithm = 'HS256';
_giosg('visitor', 'submit', jwt_payload, algorithm);
```

Signing is used for validating that data is not altered by web page's visitor. If signing is required for domain and checksum is not set or it's wrong, then giosg will reject the data and HTTP status 400 will be returned.

There is two different options for signing data: JSON Web Token specification (JWT) and simple sha1/md5. JSON Web Token specification is recommended with HMAC SHA-256 hash algorithm.

**Please note** that signed data can be still seen by visitor but cannot be modifed anyway without giosg being able to recognize that and then reject data.


**Javascript call:**

`_giosg('visitor', 'submit', <jwt_payload>, <signing_algorithm>);`

**jwt_payload** is json web token generated from payload data. Note that payload data may contain property **exp** that contains token expiration time as a UTC UNIX timestamp (an int). This will be used to check if token is still valid.

**signing_algorithm** is algorithm used. This is required.


### Supported signing algorithms

Algorithm   | Type   | Description
------------|--------|----------
`HS256` | JWT | HMAC using SHA-256 hash algorithm (recommended)
`HS384` | JWT | HMAC using SHA-384 hash algorithm
`HS512` | JWT | HMAC using SHA-512 hash algorithm
`RS256` | JWT | RSASSA-PKCS1-v1_5 signature algorithm using SHA-256 hash algorithm
`RS384` | JWT | RSASSA-PKCS1-v1_5 signature algorithm using SHA-384 hash algorithm
`RS512` | JWT | RSASSA-PKCS1-v1_5 signature algorithm using SHA-512 hash algorithm
`sha1`| hash | SHA-1 (Secure Hash Algorithm 1)
`md5`| hash | ksd


### Generating signed payload

```python
# 1. Install PyJWT
# 2. open python shell and run:
>>> import jwt
>>> import time
>>> exp = int(time.time() + 30) # 30 seconds in future
>>> payload = { "comic_url": "http://xkcd.com/1360/", "exp": exp }
>>> jwt.encode(payload, "supersecretkey", "HS256")
'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21pY191cmwiOiJodHRwOi8veGtjZC5jb20vMTM2MC8ifQ.BsjBt9a9imoj9P5_7aIAe5nuhPd5jb8HGvAJKPCwm6A'
>>>
```

Example of generating JWT token with Python can be found from the right.

You can find more information about JWT from these resources:

- JWT Specification: [http://tools.ietf.org/html/draft-ietf-oauth-json-web-token-20]()
- Python: [https://pypi.python.org/pypi/PyJWT/0.2.1]()
- PHP: [https://github.com/firebase/php-jwt]()
- Java: [https://github.com/auth0/java-jwt]()
- Asp.Net: [https://www.nuget.org/packages/JWT]()




### Using promises

### Remove submitted data

## Visitor rooms API

### Connect visitor to room

### Remove visitor from room

## Visitor chat API

### End chat session

