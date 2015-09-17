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

The best practice is to include giosg script at the start of the HTML document. This is not necessary but is advised so that the `_giosg` object is
available as soon as possible.

Javascript api can be used in two ways. Asynchronously with `_giosg` object or calling api method's directly. `_giosg` object is available right after
[giosg script tag][] so you don't need to wait for giosg to be fully loaded before calling api.



Sometimes it is however useful to know when the api calls complete. For that reason you can also call giosg api methods directly and receive jQuery
promise as return value. When you want to call api methods directly it is important to wrap your code inside `_giosg(function () { ... });` to make sure that
giosg client is fully loaded before the call is made.




## Visitor data API

You can attach key value pairs to visitor with giosg javascript api. This data is then available to operators in giosg console and also in reporting.
Data can also be signed so that you can trust that the submitted data originated from you and was not tampered by visitor.

### Submit visitor data

Javascript call:

`_giosg('visitor', 'submit', <visitor_data>, <signing_algorithm>, <replace_existing>, <room_information>);`


Attribute   | Type   | Required | Description
------------|--------|----------|--------------
`visitor_data` | Object | **required** | JSON serializable object containing key value pairs. Object can contain attributes of any names. `username` attribute has special meaning. It is displayed as visitor's name in chat dialog and reports. Example: `{ username: 'John Doe' }`
`signing_algorithm` | String | optional | String identifying which algorithm is used for signing. Default is 'plain' which means no signing. See full list of supported algorithms below.
`replace_existing` | Bool | optional | If set to `true` will replace existing data that was attached to visitor. Otherwise existing data will be extended with new values. Default is `false`.
`room_information` | Array | optional | Array of room information objects. This parameter controls the room where the data will be connected. If not set, it will default to domain room. Example: `[{ name: 'My custom room' }]`

```javascript
// Asynchronous API call
_giosg('visitor', 'submit', { username: 'John Doe' });

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

### Submit visitor data to multiple rooms at once

### Signing visitor data


Algorithm   | Type   | Description
------------|--------|----------
`visitor_data` | Object | JSON serializable object containing key value pairs. Object can contain attributes of any names. `username` attribute has special meaning. It is displayed as visitor's name in chat dialog and reports. Example: `{ username: 'John Doe' }`



### Using promises

### Remove submitted data

## Visitor rooms API

### Connect visitor to room

### Remove visitor from room

## Visitor chat API

### End chat session

