# KuzzleDataMapping

When creating a new data collection in the persistent data storage layer, Kuzzle uses a default mapping.
It means that, by default, you won't be able to exploit the full capabilities of our persistent data storage layer (currently handled by [ElasticSearch](https://www.elastic.co/products/elasticsearch)), and your searches may suffer from below-average performances, depending on the amount of data you stored in a collection and the complexity of your database.

The KuzzleDataMapping object allow to get the current mapping of a data collection and to modify it if needed.

<aside class="notice">
Once a field mapping has been set, it cannot be removed without reconstructing the data collection.
</aside>

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleDataMapping objects are returned by the method
 KuzzleDataCollection.getMapping
 */
```

#### KuzzleDataMapping(KuzzleDataCollection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDataCollection | object | An instanciated KuzzleDataCollection object |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| headers | JSON Object | Common headers for all sent documents. | get/set |
| mapping | object | Easy-to-understand list of mappings per field | get |

**Note:** the ``headers`` property is inherited from the provided ``KuzzleDataCollection`` object and can be overrided

## apply ![public](./images/public.png)

```js
// Using callbacks (NodeJS or Web Browser)
dataMapping.apply(function (error, result) {
  // called once the mapping action has been completed
});

// Using promises (NodeJS)
dataMapping.applyPromise(function (error, result) {
  // resolved once the mapping action has been completed
});
```

> Return the updated KuzzleDataMapping object

Applies the new mapping to the data collection.

## refresh ![public](./images/public.png)

```js
// Using callbacks (NodeJS & Web Browser)
dataMapping.refresh(function (error, result) {
  // called once the mapping has been retrieved from Kuzzle
});

// Using promises (NodeJS)
dataMapping.refreshPromise().then(result => {
  // resolved once the mapping has been retrieved from Kuzzle
});
```

> Return the updated KuzzleDataMapping object

<aside class="warning">
Calling this function will discard any uncommited changes. You can commit changes by calling the <code>apply</code> function
</aside>

Replaces the current content with the mapping stored in Kuzzle

## set ![public](./images/public.png)

```js
dataMapping.set('field', {type: 'string', index: 'analyzed', null_value: ''});
```

> Return the updated KuzzleDataMapping object

<aside class="notice">Changes made by this function won't be applied until you call the <code>apply</code> method</aside>

Adds or updates a field mapping.

#### set(field, mapping)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| field | string | Name of the field from which the mapping is to be added or updated |
| mapping | JSON Object | Mapping for this field, following the [Elasticsearch Mapping format](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/mapping.html)
