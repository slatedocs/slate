# KuzzleRoom

This object is the result of a subscription request, allowing to manipulate the subscription itself.

In Kuzzle, you don't exactly subscribe to a room or a topic but, instead, you subscribe to documents.

What it means is that, to subscribe, you provide to Kuzzle a set of matching filters.  
Once you have subscribed, if a pub/sub message is published matching your filters, or if a matching stored document change (because it is created, updated or deleted), then you'll receive a notification about it.

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleRoom objects are returned by KuzzleDataCollection.subscribe and
 KuzzleDocument.subscribe methods.

 You may also use the KuzzleDataCollection.roomFactory() method:
 */
var room = kuzzle.dataCollectionFactory('collection').roomFactory();

var room = kuzzle
  .dataCollectionFactory('collection')
  .roomFactory({subscribeToSelf: true, listenToConnections: false});
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
| ``listenToConnections`` | boolean | (Don't) listen to other subscriptions on that room | ``false`` |
| ``listenToDisconnections`` | boolean | (Don't) listen to other subscription cancellations on that room | ``false`` |
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``subscribeToSelf`` | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | ``false`` |


## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``collection`` | string | The subscribed data collection | get |
| ``filters`` | JSON object | The current set of filters of this room | get/set |
| ``headers`` | JSON Object | Common headers for all sent documents. | get/set |
| ``listenToConnections`` | boolean | Is this subscription (not) listening to other ``subscribed`` events on that room | get/set |
| ``listenToDisconnections`` | boolean | Is this subscription (not) listening to other ``unsubcribed`` events on that room | get/set |
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | get/set |
| ``subscribeToSelf`` | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | get/set |
| ``roomId`` | string | Unique room identifier | get |

**Notes:**

* the properties ``listenTo*`` affect only the provided callback. Listeners on the corresponding global events receive notifications even if these flags are turned off.
* updating the value of ``listenTo*`` properties takes effect immediately
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

> Return the number of subscribers on that room

```json
1
```

Return the number of subscribers on that room

## list

<aside class="warning">
To be implemented
</aside>

Returns a list of objects detailing other subscriptions on the same room.

These objects contain:

* the subscription metadata
* the subscription timestamp

## renew

```js
room.renew({terms: {field: ['some', 'new', 'filter']}}, function (err, res) {
  // called each time a change is detected on documents matching this filter
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

## setHeaders

```js
room.setHeaders({someContent: 'someValue'}, true);
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

## unsubscribe

```js
room.unsubscribe();
```

Cancels the current subscription.
