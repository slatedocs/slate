# KuzzleDocument

Kuzzle handles documents, either as realtime messages or as stored documents. KuzzleDocument is the object representation of one of these documents.

## Constructors

### KuzzleDocument(KuzzleDataCollection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDataCollection | object | An instanciated KuzzleDataCollection object |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| content | JSON Object | The actual content of the document | get/set |
| createdTimestamp | timestamp | The creation datetime of this document | get |
| headers | JSON Object | (inherited) The mandatory properties of this document | get/set |
| id | string | Unique document identifier | get |
| modifiedTimestamp | timestamp | The last modification datetime of this document | get |

## delete ![public](./images/public.png)

Deletes this document in Kuzzle.

## refresh ![public](./images/public.png)

Replaces the current content with the last version of this document stored in Kuzzle.

## save ![public](./images/public.png)

Saves this document in Kuzzle. If an ID is specified, this function will update the document with the corresponding ID. Otherwise, a new document is created **and stored**.

## send ![public](./images/public.png)

Sends the content of this document as a realtime message.

## set ![public](./images/public.png)

<aside class="notice">Changes made by this function won't be applied until you call the <code>save</code> method</aside>

Replaces the current content with new data.

#### set(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| data | JSON Object | New content |

## subscribe ![public](./images/public.png)

Listens to events concerning this document. Has no effect if the document doesn't have an ID (*i.e. if the document hasn't yet been created as a persisted document*).

**Returns:** a KuzzleRoom object
