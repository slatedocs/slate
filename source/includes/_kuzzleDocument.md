# KuzzleDocument

Kuzzle handles documents, either as realtime messages or as stored documents. KuzzleDocument is the object representation of one of these documents.

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleDocument objects are returned by various KuzzleDataCollection methods.

 You may also use the KuzzleDataCollection.documentFactory() method:
 */
var document = kuzzle.dataCollectionFactory('collection').documentFactory('id');

var document = kuzzle
  .dataCollectionFactory('collection')
  .documentFactory({content: 'some content'});

var document = kuzzle
  .dataCollectionFactory('collection')
  .documentFactory('id', {content: 'some content'});
```

```java
KuzzleDocument document = new KuzzleDocument(collection);

KuzzleDocument document = new KuzzleDocument(collection, "id");

JSONObject content = new JSONObject();
content.put("content", "some content");
KuzzleDocument document = new KuzzleDocument(collection, content);

KuzzleDocument document = new KuzzleDocument(collection, "id", content);
```

#### KuzzleDocument(KuzzleDataCollection)

#### KuzzleDocument(KuzzleDataCollection, content)

#### KuzzleDocument(KuzzleDataCollection, documentId)

#### KuzzleDocument(KuzzleDataCollection, documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleDataCollection`` | object | An instanciated KuzzleDataCollection object |
| ``content`` | JSON Object | Initializes this document with the provided content |
| ``documentId`` | string | ID of an existing document. |

**Note:**  providing a documentID to the constructor will automatically call ``refresh``, unless a ``content`` is also provided

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| ``collection`` | string | The data collection associated to this document | get |
| ``content`` | JSON Object | The content of the document | get/set |
| ``headers`` | JSON Object | Common headers for all sent documents. | get/set |
| ``id`` | string | Unique document identifier | get/set |
| ``version`` | integer | Current document version | get |

**Notes:**  

* setting a new value to the ``content`` property is equivalent to calling ``setContent(data, false)``
* setting a new value to the ``id`` property will force this value for this document
* the ``headers`` property is inherited from the provided ``KuzzleDataCollection`` object and can be overrided

## delete

```js
// Using callbacks (NodeJS or Web Browser)
document.delete(function (error, result) {
  // called once the delete action has been completed
});

// Using promises (NodeJS)
document.deletePromise().then(result => {
  // called once the delete action has been completed
});
```

```java
document.delete(new ResponseListener() {
    @Override
    public void onSuccess(JSONObject object) {
      // called once the delete action has been completed
    }

    @Override
    public void onError(JSONObject error) {
      // Handle error
    }
});
```

> Return this KuzzleDocument object

Deletes this document in Kuzzle.

#### delete([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## publish

```js
document.publish();
```

```java
document.publish();
```

Publishes the content of this document as a realtime message.

#### publish([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## refresh

```js
// Using callbacks (NodeJS or Web Browser)
document.refresh(function (error, result) {
  // called once the refresh action has been completed
});

// Using promises (NodeJS)
document.refreshPromise().then(result => {
  // called once the refresh action has been completed
});
```

```java
document.refresh(new ResponseListener() {
    @Override
    public void onSuccess(JSONObject object) {
      // called once the refresh action has been completed
    }

    @Override
    public void onError(JSONObject error) {
      // Handle error
    }
});
```

> Returns the refreshed KuzzleDocument object

Replaces the current content with the last version of this document stored in Kuzzle.

#### refresh([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## save

```js
// Using callbacks (NodeJS or Web Browser)
document.save(function (error, result) {
  // called once the save action has been completed
});

// Using promises (NodeJS)
document.savePromise().then(result => {
  // called once the save action has been completed
});
```

```java
document.save(new ResponseListener() {
    @Override
    public void onSuccess(JSONObject object) {
      // called once the save action has been completed
    }

    @Override
    public void onError(JSONObject error) {
      // Handle error
    }
});
```

> Return the updated version of this KuzzleDocument object

Saves this document into Kuzzle.

If this is a new document, this function will create it in Kuzzle and the ``id`` property will be made available.  
Otherwise, this method will replace the latest version of this document in Kuzzle by the current content of this object.

#### save([options])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``metadata`` | JSON Object | Additional information passed to notifications to other users | ``null`` |
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


## setContent

```js
document.setContent({newContent: 'someValue'}, true);
```

```java
JSONObject content = new JSONObject();
content.put("content", "some content");
document.setContent(content, true);

document.setContent("content", "some content");

document.setContent(content);
```

<aside class="notice">
Changes made by this function won't be applied until the <code>save</code> method is called
</aside>

Replaces the current content with new data.

#### setContent(data)

#### setContent(data, replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | New content |
| ``replace`` | boolean | true: replace the current content with the provided data, false: merge it |

**Note:** by default, the ``replace`` argument is set to ``false``

## setHeaders

```js
document.setHeaders({someContent: 'someValue'}, true);
```

```java
JSONObject headers = new JSONObject();
headers.put("someContent", "someValue");
document.setHeaders(headers, true);
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
var room = document.subscribe(function (error, notification) {
  // called each time a change occurs on this document
});

var room = document.subscribe(
  {subscribeToSelf: true, metadata: { myId: 'someId'}},
  function (error, notification) {
    // called each time a change occurs on this document
  });
```

```java
KuzzleRoom room = document.subscribe(new ResponseListener() {
    @Override
    public void onSuccess(JSONObject object) {
      // called each time a change occurs on this document
    }

    @Override
    public void onError(JSONObject error) {
      // Handle error
    }
});
```

> Return a KuzzleRoom object

Listens to changes occuring on this document.  
Throws an error if this document has not yet been created in Kuzzle.

#### subscribe(options, cb)

#### subscribe(cb)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | object | Subscription configuration. Passed to the KuzzleRoom constructor. |
| ``cb`` | function | Callback that will be called each time a change has been detected on this document |
