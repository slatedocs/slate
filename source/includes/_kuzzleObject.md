# Kuzzle

This is the main entry point to communicate with Kuzzle. Every other objects inherits properties from this one.

Here is the object diagram of our SDKs:

![object diagram](./images/objectDiagram.png)

## Constructors

Connects to a Kuzzle instance.


```js
var kuzzle = new Kuzzle('http://localhost:7512', {autoReconnect: true, headers: {someheader: "value"}});
```

> Returns an instanciated Kuzzle Object

#### Kuzzle(url)

#### Kuzzle(url, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``url`` | string | URL to the target Kuzzle instance |
| ``options`` | object | Configuration of the connection to Kuzzle |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``autoReconnect`` | boolean | Auto-reconnect on a connection loss | true |
| ``headers`` | JSON object | Common headers for all sent documents | |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | 1000 |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``autoReconnect`` | boolean | Auto-reconnect on a connection loss | get |
| ``headers`` | JSON object | Common headers for all sent documents. | get/set |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | get/set |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | get |

**Notes:** multiple methods allow passing specific ``metadata``. These ``metadata`` will be merged with the global Kuzzle object ``metadata`` when sending the request, with the request specific ``metadata`` taking priority over the global ones.


## Event Handling

The Kuzzle object listens to global events fired by Kuzzle. To subscribe or unsubscribe on these events, simply plug a callback function to the event you want to act upon, using the functions ``addListener`` and ``removeListener``.

Here is the list of these special events:

| Event Name | Description | Expected callback arguments |
|--------------|-------------------------------------------------------------------|--------------------------------|
| ``subscribed`` | Fired when someone enters a subscribed room  | Room name, Subscription informations |
| ``unsubscribed`` | Fired when someone leaves a subscribed room | Room name, Unsubscription informations |
| ``reconnected`` | Fired when the current session has reconnected to Kuzzle after a disconnection |
| ``disconnected`` | Fired when the current session has been unexpectedly disconnected |  |

**Note:** listeners are called in the order of their insertion.

## addListener ![public](./images/public.png)

```js
  var listenerId = kuzzle.addListener('subscribed', function (room, subscription) {
    // Actions to perform when receiving a 'subscribed' global event
  });
```

> Returns an unique listener ID

Adds a listener to a Kuzzle global event. When an event is fired, listeners are called in the order of their insertion.

<aside class="notice">
The ID returned by this function is required if you want to remove this listener later.
</aside>

#### addListener(event, listener)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |
| ``listener`` | function | The function to call each time one of the registered event is fired |

**Note:** Currently, the ``subscription`` object only contains the room ID, the subscription ID of the user from whom the event originate, and the current user count on this room

## dataCollectionFactory ![public](./images/public.png)

```js
  var collection = kuzzle.dataCollectionFactory('foobar');
```

> Returns a KuzzleDataCollection object

Instantiates a new KuzzleDataCollection object.

#### dataCollectionFactory(collection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``collection`` | string | The name of the data collection you want to manipulate |


## getAllStatistics ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.getAllStatistics(function (err, stats) {
  stats.forEach(function (frame) {
    // loop through all returned frames
  });
});

// Using promises (NodeJS only)
kuzzle
  .getAllStatisticsPromise()
  .then(stats => {
    stats.forEach(function (frame) {
      // loop through all returned frames
    });
  });
```

> Returns an array of frames

```json
[{ "connections": { "websocket": 1 },
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "mq": 37, "websocket": 17 },
    "failedRequests": { "websocket": 1 },
    "timestamp": "2015-10-26T12:21:00.218Z" },
  { "connections": { "websocket": 1 },
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "websocket": 34 },
    "failedRequests": { "websocket": 3 },
    "timestamp": "2015-10-26T12:21:10.218Z" },
  { "connections": {},
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "websocket": 40 },
    "failedRequests": {},
    "timestamp": "2015-10-26T12:21:20.218Z" }]
```

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method returns all available statistics from Kuzzle.


## getStatistics ![public](./images/public.png)

> Without argument, returns the last statistic frame:

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.getStatistics(function (err, stats) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .getStatisticsPromise()
  .then(stats => {
    // ...
  });
```

> Result:

```json
{ "connections": { "websocket": 1 },
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "mq": 37, "websocket": 17 },
    "failedRequests": { "websocket": 1 },
    "timestamp": "2015-10-26T12:21:00.218Z" }
```

> When providing a timestamp, returns all frames recorded after that timestamp:

