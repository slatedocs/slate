# KuzzleRoom

This object is the result of a subscription request, allowing to manipulate the subscription itself.

In Kuzzle, you don't exactly subscribe to a room or a topic but, instead, you subscribe to documents.

What it means is that, to subscribe, you provide to Kuzzle a set of matching filters.  
Once you have subscribed, if a pub/sub message is published matching your filters, or if a matching stored document change (because it is created, updated or deleted), then you'll receive a notification about it.

## Constructors

Creates a KuzzleRoom object.

#### KuzzleRoom(KuzzleDataCollection)

#### KuzzleRoom(KuzzleDataCollection, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDataCollection | object | an instantiated Kuzzle Data Collection object |
| options | object | Subscription configuration |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| subscribeToSelf | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | false |
| listeningToConnections | boolean | (Don't) listen to other subscriptions on that room | false |
| listeningToDisconnections | boolean | (Don't) listen to other subscription cancellations on that room | false |


## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| collection | string | The subscribed data collection | get |
| filters | JSON object | The current set of filters of this room | get/set |
| listeningToConnections | boolean | Is this subscription (not) listening to other ``subscribed`` events on that room | get/set |
| listeningToDisconnections | boolean | Is this subscription (not) listening to other ``unsubcribed`` events on that room | get/set |
| metadata | JSON Object | (inherited) Application specific informations, shared to any other subscribers | get/set |
| subscribeToSelf | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | get/set |
| subscriptionID | string | Unique subscription identifier | get |
| subscriptionTimestamp | timestamp | The timestamp of the start of this subscription | get |

**Notes:**

* the properties ``listeningTo*`` affect only the provided callback. Listeners on the corresponding global events receive notifications even if these flags are turned off.
* updating the value of ``listeningTo*`` properties takes effect immediately

## count ![public](./images/public.png)

Returns the number of other subscriptions on that room.

## list ![public](./images/public.png)

<aside class="warning">
To be implemented
</aside>

Returns a list of objects detailing other subscriptions on the same room.

These objects contain:

* the subscription metadata
* the subscription timestamp

## renew ![public](./images/public.png)

Renew the subscription using new filters

#### renew(filters, callback)


| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| callback | function | Function called each time a notification is received |

## unsubscribe ![public](./images/public.png)

Unsubscribes from Kuzzle.
