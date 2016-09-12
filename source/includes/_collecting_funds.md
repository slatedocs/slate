# Receiving Money

# Introduction

Beyonic uses the term "Collection" to refer to money that you receive (or collect) from a mobile subscriber. This differentiates money you receive (Collections) from money you send to mobile subscribers (Payments).

Beyonic provides to API methods to help you with receiving money from customers.

1. **Requesting collections**: You can request funds from a subscriber. You do this using the [Collection Requests](#collection-requests) API. See the [Collection Requests](#collection-requests) documentation for more information on how to initiate a collection request. It is as simple as creating a "Collection Request" object.

2. **Viewing received collections**: Sometimes subscribers will send you money directly without first getting a collection request from you. The [Collections](#collections) API lets you access all the collections you have received, whether they are in response to a Collection Request, or if the subscriber sent the funds directly.

The difference is that collections that were received in response to a request from you will include a "collection_requests" parameter which will have a link to the collection request id.

See the [Collections](#collections) documentation for more information on how to view, filter or search through collections you have received.

**Related Events**

The "collection.received" event is triggered whenever you receive funds from a user. You can configure a web link to receive notifications whenever this event occurs. This will allow you to respond automatically whenever you receive funds. See our [Webhooks API](#webhooks) documentation for more information.