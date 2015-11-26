# KuzzleDataCollection

In Kuzzle, you manipulate documents and subscriptions, both related to data collections.

A data collection is a set of data managed by Kuzzle. It acts like a data table for persistent documents, or like a room for pub/sub messages.


## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK. You may get an instantiated
 KuzzleDataCollection object by calling Kuzzle.dataCollectionFactory()
 */
```

#### KuzzleDataCollection(kuzzle, collection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``kuzzle`` | object | Kuzzle object |
| ``collection`` | string | The name of the data collection you want to manipulate |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``kuzzle`` | object | linked kuzzle instance | get |
| ``collection`` | string | The name of the data collection handled by this instance | get |
| ``headers`` | object | Headers for all sent documents. | get/set |


**Note:** the ``headers`` property is inherited from the main ``Kuzzle`` object and can be overrided

## advancedSearch

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .advancedSearch({}, function (err, res) {
    res.forEach(document => {
      console.log(document.toString());
    });
  });

// Using promises (NodeJS only)
kuzzle
  .dataCollectionFactory('collection')
  .advancedSearchPromise({})
  .then(res => {
    res.forEach(document => {
      console.log(document.toString());
    });
  });
```

> Returns an object containing the total number of documents, and an array of retrieved documents

```json
{ "total": 3,
  "documents": [{object}, {object}, {object}]
}
```


<aside class="notice">
There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function
</aside>

Executes an advanced search on the data collection.

#### advancedSearch(filters, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## count

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .count({}, function (err, res) {
    // ...
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .countPromise({})
 .then(res => {
   // ...
 });
```

> Returns the number of matched documents

```json
12
```

<aside class="notice">There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function</aside>

Returns the number of documents matching the provided set of filters.

#### count(filters, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## create

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .create(function (error, result) {
    // callback called once the create operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .createPromise()
 .then(result => {
   // promise resolved once the create operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

Create a new empty data collection, with no associated mapping.

Kuzzle automatically creates data collections when storing documents, but there are cases where we want to create and prepare data collections before storing documents in it.

#### create([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## createDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .createDocument({title: 'foo', content: 'bar'}, {updateIfExist: true}, function (err, res) {
    // callback called once the create action has been completed
    // => the result is a KuzzleDocument object
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .createDocumentPromise({title: 'foo', content: 'bar'}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the create action has been completed
   // => the result is a KuzzleDocument object
 });
```

> Returns a KuzzleDocument object containing the newly created document

Create a new document in Kuzzle.

#### createDocument(KuzzleDocument, [options])

#### createDocument([id], content, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleDocument`` | object | KuzzleDocument object |
| ``id`` | string | Optional document identifier |
| ``content`` | JSON Object | Content of the document to create |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |
| ``updateIfExist`` | boolean | If the same document already exists: throw an error if sets to ``false``. Update the existing document otherwise | ``false`` |


## delete

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .delete(function (error, result) {
    // callback called once the delete operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .deletePromise()
 .then(result => {
   // promise resolved once the delete operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

Delete this data collection and all documents in it.

#### delete([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

## deleteDocument

```js
// Deleting one document using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .deleteDocument('document unique ID', function (err, res) {
    // callback called once the delete action has been completed
  });

// Deleting one document using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .deleteDocumentPromise('document unique ID')
  .then(res => {
    // promises resolved once the delete action has been completed
  });

// Deleting multiple documents using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .deleteDocument({term: {title: 'foo'}}, function (err, res) {
    // callback called once the delete with query has been completed
  });

// Deleting multiple documents using promises (NodeJS)
 kuzzle
 .dataCollectionFactory('collection')
 .deleteDocumentPromise({title: 'foo', content: 'bar'}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the delete by query has been completed
 });
```

> Returns the list of deleted document IDs

```json
["AVCoeBkimsySTKTfa8AX"]
```

<aside class="notice">
There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be deleted by the filtered version of this function
</aside>

Delete persistent documents.

#### deleteDocument(documentId, [options])

#### deleteDocument(filters, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``filters`` | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## fetchDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .fetchDocument('documentId', function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .fetchDocumentPromise('documentId')
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object

Retrieve a single stored document using its unique document ID.

#### fetchDocument(documentId, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## fetchAllDocuments

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .fetchAllDocuments(function (error, result) {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .fetchAllDocumentsPromise()
  .then(result => {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  });
```

> Returns an object containing the total number of documents, and an array of retrieved documents

```json
{ "total": 3,
  "documents": [{object}, {object}, {object}]
}
```

Retrieves all documents stored in this data collection.

#### fetchAllDocuments([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## getMapping

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .getMapping(function (error, result) {
    // result is a KuzzleDataMapping object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .getMappingPromise()
  .then(result => {
    // result is a KuzzleDataMapping object
  });
```

> Returns a KuzzleDataMapping object

Instantiates a KuzzleDataMapping object containing the current mapping of this collection.

#### getMapping([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## publishMessage

```js
kuzzle
  .dataCollectionFactory('collection')
  .publishMessage({foo: 'bar', baz: 'qux'});
```

Publish a realtime message

#### publishMessage(KuzzleDocument, [options])

#### publishMessage(content, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleDocument`` | object | KuzzleDocument object |
| ``content`` | JSON Object | Content of the document to publish |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

## putMapping

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .putMapping({foo: {type: 'string', store: true}, bar: {type: 'date'}, function (error, result) {
    // result is a KuzzleDataMapping object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .putMappingPromise({foo: {type: 'string', store: true}, bar: {type: 'date'})
  .then(result => {
    // result is a KuzzleDataMapping object
  });
```

Applies a new mapping to the data collection.  
Note that you cannot delete an existing mapping, you can only add or update one.

#### putMapping(mapping, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``mapping`` | JSON Object | Mapping to apply |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## replaceDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .replaceDocument('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .replaceDocumentPromise('documentId', {title: 'foo', content: 'bar'})
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object containing the new version of the document

Replace an existing document with a new one.

#### replaceDocument(documentId, content, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``content`` | JSON Object | Content of the document to create |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

## setHeaders

```js
kuzzle
  .dataCollectionFactory('collection')
  .setHeaders({
    someContent: 'someValue',
    metadata: { someMetaData: ['with', 'some', 'values']}
  }, true);
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

## subscribe

```js
var notificationCB = function (error, result) {
  // called each time a new notification on this filter is received
};

var room =
  kuzzle
    .dataCollectionFactory('collection')
    .subscribe({term: {title: 'foo'}}, notificationCB, {subscribeToSelf: true});
```

> Returns a KuzzleRoom object

Subscribes to this data collection with a set of filters.

<aside class="notice">
To subscribe to the entire data collection, simply provide an empty filter.
</aside>

#### subscribe(filters, callback)

#### subscribe(filters, callback, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| ``callback`` | function | Callback to call every time a notification is received on this subscription |
| ``options`` | object | Subscription configuration. Passed to the KuzzleRoom constructor. |


## truncate

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .truncate(function (error, result) {
    // callback called once the truncate operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .truncatePromise()
 .then(result => {
   // promise resolved once the truncate operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

Truncate the data collection, removing all stored documents but keeping all associated mappings.

This method is a lot faster than removing all documents using a query.

#### truncate([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## updateDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .updateDocument('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .updateDocumentPromise('documentId', {title: 'foo', content: 'bar'})
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object containing the new version of the document  

Update parts of a document

#### updateDocument(documentId, content, [options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``content`` | JSON Object | Content of the document to create |
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |
