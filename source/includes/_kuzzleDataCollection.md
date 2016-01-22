# KuzzleDataCollection

In Kuzzle, you manipulate documents and subscriptions, both related to data collections.

A data collection is a set of data managed by Kuzzle. It acts like a data table for persistent documents, or like a room for pub/sub messages.


## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK. You may get an instantiated
 KuzzleDataCollection object by calling Kuzzle.dataCollectionFactory()
 */
var dataCollection = kuzzle.dataCollectionFactory('index', 'collection');
```

```java
  KuzzleDataCollection myCollection = new KuzzleDataCollection(kuzzle, "my-index", "my-collection");
```

#### KuzzleDataCollection(kuzzle, index, collection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``kuzzle`` | object | Kuzzle object |
| ``index`` | string | Name of the index containing the data collection |
| ``collection`` | string | The name of the data collection you want to manipulate |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``kuzzle`` | object | linked kuzzle instance | get |
| ``index`` | object | Name of the index containing the data collection | get |
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
  .dataCollectionFactory('index', 'collection')
  .advancedSearch(filter, function (err, res) {
    res.documents.forEach(document => {
      console.log(document.toString());
    });
  });

// Using promises (NodeJS only)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .advancedSearchPromise({})
  .then(res => {
    res.documents.forEach(document => {
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
dataCollection.advancedSearch(userFilter, new ResponseListener<KuzzleDocumentList>() {
  @Override
  public void onSuccess(KuzzleDocumentList result) {
    for (KuzzleDocument doc : result.getDocuments()) {
      // Get documents
    }
    doc.getTotal(); // return total of documents returned
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
{ "total": 3,
  "documents": [{object}, {object}, {object}]
}
```


<aside class="notice">
There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function
</aside>

Executes an advanced search on the data collection.

#### advancedSearch(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.


#### Callback response

Resolves to a `JSON object` containing:

- the total number of matched documents
- an `array` of `KuzzleDocument` objects

