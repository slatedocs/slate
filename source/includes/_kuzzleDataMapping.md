# KuzzleDataMapping

When creating a new data collection in the persistent data storage layer, Kuzzle uses a default mapping.
It means that, by default, you won't be able to exploit the full capabilities of our persistent data storage layer (currently handled by [ElasticSearch](https://www.elastic.co/products/elasticsearch)), and your searches may suffer from below-average performances, depending on the amount of data you stored in a collection and the complexity of your database.

The KuzzleDataMapping object allow to get the current mapping of a data collection and to modify it if needed.

## Constructors

### KuzzleDataMapping(KuzzleDataCollection)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| KuzzleDataCollection | object | An instanciated KuzzleDataCollection object |

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| mapping | object | Easy-to-understand list of mappings per field | get |

## apply ![public](./images/public.png)

Applies the new mapping to the data collection.

## refresh ![public](./images/public.png)

<aside class="warning">
Calling this function will discard any uncommited changes. You can commit changes by calling the ``apply`` function
</aside>

Replaces the current content with the mapping stored in Kuzzle



## remove ![public](./images/public.png)

<aside class="notice">Changes made by this function won't be applied until you call the <code>apply</code> method</aside>

Removes a field mapping.

#### remove(field)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| field | string | Name of the field from which the mapping is to be removed |

## set ![public](./images/public.png)

<aside class="notice">Changes made by this function won't be applied until you call the <code>apply</code> method</aside>

Adds or updates a field mapping.

#### set(field, mapping)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| field | string | Name of the field from which the mapping is to be removed |
| mapping | JSON Object | Mapping for this field, following the [Elasticsearch Mapping format](https://www.elastic.co/guide/en/elasticsearch/reference/1.3/mapping.html)