```js
var ts = Date.parse('2015-10-26T12:19:10.213Z');

// Using callbacks (NodeJS or Web Browser)
kuzzle.getStatistics(ts, function (err, stats) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .getStatisticsPromise(ts)
  .then(stats => {
    // ...
  });
```

> Result:

```json
[{ "connections": { "websocket": 1 },
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "mq": 37, "websocket": 17 },
    "failedRequests": { "websocket": 1 },
    "timestamp": "2015-10-26T12:21:00.218Z" },
  { "connections": { "websocket": 1 },
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "websocket": 34 },
    "failedRequests": { "websocket": 3 },
    "timestamp": "2015-10-26T12:21:10.218Z" },
  { "connections": {},
    "ongoingRequests": { "mq": 0, "rest": 0, "websocket": 0 },
    "completedRequests": { "websocket": 40 },
    "failedRequests": {},
    "timestamp": "2015-10-26T12:21:20.218Z" }]
```

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method allows getting either the last statistics frame, or a set of frames starting from a provided timestamp.

#### getStatistics()

#### getStatistics(timestamp)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``timestamp`` | Epoch time | Starting time from which the frames are to be retrieved |

**Note:** Kuzzle statistics are cleaned up regularly. If the timestamp is set too far in the past, then this method will return all available statistics.

## listCollections ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.listCollections(function (err, collections) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .listCollectionsPromise()
  .then(collections => {
    // ...
  });
```

> Result:

```json
["foo", "bar", "baz", "qux"]
```

Returns the list of known persisted data collections.

## logout ![public](./images/public.png)

```js
kuzzle.logout();
```

Closes the current connection. Does not fire a ``disconnected`` event.

## now ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.now(function (err, res) {
  // 'res' contains the Kuzzle timestamp
});

// Using promises (NodeJS only)
kuzzle.nowPromise().then(res => {
  // 'res' contains the Kuzzle timestamp
});
```

> Return an UTC Epoch time in milliseconds

```json
1447151167622
```

Returns the current Kuzzle time.


## query ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.query('foo', 'read', 'search', {}, function (err, res) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .queryPromise('foo', 'read', 'search', {})
  .then(result => {

  });
```

> Result: a Kuzzle Response Object

```json
{ "error": null,
  "result": {
    "_shards": {
      "failed": 0,
      "successful": 5,
      "total": 5
    },
    "_source": {},
    "action": "search",
    "collection": "foo",
    "controller": "read",
    "hits": {
      "hits": [],
      "max_score": 0,
      "total": 0
    },
    "requestId": "bf87b930-7c02-11e5-ab10-dfa9e9fd2e07",
    "timed_out": false,
    "took": 1
  }
}
```

<aside class="warning">
This is a low-level method, exposed to allow advanced SDK users to bypass high-level methods.<br/>
Check the Kuzzle documentation available <a href=https://github.com/kuzzleio/kuzzle/tree/master/docs>here</a>
</aside>

Base method used to send queries to Kuzzle

#### query(collection, controller, action, query)

#### query(collection, controller, action, query, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``collection`` | string | The name of the data collection you want to manipulate |
| ``controller`` | string | The Kuzzle controller that will handle this query |
| ``action`` | string | Controller action to perform |
| ``query`` | JSON Object | Query to execute |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |



## reconnect ![protected](./images/protected.png)

```js
// TODO
```

This function is automatically executed by the event handler, when a ``disconnected`` event is fired, and only if the ``autoReconnect`` option has been set to ``true``.

The purpose of this method is to:

* bufferize queries sent to Kuzzle until a successful reconnection has been established
* retries connecting to Kuzzle at regular intervals
* once connection has been established again, replays sequentially all bufferized queries

## removeAllListeners ![public](./images/public.png)

```js
// Removes all listeners on the "unsubscribed" global event
kuzzle.removeAllListeners('unsubscribed');

// Removes all listeners on all global events
kuzzle.removeAllListeners();
```

Removes all listeners, either from a specific event or from all events

#### removeAllListeners()

#### removeAllListeners(event)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |

## removeListener ![public](./images/public.png)

```js
kuzzle.removeListener('disconnected', listenerId);
```

Removes a listener from an event.

#### removeListener(event, listenerID)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |
| ``listenerID`` | string | The ID returned by ``addListener`` |

## setHeaders ![public](./images/public.png)

```js
kuzzle.setHeaders({someContent: 'someValue'}, true);
```

> Returns itself

This is a helper function returning itself, allowing to easily chain calls.

#### setHeaders(content)

#### setHeaders(content, replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``content`` | JSON Object | New content |
| ``replace`` | boolean | true: replace the current content with the provided data, false: merge it |

**Note:** by default, the ``replace`` argument is set to ``false``
