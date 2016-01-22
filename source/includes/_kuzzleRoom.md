# KuzzleRoom

This object is the result of a subscription request, allowing to manipulate the subscription itself.

In Kuzzle, you don't exactly subscribe to a room or a topic but, instead, you subscribe to documents.  
What it means is that, to subscribe, you provide to Kuzzle a set of matching filters. Of course, providing an empty filter results in subcribing to all changes occuring on a data collection, emulating the behavior of a traditional topic.

Once you have subscribed, depending on the subscription configuration you provided, you may receive the following notifications:

* a pub/sub message matches your criteria (realtime)
* a matching document is about to be created or deleted (realtime)
* a matching document is created, updated or deleted (once the change is effective in the database)
* a user enters or leaves the room

You may subscribe multiple times to the same room, with identical or different subscription parameters, and with different callbacks. This allow dispatching notifications across the right parts of your application, instead of having to maintain an all-purpose notification consumer (but you can do that, too).

## Notifications

> Document notification example:

```json
{
  "status": 200,
  "error": null,
  "requestId": "bc41ced6-38fc-42b9-8fd5-22ae0774aac2",
  "controller": "name of the controller that generated the notification",
  "action": "name of the action that generated the notification",
  "collection": "collection name",
  "index": "index name",
  "metadata": {},
  "state": "done",
  "scope": "in",
  "result": {
    "_source": {
      "message content": "this is an example"
    }
  }
}
```

> User notification example:

```json
{
  "error": null,
  "status": 200,
  "roomId": "ID of the room concerned by this notification",
  "requestId": "5897cd2f-a8a2-40b2-aa43-b31898172008",
  "controller": "subscribe",
  "action": "on",
  "protocol": "protocol used by the notificating user",
  "timestamp": 1453193069592,
  "metadata": {
    "optional": "user informations"
  },
  "result": {
    "roomId": "ID of the room concerned by this notification",
    "count": 42
  }
}
```

To subscribe, you must provide a callback that will be called each time a new notification is received.

On the right panel you can see a document and a user notification examples.

#### Document notification rundown

| Notification field | Type |Description       | Possible values |
|--------------------|------|------------------|-----------------|
| `result._source` | JSON object | Content of the document or realtime message that generated the notification | |
| `scope` | string | Indicates if the document enters or exits the subscription scope | `in`, `out` |
| `state` | string | Tells if the document is about to be changed, or if the change is effective | `pending`, `done` |


#### User notification rundown

| Notification field | Type |Description       | Possible values |
|--------------------|------|------------------|-----------------|
| `action` | string | Indicates if the user enters or leaves the susbcribed room | `on`, `off` |
| `metadata` | JSON object | If provided during subscription, contains application specific informations | |
| `result.count` | integer | Updated number of users subscribing to this room | |

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleRoom objects are returned by KuzzleDataCollection.subscribe and
 KuzzleDocument.subscribe methods.

 You may also use the KuzzleDataCollection.roomFactory() method:
 */
var room = kuzzle.dataCollectionFactory('index', 'collection').roomFactory();

var room = kuzzle
  .dataCollectionFactory('index', 'collection')
  .roomFactory({subscribeToSelf: false});
```

```java
KuzzleRoom room = new KuzzleRoom(dataCollection);

KuzzleRoomOptions options = new KuzzleRoomOptions();
options.setSubscribeToSelf(false);
KuzzleRoom room = new KuzzleRoom(dataCollection, options);
```


Creates a KuzzleRoom object.

#### KuzzleRoom(KuzzleDataCollection)

#### KuzzleRoom(KuzzleDataCollection, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleDataCollection`` | object | an instantiated Kuzzle Data Collection object |
| ``options`` | object | Subscription configuration |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``scope`` | string | Filter document notifications depending on their scope status. You may receive entering documents (scope: ``in``), leaving documents (scope: ``out``), all documents changes (scope: ``all``) or filter these notifications completely (scope: ``none``). This filter does not affect pub/sub messages or user events. | ``all`` |
| ``state`` | string | Filter document notifications depending on the state of the modifying request. You may receive realtime notifications when a document is about to be changed (state: ``pending``), or be notified when the change has been fully written in the database (state: ``done``), or both (state: ``all``). This filter does not affect pub/sub messages or user events. | ``done`` |
| ``subscribeToSelf`` | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | ``true`` |
| ``users`` | string | Filter notifications fired upon a user entering the room (user: ``in``), leaving the room (user: ``out``), or both (user: ``all``). Setting this variable to ``none`` prevents receiving these notifications | ``none`` |


## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``collection`` | string | The subscribed data collection | get |
| ``filters`` | JSON object | The current set of filters of this room | get/set |
| ``headers`` | JSON Object | Common headers for all sent documents. | get/set |
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | get/set |
| ``subscribeToSelf`` | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | get/set |
| ``roomId`` | string | Unique room identifier | get |

**Notes:**

* the ``headers`` property is inherited from the provided ``KuzzleDataCollection`` object and can be overrided
* updating the ``metadata`` property takes effect after ``renew`` is called
* by default, the global Kuzzle ``metadata`` properties are sent along with the subscription request. If a ``metadata`` option is provided during subscription, it will be merged with the global ``metadata`` for the subscription only. In case of conflicts, subscription ``metadata`` take priority over the global ``metadata``.

## count

```js
// Using callbacks (NodeJS or Web Browser)
room.count(function (error, result) {
  // ...
});

// Using promises (NodeJS)
room.countPromise().then(result => {
  // ...
});
```

```java
room.count(new ResponseListener<Integer>() {
 @Override
 public void onSuccess(Integer result) throws Exception {
   //  ...
 }

 @Override
 public void onError(JSONObject error) throws Exception {
   // Handle error
 }
});
```

> Callback response

```json
1
```

Return the number of subscribers on that room

#### count(callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | Callback handling the response |

#### Return value

Returns this `KuzzleRoom` object to allow chaining.

#### Callback response

Resolves to a `integer` containing the number of users subscribing to this room.


## renew

```js
room.renew({terms: {field: ['some', 'new', 'filter']}}, function (err, res) {
  // called each time a change is detected on documents matching this filter
});
```

```java
JSONObject filters = new JSONObject();
JSONObject terms = new JSONObject();
JSONArray field = new JSONArray();
field.put("some").put("new").put("filter");
terms.put("field", field);
filters.put("terms", terms);
room.renew(terms, new ResponseListener<KuzzleNotificationResponse>() {
 @Override
 public void onSuccess(KuzzleNotificationResponse result) throws Exception {
   // called each time a change is detected on documents matching this filter
 }

 @Override
 public void onError(JSONObject error) throws Exception {
   // Handle error
 }
});
```

Renew the subscription. Force a resubscription using the same filters if no new ones are provided.
Unsubscribes first if this KuzzleRoom was already listening to events.

#### renew(callback)

#### renew(filters, callback)


| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| ``callback`` | function | Function called each time a notification is received |

#### Return value

Returns this `KuzzleRoom` object to allow chaining.


## setHeaders

```js
room.setHeaders({someContent: 'someValue'}, true);
```

```java
JSONObject headers = new JSONObject();
headers.put("someContent", "someValue");
room.setHeaders(headers, true);
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

#### Return value

Returns this `KuzzleRoom` object to allow chaining.

## unsubscribe

```js
room.unsubscribe();
```

```java
room.unsubscribe();
```

Cancels the current subscription.

#### Return value

Returns this `KuzzleRoom` object to allow chaining.
