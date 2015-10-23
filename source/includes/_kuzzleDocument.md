# KuzzleDocument

Kuzzle handles documents, either as realtime messages or as stored documents. KuzzleDocument is the object representation of one of these documents.

## Constructors

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

Deletes this document in Kuzzle.

## publish ![public](./images/public.png)

Publishes the content of this document as a realtime message.

## refresh ![public](./images/public.png)

Replaces the current content with the last version of this document stored in Kuzzle.

## save ![public](./images/public.png)

Saves this document into Kuzzle.

If this is a new document, this function will create it in Kuzzle. Otherwise, you can specify whether you want to merge this document with the one stored in Kuzzle, or if you want to replace it.

#### save(replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| replace | boolean | true: replace the document, false: merge it |

**Note:** the ``replace`` argument is ignored if the document is to be created into Kuzzle


## setContent ![public](./images/public.png)

<aside class="notice">Changes made by this function won't be applied until the <code>save</code> method is called</aside>

Replaces the current content with new data.

#### setContent(data)

#### setContent(data, replace)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| data | JSON Object | New content |
| replace | boolean | (default: false) If true, replace the current content with the provided data |

## subscribe ![public](./images/public.png)

Listens to events concerning this document.  
Throws an error if this document has not yet been created in Kuzzle.

#### subscribe(cb)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| cb | function | Callback that will be called each time a change has been detected on this document |

**Returns:** a KuzzleRoom object
