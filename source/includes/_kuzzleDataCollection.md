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

```java
  KuzzleDataCollection myCollection = new KuzzleDataCollection(kuzzle, "my-collection");
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
var filter = {
  filter: {
    and: [
      {
        terms: {
          status: ['idle', 'wantToHire', 'toHire', 'riding'],
        }
      },
      {
        terms:{
          type: ['cab']
        }
      },
      {
        geo_distance: {
          distance: '10km',
          pos: {
            lat: '48.8566140', lon: '2.352222'
          }
        }
      }
    ]
  }
};
kuzzle
  .dataCollectionFactory('collection')
  .advancedSearch(filter, function (err, res) {
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

```java
JSONObject filter = new JSONObject();
JSONArray and = new JSONArray();
JSONArray types = new JSONArray();
JSONArray status = new JSONArray();
JSONObject statu = new JSONObject();
JSONObject terms = new JSONObject();
JSONObject terms2 = new JSONObject();
JSONObject type = new JSONObject();
types.put("cab");
status.put("idle").put("hired").put("riding");
if (userController.getUser().getType() == UserType.CAB) {
  types.put("customer");
  status.put("wantToHire");
} else {
  status.put("toHire");
}
type.put("type", types);
statu.put("status", status);
terms.put("terms", statu);
terms2.put("terms", type);
and.put(terms).put(terms2);
filter.put("and", and);
userFilter.put("filter", filter);
dataCollection.advancedSearch(userFilter, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // Handle success
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
JSONObject filters = new JSONObject();
dataCollection.count(filters, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // Handle success
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
dataCollection.create(new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the create operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
KuzzleDocument myDocument = new KuzzleDocument(collection);
myDocument.setContent("title", "foo");
myDocument.setContent("content", "bar");
dataCollection.createDocument(myDocument, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the create action has been completed
    // => the result is a KuzzleDocument object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
dataCollection.delete(new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the delete operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
// Deleting one document
dataCollection.deleteDocument("document unique ID", new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the delete action has been completed
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});

// Deleting multiple documents
JSONObject termFilter = new JSONObject();
JSONObject title = new JSONObject();
title.put("title", "foo");
termFilter.put("term", title);
dataCollection.deleteDocument(termFilter, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the delete with query has been completed
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
KuzzleDocument myDoc;
dataCollection.fetchDocument("documentId", new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    myDoc = new KuzzleDocument(dataCollection, object);
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
dataCollection.fetchAllDocuments(new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
dataCollection.getMapping(new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // result is a KuzzleDataMapping object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
KuzzleDocument myDocument = new KuzzleDocument(dataCollection);
myDocument.setContent("title", "foo");
myDocument.setContent("content", "bar");
dataCollection.publish(myDocument);
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

```java
dataCollection.putMapping(myKuzzleDataMapping, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // result is a KuzzleDataMapping object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
KuzzleDocument doc = new KuzzleDocument(collection);
doc.setContent("foo", "bar");
dataCollection.replaceDocument("42", doc);
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

```java
JSONObject content = new JSONObject();
content.put("someContent", "someValue");
JSONObject meta = new JSONObject();
JSONArray metaValue = new JSONArray();
metaValue.put("with").put("some").put("value");
meta.put("someMetaData", metaValue);
content.put("metadata", meta);
dataCollection.setHeaders(content, true);
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
var room =
  kuzzle
    .dataCollectionFactory('collection')
    .subscribe({term: {title: 'foo'}}, function (error, result) {
      // called each time a new notification on this filter is received
    };
```

```java
JSONObject term = new JSONObject();
JSONObject title = new JSONObject();
title.put("title", "foo");
term.put("term", title);
dataCollection.subscribe(term, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // called each time a new notification on this filter is received
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Returns a KuzzleRoom object

Subscribes to this data collection with a set of filters.

<aside class="notice">
To subscribe to the entire data collection, simply provide an empty filter.
</aside>

#### subscribe(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| ``options`` | object | (Optional) Subscription configuration. Passed to the KuzzleRoom constructor. |
| ``callback`` | function | Callback to call every time a notification is received on this subscription |


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

```java
dataCollection.truncate(new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the truncate operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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

```java
KuzzleDocument doc = new KuzzleDocument(collection);
doc.setContent("bar", "foo");
doc.save();
doc.setContent("foo", "bar");
dataCollection.updateDocument("documentId", doc, new ResponseListener() {
  @Override
  public void onSuccess(JSONObject object) {
    // callback called once the truncate operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
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
