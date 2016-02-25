# Kuzzle

This is the main entry point to communicate with Kuzzle. Every other objects inherits properties from this one.

Here is the object diagram of our SDKs:

![object diagram](./images/objectDiagram.png)

## Constructors

Connects to a Kuzzle instance.


```js
var kuzzle = new Kuzzle('http://localhost:7512', {defaultIndex: 'some index', autoReconnect: true, headers: {someheader: "value"}});

// A callback is also available and will be invoked once connected to the Kuzzle instance:
var kuzzle = new Kuzzle('http://localhost:7512', function (err, res) {
  // ...
});
```

```java
KuzzleOptions options = new KuzzleOptions();

options.setDefaultIndex("some index")
  .setAutoReconnect(true),
  .setHeaders(new JSONObject().put("someheader", "value"));

Kuzzle kuzzle = new Kuzzle("http://localhost:7512", options, new KuzzleResponseListener<Void>() {
 @Override
 public void onSuccess(Void object) {
   // invoked once connected, object contains the kuzzle instance
 }

 @Override
 public void onError(JSONObject error) {
   // Handle connection error
 }
});
```

#### Kuzzle(url, [options], [callback])


| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``url`` | string | URL to the target Kuzzle instance |
| ``options`` | JSON object | Optional Kuzzle connection configuration |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``autoQueue`` | boolean | Automatically queue all requests during offline mode | ``false`` |
| ``autoReconnect`` | boolean | Automatically reconnect after a connection loss | ``true`` |
| ``autoReplay`` | boolean | Automatically replay queued requests on a ``reconnected`` event | ``false`` |
| ``autoResubscribe`` | boolean | Automatically renew all subscriptions on a ``reconnected`` event | ``true`` |
| ``connect`` | string | Manually or automatically connect to the Kuzzle instance | ``auto`` |
| ``defaultIndex`` | string | Set the default index to use | |
| ``offlineMode`` | string | Offline mode configuration | ``manual`` |
| ``queueTTL`` | integer | Time a queued request is kept during offline mode, in milliseconds | ``120000`` |
| ``queueMaxSize`` | integer | Number of maximum requests kept during offline mode | ``500`` |
| ``headers`` | JSON object | Common headers for all sent documents | |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | |
| ``replayInterval`` | integer | Delay between each replayed requests, in milliseconds | ``10`` |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | ``1000`` |

**Notes:** the ``offlineMode`` option only accept the ``manual`` and ``auto`` values

#### Callback response

If the connection succeeds, resolves to the `Kuzzle` object itself.
If the `connect` option is set to `manual`, the callback will be called after the `connect` method is resolved.

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``autoQueue`` | boolean | Automatically queue all requests during offline mode | get/set |
| ``autoReconnect`` | boolean | Automatically reconnect after a connection loss | get |
| ``autoReplay`` | boolean | Automatically replay queued requests on a ``reconnected`` event | get/set |
| ``autoResubscribe`` | boolean | Automatically renew all subscriptions on a ``reconnected`` event | get/set |
| ``defaultIndex`` | string | Kuzzle's default index to use | get |
| ``offlineQueue`` | JSON object | Contains the queued requests during offline mode | get/set |
| ``queueFilter`` | function | Called during offline mode. Takes a request object as arguments and returns a boolean, indicating if a request can be queued | get/set |
| ``queueMaxSize`` | integer | Number of maximum requests kept during offline mode | get/set |
| ``queueTTL`` | integer | Time a queued request is kept during offline mode, in milliseconds | get/set |
| ``headers`` | JSON object | Common headers for all sent documents. | get/set |
| ``metadata`` | JSON object | Common metadata, will be sent to all future requests | get/set |
| ``replayInterval`` | integer | Delay between each replayed requests | get/set |
| ``reconnectionDelay`` | integer | number of milliseconds between reconnection attempts | get |

**Notes:**

