# Kuzzle

This is the main entry point to communicate with Kuzzle. Every other objects inherits properties from this one.

Here is the object diagram of our SDKs:

![object diagram](./images/objectDiagram.png)

## Constructors

### Kuzzle(ApplicationName, KuzzleURL)

Connects to a Kuzzle instance.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ApplicationName | string | The name of the application using Kuzzle. |
| KuzzleURL | string | URL to the target Kuzzle instance |


### Kuzzle(ApplicationName, Options)

Connects to a Kuzzle instance.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ApplicationName | string | The name of the application using Kuzzle. |
| Options | object | Configuration of the connection to Kuzzle |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| autoReconnect | boolean | Auto-reconnect on a connection loss | true |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| applicationID | string | Unique application ID. Provided by Kuzzle | get |
| applicationName | string | Set by the constructor | get/set |
| connectionID | string | Unique client ID. Provided by Kuzzle | get |
| connectionTimestamp | timestamp | Timestamp of the last successful connection to Kuzzle | get |
| headers | object | Common headers for all sent documents. | get/set |
| metadata | JSON Object | Application specific informations, shared to other subscribers | get/set |

## Event Handling

The Kuzzle object listens to global events fired by Kuzzle. To add your own actions on these events, simply plug a callback function to the event you want to act upon.

Here is the list of these special events:

| Event Name | Description | Expected callback arguments |
|--------------|-------------------------------------------------------------------|--------------------------------|
| subscribed | Fired when someone enters a subscribed room  | Room name, updated users count |
| unsubscribed | Fired when someone leaves a subscribed room | Room name, updated users count |
| disconnected | Fired when the current session has been unexpectedly disconnected |  |

## count ![public](./images/public.png)

**Returns:** the number of other connected clients

## dataCollectionFactory ![public](./images/public.png)

Instantiates a new KuzzleDataCollection object.

#### dataCollectionFactory(dataCollectionName)

#### dataCollectionFactory(dataCollectionName, defaultDocumentsHeaders)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| dataCollectionName | string | The name of the data collection you want to manipulate |
| defaultDocumentsHeaders | JSON Object | Common properties for all future write documents queries |

**Returns:** a KuzzleDataCollection object

## logout ![public](./images/public.png)

Closes the current connection. Does not fire a ``disconnected`` event.

## now ![public](./images/public.png)

**Returns:** the current Kuzzle UTC timestamp.


## reconnect ![protected](./images/protected.png)

This function is automatically executed by the event handler, when a ``disconnected`` event is fired, and only if the ``autoReconnect`` option has been set to ``true``.

The purpose of this method is to:

* bufferize queries sent to Kuzzle until a successful reconnection has been established
* retries connecting to Kuzzle at regular intervals
* once connection has been established again, replays sequentially all bufferized queries

## search ![public](./images/public.png)

<aside class="warning">This is a low-level method, exposed to allow advanced SDK users to bypass high-level methods.</aside>

Base method used to send search queries to Kuzzle

## subscribe ![public](./images/public.png)

<aside class="warning">This is a low-level method, exposed to allow advanced SDK users to bypass high-level methods.</aside>

Base method to create a new document or room subscription.

#### subscribe(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Set of filters corresponding to the documents we want to listen to |

**Returns:** a KuzzleRoom object

## write ![public](./images/public.png)

<aside class="warning">This is a low-level method, exposed to allow advanced SDK users to bypass high-level methods.</aside>

Used to interact directly with Kuzzle's write controller.
