---
title: CB Core Search API

language_tabs:
  - json: JSON
  - csharp: C#

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the CB Core Search API documentation. This is the API used for generic adding, searching, and deleting of documents.


The first thing you will have to find out is the correct API endpoint to use.

* **Matrix Production:** For projects targeting Matrix resources in production, use [https://searchapi.careerbuilder.com/searchapi/](https://searchapi.careerbuilder.com/searchapi/).
* **Matrix Test:** For projects targeting Matrix resources in production, use [https://searchapitest.careerbuilder.com/searchapi/](https://searchapitest.careerbuilder.com/searchapi/).

# Authentication

The CB Core Search API uses either assigned developer keys or OAuth tokens depending on where your application lives and which resources you are targeting. For more information on how to generate OAuth tokens, visit [this link](http://somelink.com/oauthstuff). To request a developer key, visit [this link](http://developerkey.com/coresearch).

The API expects authorization credentials to be included in all API requests to the server in a header that looks like the following:

`Developer_Key: RunMuhSearch!`

<aside class="notice">
You must replace <code>RunMuhSearch!</code> with your personal API credentials.
</aside>

# Making Requests

## Feeding a Document

```json
{
  "documentid": "TJHKTOGBOJ",
  "priority": 30,
  "schema": {
    "name": "SearchAPITest-Sportsball",
    "pool": "general",
    "languages": [
      "Other"
    ],
    "fields": [
      {
        "name": "jerseynumber",
        "type": "Integer",
        "searchable": true,
        "retrievable": true,
        "sortable": true,
        "normalizeLength": false
      },
      {
        "name": "player-name",
        "type": "String",
        "searchable": true,
        "retrievable": true,
        "sortable": true,
        "normalizeLength": false,
        "semanticSearchFeatures": []
      }
    ],
    "hash": "",
    "semanticSearch": {
      "dictionaries": []
    }
  },
  "fields": [
    {
      "name": "jerseynumber",
      "value": 49
    },
    {
      "name": "player-name",
      "value": "Scarlett Garcia"
    }
  ]
}
```

```csharp
using CBSearch.CBSolr;
using CBSearch.CBSolr.Endpoints;
using CBSearch.CBSolr.DataTypes.Document;
using CBSearch.CBSolr.DataTypes.Schema;

var document = new Document.DocumentBuilder(
		new Schema.SchemaBuilder("SearchAPITest-Sportsball", "general")
			.AddSchemaField(new IntegerField.IntegerFieldBuilder("jerseynumber")
                .MakeSearchable()
                .MakeRetrievable()
                .Build())
            .AddSchemaField(new StringField.StringFieldBuilder("player-name")
                .MakeSearchable()
                .MakeRetrievable()
                .Build())
            .Build(),
        "TJHKTOGBOJ")
    .AddField("jerseynumber", 49)
    .AddField("player-name", "Scarlett Garcia")
    .Build();

var endpoint = EndpointFactory.GetEndPoint(SearchEndPoints.MatrixTest, "RunMuhSearch!");
var resultContainer = SearchEngine.AddDocument(endpoint, document);
```

This endpoint feeds a document to the search engine.

### HTTP Request

`POST /putdocument`

`Version: 2.0`

`Developer_Key: RunMuhSearch!`

`Content-Type: application/json`

### Request Payload

The document you wish to feed to the search engine.

| Attribute  | Description                                                                                                                                                                                                                   |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| documentid | Unique identifier for this particular document. You will use this identifier when deleting documents. Typically, this matches the primary key used in your source database.                                                   |
| priority   | Optional int for controlling indexing priority. Allows indexing triggered by customer actions to be prioritized over batch processes. Can be omitted, will default to 30.                                                     |
| schema     | A schema object (described [here](#schema)) that defines the fields used within this document.                                                                                                                                           |
| fields     | An array of name/value pairs that set a value for fields within the schema. You do not need to provide values for every field defined in the schema, omitted entries will simply not be indexed for that particular document. |

<aside class="success">
Remember — allow 15 minutes for your document to make it to the engine before searching for it!
</aside>

## Deleting a Document

```json
{
  "documentid": "TJHKTOGBOJ",
  "priority": 30,
  "pool": "general"
}
```
```csharp
using CBSearch.CBSolr;
using CBSearch.CBSolr.Endpoints;
using CBSearch.CBSolr.DataTypes.Request;

var delete = new DeleteDocument("TJHKTOGBOJ", "general");
var endpoint = EndpointFactory.GetEndPoint(SearchEndPoints.MatrixTest, "RunMuhSearch!");

var resultContainer = SearchEngine.DeleteDocument(endpoint, delete);
```

This endpoint deletes a document from the search engine.

### HTTP Request

`POST /deletedocument`

`Version: 2.0`

`Developer_Key: RunMuhSearch!`

`Content-Type: application/json`

### Request Payload

This describes the necessary information to delete a document from the search engine.

| Attribute | Description |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| documentid | The ID of the document you wish to delete |
| priority | Optional int for controlling deleting priority. Allows deleting triggered by customer actions to be prioritized over batch processes. Can be omitted, will default to 30. |
| pool | The pool in which the document to be deleted was indexed. |

# Request Components

## Schema

```json
{
  "name": "SearchAPITest-Sportsball",
  "pool": "general",
  "languages": [
    "Other"
  ],
  "fields": [
    {
      "name": "jerseynumber",
      "type": "Integer",
      "searchable": true,
      "retrievable": true,
      "sortable": true,
      "normalizeLength": false
    },
    {
      "name": "player-name",
      "type": "String",
      "searchable": true,
      "retrievable": true,
      "sortable": true,
      "normalizeLength": false,
      "semanticSearchFeatures": []
    }
  ],
  "hash": "",
  "semanticSearch": {
    "dictionaries": []
  }
}
```

```csharp
using CBSearch.CBSolr.DataTypes.Schema;

var schema = new Schema.SchemaBuilder("SearchAPITest-Sportsball", "general")
		.AddSchemaField(new IntegerField.IntegerFieldBuilder("jerseynumber")
            .MakeSearchable()
            .MakeRetrievable()
            .Build())
        .AddSchemaField(new StringField.StringFieldBuilder("player-name")
            .MakeSearchable()
            .MakeRetrievable()
            .Build())
        .Build();
```
A schema defines the fields used within a document.

### Attributes

| Attribute      | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name           | The name of your schema is essentially just another field. You can perform query operations against it and retrieve it from Solr. You may have any number of schema names in the same index. The same schema name may be used to represent a multiple fields list configurations. There is no requirement or validation to ensure that a schema of a particular name has the same fields as it did the last time we saw it. This allows you to add, remove, and modify fields without having to change the name.                              |
| pool           | This field allows documents and searches to be routed to the correct locations.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| languages      | The search API provides language processing on the following languages; English, Chinese, French, German, Spanish, Dutch, Greek, Swedish, Norwegian, Italian, Finnish, Danish, Romanian, Polish, Japanese, Korean, Portuguese. If you wish for Solr to be able to recognize language specific rules and lemmatization then you will need to include the language(s) in this property. Only FreeTextFields will benefit from this feature.                                                                                                     |
| fields         | Fields is an array of schema fields. Schema fields detail how data should be stored and how it will be queried.                                                                                                                                                                                                                                                                                                                                                                                                                               |
| hash           | Currently not implemented and can be left off of your request or left blank.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| semanticSearch | Currently, the only SemanticSearch feature available through our API is the dictionary feature. Dictionaries are a straightforward means of enhancing queries by adding words to a query. For example, associating the shorthand "mgr" with "manager" would result in queries for "manager" turning into "manager OR mgr", thus boosting the quantity of results returned. If you wish to use this feature you will need to contact CoreSearchDevelopment in order to set up your own dictionary or get the names of dictionaries that exist. |

## SchemaField
```json
{
  "name": "player-name",
  "type": "String",
  "searchable": true,
  "retrievable": true,
  "sortable": true,
  "normalizeLength": false,
  "semanticSearchFeatures": []
}
```
```csharp
using CBSearch.CBSolr.DataTypes.Schema;

var schemaField = new StringField.StringFieldBuilder("player-name")
        .MakeSearchable()
        .MakeRetrievable()
        .Build());
```
A SchemaField details how data should be stored and how it will be queried.

### Attributes

| Attribute | Supported Field Types | Description |
|------------------------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name | All | A unique identifier for the field |
| type | All | The data type that field will be stored as. We currently support the following types: Boolean, datetime, delimitedtext, double, freetext, integer, latlon, point, spacial, and string. |
| searchable | All | These fields will be part of the index and therefore can be searched against. |
| retrievable | All | Fields that need to be returned in a search. |
| sortable | All | Marks the field as able to be sorted on. |
| normalizeLength | All | Fields with this value set to true will apply a larger score to documents that have less information in the field. For example, if a field contained a paragraph for some documents and an entire book for another, finding your search term in one of the documents with only a paragraph in the field would score higher than finding the term in an entire book. |
| semanticSearchFeatures | StringField | A list of names of the semantic search features applicable to this field. |

### SchemaField Types

* Boolean
* Custom
* DateTime
* DelimitedText
* Double
* FreeText
* Integer
* LatLon
* Point
* Spacial
* String