* if ``connect`` is set to ``manual``, the ``connect`` method will have to be called manually
* the kuzzle instance will automatically queue all requests, and play them automatically once a first connection is established, regardless of the ``connect`` or offline mode option values.
* multiple methods allow passing specific ``metadata``. These ``metadata`` will be merged with the global Kuzzle object ``metadata`` when sending the request, with the request specific ``metadata`` taking priority over the global ones.
* the ``queueFilter`` property is a function taking a JSON object as an argument. This object is the request sent to Kuzzle, following the [Kuzzle Websocket API](http://kuzzleio.github.io/kuzzle-api-documentation/) format
* if ``queueTTL`` is set to ``0``, requests are kept indefinitely
* The offline buffer acts like a FIFO queue, meaning that if the ``queueMaxSize`` limit is reached, older requests are deleted and new requests are queued
* if ``queueMaxSize`` is set to ``0``, an unlimited number of requests is kept until the buffer is flushed

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
Requests are emitted with the ``replayInterval`` delay between each one of them, and requests submitted while replaying the queue are delayed until the queue is empty, to ensure all requests are played in the right order.

<aside class="warning">
Setting <code>autoReplay</code> to <code>true</code> when using JWT Tokens should generally be avoided.<br/>
When leaving offline-mode, the SDK will automatically check the JWT Token and, if it has expired, the token will be removed and a <code>jwtTokenExpired</code> event will be fired. If <code>autoReplay</code> is set, then all pending requests will be automatically played as an anonymous user.
</aside>

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

| Event Name | Description |
|--------------|-------------------------------------------------------------------|
| ``connected`` | Fired when the SDK has successfully connected to Kuzzle |
| ``disconnected`` | Fired when the current session has been unexpectedly disconnected |
| ``error`` | Fired when the SDK has failed to connect to Kuzzle. Does not trigger offline mode. |
| ``jwtTokenExpired`` | Fired when Kuzzle rejected a request because the authentication token expired.<br>Provides the request and its associated callback to the listener |
| ``loginAttempt`` | Fired when a login attempt completes, either with a success or a failure result.<br>Provides a JSON object with the login status to the listener (see the `login` method documentation)|
| ``reconnected`` | Fired when the current session has reconnected to Kuzzle after a disconnection, and only if ``autoReconnect`` is set to ``true`` |

**Note:** listeners are called in the order of their insertion.

## addListener

```js
  var listenerId = kuzzle.addListener('connected', function (room, subscription) {
    // Actions to perform when receiving a 'subscribed' global event
  });
```

```java
String listenerId = kuzzle.addListener(KuzzleEvent.connected, new IKuzzleEventListener() {
  @Override
  public void trigger(Object... args) {
    // Actions to perform when receiving a 'subscribed' global event
  }
});
```

Adds a listener to a Kuzzle global event. When an event is fired, listeners are called in the order of their insertion.

<aside class="notice">
The ID returned by this function is required if you want to remove this listener later.
</aside>

#### addListener(event, listener)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |
| ``listener`` | function | The function to call each time one of the registered event is fired |

#### Return value

Returns a `string` containing an unique listener ID.

## checkToken

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.checkToken(token, function (err, res) {
  // ...
});

// Using promises (NodeJS only)
kuzzle.checkTokenPromise(token)
  .then(res => {
    // ...
  });
```

```java
kuzzle.checkToken("some jwt token", new KuzzleResponseListener<KuzzleTokenValidity>() {
  @Override
  public void onSuccess(KuzzleTokenValidity tokenInfo) {
    if (tokenInfo.isValid()) {
      // tokenInfo.getExpiresAt() returns the expiration timestamp
    }
    else {
      // tokenInfo.getState() returns the invalidity reason
    }
  }
});
```

> Callback response if the token is valid:

```json
{
  "expiresAt": 1454588077399,
  "valid": true
}
```

> Callback response if the token is invalid:

```json
{
  "valid": false,
  "state": "<invalidity reason>"
}
```

Checks the validity of a JSON Web Token.

#### checkToken(token, callback)

<aside class="note">
This method is non-queuable, meaning that during offline mode, it will be discarded and the callback will be called with an error.
</aside>

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``token``    | string   | The token to check |
| ``callback`` | function | Callback handling the response |

**Note:** this method sends an unauthenticated API call to Kuzzle, meaning it ignores the JWT Token property, even if it has been set.

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

A JSON object with a `valid` boolean property.  
If the token is valid, a `expiresAt` property is set with the expiration timestamp. If not, a `state` property is set explaining why the token is invalid.

## connect

```js
kuzzle.connect();
```

```java
kuzzle.connect();
```

Connects to the Kuzzle instance using the URL provided to the constructor.  
Has no effect if ``connect`` is set to ``auto``, unless ``disconnect`` has been called first.

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

If a callback has been provided to the `Kuzzle` constructor, it will be called with the `Kuzzle` instance once successfully connected


## dataCollectionFactory

```js
  var collection = kuzzle.dataCollectionFactory('index', 'collection');

  // or using a default index:
  var
    kuzzle = new Kuzzle('http://localhost:7512', {defaultIndex: 'index'}),
    collection = kuzzle.dataCollectionFactory('collection');
```

```java
KuzzleDataCollection collection = kuzzle.dataCollectionFactory("index", "collection");

// or using a default index:
kuzzle.setDefaultIndex("index");
KuzzleDataCollection collection = kuzzle.dataCollectionFactory("collection");
```

Instantiates a new KuzzleDataCollection object.

#### dataCollectionFactory([index], collection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``index`` | string | The name of the index containing the data collection |
| ``collection`` | string | The name of the data collection you want to manipulate |

If no ``index`` is provided, the factory will take the default index set in the main Kuzzle instance. If no default index has been set, an error is thrown.

The ``index`` argument takes precedence over the default index.


#### Return value

Returns a `KuzzleDataCollection` object.

## disconnect

```js
kuzzle.disconnect();
```
```java
kuzzle.disconnect();
```


Closes the current connection.

## flushQueue

```js
kuzzle.flushQueue();
```

```java
kuzzle.flushQueue();
```

Empties the offline queue without replaying it.

#### Return value

Returns the `Kuzzle` object to allow chaining.

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

```java
kuzzle.getAllStatistics(new KuzzleResponseListener<JSONArray>() {
  @Override
  public void onSuccess(JSONArray object) {
    // loop through all returned frames
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
};
```

> Callback response example:

```json
[{ "connections": { "socketio": 1 },
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "mqtt": 37, "socketio": 17 },
    "failedRequests": { "socketio": 1 },
    "timestamp": "1453110641308" },
  { "connections": { "socketio": 1 },
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "socketio": 34 },
    "failedRequests": { "socketio": 3 },
    "timestamp": "1453110642308" },
  { "connections": {},
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "socketio": 40 },
    "failedRequests": {},
    "timestamp": "1453110643308" }]
