---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - CURL
  - PHP
  - Node.js
  - JSON Response

toc_footers:
  # - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>
  - <a href ='https://docparser.com/'>Discover Parser</a>
  - <a href ='https://app.docparser.com/account/login/?red='>Visit Docparser App</a>
  - <a href='https://docparser.com/legal/terms-of-service'>Terms of Service</a>

includes:
  - errors

search: true

code_clipboard: true
---
# Get Started

## Introduction

Welcome to the API of Docparser! You can use this API to

list Document Parsers created with Docparser
load documents to a Document Parser
obtain your parsed data
The Docparser API is organized around REST principles. Our API has predictable, resource-oriented URLs, and uses clear response messages to indicate API errors.

The code examples in the right sidebar are designed to show you how to call our API. All you need to do is to replace the secret_api_key in the sample with your private API token.

This documentation was last updated 2021-04-27.

## Client Libraries (SDKs)
Docparser comes with two official client libraries to make it easier for you to build an integration with Docparser.

Both client libraries are open source and are published under the MIT license. Which means that you can use them in your projects without any restrictions. If you want to contribute to the development of our libraries, please don’t hesitate to create a pull-requests in our Github repositories.

Please note that the Docparser API can be used with any programming language capable of making HTTPS calls - even if there is no ready-to-use client library available. In case you developed a library in another programming language than the ones listed below, we would be thrilled to list it here as open source.

