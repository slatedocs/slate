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

## subscribe ![public](./images/public.png)

Listens to events concerning documents similar to this one.

**Returns:** a KuzzleRoom object

## update ![public](./images/public.png)

Updates the current content with new data

#### update(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| data | JSON Object | Updated content |