```

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method returns all available statistics from Kuzzle.

#### getAllStatistics([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

The response is an array of JSON objects, each one of them being a statistic frame.

## getJwtToken

```js
var jwtToken = kuzzle.getJwtToken();
```

```java
String jwtToken = kuzzle.getJwtToken();
```

Get internal jwtToken used to request kuzzle.

#### getJwtToken()

#### Return value

Returns the `jwtToken` property to export previous kuzzle logged connection.

## getServerInfo

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.getServerInfo(function (err, stats) {
  // ...
});

// Using promises (NodeJS only)
kuzzle.getServerInfoPromise()
  .then(infos => {
  // ...  
  });
```

```java
kuzzle.getServerInfo(new KuzzleResponseListener<JSONObject>() {
  @Override
  public void onSuccess(JSONObject result) {
    // Handle success
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response example:

```json
{
  "kuzzle": {
    "api": {
      "routes": {
        "admin": [
          "deleteCollection",
          "putMapping",
          "getMapping",
          "getStats",
          "getLastStats",
          "getAllStats",
          "truncateCollection",
          "putRole",
          "deleteIndexes",
          "createIndex",
          "deleteIndex",
          "removeRooms"
        ],
        "auth": [
          "login"
        ],
        "bulk": [
          "import"
        ],
        "read": [
          "search",
          "get",
          "count",
          "listCollections",
          "now",
          "listIndexes",
          "serverInfo"
        ],
        "subscribe": [
          "on",
          "join",
          "off",
          "count",
          "list"
        ],
        "write": [
          "create",
          "publish",
          "createOrUpdate",
          "update",
          "delete",
          "deleteByQuery",
          "createCollection"
        ]
      },
      "version": "1.0"
    },
    "memoryUsed": 99901440,
    "nodeVersion": "v4.2.1",
    "plugins": {
      "kuzzle-plugin-auth-passport-local": {
        "activated": true,
        "hooks": [
          "auth:loadStrategies"
        ],
        "name": "kuzzle-plugin-auth-passport-local"
      },
      "kuzzle-plugin-logger": {
        "activated": true,
        "hooks": [
          "log:silly",
          "log:verbose",
          "log:info",
          "log:debug",
          "log:warn",
          "log:error",
          "data:*",
          "subscription:*",
          "websocket:*",
          "prepare:*",
          "cleanDb:done",
          "cleanDb:error",
          "server:*",
          "rabbit:started",
          "rabbit:error",
          "rabbit:stopped",
          "internalBroker:*",
          "room:new",
          "room:remove",
          "workerGroup:loaded",
          "profiling:*"
        ],
        "name": "kuzzle-plugin-logger",
        "version": "1.0.6"
      },
      "kuzzle-plugin-socketio": {
        "activated": true,
        "hooks": [
          "protocol:broadcast",
          "protocol:joinChannel",
          "protocol:leaveChannel"
        ],
        "name": "kuzzle-plugin-socketio",
        "version": "1.0.4"
      }
    },
    "system": {
      "cpus": [
        {
          "model": "Intel(R) Core(TM) i5-4310M CPU @ 2.70GHz",
          "speed": 800,
          "times": {
            "idle": 8859265400,
            "irq": 500,
            "nice": 4325300,
            "sys": 115447100,
            "user": 497028200
          }
        },
        {
          "model": "Intel(R) Core(TM) i5-4310M CPU @ 2.70GHz",
          "speed": 2701,
          "times": {
            "idle": 8848628800,
            "irq": 400,
            "nice": 3648100,
            "sys": 115458300,
            "user": 495154300
          }
        },
        {
          "model": "Intel(R) Core(TM) i5-4310M CPU @ 2.70GHz",
          "speed": 1300,
          "times": {
            "idle": 8875594600,
            "irq": 4200,
            "nice": 3956800,
            "sys": 98348100,
            "user": 538083800
          }
        },
        {
          "model": "Intel(R) Core(TM) i5-4310M CPU @ 2.70GHz",
          "speed": 2701,
          "times": {
            "idle": 8801022600,
            "irq": 0,
            "nice": 3946300,
            "sys": 97387200,
            "user": 552344400
          }
        }
      ],
      "memory": {
        "free": 1651486720,
        "total": 16729739264
      }
    },
    "uptime": "161016.824s",
    "version": "0.9.2"
  },
  "services": {
    "internalCache": {
      "memoryPeak": "4.88M",
      "memoryUsed": "4.88M",
      "mode": "standalone",
      "type": "redis",
      "version": "3.0.2"
    },
    "readEngine": {
      "api": "1.7",
      "lucene": "4.10.4",
      "nodes": {
        "count": {
          "client": 0,
          "data_only": 0,
          "master_data": 1,
          "master_only": 0,
          "total": 1
        },
        "fs": {
          "available": "5.5gb",
          "available_in_bytes": 5996474368,
          "free": "7.4gb",
          "free_in_bytes": 8013250560,
          "total": "36.5gb",
          "total_in_bytes": 39237341184
        },
        "jvm": {
          "max_uptime": "1.9d",
          "max_uptime_in_millis": 171087444,
          "mem": {
            "heap_max": "990.7mb",
            "heap_max_in_bytes": 1038876672,
            "heap_used": "51.8mb",
            "heap_used_in_bytes": 54394592
          },
          "threads": 75,
          "versions": [
            {
              "count": 1,
              "version": "1.8.0_66-internal",
              "vm_name": "OpenJDK 64-Bit Server VM",
              "vm_vendor": "Oracle Corporation",
              "vm_version": "25.66-b01"
            }
          ]
        },
        "os": {
          "available_processors": 4,
          "cpu": [
            {
              "cache_size": "3kb",
              "cache_size_in_bytes": 3072,
              "cores_per_socket": 16,
              "count": 1,
              "mhz": 2701,
              "model": "Core(TM) i5-4310M CPU @ 2.70GHz",
              "total_cores": 4,
              "total_sockets": 4,
              "vendor": "Intel"
            }
          ],
          "mem": {
            "total": "15.5gb",
            "total_in_bytes": 16729739264
          }
        },
        "plugins": [],
        "process": {
          "cpu": {
            "percent": 0
          },
          "open_file_descriptors": {
            "avg": 190,
            "max": 190,
            "min": 190
          }
        },
        "versions": [
          "1.5.2"
        ]
      },
      "spaceUsed": "14.5kb",
      "status": "red",
      "type": "elasticsearch",
      "version": "1.5.2"
    },
    { "etc." }
  }
}
```

Retrieves information about Kuzzle, its plugins and active services.

#### getServerInfo([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Optional callback |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to a JSON object containing server information.

## getStatistics

> Without argument, retrieves the last statistic frame in an array:

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

```java
kuzzle.getStatistics(new KuzzleResponseListener<JSONObject>() {
  @Override
  public void onSuccess(JSONObject object) {
    // ...
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
[{ "connections": { "socketio": 1 },
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "mqtt": 37, "socketio": 17 },
    "failedRequests": { "socketio": 1 },
    "timestamp": "1453110641308" }]
```

> When providing a timestamp, retrieves all frames recorded after that timestamp:

```js
// Date can be either in ISO format or a timestamp (utc, in milliseconds)
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

```java
// Date can be either in ISO format or a timestamp (utc, in milliseconds)
kuzzle.getStatistics("2015-11-15T13:36:45.558Z", new KuzzleResponseListener<JSONArray>() {
  @Override
  public void onSuccess(JSONArray results) {
    // ...
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
};
```

> Callback response:

```json
[{ "connections": { "socketio": 1 },
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "mqtt": 37, "socketio": 17 },
    "failedRequests": { "socketio": 1 },
    "timestamp": "1453110641308" },
  { "connections": { "socketio": 1 },
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "socketio": 34 },
    "failedRequests": { "socketio": 3 },
    "timestamp": "1453110642308" },
  { "connections": {},
    "ongoingRequests": { "rest": 0, "socketio": 0 },
    "completedRequests": { "socketio": 40 },
    "failedRequests": {},
    "timestamp": "1453110643308" }]
```

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method allows getting either the last statistics frame, or a set of frames starting from a provided timestamp.

#### getStatistics([timestamp], [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``timestamp`` | Epoch time | Optional starting time from which the frames are to be retrieved |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

**Note:** Kuzzle statistics are cleaned up regularly. If the timestamp is set too far in the past, then this method will return all available statistics.

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to an `array` containing one or more statistics frame(s), as JSON objects.

## listCollections

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.listCollections('index', {type: 'stored'}, function (err, collections) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .listCollectionsPromise('index', {type: 'stored'})
  .then(collections => {
    // ...
  });
```

```java
kuzzle.listCollections("index", new KuzzleResponseListener<JSONObject>() {
  @Override
  public void onSuccess(JSONObject object) {
    // ...
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
{
  "stored": ["collection_1", "collection_2", "...", "collection_n"],
  "realtime": ["collection_1", "collection_2", "...", "collection_n"]
}
```

Retrieves the list of known data collections contained in a specified index.

#### listCollections([index], [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``index`` | string | Index containing the collections to be listed |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |
| ``type`` | string | Get either ``stored`` collections or ``realtime`` ones. By default, list ``all`` collections | ``all`` |


If no `index` argument is provided, the `defaultIndex` property is used. If no default index is found, this method throws an error.

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing the list of stored and/or realtime collections on the provided index.

## listIndexes

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.listIndexes(function (err, indexes) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .listIndexesPromise()
  .then(indexes => {
    // ...
  });
```

```java
kuzzle.listIndexes(new KuzzleResponseListener<String[]>() {
  @Override
  public void onSuccess(String[] result) {
    // ...
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
[ "index", "another index", "..."]
```

Retrieves the list of indexes stored in Kuzzle.

#### listIndexes([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

The response is an `array` of index names.


## login

<aside class="note">
This method is non-queuable, meaning that during offline mode, it will be discarded and the callback will be called with an error.
</aside>

```js
// Expiration time is expressed as a string following the
// time conversion library: https://www.npmjs.com/package/ms
 var expiresIn = "1h";

// Using callbacks (NodeJS or Web Browser)
kuzzle.login("local", {username: "username", password: "password"}, expiresIn, function (err, res) {
  // ...
});

// Using promises (NodeJS only)
kuzzle.loginPromise("local", {username: "username", password: "password"}, expiresIn)
  .then(res => {
    // ...
  });
```

```java
JSONObject credentials = new JSONObject()
  .put("username", "John Doe")
  .put("password", "my secret password");

kuzzle.login("local", credentials, 30000, new KuzzleResponseListener<JSONObject>() {
  @Override
  public void onSuccess(JSONObject result) {
    // ...
  }

  @Override
  public void onError() {
    // Handle error
  }
});
```

Log a user according to a strategy and credentials.

If the Kuzzle response contains a JWT Token, the SDK token will be set and the `loginAttempt` event is fired immediately.  
This is the case, for instance, with the `local` authentication strategy.

If there is no token, then it means that the chosen strategy is a two-steps authentication method, like OAUTH. In that case, the `loginAttempt` event is **not** fired. To complete the login attempt, the `setJwtToken` method must be called either with a token or with an appropriate Kuzzle response.

#### login(strategy, credentials, [expiresIn], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``strategy`` | string | Authentication strategy (local, facebook, github, ...) |
| ``credentials`` | JSON object | Login credentials, depending on the strategy |
| ``expiresIn`` | \<varies\> | Login expiration time |
| ``callback`` | function | Optional callback handling the response |

**Note:** If the ``expiresIn`` argument is not set, the default token expiration value will be taken from the Kuzzle server configuration.

By default, kuzzle embed the plugin [kuzzle-plugin-auth-passport-local](https://github.com/kuzzleio/kuzzle-plugin-auth-passport-local) which provide `local` stored password authentication strategy.
This strategy require `username` and `password` as `credentials`

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to the `Kuzzle` object itself once the login process is complete, either successfully or not.  
The `Kuzzle` object will have the property `jwtToken` filled if logging in succeeds.
If no callback is provided and if the login attempt fails, an error is thrown.

## logout

<aside class="note">
This method is non-queuable, meaning that during offline mode, it will be discarded and the callback will be called with an error.
</aside>

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.logout(function (err, res) {
  // ...
});

// Using promises (NodeJS only)
kuzzle.logoutPromise()
  .then(res => {
    // ...
  });
```

```java
kuzzle.logout(new KuzzleResponseListener<Void>() {
  @Override
  public void onSuccess(Void result) {
    // ...
  }

  @Override
  public void onError() {
    // Handle error
  }
});
```

Logs the user out.

#### logout([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | Optional callback handling the response |

This method empties the `jwtToken` property

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to the `Kuzzle` object itself once the logout process is complete, either successfully or not.  
The `Kuzzle` object will unset the property `jwtToken` if the user is successfully logged out.

## now

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.now(function (err, res) {
  // 'res' contains the Kuzzle timestamp (utc, in milliseconds)
});

// Using promises (NodeJS only)
kuzzle.nowPromise().then(res => {
  // 'res' contains the Kuzzle timestamp (utc, in milliseconds)
});
```

```java
kuzzle.now(new KuzzleResponseListener<Date>() {
  @Override
  public void onSuccess(Date object) {
    // 'object' contains the Kuzzle timestamp (utc, in milliseconds)
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
1447151167622
```

Retrieves the current Kuzzle time.

#### now([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Returns a `integer` containing the current Kuzzle time, encoded as an UTC Epoch time in milliseconds.

## query

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.query({controller: 'read', action: 'search'}, {match: { message: 'this is a test' }}, function (err, res) {
  // ...
});

// Using promises (NodeJS only)
kuzzle
  .queryPromise({controller: 'read', action: 'search'}, {match: { message: 'this is a test' }})
  .then(result => {

  });
```

```java
QueryArgs args = new QueryArgs();
args.controller = "read";
args.action = "search";
kuzzle.query(args, new JSONObject(), new OnQueryDoneListener() {
  @Override
  public void onSuccess(JSONObject object) {

  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

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

Base method used to send queries to Kuzzle, following the [Kuzzle API Documentation](http://kuzzleio.github.io/kuzzle-api-documentation)

#### query(queryArgs, query, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``queryArgs`` | JSON object | Query base arguments |
| ``query`` | JSON object | Query to execute |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Optional callback |


Expected `queryArgs` content:

| Option | Type | Description |  Required? |
|---------------|---------|----------------------------------------|---------|
| ``controller`` | string | API Controller argument | required |
| ``action`` | string | API Controller action | required |
| ``index`` | string | Index concerned by the action | optional |
| ``collection`` | string | Data collection concerned by the action | optional |


Available `options`:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing the raw Kuzzle response.

## removeAllListeners

```js
// Removes all listeners on the "unsubscribed" global event
kuzzle.removeAllListeners('disconnected');

// Removes all listeners on all global events
kuzzle.removeAllListeners();
```

```java
// Removes all listeners on the "unsubscribed" global event
kuzzle.removeAllListeners(KuzzleEvent.disconnected);

// Removes all listeners on all global events
kuzzle.removeAllListeners();
```

Removes all listeners, either from a specific event or from all events

#### removeAllListeners([event])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``event`` | string | One of the event described in the ``Event Handling`` section of this documentation |

## removeListener

```js
kuzzle.removeListener('disconnected', listenerId);
```

```java
kuzzle.removeListener(KuzzleEvent.disconnected, "listenerId");
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

```java
kuzzle.replayQueue();
```

Replays the requests queued during offline mode. Works only if the SDK is not in a ``disconnected`` state, and if the ``autoReplay`` option is set to ``false``.

#### Return value

Returns the `Kuzzle` object to allow chaining.

## security

A static `KuzzleSecurity` instance

## setDefaultIndex

```js
kuzzle.setDefaultIndex('index');
```

Set the default data index. Has the same effect than the `defaultIndex` constructor option.

#### Return value

Returns the `Kuzzle` object to allow chaining.


## setHeaders

```js
kuzzle.setHeaders({someContent: 'someValue'}, true);
```

```java
JSONObject headers = new JSONObject().put("someContent", "someValue");

kuzzle.setHeaders(headers, true);
```

This is a helper function returning itself, allowing to easily chain calls.

#### setHeaders(content, [replace])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``content`` | JSON Object | New content |
| ``replace`` | boolean | true: replace the current content with the provided data, false: merge it |

**Note:** by default, the ``replace`` argument is set to ``false``

#### Return value

Returns the `Kuzzle` object to allow chaining.

## setJwtToken

```js
// Directly with a JWT Token
kuzzle.setJwtToken('some jwt token');

/*
 Or with a Kuzzle response.
 For instance, the final OAUTH2 response is obtained with a redirection from Kuzzle,
 and it can be provided to this method directly
 */
kuzzle.setJwtToken(authenticationResponse);
```

```java
// Directly with a JWT Token
kuzzle.setJwtToken("some jwt token");

/*
 Or with a Kuzzle response.
 For instance, the final OAUTH2 response is obtained with a redirection from Kuzzle,
 and it can be provided to this method directly.

 Here, "authenticationResponse" is an instance of JSONObject
 */
kuzzle.setJwtToken(authenticationResponse)
```

Sets the internal JWT token which will be used to request kuzzle.

If the provided token is correct, a `loginAttempt` event is fired with the following object:  
`{ success: true }`

If not, the `loginAttempt` event is fired with response:  
`{ success: false, error: 'invalidity reason' }`

#### setJwtToken(jwtToken)

#### setJwtToken(kuzzleResponse)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``jwtToken`` | string | Previously generated JSON Web Token |
| ``kuzzleResponse`` | JSON object | Final Kuzzle response from a 2-steps authentication process |

#### Return value

Returns the `Kuzzle` object to allow chaining.


## startQueuing

```js
kuzzle.startQueuing();
```

```java
kuzzle.startQueuing();
```

Starts the requests queuing. Works only during offline mode, and if the ``autoQueue`` option is set to ``false``.

#### Return value

Returns the `Kuzzle` object to allow chaining.


## stopQueuing

```js
kuzzle.stopQueuing();
```

```java
kuzzle.stopQueuing();
```

Stops the requests queuing. Works only during offline mode, and if the ``autoQueue`` option is set to ``false``.

#### Return value

Returns the `Kuzzle` object to allow chaining.

## whoAmI

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle.whoAmI(function (err, result) {
  // "result" is a KuzzleUser object
});

// Using promises (NodeJS only)
kuzzle.whoAmIPromise()
  .then(res => {
    // "res" is a KuzzleUser object
  });
```

```java
kuzzle.whoAmI(new KuzzleResponseListener<KuzzleUser>() {
  @Override
  public void onSuccess(KuzzleUser myself) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

Retrieves current user object.

#### whoAmI(callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | Callback handling the response |

#### Return value

Returns the `Kuzzle` object to allow chaining.

#### Callback response

An instanciated `KuzzleUser` object.
