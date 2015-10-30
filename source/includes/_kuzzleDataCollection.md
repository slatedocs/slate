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
| kuzzle | object | Kuzzle object |
| collection | string | The name of the data collection you want to manipulate |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| kuzzle | object | linked kuzzle instance | get |
| collection | string | The name of the data collection handled by this instance | get |
| headers | object | Headers for all sent documents. | get/set |


**Note:** the ``headers`` property is inherited from the main ``Kuzzle`` object and can be overrided

## advancedSearch ![public](./images/public.png)

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

#### advancedSearch(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |


## count ![public](./images/public.png)

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

#### count(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |


## create ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .create({title: 'foo', content: 'bar'}, {updateIfExist: true}, function (err, res) {
    // callback called once the create action has been completed
    // => the result is a KuzzleDocument object
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('collection')
 .createPromise({title: 'foo', content: 'bar'}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the create action has been completed
   // => the result is a KuzzleDocument object
 });
```

> Returns a KuzzleDocument object containing the newly created document

Create a new document in Kuzzle.

#### create(KuzzleDocument)

#### create(KuzzleDocument, updateIfExist)

#### create(content)

#### create(content, updateIfExist)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDocument | object | KuzzleDocument object |
| content | JSON Object | Content of the document to create |
| updateIfExist | boolean | If the same document already exists: throw an error if sets to ``false``. Update the existing document otherwise |

**Note:** by default, the ``updateIfExist`` is set to ``false``

## delete ![public](./images/public.png)

```js
// Deleting one document using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .delete('document unique ID', function (err, res) {
    // callback called once the delete action has been completed
  });

// Deleting one document using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .deletePromise('document unique ID')
  .then(res => {
    // promises resolved once the delete action has been completed
  });

// Deleting multiple documents using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .delete({term: {title: 'foo'}}, function (err, res) {
    // callback called once the delete with query has been completed
  });

// Deleting multiple documents using promises (NodeJS)
 kuzzle
 .dataCollectionFactory('collection')
 .deletePromise({title: 'foo', content: 'bar'}, {updateIfExist: true})
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

#### delete(documentId)

#### delete(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |
| filters | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |


## fetch ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .fetch('documentId', function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .fetchPromise('documentId')
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object

Retrieve a single stored document using its unique document ID.

#### fetch(documentId)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |


## fetchAll ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .fetchAll(function (error, result) {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .fetchAllPromise()
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

**Returns:** a KuzzleDocumentSet object

## getMapping ![public](./images/public.png)

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


## publish ![public](./images/public.png)

```js
kuzzle
  .dataCollectionFactory('collection')
  .publish({foo: 'bar', baz: 'qux'});
```

Publish a realtime message

#### publish(KuzzleDocument)

#### publish(content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDocument | object | KuzzleDocument object |
| content | JSON Object | Content of the document to publish |

## replace ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .replace('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .replacePromise('documentId', {title: 'foo', content: 'bar'})
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object containing the new version of the document

Replace an existing document with a new one.

#### replace(documentId, KuzzleDocument)

#### replace(documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |
| KuzzleDocument | object | KuzzleDocument object |
| content | JSON Object | Content of the document to create |

## subscribe ![public](./images/public.png)

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
| filters | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| callback | function | Callback to call every time a notification is received on this subscription |
| options | object | Subscription configuration. Passed to the KuzzleRoom constructor. |


## update ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('collection')
  .update('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('collection')
  .updatePromise('documentId', {title: 'foo', content: 'bar'})
  .then(result => {
    // result is a KuzzleDocument object
  });
```

> Returns a KuzzleDocument object containing the new version of the document  

Update parts of a document

#### update(documentId, KuzzleDocument)

#### update(documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |
| KuzzleDocument | object | KuzzleDocument containing the updated content |
| content | JSON Object | Content of the document to create |