<strong>Official Libraries</strong> 
<ul>
<li>[PHP Client Library](https://github.com/Docparser/Docparser-PHP)</li>
<li>[Node.js Client Library](https://github.com/Docparser/Docparser-Node)</li>
</ul>

<strong>Third Party Libraries And Code Snippets </strong>
<ul>
<li>[Salesforce Apex Code Snippets](https://github.com/Docparser/Docparser-Apex)</li>
<li>[Coldfusion Library](https://github.com/Construction-Monitor/coldfusion-docparser)</li>

# Authentication
Every request to the Docparser API needs to be authenticated with a secret API key linked to your account. You can obtain and reset your secret API key in the [API Settings](https://app.docparser.com/account/login/?red=myaccount%2Fapi) of your Docparser Account. Your API key carries many privileges, so be sure to keep them secret!

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.

Authentication to the API can be performed in two ways:
<ul>
<li>via HTTP Basic Auth (recommended)</li>
<li>by directly providing your API key in your request</li>
</ul>
You can test if the authentication works by pinging the following URL. Please make sure to include the correct authentication headers / parameters as described below.

`GET https://api.docparser.com/v1/ping`

## HTTP Basic Auth
This authentication method is the preferred way of authenticating your requests to Docparser. When using HTTP Basic Auth, use your secret API key as the “username” and leave the “password” blank.

<!-- CURL
<pre class="highlight ruby tab-ruby" style>
<code>
curl https://api.docparser.com/v1/ping \

   <span class="nb">\</span>
   "
   -u <secret_api_key>:
   "
   </code>
   </pre>
    -->

## With API Key
In case Basic Auth is not an option for you, it is also possible to include your secret API key directly within your request. You can provide your API key either as a header (api_key: ABC123), a post-field (api_key=ABC123) or an URL query parameter (&api_key=ABC123).

Please note that including your API as an URL query parameter is the least secure method and we don’t recommend doing this. Including API keys in URLs comes with a high risk of accidentally exposing them to others.


# Parsers

## List Document Parsers

This endpoint returns a list of all Document Parsers linked to your account. Each entry contains an id and a label. The id value an be used in other API routes, e.g. for importing documents to a specific Document Parser or obtaining parsing results.

`GET https://api.docparser.com/v1/parsers`

## List Parser Model Layouts
This endpoint returns a list of all the Model Layouts for a specific parser linked to your account.

`GET https://api.docparser.com/v1/parser/models/<PARSER_ID>`

# Documents

## Import Documents
We offer several options to import a document to Docparser to make it as easy as possible for you to integrate Docparser in your existing workflow.

Next to manually uploading your documents with our app, Docparser also allows you to import documents using this API. You can upload your document with a HTTP POST request, or by providing a publicly accessible URL which can be used to fetch the document.

Hint: Another easy way of importing your documents is to forward them by e-mail to a private email inbox linked to your account. You can learn more about this method in the settings of your Document Parser.

<h3> Upload Document From Local Path </h3>

Docparser allows you to upload documents from your local hard-drive with a multipart/form-data request. This is the same type of request a HTML form with a file upload field would send. The field name used for the document upload needs to be <code>file</code>.

The return value of a successful upload is the ID of the newly created document, the filesize of the imported document as well as account usage data.

Each of your Document Parsers has a unique API route to which you need to send your request. The <PARSER_ID> shown in the URL below can be obtained by calling the List Parsers API route. You can also easily obtain the <PARSER_ID> inside the Docparser app in the settings of your Document Parser under Settings > API.

In addition, you can submit an arbitrary string to Docparser which will be stored together with the uploaded document. The submitted value (remote_id) will be kept throughout the processing and will be available later once you obtain the parsed data with our API, as CSV/XLS/XML file or through webhooks. This optional parameter makes it easy to relate the parsed data returned by Docparser with document records in your own system.

`POST https://api.docparser.com/v1/document/upload/<PARSER_ID>`

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>File</td>
<td>Optional parameter to pass through your own document ID</td>
</tr>
</tbody>
</table>

<h3> Upload Document By Content </h3>

Alternatively to uploading a document from your hard drive, you can also send files in using a simple form-data HTTP POST request. To make this work, name your form field file_content and use base64 encoding for safe delivery of the data. The document name can be transferred in a second form field called file_name.

The return value of a successful upload is the ID of the newly created document, the filesize of the imported document as well as account usage data.

Each of your Document Parsers has a unique API route to which you need to send your request. The <PARSER_ID> shown in the URL below can be obtained by calling the List Parsers API route. You can also easily obtain the <PARSER_ID> inside the Docparser app in the settings of your Document Parser under Settings > API.

In addition, you can submit an arbitrary string to Docparser which will be stored together with the uploaded document. The submitted value (remote_id) will be kept throughout the processing and will be available later once you obtain the parsed data with our API, as CSV/XLS/XML file or through webhooks. This optional parameter makes it easy to relate the parsed data returned by Docparser with document records in your own system.

`POST https://api.docparser.com/v1/document/upload/<PARSER_ID>`

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>file_content</td>
<td>The file content encoded with base64.</td>
</tr>
<tr>
<td>file_name</td>
<td>"The file name for this document.This parameter is optional and we will attribute a file-name based on the time of uploading if empty." </td>
</tr>
<tr>
<td>remote_id </td>
<td>Optional parameter to pass through your own document ID </td>
</tr>
</tbody>
</table>

<h3>Fetch Document From URL</h3>
If your files are stored under a publicly accessible URL, you can also import a document by providing the URL to our API. This method is really straight forward and you just need to perform a simple POST or GET request with url as the parameter.

The return value of a successful fetch request is the ID of the newly created document, as well as account usage data.

Each of your Document Parsers has a unique API route to which you need to send your request. The <PARSER_ID> shown in the URL below can be obtained by calling the <code>List Parsers</code> API route. You can also easily obtain the <PARSER_ID> inside the Docparser app in the settings of your Document Parser under <code> Settings > API.</code>

In addition, you can submit an arbitrary string to Docparser which will be stored together with the fetched document. The submitted value (<code>remote_id</code>) will be kept throughout the processing and will be available later once you obtain the parsed data with our API, as CSV/XLS/XML file or through webhooks. This optional parameter makes it easy to relate the parsed data returned by Docparser with document records in your own system.

`POST https://api.docparser.com/v1/document/fetch/<PARSER_ID>`

`GET https://api.docparser.com/v1/document/fetch/<PARSER_ID>`

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Description</th>
<tr>
</thead>
<tbody>
<tr>
<td>url</td>
<td>The location of a publicy accessible document</td>
</tr>
<tr>
<td>remote_id</td>
<td>Optional parameter to pass hrough your own document ID</td>
</tr>
</tbody>
</table>

# Parsed Data
Docparser provides a couple of different ways to obtain the data parsed from your documents. Basically, you have the following three options:
<ul>
<li>Create permanent [download links](https://support.docparser.com/article/1250-what-are-the-options-for-downloading-parsed-data)</li>
<li>Send parsed data to your API with [webhooks] (https://support.docparser.com/article/1252-what-are-webhooks-and-cloud-integrations)</li>
<li>Fetch parsed data with this API</li>
</ul>

## Get Data Of One Document 
This API route returns the parsed data of one document. The response structure is identical to the list route above, only that the contains a single object representing the data of the requested document.

 A much better way than polling our API for parsed data is to use our `Webhook` integration. By using webhooks, parsed data will be pushed to your API immediately after parsing. You’ll find the webhook integration in your Document Parser under ‘Integrations > Advanced Webhook’.

 The <PARSER_ID> shown in the URL below can be obtained by calling the <code>List Parsers</code> API route. You can also easily obtain the <PARSER_ID> inside the Docparser app in the settings of your Document Parser under <code>Settings > API.</code>

The <DOCUMENT_ID> is returned when uploading/importing a new document.

``GET https://api.docparser.com/v1/results/<PARSER_ID>/<DOCUMENT_ID>`

<table>
<thead>
<tr>
<th> Parameter</th>
<th> Default</th>
<th> Description</th>
</tr>
<tbody>
<tr>
<td>format</td>
<td>object</td>
<td>Valid values are <code>object</code> or <code>flat</code>. By default, parsed document data is returned as nested JSON objects. Setting this parameter to flat will return a simplified version of the parsed data which does not contain flat key/value pairs instead of nested objects. </td>
</tr>
<tr>
<td>include_children</td>
<td> </td>
<td> If child documents were created during preprocessing (e.g. when splitting documents), setting this parameter to <code> true</code> ensures that the parsed data of all child documents is returned.</td>


## Get Data of Multiple Documents
This API route returns a list of JSON objects representing the parsed data. By default, the data of the last 100 documents in reverse chronological order. Additional parameters can be used to change this default behaviour.

 <aside class="notice">A much better way than polling our API for parsed data is to use our `Webhook` integration. By using webhooks, parsed data will be pushed to your API immediately after parsing. You’ll find the webhook integration in your Document Parser under 'Integrations > Advanced Webhook’.</aside>

 The <PARSER_ID> shown in the URL below can be obtained by calling the <code>List Parsers</code> API route. You can also easily obtain the <PARSER_ID> inside the Docparser app in the settings of your Document Parser under Settings > API.

`GET https://api.docparser.com/v1/results/<PARSER_ID>`

<table>
<thead>
<tr>
<th> Parameter</th>
<th> Default</th>
<th> Description</th>
</tr>
<tbody>
<tr>
<td>format</td>
<td>object</td>
<td>Valid values are <code>object</code> or <code>flat</code>. By default, parsed document data is returned as nested JSON objects. Setting this parameter to flat will return a simplified version of the parsed data which does not contain flat key/value pairs instead of nested objects. </td>
</tr>
<tr>
<td>list</td>
<td>last _uploaded</td>
<td>Valid values are last_uploaded, uploaded_after and processed_after. By default, the data of the last uploaded documents in reverse chronological order is returned. If set to uploaded_after, documents imported after a certain date are returned (see below). If set to processed_after, documents parsed after a certain date are returned (see below).</td>
</tr>
<tr>
<td> limit </td>
<td> 100</td>
<td> This parameter indicates how many documents to include when the parameter list is set to last_uploaded. The maximum quantity of documents which can be returned is limited 10,000. </td>
</tr>
<tr>
<td> date</td>
<td> </td>
<td> This parameter is mandatory if the parameter list is set to uploaded_after or processed_after. The parameter needs to be a valid ISO 8601 (e.g. 2017-02-12T15:19:21+00:00) date string or a Linux timestamp and determines which documents are included in the return. Please note that the maximum quantity of documents which can be returned is limited 10,000.</td>
</tr>
<tr>
<td> remote_id</td>
<td></td>
<td> When this parameter is set, only documents having the provided remote_id will be returned. The remote_id of a document can be set when importing the file via the API [(see above)](https://dev.docparser.com/?shell#import-documents).</td>
</tr>
<tr>
<td>include_processing_queue</td>
<td></td>
<td> By default, only documents which are fully processed (imported, preprocessed, parsed) are included in the results. By setting include_processing_queue to true, files which are not yet entirely processed are included in the results.</td>
</tr>