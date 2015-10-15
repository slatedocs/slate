# KuzzleDataCollection

In Kuzzle, you manipulate documents and subscriptions, both related to data collections.

A data collection is a set of data managed by Kuzzle. It acts like a data table for persistent documents, or like a room for pub/sub messages.


## Constructors

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

<aside class="notice">There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function</aside>

Executes an advanced search on the data collection.

#### advancedSearch(filters)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |

## count ![public](./images/public.png)

<aside class="notice">There is a small delay between documents creation and their existence in our advanced search layer, usually a couple of seconds. That means that a document that was just been created won't be returned by this function</aside>

Returns the number of documents matching the provided set of filters.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| filters | JSON Object | Filters in [ElasticSearch Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/query-dsl.html) format |

#### count(filters)

**Returns:** the number of matched documents

## create ![public](./images/public.png)

Store a document or publish a realtime message.

#### create(KuzzleDocument)

#### create(KuzzleDocument, options)

#### create(content)

#### create(content, options)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDocument | object | KuzzleDocument object |
| content | JSON Object | Content of the document to create |
| Options | object | Configuration for this document creation |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| persist | boolean | Indicates if this is a realtime message or a persistent document | false |
| updateIfExist | boolean | If the same document already exists: throw an error if sets to ``false``. Update the existing document otherwise. | false |

## delete ![public](./images/public.png)

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

Alias to the ``get`` method.

## fetchAll ![public](./images/public.png)

Alias to the ``getAll`` method.

## get ![public](./images/public.png)

Retrieve a single stored document using its unique document ID.

#### get(documentId)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |

**Returns:** a KuzzleDocument object containing the retrieved document

## getAll ![public](./images/public.png)

Retrieves all documents stored in this data collection.

**Returns:** a KuzzleDocumentSet object

## getMapping ![public](./images/public.png)

Instantiates a KuzzleDataMapping object containing the current mapping of this collection.

**Returns:** a KuzzleDataMapping object

## replace ![public](./images/public.png)

Replace an existing document with a new one.

#### replace(documentId, KuzzleDocument)

#### replace(documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |
| KuzzleDocument | object | KuzzleDocument object |
| content | JSON Object | Content of the document to create |

## subscribe ![public](./images/public.png)

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
| options | object | Subscription configuration |

**Returns:** a KuzzleRoom object

## update ![public](./images/public.png)

Update parts of a document

#### update(documentId, KuzzleDocument)

#### update(documentId, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| documentId | string | Unique document identifier |
| KuzzleDocument | object | KuzzleDocument containing the updated content |
| content | JSON Object | Content of the document to create |
