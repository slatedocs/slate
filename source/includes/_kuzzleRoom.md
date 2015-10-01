# KuzzleRoom

This object is the result of a subscription request, allowing to manipulate the subscription itself.

In Kuzzle, you don't exactly subscribe to a room or a topic but, instead, you subscribe to documents.

What it means is that, to subscribe, you provide to Kuzzle a set of matching criterias.  
Once you have subscribed, if a pub/sub message is published matching your criterias, or if a matching stored document change (because it is created, updated or deleted), then you'll receive a notification about it.

## Constructors

Susbcribes to documents using a set of filters.

### KuzzleRoom(Kuzzle, filters)

### KuzzleRoom(Kuzzle, filters, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| Kuzzle | object | an instantiated Kuzzle object |
| filters | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| Options | object | Subscription configuration |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| subscribeToSelf | boolean | (Don't) subscribe to notifications fired as a consequence of our own queries | false |
| listenToSubscriptions | boolean | (Don't) listen to other subscriptions on that room | false |
| listenToUnsubscriptions | boolean | (Don't) listen to other subscription cancellations on that room | false |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| listeningToConnections | boolean | Is this subscription (not) listening to other ``subscribed`` events on that room | get |
| listeningToDisconnections | boolean | Is this subscription (not) listening to other ``unsubcribed`` events on that room | get |
| metadata | JSON Object | (inherited) Application specific informations, shared to any other subscribers | get/set |
| subscriptionID | string | Unique subscription identifier | get |
| subscriptionTimestamp | timestamp | The timestamp of the start of this subscription | get |

## count ![public](./images/public.png)

Returns the number of other subscriptions on that room.

## listen ![public](./images/public.png)

Start/Stop listening to a room special event. A special event is an event not concerning a document, but the room itself.

These special events trigger the Kuzzle event handler, on which you have to plug a callback method.

#### listen(event)

#### listen(event, start)

| Arguments | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| event | string | Special event. The complete list can be found in the Kuzzle/Event Handling part of this documentation | |
| start | boolean | Start (``true``) or stop (``false``) listening to that event | true |

## list ![public](./images/public.png)

Returns a list of objects detailing other subscriptions on the same room.

These objects contain:

* the subscription metadata
* the subscription timestamp

## unsubscribe ![public](./images/public.png)

Unsubscribes and invalidates this KuzzleRoom object.

## update ![public](./images/public.png)

Renew the subscription using new filters

#### update(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
