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
| ``options`` | object | Kuzzle connection configuration |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``autoQueue`` | boolean | Automatically queue all requests during offline mode | ``false`` |
| ``autoReconnect`` | boolean | Automatically reconnect after a connection loss | ``true`` |
| ``autoReplay`` | boolean | Automatically replay queued requests on a ``reconnected`` event | ``false`` |
| ``autoResubscribe`` | boolean | Automatically renew all subscriptions on a ``reconnected`` event | ``true`` |
| ``offlineMode`` | string | Offline mode configuration | ``manual`` |
| ``queueTTL`` | integer | Time a queued request is kept during offline mode, in milliseconds | ``120000`` |
| ``queueMaxSize`` | integer | Number of maximum requests kept during offline mode | ``500`` |
| ``headers`` | JSON object | Common headers for all sent documents | |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | ``1000`` |

**Notes:** the ``offlineMode`` option only accept the ``manual`` and ``auto`` values

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``autoQueue`` | boolean | Automatically queue all requests during offline mode | get/set |
| ``autoReconnect`` | boolean | Automatically reconnect after a connection loss | get |
| ``autoReplay`` | boolean | Automatically replay queued requests on a ``reconnected`` event | get/set |
| ``autoResubscribe`` | boolean | Automatically renew all subscriptions on a ``reconnected`` event | get/set |
| ``offlineQueue`` | JSON object | Contains the queued requests during offline mode | get/set |
| ``queueFilter`` | function | Called during offline mode. Takes a request object as arguments and returns a boolean, indicating if a request can be queued | get/set |
| ``queueMaxSize`` | integer | Number of maximum requests kept during offline mode | get/set |
| ``queueTTL`` | integer | Time a queued request is kept during offline mode, in milliseconds | get/set |
| ``headers`` | JSON object | Common headers for all sent documents. | get/set |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | get/set |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | get |

**Notes:**

* multiple methods allow passing specific ``metadata``. These ``metadata`` will be merged with the global Kuzzle object ``metadata`` when sending the request, with the request specific ``metadata`` taking priority over the global ones.
* the ``queueFilter`` property is a function taking a JSON object as an argument. This object is the request sent to Kuzzle, following the [Kuzzle Websocket API](https://github.com/kuzzleio/kuzzle/blob/master/docs/API.WebSocket.md) format
* if ``queueTTL`` is set to ``0``, requests are kept indefinitely
* The offline buffer acts like a FIFO queue, meaning that if the ``queueMaxSize`` limit is reached, older requests are deleted and new requests are queued
* if ``queueMaxSize`` is set to ``0``, an unlimited number of requests are is kept until the buffer is flushed

## Offline mode

Working with an unstable network connection implies to handle what an application should be doing while being offline.  
Our goal is to provide our users with the right tools to handle such situations.

There are two ways to handle a network disconnection:

* Stop all further communication with Kuzzle and invalidate the current instance and all its children. The application will have to manually instantiate a new Kuzzle object once the network has recovered. To do so, simply pass the ``autoReconnect`` option to ``false`` when starting a new Kuzzle instance.
* Reconnect automatically to Kuzzle when possible, and enter *offline mode*. This is the default behavior.

Offline mode simply refers to the time between a ``disconnected`` and a ``reconnected`` event.

During offline mode, the Kuzzle SDK handles subscriptions (``KuzzleRoom`` instances) and requests separately.

All subscriptions are kept indefinitely, with no maximum subscriptions retained. By default, upon reconnection, all subscription are renewed. This behavior can be changed by setting the ``autoResubscribe`` to ``false``. In that case, each subscription must be renewed manually using the ``KuzzleRoom.renew`` method.

Requests are handled differently. By default, there is no request queuing. Setting the ``autoQueue`` option to ``true`` activates automatic request queuing.  
You may also control when to start and stop queuing manually, by using the ``startQueuing`` and ``stopQueuing`` methods.  
The queue itself can be configured using the ``queueTTL`` and ``queueMaxSize`` options.

Once a ``reconnected`` event is fired, you may replay the content of the queue with the ``replayQueue`` method. Or you can let the SDK replay it automatically by setting the ``autoReplay`` option to ``true``.  
Emitted requests while replaying the queue are delayed until the queue is empty, to ensure all requests are played in the right order.

You can also control what request can be queued. By default, all requests are queued, but you may decide to filter some of these requests with the ``queueFilter`` property.  
Additionally, all methods accept a ``queuable`` option. If set to ``false``, the request will be discarded if the SDK is disconnected, and it will be played immediately with no queuing otherwise. This option bypasses the ``queueFilter`` property.

If the provided methods don't give you enough control over the offline queue, you can access and edit the queue directly with the ``offlineQueue`` property.

Finally, you may set the ``offlineMode`` option to ``auto``. This configures the offline mode behavior with the following options:

* ``autoReconnect`` = ``true``
* ``autoQueue`` = ``true``
* ``autoReplay`` = ``true``
* ``autoResubscribe`` = ``true``


## Event Handling

The Kuzzle object listens to global events fired by Kuzzle. To subscribe or unsubscribe on these events, simply plug a callback function to the event you want to act upon, using the functions ``addListener`` and ``removeListener``.

Here is the list of these special events:

| Event Name | Description | Expected callback arguments |
|--------------|-------------------------------------------------------------------|--------------------------------|
| ``subscribed`` | Fired when someone enters a subscribed room  | Room name, Subscription informations |
| ``unsubscribed`` | Fired when someone leaves a subscribed room | Room name, Unsubscription informations |
| ``reconnected`` | Fired when the current session has reconnected to Kuzzle after a disconnection, and only if ``autoReconnect`` is set to ``true`` |
| ``disconnected`` | Fired when the current session has been unexpectedly disconnected |  |

**Note:** listeners are called in the order of their insertion.

## addListener

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

## dataCollectionFactory

```js
  var collection = kuzzle.dataCollectionFactory('foobar');
```

> Returns a KuzzleDataCollection object

Instantiates a new KuzzleDataCollection object.

#### dataCollectionFactory(collection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``collection`` | string | The name of the data collection you want to manipulate |


## flushQueue

```js
kuzzle.flushQueue();
```

Empties the offline queue without replaying it.

## getAllStatistics

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

#### getAllStatistics([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

## getStatistics

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

#### getStatistics([options])

#### getStatistics(timestamp, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``timestamp`` | Epoch time | Starting time from which the frames are to be retrieved |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

**Note:** Kuzzle statistics are cleaned up regularly. If the timestamp is set too far in the past, then this method will return all available statistics.

## listCollections

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

#### listCollections([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |



## logout

```js
kuzzle.logout();
```

Closes the current connection. Does not fire a ``disconnected`` event.

## now

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

#### now([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |



## query

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

#### query(collection, controller, action, query, [options])

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
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |



## removeAllListeners

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

## removeListener

```js
kuzzle.removeListener('disconnected', listenerId);
```

Removes a listener from an event.

#### removeListener(event, listenerID)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |
| ``listenerID`` | string | The ID returned by ``addListener`` |

## replayQueue

```js
kuzzle.replayQueue();
```

Replays the requests queued during offline mode. Works only if the SDK is not in a ``disconnected`` state, and if the ``autoReplay`` option is set to ``false``.

## setHeaders

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

## startQueuing

```js
kuzzle.startQueuing();
```

Starts the requests queuing. Works only during offline mode, and if the ``autoQueue`` option is set to ``false``.


## stopQueuing

```js
kuzzle.stopQueuing();
```

Stops the requests queuing. Works only during offline mode, and if the ``autoQueue`` option is set to ``false``.
