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
JSONObject filter = new JSONObject()
  .put("filter", new JSONObject()
    .put("and", new JSONArray()
      .put(
        new JSONObject().put("terms",
          new JSONObject().put("status",
            new JSONArray()
              .put("idle")
              .put("wantToHire")
              .put("toHire")
              .put("riding")
          )
        )
      )
      .put(
        new JSONObject().put("terms",
          new JSONObject()
            .put("type", new JSONArray().put("cab"))
        )
      )
      .put(
        new JSONObject().put("geo_distance",
          new JSONObject()
            .put("distance", "10km")
            .put("pos",
              new JSONObject()
                .put("lat", "48.8566140")
                .put("lon", "2.352222")
            )
        )
      )
    )
  );

kuzzle
  .dataCollectionFactory("index", "collection")
  .advancedSearch(userFilter, new KuzzleResponseListener<KuzzleDocumentList>() {
    @Override
    public void onSuccess(KuzzleDocumentList result) {
      for (KuzzleDocument doc : result.getDocuments()) {
        // Get documents
      }

      result.getTotal(); // return total of documents returned
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
| ``filters`` | JSON object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.7/query-dsl.html) format |
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

kuzzle
  .dataCollectionFactory("index", "collection")
  .count(filters, new KuzzleResponseListener<Integer>() {
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
| ``filters`` | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.7/query-dsl.html) format |
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
kuzzle
  .dataCollectionFactory("index", "collection")
  .create(new KuzzleResponseListener<JSONObject>() {
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

kuzzle
  .dataCollectionFactory("index", "collection")
  .createDocument(myDocument, new KuzzleResponseListener<KuzzleDocument>() {
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
KuzzleDataMapping dataMapping = kuzzle
  .dataCollectionFactory("index", "collection")
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

<aside class="warning">
Since the 2.0 version, ElasticSearch <a href="https://www.elastic.co/guide/en/elasticsearch/reference/current/breaking_20_mapping_changes.html#_types_may_no_longer_be_deleted">removed the ability to delete a Type</a>, which is used internally by Kuzzle to store its collections.<br>
<br>
As such, it is not possible to delete a collection from Kuzzle either. You can still delete all the documents that belong to a collection but if you need to delete the collection mapping, you will need to use a new index.
</aside>

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
  .deleteDocument({filter: {term: {title: 'foo'}}}, function (err, res) {
    // callback called once the delete with query has been completed
  });

// Deleting multiple documents using promises (NodeJS)
 kuzzle
 .dataCollectionFactory('index', 'collection')
 .deleteDocumentPromise({filter: {title: 'foo', content: 'bar'}}, {updateIfExist: true})
 .then(res => {
   // promise resolved once the delete by query has been completed
 });
```

```java
// Deleting one document
kuzzle
  .dataCollectionFactory("index", "collection")
  .deleteDocument("document unique ID", new KuzzleResponseListener<String>() {
    @Override
    public void onSuccess(String object) {
      // The resulting string contains the deleted document ID
    }

    @Override
    public void onError(JSONObject error) {
      // Handle error
    }
  });

// Deleting multiple documents
JSONObject termFilter = new JSONObject()
  .put("filter", new JSONObject()
  .put("term",
    new JSONObject().put("title", "foo")
  ));

kuzzle
  .dataCollectionFactory("index", "collection")
  .deleteDocument(termFilter, new KuzzleResponseListener<String[]>() {
    @Override
    public void onSuccess(String[] object) {
      // The resulting object contains the list of deleted document IDs
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
| ``filters`` | JSON object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.7/query-dsl.html) format |
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
KuzzleDocument document = kuzzle
  .dataCollectionFactory("index", "collection")
  .documentFactory("id", new JSONObject().put("some", "content"))
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
kuzzle
  .dataCollectionFactory("index", "collection")
  .fetchDocument("documentId", new KuzzleResponseListener<KuzzleDocument>() {
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
kuzzle
  .dataCollectionFactory("index", "collection")
  .fetchAllDocuments(new KuzzleResponseListener<KuzzleDocumentList>() {
    @Override
    public void onSuccess(KuzzleDocumentList object) {
      // result is an object containing the total number of documents
      // and an array of KuzzleDocument objects
      for (KuzzleDocument doc : result.getDocuments()) {
        // Get documents
      }

      result.getTotal(); // return total of documents returned
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

Resolves to an object containing:

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
kuzzle
  .dataCollectionFactory("index", "collection")
  .getMapping(new KuzzleResponseListener<KuzzleDataMapping>() {
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
JSONObject message = new JSONObject().put("some", "content");
JSONObject metadata = new JSONObject().put("metadata", "are volatile information");
KuzzleOptions opts = new KuzzleOptions().setMetadata(metadata);

kuzzle
  .dataCollectionFactory("index", "collection")
  .publish(message, opts);
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
JSONObject newContent = new JSONObject("new", "document content");

kuzzle
  .dataCollectionFactory("index", "collection")
  .replaceDocument("documentId", newContent, new KuzzleResponseListener<KuzzleDocument>() {
    @Override
    public void onSuccess(KuzzleDocument document) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
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
JSONObject filters = new JSONObject()
  .put("terms",
    new JSONObject("field")
      .put(new JSONArray()
        .put("some")
        .put("filter")
      )
  );    

KuzzleRoom room = kuzzle.dataCollectionFactory("index", "collection")
  .roomFactory()
  .renew(filters, new KuzzleResponseListener<KuzzleNotificationResponse>() {
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
JSONObject headers = new JSONObject()
  .put("someContent", "someValue")
  .put("metadata", new JSONObject()
    .put("someMetaData", new JSONArray()
      .put("with")
      .put("some")
      .put("values")
    )
  );

kuzzle
  .dataCollectionFactory("index", "collection")
  .setHeaders(content, true);
```

This is a helper function returning itself, allowing to easily set headers while chaining calls.

#### setHeaders(content, [replace])

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

      // check the KuzzleRoom/Notifications section of this documentation
      // to get notification examples
    });
```

```java
JSONObject filter = new JSONObject()
  .put("and", new JSONArray()
    .put(
      new JSONObject().put("terms",
        new JSONObject().put("status",
          new JSONArray()
            .put("idle")
            .put("wantToHire")
            .put("toHire")
            .put("riding")
        )
      )
    )
    .put(
      new JSONObject().put("terms",
        new JSONObject()
          .put("type", new JSONArray().put("cab"))
      )
    )
    .put(
      new JSONObject().put("geo_distance",
        new JSONObject()
          .put("distance", "10km")
          .put("pos",
            new JSONObject()
              .put("lat", "48.8566140")
              .put("lon", "2.352222")
          )
      )
    )
  );

kuzzle
  .dataCollectionFactory("index", "collection")
  .subscribe(filter, new KuzzleResponseListener<KuzzleNotificationResponse>() {
    @Override
    public void onSuccess(KuzzleNotificationResponse object) {
      // called each time a new notification on this filter is received

      // check the KuzzleRoom/Notifications section of this documentation
      // to get notification examples
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
kuzzle
  .dataCollectionFactory("index", "collection")
  .truncate(new KuzzleResponseListener<JSONObject>() {
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
JSONObject newTitle = new JSONObject().put("title", "a shiny new title");

kuzzle
  .dataCollectionFactory("index", "collection")
  .updateDocument("documentId", newTitle, new KuzzleResponseListener<KuzzleDocument>() {
    @Override
    public void onSuccess(KuzzleDocument result) {
      // result is an updated KuzzleDocument object
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
