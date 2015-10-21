# Kuzzle

This is the main entry point to communicate with Kuzzle. Every other objects inherits properties from this one.

Here is the object diagram of our SDKs:

![object diagram](./images/objectDiagram.png)

## Constructors

Connects to a Kuzzle instance.

#### Kuzzle(url)

#### Kuzzle(url, options)


| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| url | string | URL to the target Kuzzle instance |
| options | object | Configuration of the connection to Kuzzle |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| autoReconnect | boolean | Auto-reconnect on a connection loss | true |
| headers | JSON object | Common headers for all sent documents | |


## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| autoReconnect | boolean | Auto-reconnect on a connection loss | get/set |
| headers | object | Common headers for all sent documents. | get/set |
| metadata | JSON Object | Application specific informations, shared to other subscribers | get/set |

## Event Handling

The Kuzzle object listens to global events fired by Kuzzle. To subscribe or unsubscribe on these events, simply plug a callback function to the event you want to act upon, using the functions ``addListener`` and ``removeListener``.

Here is the list of these special events:

| Event Name | Description | Expected callback arguments |
|--------------|-------------------------------------------------------------------|--------------------------------|
| subscribed | Fired when someone enters a subscribed room  | Room name, Subscription informations |
| unsubscribed | Fired when someone leaves a subscribed room | Room name, Unsubscription informations |
| disconnected | Fired when the current session has been unexpectedly disconnected |  |

## addListener ![public](./images/public.png)

Adds a listener to a Kuzzle global event. When an event is fired, listeners are called in the order of their insertion.

<aside class="notice">
The ID returned by this function is required if you want to remove this listener later.
</aside>

#### addListener(event, listener)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| event | string | One of the event described in the ``Event Handling`` section of this documentation |
| listener | function | The function to call each time one of the registered event is fired |

**Returns:** an unique listener ID.

## dataCollectionFactory ![public](./images/public.png)

Instantiates a new KuzzleDataCollection object.

#### dataCollectionFactory(collection)

#### dataCollectionFactory(collection, headers)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| collection | string | The name of the data collection you want to manipulate |
| headers | JSON Object | Common properties for all future write documents queries |

**Returns:** a KuzzleDataCollection object

## getAllStatistics ![public](./images/public.png)

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method returns all available statistics from Kuzzle.


**Returns:** a JSON object containing all available statistics

## getStatistics ![public](./images/public.png)

Kuzzle monitors active connections, and ongoing/completed/failed requests.  
This method allows getting either the last statistics frame, or a set of frames starting from a provided timestamp.

#### getStatistics()

#### getStatistics(timestamp)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| timestamp | Epoch time | Starting time from which the frames are to be retrieved |

**Returns:** a JSON object containing the requested statistics frame(s)

**Note:** Kuzzle statistics are cleaned up regularly. If the timestamp is set too far in the past, then this method will return all available statistics.

## logout ![public](./images/public.png)

Closes the current connection. Does not fire a ``disconnected`` event.

## now ![public](./images/public.png)

**Returns:** the current Kuzzle UTC timestamp.

## query ![public](./images/public.png)

<aside class="warning">
This is a low-level method, exposed to allow advanced SDK users to bypass high-level methods.<br/>
Check the Kuzzle documentation available <a href=https://github.com/kuzzleio/kuzzle/tree/master/docs>here</a>
</aside>

#### query(collection, controller, action, query)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| collection | string | The name of the data collection you want to manipulate |
| controller | string | The Kuzzle controller that will handle this query |
| action | string | Controller action to perform |
| query | JSON Object | Query to execute |

Base method used to send queries to Kuzzle

## reconnect ![protected](./images/protected.png)

This function is automatically executed by the event handler, when a ``disconnected`` event is fired, and only if the ``autoReconnect`` option has been set to ``true``.

The purpose of this method is to:

* bufferize queries sent to Kuzzle until a successful reconnection has been established
* retries connecting to Kuzzle at regular intervals
* once connection has been established again, replays sequentially all bufferized queries

## removeAllListeners ![public](./images/public.png)

Removes all listeners, either from a specific event or from all events

#### removeAllListeners()

#### removeAllListeners(event)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| event | string | One of the event described in the ``Event Handling`` section of this documentation |

## removeListener ![public](./images/public.png)

Removes a listener from an event.

#### removeListener(event, listenerID)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| event | string | One of the event described in the ``Event Handling`` section of this documentation |
| listenerID | string | The ID returned by ``addListener`` |