## count

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .count({}, function (err, res) {
    // ...
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('index', 'collection')
 .countPromise({})
 .then(res => {
   // ...
 });
```

```java
JSONObject filters = new JSONObject();
dataCollection.count(filters, new ResponseListener<Integer>() {
  @Override
  public void onSuccess(Integer object) {
    // Handle success
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
12
```

<aside class="notice">There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function</aside>

Returns the number of documents matching the provided set of filters.

#### count(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to the matched documents count as a ``integer``.

## create

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .create(function (error, result) {
    // callback called once the create operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('index', 'collection')
 .createPromise()
 .then(result => {
   // promise resolved once the create operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

```java
dataCollection.create(new ResponseListener<JSONObject>() {
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

> Callback response:

```json
{
  "status": 200,
  "error": null,
  "requestId": "cf1fc8b4-fd87-46c3-b0a2-3d9d2fb7d401",
  "controller": "write",
  "action": "createCollection",
  "collection": "newly created collection",
  "index": "index",
  "metadata": {},
  "state": "done",
  "scope": null,
  "result": {}
}
```

Create a new empty data collection, with no associated mapping.

#### create([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing the raw Kuzzle response.

## createDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .createDocument('foobar', {title: 'foo', content: 'bar'}, {updateIfExist: true}, function (err, res) {
    // callback called once the create action has been completed
    // => the result is a KuzzleDocument object
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('index', 'collection')
 .createDocumentPromise('foobar', {title: 'foo', content: 'bar'}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the create action has been completed
   // => the result is a KuzzleDocument object
 });
```

```java
KuzzleDocument myDocument = new KuzzleDocument(collection);
myDocument.setContent("title", "foo");
myDocument.setContent("content", "bar");
dataCollection.createDocument(myDocument, new ResponseListener<KuzzleDocument>() {
  @Override
  public void onSuccess(KuzzleDocument object) {
    // callback called once the create action has been completed
    // => the result is a KuzzleDocument object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

Create a new document in Kuzzle.

#### createDocument(KuzzleDocument, [options], [callback])

#### createDocument([id], content, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleDocument`` | object | KuzzleDocument object |
| ``id`` | string | Optional document identifier |
| ``content`` | JSON object | Content of the document to create |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |
| ``updateIfExist`` | boolean | If the same document already exists: throw an error if sets to ``false``. Update the existing document otherwise | ``false`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `KuzzleDocument` object containing the newly created document.

## dataMappingFactory

```js
var dataMapping = kuzzle
  .dataCollectionFactory('index', 'collection')
  .dataMappingFactory({someField: {type: 'string', index: 'analyzed'}}})
  .apply();
```

```java
KuzzleDataMapping dataMapping = kuzzle.dataCollectionFactory("index", "collection")
  .dataMappingFactory(new JSONObject().put("someFiled", new JSONObject().put("type", "string").put("index", "analyzed"))
  .apply();
```

Creates a new `KuzzleDataMapping` object, using its constructor.  

#### dataMappingFactory([mapping])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``mapping`` | JSON Object | Optional mapping |

#### Return value

Returns the newly created `KuzzleDataMapping` object.

## delete

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .delete(function (error, result) {
    // callback called once the delete operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('index', 'collection')
 .deletePromise()
 .then(result => {
   // promise resolved once the delete operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

```java
dataCollection.delete(new ResponseListener<String>() {
  @Override
  public void onSuccess(String object) {
    // callback called once the delete operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
{
  "status": 200,
  "error": null,
  "requestId": "05e27297-082a-430c-bd20-a94850abdff7",
  "controller": "admin",
  "action": "deleteCollection",
  "collection": "the deleted collection name",
  "index": "index containing the collection",
  "metadata": {},
  "state": "done",
  "scope": null,
  "result": {}
}
```

Delete this data collection and all documents in it.

#### delete([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing the raw Kuzzle response.

## deleteDocument

```js
// Deleting one document using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .deleteDocument('document unique ID', function (err, res) {
    // callback called once the delete action has been completed
  });

// Deleting one document using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .deleteDocumentPromise('document unique ID')
  .then(res => {
    // promises resolved once the delete action has been completed
  });

// Deleting multiple documents using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .deleteDocument({term: {title: 'foo'}}, function (err, res) {
    // callback called once the delete with query has been completed
  });

// Deleting multiple documents using promises (NodeJS)
 kuzzle
 .dataCollectionFactory('index', 'collection')
 .deleteDocumentPromise({title: 'foo', content: 'bar'}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the delete by query has been completed
 });
```

```java
// Deleting one document
dataCollection.deleteDocument("document unique ID", new ResponseListener<String>() {
  @Override
  public void onSuccess(String object) {
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
dataCollection.deleteDocument(termFilter, new ResponseListener<String>() {
  @Override
  public void onSuccess(String object) {
    // callback called once the delete with query has been completed
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
[ "AVCoeBkimsySTKTfa8AX" ]
```

<aside class="notice">
There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be deleted by the filtered version of this function
</aside>

Delete either a stored document, or all stored documents matching search filters.

#### deleteDocument(documentId, [options], [callback])

#### deleteDocument(filters, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``filters`` | JSON object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Optional callback |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to an `array` containing the deleted document IDs.

## documentFactory

```js
var document = kuzzle
  .dataCollectionFactory('index', 'collection')
  .documentFactory('id', {some: 'content'})
  .save();
```

```java
KuzzleDocument document = kuzzle.dataCollectionFactory("index", "collection")
  .documentFactory("id", new JSONObject().put("some", "content")
  .save();
```

Creates a new `KuzzleDocument` object, using its constructor.

#### documentFactory([id], [content])

| Arguments | Type | Description |
|-----------|------|-------------|
| ``id`` | string | Optional document unique ID |
| ``content`` | JSON object | Optional document content |

#### Return value

Returns the newly created `KuzzleDocument` object.

## fetchDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .fetchDocument('documentId', function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .fetchDocumentPromise('documentId')
  .then(result => {
    // result is a KuzzleDocument object
  });
```

```java
KuzzleDocument myDoc;
dataCollection.fetchDocument("documentId", new ResponseListener<KuzzleDocument>() {
  @Override
  public void onSuccess(KuzzleDocument object) {
    // result is a KuzzleDocument object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

Retrieves a single stored document using its unique document ID.

#### fetchDocument(documentId, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `KuzzleDocument` object.

## fetchAllDocuments

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .fetchAllDocuments(function (error, result) {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .fetchAllDocumentsPromise()
  .then(result => {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  });
```

```java
dataCollection.fetchAllDocuments(new ResponseListener<KuzzleDocumentList>() {
  @Override
  public void onSuccess(KuzzleDocumentList object) {
    // result is an object containing the total number of documents
    // and an array of KuzzleDocument objects
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

> Callback response:

```json
{ "total": 3,
  "documents": [{object}, {object}, {object}]
}
```

Retrieves all documents stored in this data collection.

#### fetchAllDocuments([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing:

- the total number of retrieved documents
- a `array` of `KuzzleDocument` objects


## getMapping

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .getMapping(function (error, result) {
    // result is a KuzzleDataMapping object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .getMappingPromise()
  .then(result => {
    // result is a KuzzleDataMapping object
  });
```

```java
dataCollection.getMapping(new ResponseListener<KuzzleDataMapping>() {
  @Override
  public void onSuccess(KuzzleDataMapping object) {
    // result is a KuzzleDataMapping object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```


Retrieves the current mapping of this collection.

#### getMapping([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Callback handling the response |


Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `KuzzleDataMapping` object.

## publishMessage

```js
kuzzle
  .dataCollectionFactory('index', 'collection')
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

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

## putMapping

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .putMapping({foo: {type: 'string', store: true}, bar: {type: 'date'}}, function (error, result) {
    // result is a KuzzleDataMapping object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .putMappingPromise({foo: {type: 'string', store: true}, bar: {type: 'date'}})
  .then(result => {
    // result is a KuzzleDataMapping object
  });
```

```java
dataCollection.putMapping(myKuzzleDataMapping, new ResponseListener<KuzzleDataMapping>() {
  @Override
  public void onSuccess(KuzzleDataMapping object) {
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

#### putMapping(mapping, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``mapping`` | JSON Object | Mapping to apply |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to an up-to-date `KuzzleDataMapping` object.

## replaceDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .replaceDocument('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
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

Replace an existing document with a new one.

#### replaceDocument(documentId, content, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``content`` | JSON Object | Content of the document to create |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to an updated `KuzzleDocument` object.

## roomFactory

```js
var room = kuzzle
  .dataCollectionFactory('index', 'collection')
  .roomFactory()
  .renew({terms: {field: ['some', 'new', 'filter']}}, function (err, res) {
    // handle notifications
  });
```

```java
KuzzleRoom room = kuzzle.dataCollectionFactory("index", "collection")
  .roomFactory()
  .renew(new JSONObject().put(new JSONObject().put("terms", new JSONObject("field").put(new JSONArray().put("some").put("filter"), new KuzzleResponseListener<KuzzleNotificationResponse>() {
    @Override
      public void onSuccess(KuzzleNotificationResponse object) {
        // handle notifications
      }

      @Override
      public void onError(JSONObject error) {
        // Handle notifications error
      }
  });
```

Creates a new `KuzzleRoom` object, using its constructor.  

#### roomFactory([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | object | Subscription configuration |

#### Return value

Returns the newly created `KuzzleRoom` object.

## setHeaders

```js
kuzzle
  .dataCollectionFactory('index', 'collection')
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

This is a helper function returning itself, allowing to easily set headers while chaining calls.

#### setHeaders(content)

#### setHeaders(content, replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``content`` | JSON Object | New content |
| ``replace`` | boolean | true: replace the current content with the provided data, false: merge it |

**Note:** by default, the ``replace`` argument is set to ``false``

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

## subscribe

```js
var room =
  kuzzle
    .dataCollectionFactory('index', 'collection')
    .subscribe({term: {title: 'foo'}}, function (error, result) {
      // called each time a new notification on this filter is received
    };
```

```java
JSONObject term = new JSONObject();
JSONObject title = new JSONObject();
title.put("title", "foo");
term.put("term", title);
dataCollection.subscribe(term, new ResponseListener<KuzzleNotificationResponse>() {
  @Override
  public void onSuccess(KuzzleNotificationResponse object) {
    // called each time a new notification on this filter is received
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

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

#### Return value

Returns a `KuzzleRoom` object.

## truncate

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .truncate(function (error, result) {
    // callback called once the truncate operation has completed
    // => the result is a JSON object containing the raw Kuzzle response
  });

// Using promises (NodeJS only)
kuzzle
 .dataCollectionFactory('index', 'collection')
 .truncatePromise()
 .then(result => {
   // promise resolved once the truncate operation has completed
   // => the result is a JSON object containing the raw Kuzzle response
 });
```

```java
dataCollection.truncate(new ResponseListener<JSONObject>() {
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

> Callback response:

```json
{
  "status": 200,
  "error": null,
  "requestId": "8fdc0efb-6fc7-427d-a3a1-fd8cf5eabc20",
  "controller": "admin",
  "action": "truncateCollection",
  "collection": "name of the truncated collection",
  "index": "name of the index containing the truncated collection",
  "metadata": {},
  "state": "done",
  "result": { "acknowledged": true }
}
```

Truncate the data collection, removing all stored documents but keeping all associated mappings.

This method is a lot faster than removing all documents using a query.

#### truncate([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to a `JSON object` containing the raw Kuzzle response.

## updateDocument

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .dataCollectionFactory('index', 'collection')
  .updateDocument('documentId', {title: 'foo', content: 'bar'}, function (error, result) {
    // result is a KuzzleDocument object
  });

// Using promises (NodeJS)
kuzzle
  .dataCollectionFactory('index', 'collection')
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
dataCollection.updateDocument("documentId", doc, new ResponseListener<KuzzleDocument>() {
  @Override
  public void onSuccess(KuzzleDocument result) {
    // result is a KuzzleDocument object
  }

  @Override
  public void onError(JSONObject error) {
    // Handle error
  }
});
```

Update parts of a document, by replacing some fields or adding new ones.  
Note that you cannot remove fields this way: missing fields will simply be left unchanged.

#### updateDocument(documentId, content, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``documentId`` | string | Unique document identifier |
| ``content`` | JSON object | Content of the document to create |
| ``options`` | JSON object | Optional parameters |
| ``callback`` | function | Optional callback |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Return value

Returns the `KuzzleDataCollection` object to allow chaining.

#### Callback response

Resolves to an up-to-date `KuzzleDocument` object.
