# KuzzleDocument

Kuzzle handles documents, either as realtime messages or as stored documents. KuzzleDocument is the object representation of one of these documents.

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleDocument objects are returned by various KuzzleDataCollection methods.
 */
```


#### KuzzleDocument(KuzzleDataCollection)

#### KuzzleDocument(KuzzleDataCollection, content)

#### KuzzleDocument(KuzzleDataCollection, documentId)

#### KuzzleDocument(KuzzleDataCollection, documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDataCollection | object | An instanciated KuzzleDataCollection object |
| content | JSON Object | Initializes this document with the provided content |
| documentId | string | ID of an existing document. |

**Note:**  providing a documentID to the constructor will automatically call ``refresh``, unless a ``content`` is also provided

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| collection | string | The data collection associated to this document | get |
| content | JSON Object | The content of the document | get/set |
| createdTimestamp | timestamp | The creation datetime of this document | get |
| headers | JSON Object | Common headers for all sent documents. | get/set |
| id | string | Unique document identifier | get |
| modifiedTimestamp | timestamp | The last modification datetime of this document | get |

**Notes:**  

* setting a new value to the ``content`` property is equivalent to calling ``setContent(data, false)``
* the ``headers`` property is inherited from the provided ``KuzzleDataCollection`` object and can be overrided

## delete ![public](./images/public.png)

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

> Returns a JSON object containing the result of the request

```json
{ "_id": "document Id",
  "found": true,
  "_version": 1,
  "requestId": "unique request identifier",
  "controller": "write",
  "action": "delete",
  "collection": "collection",
  "_source": { "deletedDocument": "content"} }
```

Deletes this document in Kuzzle.

## publish ![public](./images/public.png)

```js
document.publish();
```

Publishes the content of this document as a realtime message.

## refresh ![public](./images/public.png)

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

> Returns the refreshed KuzzleDocument object

Replaces the current content with the last version of this document stored in Kuzzle.

## save ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
document.save(true, function (error, result) {
  // called once the save action has been completed
});

// Using promises (NodeJS)
document.savePromise(true).then(result => {
  // called once the save action has been completed
});
```

> Return the updated version of this KuzzleDocument object

Saves this document into Kuzzle.

If this is a new document, this function will create it in Kuzzle. Otherwise, you can specify whether you want to merge this document with the one stored in Kuzzle, or if you want to replace it.


#### save()

#### save(replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| replace | boolean | true: replace the document, false: merge it |

**Notes:**

* the ``replace`` argument is ignored if the document is to be created into Kuzzle
* by default, ``replace`` is set to false


## setContent ![public](./images/public.png)

```js
document.setContent({newContent: 'someValue'}, true);
```

<aside class="notice">
Changes made by this function won't be applied until the <code>save</code> method is called
</aside>

Replaces the current content with new data.

#### setContent(data)

#### setContent(data, replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| data | JSON Object | New content |
| replace | boolean | true: replace the current content with the provided data, false: merge it |

**Note:** by default, the ``replace`` argument is set to ``false``

## subscribe ![public](./images/public.png)

```js
var room = document.subscribe(function (error, notification) {
  // called each time a change occurs on this document
});
```

> Return a KuzzleRoom object

Listens to changes occuring on this document.  
Throws an error if this document has not yet been created in Kuzzle.

#### subscribe(cb)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| cb | function | Callback that will be called each time a change has been detected on this document |
