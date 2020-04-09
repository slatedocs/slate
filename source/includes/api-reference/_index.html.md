<!-- Generator: Widdershins v3.6.6 -->

<hr class="full-line">
<section class="full-section">
<h1 id="asana">API Reference</h1>

> Scroll down for example requests and responses.

This is the interface for interacting with the [Asana Platform](https://developers.asana.com). Our API reference is generated from our [OpenAPI spec] (https://raw.githubusercontent.com/Asana/developer-docs/master/defs/asana_oas.yaml).

Base URLs:

* <a href="https://app.asana.com/api/1.0">https://app.asana.com/api/1.0</a>

<a href="https://asana.com/terms">Terms of service</a>
Web: <a href="https://asana.com/support">Asana Support</a> 
</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-attachments">Attachments</h1>

<pre class="highlight http tab-http">
<code><a href="#get-an-attachment"><span class="get-verb">GET</span> <span class=""nn>/attachments/{attachment_gid}</span></a><br><a href="#delete-an-attachment"><span class="delete-verb">DELETE</span> <span class=""nn>/attachments/{attachment_gid}</span></a><br><a href="#get-attachments-for-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/attachments</span></a><br><a href="#upload-an-attachment"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/attachments</span></a></code>
</pre>

An *attachment* object represents any file attached to a task in Asana, whether it’s an uploaded file or one associated via a third-party service such as Dropbox or Google Drive.

</section>
<hr class="half-line">
<section>
## Get an attachment

<a id="opIdgetAttachment"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/attachments/{attachment_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "attachment",
    "name": "Screenshot.png",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
    "host": "dropbox",
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /attachments/{attachment_gid}</code>
</p>

Get the full record for a single attachment.

<h3 id="get-an-attachment-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/attachment_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the attachment.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-an-attachment-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Attachment](#schemaattachment)</span>|Successfully retrieved the record for a single attachment.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|402<span class="param-type"> [Error](#schemaerror)</span>|The request was valid, but the queried object or object mutation specified in the request is above your current premium level.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|424<span class="param-type"> [Error](#schemaerror)</span>|You have exceeded one of the enforced rate limits in the API. See the [documentation on rate limiting](https://developers.asana.com/docs/#rate-limits) for more information.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|
|501<span class="param-type"> [Error](#schemaerror)</span>|There is an issue between the load balancers and Asana's API.|
|503<span class="param-type"> [Error](#schemaerror)</span>|Either the upstream service is unavailable to the API, or he API has been intentionally shut off.|
|504<span class="param-type"> [Error](#schemaerror)</span>|This request took too long to complete.|

</section><hr class="half-line">
<section>
## Delete an attachment

<a id="opIddeleteAttachment"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/attachments/{attachment_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /attachments/{attachment_gid}</code>
</p>

Deletes a specific, existing attachment.

Returns an empty data record.

<h3 id="delete-an-attachment-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/attachment_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the attachment.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-an-attachment-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified attachment.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-an-attachment-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get attachments for a task

<a id="opIdgetAttachmentsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/attachments \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "attachment",
      "name": "Screenshot.png"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/attachments</code>
</p>

Returns the compact records for all attachments on the task.

<h3 id="get-attachments-for-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-attachments-for-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AttachmentCompact](#schemaattachmentcompact)</span>|Successfully retrieved the compact records for all attachments on the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Upload an attachment

<a id="opIdcreateAttachmentForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/attachments \
  -H 'Content-Type: multipart/form-data' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```yaml
file: string

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "attachment",
    "name": "Screenshot.png",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
    "host": "dropbox",
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/attachments</code>
</p>

Upload an attachment.

This method uploads an attachment to a task and returns the compact
record for the created attachment object. It is not possible to attach
files from third party services such as Dropbox, Box & Google Drive via
the API. You must download the file content first and then upload it as
any other attachment.

The 100MB size limit on attachments in Asana is enforced on this endpoint.

This endpoint expects a multipart/form-data encoded request containing
the full contents of the file to be uploaded.

Requests made should follow the HTTP/1.1 specification that line
terminators are of the form `CRLF` or `\r\n` outlined
[here](http://www.w3.org/Protocols/HTTP/1.1/draft-ietf-http-v11-spec-01#Basic-Rules)
in order for the server to reliably and properly handle the request.

<h3 id="upload-an-attachment-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The file you want to upload.|
|» file<span class="param-type"> string(binary)</span>|none|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

#### Detailed descriptions

**body**: The file you want to upload.

*Note when using curl:*

Be sure to add an `‘@’` before the file path, and use the `—form`
option instead of the `-d` option.

When uploading PDFs with curl, force the content-type to be pdf by
appending the content type to the file path: `—form
“file=@file.pdf;type=application/pdf”`.

<h3 id="upload-an-attachment-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Attachment](#schemaattachment)</span>|Successfully uploaded the attachment to the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-batch-api">Batch API</h1>

<pre class="highlight http tab-http">
<code><a href="#submit-parallel-requests"><span class="post-verb">POST</span> <span class=""nn>/batch</span></a></code>
</pre>

There are many cases where you want to accomplish a variety of work in the Asana API but want to minimize the number of HTTP requests you make. For example:

* Modern browsers limit the number of requests that a single web page can
  make at once.
* Mobile apps will use more battery life to keep the cellular radio on
  when making a series of requests.
* There is an overhead cost to developing software that can make multiple
  requests in parallel.
* Some cloud platforms handle parallelism poorly, or disallow it
  entirely.

To make development easier in these use cases, Asana provides a **batch API** that enables developers to perform multiple “actions” by making only a single HTTP request.

#### Making a Batch Request

To make a batch request, send a `POST` request to `/batch`. Like other `POST` endpoints, the body should contain a `data` envelope. Inside this envelope should be a single `actions` field, containing a list of “action” objects.  Each action represents a standard request to an existing endpoint in the Asana API.

**The maximum number of actions allowed in a single batch request is 10**. Making a batch request with no actions in it will result in a `400 Bad Request`.

When the batch API receives the list of actions to execute, it will dispatch those actions to the already-implemented endpoints specified by the `relative_path` and `method` for each action. This happens in parallel, so all actions in the request will be processed simultaneously. There is no guarantee of the execution order for these actions, nor is there a way to use the output of one action as the input of another action (such as creating a task and then commenting on it).

The response to the batch request will contain (within the `data` envelope) a list of result objects, one for each action. The results are guaranteed to be in the same order as the actions in the request, e.g., the first result in the response corresponds to the first action in the request.

The batch API will always attempt to return a `200 Success` response with individual result objects for each individual action in the request. Only in certain cases (such as missing authorization or malformed JSON in the body) will the entire request fail with another status code. Even if every individual action in the request fails, the batch API will still return a `200 Success` response, and each result object in the response will contain the errors encountered with each action.

#### Rate Limiting

The batch API fully respects all of our rate limiting. This means that a batch request counts against *both* the standard rate limiter and the concurrent request limiter as though you had made a separate HTTP request for every individual action. For example, a batch request with five actions counts as five separate requests in the standard rate limiter, and counts as five concurrent requests in the concurrent request limiter. The batch request itself incurs no cost.

If any of the actions in a batch request would exceed any of the enforced limits, the *entire* request will fail with a `429 Too Many Requests` error. This is to prevent the unpredictability of which actions might succeed if not all of them could succeed.

#### Restrictions

Not every endpoint can be accessed through the batch API. Specifically, the following actions cannot be taken and will result in a `400 Bad Request` for that action:

* Uploading attachments
* Creating, getting, or deleting organization exports
* Any SCIM operations
* Nested calls to the batch API

</section>
<hr class="half-line">
<section>
## Submit parallel requests

<a id="opIdcreateBatchRequest"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/batch \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "actions": [
      {
        "data": {
          "assignee": "me",
          "workspace": "1337"
        },
        "method": "get",
        "options": {
          "fields": [
            "name",
            "notes",
            "completed"
          ],
          "limit": 3
        },
        "relative_path": "/tasks/123"
      }
    ]
  }
}
```

> 200 Response

```json
{
  "data": [
    {
      "body": {
        "data": {
          "completed": false,
          "gid": "1967",
          "name": "Hello, world!",
          "notes": "How are you today?"
        }
      },
      "headers": {
        "location": "/tasks/1234"
      },
      "status_code": 200
    }
  ]
}
```

<p>
<code> <span class="post-verb">POST</span> /batch</code>
</p>

Make multiple requests in parallel to Asana's API.

<h3 id="submit-parallel-requests-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The requests to batch together via the Batch API.|
|» data<span class="param-type"> object</span>|A request object for use in a batch request.|
|»» actions<span class="param-type"> [object]</span>|none|
|»»» data<span class="param-type"> object</span>|For `GET` requests, this should be a map of query parameters you would have normally passed in the URL. Options and pagination are not accepted here; put them in `options` instead. For `POST`, `PATCH`, and `PUT` methods, this should be the content you would have normally put in the data field of the body.|
|»»» method<span class="param-type"> string</span><div class="param-required">required</div>|The HTTP method you wish to emulate for the action.|
|»»» options<span class="param-type"> object</span>|Pagination (`limit` and `offset`) and output options (`fields` or `expand`) for the action. “Pretty” JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request.|
|»»»» fields<span class="param-type"> [string]</span>|The fields to retrieve in the request.|
|»»»» limit<span class="param-type"> integer</span>|Pagination limit for the request.|
|»»»» offset<span class="param-type"> integer</span>|Pagination offset for the request.|
|»»» relative_path<span class="param-type"> string</span><div class="param-required">required</div>|The path of the desired endpoint relative to the API’s base URL. Query parameters are not accepted here; put them in `data` instead.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| method|get|
| method|post|
| method|put|
| method|delete|
| method|patch|
| method|head|

<h3 id="submit-parallel-requests-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Batch](#schemabatch)</span>|Successfully completed the requested batch API operations.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-custom-fields">Custom Fields</h1>

<pre class="highlight http tab-http">
<code><a href="#create-a-custom-field"><span class="post-verb">POST</span> <span class=""nn>/custom_fields</span></a><br><a href="#get-a-custom-field"><span class="get-verb">GET</span> <span class=""nn>/custom_fields/{custom_field_gid}</span></a><br><a href="#update-a-custom-field"><span class="put-verb">PUT</span> <span class=""nn>/custom_fields/{custom_field_gid}</span></a><br><a href="#delete-a-custom-field"><span class="delete-verb">DELETE</span> <span class=""nn>/custom_fields/{custom_field_gid}</span></a><br><a href="#get-a-workspace-39-s-custom-fields"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/custom_fields</span></a><br><a href="#create-an-enum-option"><span class="post-verb">POST</span> <span class=""nn>/custom_fields/{custom_field_gid}/enum_options</span></a><br><a href="#reorder-a-custom-field-39-s-enum"><span class="post-verb">POST</span> <span class=""nn>/custom_fields/{custom_field_gid}/enum_options/insert</span></a><br><a href="#update-an-enum-option"><span class="put-verb">PUT</span> <span class=""nn>/enum_options/{enum_option_gid}</span></a></code>
</pre>

In the Asana application, Tasks, Projects, and Portfolios can hold user-specified Custom Fields which provide extra information; for example, a priority value or a number representing the time required to complete a Task. This lets a user define the type of information that each Item within a Project or Portfolio can contain in addition to the built-in fields that Asana provides.

**Note:** Custom Fields are a premium feature. Integrations which work with Custom Fields need to handle an assortment of use cases for free and premium users in context of free and premium organizations. For a detailed examination of to what data users will have access in different circumstances, read the section below on [access control](#custom-field-access-control).

The characteristics of Custom Fields are:

* There is metadata that defines the Custom Field. This metadata can be shared across an entire workspace, or be specific to a Project or Portfolio. * Creating a Custom Field Setting on a Project or Portfolio means each direct child will have the custom field. This is conceptually akin to adding columns in a database or a spreadsheet: every Task (row) in the Project (table) can contain information for that field, including "blank" values, i.e. `null` data. For Portfolio custom fields, every Project (row) in the Portfolio (table) will contain information for the custom field. * Custom Field Settings only go one child deep. Meaning a custom field setting on a portfolio will give each project the custom field, but not each task within those projects. * Tasks have Custom Field _values_ assigned to them.

A brief example: let's imagine that an organization has defined a Custom Field for "Priority". This field is of `enum` type and can have user-defined values of `Low`, `Medium`, or `High`. This is the field metadata, and it is visible within, and shared across, the entire organization.

A Project is then created in the organization, called "Bugs", and the "Priority" Custom Field is associated with that Project. This will allow all Tasks within the "Bugs" Project to have an associated "Priority".

A new Task is created within "Bugs". This Task, then, has a field named "Priority" which can take on the Custom Field value of one of `[null]`, `Low`, `Medium`, and `High`.

These Custom Fields are accessible via the API through a number of endpoints at the top level (e.g. `/custom_fields` and `/custom_field_settings`) and through calls on Workspaces, Portfolios, Projects, and Tasks resources. The API also provides a way to fetch both the metadata and data which define each particular Custom Field, so that a client application may render proper UI to display or edit the values.

Custom Field aware integrations need to be aware of the basic types that Custom Fields can adopt. These types are:

* `text` - an arbitrary, relatively short string of text * `number` - a number with a defined level of precision * `enum` - a selection from a defined list of options

Text fields are currently limited to 1024 characters. On Tasks, their Custom Field value will have a `text_value` property to represent this field.

Number fields can have an arbitrary `precision` associated with them; for example, a precision of `2` would round its value to the second (hundredths) place, i.e. 1.2345 would round to 1.23. On Tasks, the Custom Field value will have a `number_value` property to represent this field.

Enum fields represent a selection from a list of options. On the metadata, they will contain all of the options in an array. Each option has 4 properties:

* `gid` - the gid of this enum option. Note that this is the gid of the _option_ - the Custom Field itself has a separate `gid`. * `name` - the name of the option, e.g. "Choice #1" * `enabled` - whether this field is enabled. Disabled fields are not available to choose from when disabled, and are visually hidden in the Asana application, but they remain in the metadata for Custom Field values which were set to the option before the option was disabled. * `color` - a color associated with this choice.

On the Task's Custom Field value, the enum will have an `enum_value` property which will be the same as one of the choices from the list defined in the Custom Field metadata.

#### Querying an organization for its Custom Fields

For Custom Fields shared across the workspace or organization, the Workspace [can be queried](#get-a-workspace-39-s-custom-fields) for its list of defined Custom Fields. Like other collection queries, the fields will be returned as a compact record; slightly different from most other compact records is the fact that the compact record for Custom Fields includes `type` as well as `gid` and `name`.

#### Accessing Custom Field definitions

The [Custom Fields](#get-a-custom-field) reference describes how the metadata which defines a Custom Field is accessed. A GET request with a `gid` can be issued on the `/custom_fields` endpoint to fetch the full definition of a single Custom Field given its `gid` from (for instance) listing all Custom Fields on a Workspace, or getting the `gid` from a Custom Field Settings object or a Task.

#### Associating Custom Fields with a Project or Portfolio

A mapping between a Custom Field and a Project or Portfolio is handled with a [Custom Field Settings](#asana-custom-field-settings) object. This object contains a reference for each of the Custom Field and the Project or Porfolio, as well as additional information about the status of that particular Custom Field. For instance, `is_important`, which defines whether or not the custom field will appear in the list/grid on the Asana application.

#### Accessing Custom Field values on Tasks or Projects

The [Tasks](#get-a-task) reference has information on how Custom Fields look on Tasks. Custom Fields will return as an array on the property `custom_fields`, and each entry will contain, side-by-side, the compact representation of the Custom Field metadata and a `{typename}_value` property that stores the value set for the Custom Field.

Of particular note is that the top-level `gid` of each entry in the `custom_fields` array is the `gid` of the Custom Field metadata, as it is the compact representation of this metadata. This can be used to refer to the full metadata by making a request to the `/custom_fields/{custom_fields_id}` endpoint as described above.

Custom Fields can be set just as in the Asana-defined fields on a task via POST or PUT requests. You can see an example on the [update a task](#update-a-task) endpoint.

Custom Fields on projects follow this same pattern.

#### Warning: Program defensively with regards to Custom Field definitions

Asana application users have the ability to change the definitions of Custom Field metadata. This means that as you write scripts or applications to work with them, it's possible for the definitions to change at any time, which may cause an application using them to break or malfunction if it makes assumptions about the metadata for a particular Custom Field. When using Custom Fields, it is a good idea to program *defensively*, meaning you your application should double-check that the Custom Field metadata is what it expects.

Storing the state of the Custom Field metadata for too long if you dynamically create a model for it can cause your model to become unsynchronized with the model stored in Asana. If you encounter (for example) an `enum` value on a Task that does not match any option in your metadata model, your metadata model has become out of date with the Custom Field metadata.

**Note:** We are currently studying proposals for future implementations to more elegantly handle the modification of Custom Field metadata for application integrations.

#### Enabled and Disabled Values

When information that is contained in a Custom Field value loses a logical association with its metadata definition, the value becomes disabled. This can happen in a couple of simple ways, for example, if you remove the Custom Field metadata from a Project, or move a Task with a Custom Field to a different Project which does not have the Custom Field metadata associated with it. The value remains on the Task, and the Custom Field metadata can still be found and examined, but as the context in which the Custom Field makes sense is gone, the Custom Field cannot change its value; it can only be cleared.

Note: Tasks that are associated with multiple Projects do not become disabled, so long as at least one of the Projects is still associated with the Custom Field metadata. In other words, Tasks with multiple Projects will retain logically associated to the set of Custom Field metadata represented by all of their Projects.

Moving the Task back under a Project with that Custom Field applied to it or applying the Custom Field metadata to the current Project will return the Custom Field value to an enabled state. In this scenario, the Custom Field will be re-enabled and editable again.

In the Asana application, disabled fields are grayed out and not allowed to change, other than to be discarded. In the API, we return a property `enabled: false` to inform the external application that the value has been disabled.

Note that the API enforces the same operations on disabled Custom Field values as hold in the Asana application: they may not have their values changed, since the lack of context for the values of a custom field in general doesn't provide enough information to know what new values should be. Setting the Custom Field value to `null` will clear and remove the Custom Field value from the Task.

#### Custom Field access control

Custom Fields are a complex feature of the Asana platform, and their access in the Asana application and in the API vary based on the status of the user and project. When building your application, it's best to be defensive and not assume the given user will have read or write access to a custom field, and fail gracefully when this occurs.

</section>
<hr class="half-line">
<section>
## Create a custom field

<a id="opIdcreateCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "format": "custom",
    "has_notifications_enabled": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "workspace": "1331"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "custom_field",
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "format": "custom",
    "has_notifications_enabled": true,
    "is_global_to_workspace": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "type": "text"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /custom_fields</code>
</p>

Creates a new custom field in a workspace. Every custom field is required
to be created in a specific workspace, and this workspace cannot be
changed once set.

A custom field’s name must be unique within a workspace and not conflict
with names of existing task properties such as ‘Due Date’ or ‘Assignee’.
A custom field’s type must be one of ‘text’, ‘enum’, or ‘number’.

Returns the full record of the newly created custom field.

<h3 id="create-a-custom-field-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The custom field object to create.|
|» data<span class="param-type"> object</span>|Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](#asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.|
|»» currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|»» custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|»» custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|»» description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|»» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|»» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»»» name<span class="param-type"> string</span>|The name of the enum option.|
|»» format<span class="param-type"> string</span>|The format of this custom field.|
|»» has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|»» name<span class="param-type"> string</span>|The name of the custom field.|
|»» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|»» precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.|
|»» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|»» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|»» workspace<span class="param-type"> string</span><div class="param-required">required</div>|*Create-Only* The workspace to create a custom field in.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

#### Detailed descriptions

**precision**: Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.
For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.
The identifier format will always have a precision of 0.

#### Enumerated Values

|Parameter|Value|
|---|---|
| custom_label_position|prefix|
| custom_label_position|suffix|
| format|currency|
| format|identifier|
| format|percentage|
| format|custom|
| format|none|
| resource_subtype|text|
| resource_subtype|enum|
| resource_subtype|number|

<h3 id="create-a-custom-field-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [CustomField](#schemacustomfield)</span>|Custom field successfully created.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a custom field

<a id="opIdgetCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "custom_field",
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "format": "custom",
    "has_notifications_enabled": true,
    "is_global_to_workspace": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "type": "text"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /custom_fields/{custom_field_gid}</code>
</p>

Get the complete definition of a custom field’s metadata.

Since custom fields can be defined for one of a number of types, and
these types have different data and behaviors, there are fields that are
relevant to a particular type. For instance, as noted above, enum_options
is only relevant for the enum type and defines the set of choices that
the enum could represent. The examples below show some of these
type-specific custom field definitions.

<h3 id="get-a-custom-field-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/custom_field_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the custom field.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-custom-field-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [CustomField](#schemacustomfield)</span>|Successfully retrieved the complete definition of a custom field’s metadata.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a custom field

<a id="opIdupdateCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "format": "custom",
    "has_notifications_enabled": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "workspace": "1331"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "custom_field",
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "format": "custom",
    "has_notifications_enabled": true,
    "is_global_to_workspace": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "type": "text"
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /custom_fields/{custom_field_gid}</code>
</p>

A specific, existing custom field can be updated by making a PUT request on the URL for that custom field. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged
When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the custom field.
A custom field’s `type` cannot be updated.
An enum custom field’s `enum_options` cannot be updated with this endpoint. Instead see “Work With Enum Options” for information on how to update `enum_options`.
Locked custom fields can only be updated by the user who locked the field.
Returns the complete updated custom field record.

<h3 id="update-a-custom-field-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The custom field object with all updated properties.|
|» data<span class="param-type"> object</span>|Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](#asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.|
|»» currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|»» custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|»» custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|»» description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|»» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|»» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»»» name<span class="param-type"> string</span>|The name of the enum option.|
|»» format<span class="param-type"> string</span>|The format of this custom field.|
|»» has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|»» name<span class="param-type"> string</span>|The name of the custom field.|
|»» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|»» precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.|
|»» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|»» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|»» workspace<span class="param-type"> string</span><div class="param-required">required</div>|*Create-Only* The workspace to create a custom field in.|
|/custom_field_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the custom field.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**precision**: Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.
For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.
The identifier format will always have a precision of 0.

#### Enumerated Values

|Parameter|Value|
|---|---|
| custom_label_position|prefix|
| custom_label_position|suffix|
| format|currency|
| format|identifier|
| format|percentage|
| format|custom|
| format|none|
| resource_subtype|text|
| resource_subtype|enum|
| resource_subtype|number|

<h3 id="update-a-custom-field-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [CustomField](#schemacustomfield)</span>|The custom field was successfully updated.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a custom field

<a id="opIddeleteCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /custom_fields/{custom_field_gid}</code>
</p>

A specific, existing custom field can be deleted by making a DELETE request on the URL for that custom field.
Locked custom fields can only be deleted by the user who locked the field.
Returns an empty data record.

<h3 id="delete-a-custom-field-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/custom_field_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the custom field.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-custom-field-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|The custom field was successfully deleted.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-custom-field-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get a workspace's custom fields

<a id="opIdgetCustomFieldsForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "custom_field",
      "currency_code": "EUR",
      "custom_label": "gold pieces",
      "custom_label_position": "suffix",
      "description": "Development team priority",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "enum_value": {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      },
      "format": "custom",
      "has_notifications_enabled": true,
      "is_global_to_workspace": true,
      "name": "Status",
      "number_value": 5.2,
      "precision": 2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/custom_fields</code>
</p>

Returns a list of the compact representation of all of the custom fields in a workspace.

<h3 id="get-a-workspace's-custom-fields-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-workspace's-custom-fields-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [CustomField](#schemacustomfield)</span>|Successfully retrieved all custom fields for the given workspace.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create an enum option

<a id="opIdcreateEnumOptionForCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "blue",
    "enabled": true,
    "insert_after": "12345",
    "insert_before": "12345",
    "name": "Low"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /custom_fields/{custom_field_gid}/enum_options</code>
</p>

Creates an enum option and adds it to this custom field’s list of enum options. A custom field can have at most 50 enum options (including disabled options). By default new enum options are inserted at the end of a custom field’s list.
Locked custom fields can only have enum options added by the user who locked the field.
Returns the full record of the newly created enum option.

<h3 id="create-an-enum-option-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The enum option object to create.|
|» data<span class="param-type"> object</span>|Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» insert_after<span class="param-type"> string</span>|An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.|
|»» insert_before<span class="param-type"> string</span>|An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|/custom_field_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the custom field.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="create-an-enum-option-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [EnumOption](#schemaenumoption)</span>|Custom field enum option successfully created.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Reorder a custom field's enum

<a id="opIdinsertEnumOptionForCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "after_enum_option": "12345",
    "before_enum_option": "12345",
    "enum_option": "97285"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /custom_fields/{custom_field_gid}/enum_options/insert</code>
</p>

Moves a particular enum option to be either before or after another specified enum option in the custom field.
Locked custom fields can only be reordered by the user who locked the field.

<h3 id="reorder-a-custom-field's-enum-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The enum option object to create.|
|» data<span class="param-type"> object</span>|none|
|»» after_enum_option<span class="param-type"> string</span>|An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.|
|»» before_enum_option<span class="param-type"> string</span>|An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.|
|»» enum_option<span class="param-type"> string</span><div class="param-required">required</div>|The gid of the enum option to relocate.|
|/custom_field_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the custom field.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="reorder-a-custom-field's-enum-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [EnumOption](#schemaenumoption)</span>|Custom field enum option successfully reordered.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update an enum option

<a id="opIdupdateEnumOption"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/enum_options/{enum_option_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "blue",
    "enabled": true,
    "insert_after": "12345",
    "insert_before": "12345",
    "name": "Low"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /enum_options/{enum_option_gid}</code>
</p>

Updates an existing enum option. Enum custom fields require at least one enabled enum option.
Locked custom fields can only be updated by the user who locked the field.
Returns the full record of the updated enum option.

<h3 id="update-an-enum-option-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The enum option object to update|
|» data<span class="param-type"> object</span>|Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» insert_after<span class="param-type"> string</span>|An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.|
|»» insert_before<span class="param-type"> string</span>|An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|/enum_option_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the enum option.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="update-an-enum-option-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [EnumOption](#schemaenumoption)</span>|Successfully updated the specified custom field enum.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-custom-field-settings">Custom Field Settings</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-project-39-s-custom-fields"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/custom_field_settings</span></a><br><a href="#get-a-portfolio-39-s-custom-fields"><span class="get-verb">GET</span> <span class=""nn>/portfolios/{portfolio_gid}/custom_field_settings</span></a></code>
</pre>

Custom fields are attached to a particular project with the Custom Field Settings resource. This resource both represents the many-to-many join of the Custom Field and Project as well as stores information that is relevant to that particular pairing; for instance, the `is_important` property determines some possible application-specific handling of that custom field.

</section>
<hr class="half-line">
<section>
## Get a project's custom fields

<a id="opIdgetCustomFieldSettingsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "custom_field": {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      },
      "is_important": false,
      "parent": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      },
      "project": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/custom_field_settings</code>
</p>

Returns a list of all of the custom fields settings on a project, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [getting started guide on input/output options](https://developers.asana.com/docs/#input-output-options) for more information.

<h3 id="get-a-project's-custom-fields-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-project's-custom-fields-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [CustomFieldSetting](#schemacustomfieldsetting)</span>|Successfully retrieved custom field settings objects for a project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a portfolio's custom fields

<a id="opIdgetCustomFieldSettingsForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "custom_field": {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      },
      "is_important": false,
      "parent": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      },
      "project": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolios/{portfolio_gid}/custom_field_settings</code>
</p>

Returns a list of all of the custom fields settings on a portfolio, in compact form.

<h3 id="get-a-portfolio's-custom-fields-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-portfolio's-custom-fields-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [CustomFieldSetting](#schemacustomfieldsetting)</span>|Successfully retrieved custom field settings objects for a portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-events">Events</h1>

<pre class="highlight http tab-http">
<code><a href="#get-events-on-a-resource"><span class="get-verb">GET</span> <span class=""nn>/events</span></a></code>
</pre>

An *event* is an object representing a change to a resource that was observed by an event subscription.

In general, requesting events on a resource is faster and subject to higher rate limits than requesting the resource itself. Additionally, change events bubble up - listening to events on a project would include when stories are added to tasks in the project, even on subtasks.

Establish an initial sync token by making a request with no sync token. The response will be a `412` error - the same as if the sync token had expired.

Subsequent requests should always provide the sync token from the immediately preceding call.

Sync tokens may not be valid if you attempt to go ‘backward’ in the history by requesting previous tokens, though re-requesting the current sync token is generally safe, and will always return the same results.

When you receive a `412 Precondition Failed` error, it means that the sync token is either invalid or expired. If you are attempting to keep a set of data in sync, this signals you may need to re-crawl the data.

Sync tokens always expire after 24 hours, but may expire sooner, depending on load on the service.

</section>
<hr class="half-line">
<section>
## Get events on a resource

<a id="opIdgetEvents"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/events?resource=12345 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "action": "changed",
      "created_at": "2012-02-22T02:06:58.147Z",
      "parent": {
        "gid": "12345",
        "resource_type": "task",
        "name": "Bug Task"
      },
      "resource": {
        "gid": "12345",
        "resource_type": "task",
        "name": "Bug Task"
      },
      "type": "task",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ],
  "sync": "de4774f6915eae04714ca93bb2f5ee81"
}
```

<p>
<code> <span class="get-verb">GET</span> /events</code>
</p>

Returns the full record for all events that have occurred since the sync
token was created.

A GET request to the endpoint /[path_to_resource]/events can be made in
lieu of including the resource ID in the data for the request.

*Note: The resource returned will be the resource that triggered the
event. This may be different from the one that the events were requested
for. For example, a subscription to a project will contain events for
tasks contained within the project.*

<h3 id="get-events-on-a-resource-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?resource<span class="param-type"> string</span><div class="param-required">required</div>|A resource ID to subscribe to. The resource can be a task or project.|
|?sync<span class="param-type"> string</span>|A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**sync**: A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.
*Note: On your first request, omit the sync token. The response will be the same as for an expired sync token, and will include a new valid sync token.If the sync token is too old (which may happen from time to time) the API will return a `412 Precondition Failed` error, and include a fresh sync token in the response.*

<h3 id="get-events-on-a-resource-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Event](#schemaevent)</span>|Successfully retrieved events.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-jobs">Jobs</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-job-by-id"><span class="get-verb">GET</span> <span class=""nn>/jobs/{job_gid}</span></a></code>
</pre>

Jobs represent processes that handle asynchronous work.
Jobs are created when an endpoint requests an action that will be handled asynchronously. Such as project or task duplication.
Only the creator of the duplication process can access the duplication status of the new object.

</section>
<hr class="half-line">
<section>
## Get a job by id

<a id="opIdgetJob"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/jobs/{job_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "job",
    "new_project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "resource_subtype": "duplicate_task",
    "status": "in_progress"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /jobs/{job_gid}</code>
</p>

Returns the full record for a job.

<h3 id="get-a-job-by-id-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/job_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the job.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-job-by-id-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Job](#schemajob)</span>|Successfully retrieved Job.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-organization-exports">Organization Exports</h1>

<pre class="highlight http tab-http">
<code><a href="#create-an-organization-export-request"><span class="post-verb">POST</span> <span class=""nn>/organization_exports</span></a><br><a href="#get-details-on-an-org-export-request"><span class="get-verb">GET</span> <span class=""nn>/organization_exports/{organization_export_gid}</span></a></code>
</pre>

An *organization_export* object represents a request to export the complete data of an Organization in JSON format.

To export an Organization using this API:

* Create an `organization_export`
  [request](#create-an-organization-export-request)
  and store the id that is returned.
* Request the `organization_export` every few minutes, until the
  `state` field contains ‘finished’.
* Download the file located at the URL in the `download_url` field. * Exports can take a long time, from several minutes to a few hours
  for large Organizations.

*Note: These endpoints are only available to [Service Accounts](https://asana.com/guide/help/premium/service-accounts) of an [Enterprise](https://asana.com/enterprise) Organization.*

</section>
<hr class="half-line">
<section>
## Create an organization export request

<a id="opIdcreateOrganizationExport"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/organization_exports \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "organization": "1331"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "organization_export",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
    "organization": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "state": "started"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /organization_exports</code>
</p>

This method creates a request to export an Organization. Asana will complete the export at some point after you create the request.

<h3 id="create-an-organization-export-request-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The organization to export.|
|» data<span class="param-type"> object</span>|An *organization_export* request starts a job to export the complete data of the given Organization.|
|»» organization<span class="param-type"> string</span>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="create-an-organization-export-request-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> Inline</span>|Successfully created organization export request.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="create-an-organization-export-request-responseschema">Response Schema</h3>

Status Code **201**

|Name|Description|
|---|---|
| data<span class="param-type"> [OrganizationExportResponse](#schemaorganizationexportresponse)</span>|An *organization_export* object represents a request to export the complete data of an Organization in JSON format.|
| gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
| resource_type<span class="param-type"> string</span>|The base type of this resource.|
| created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
| download_url<span class="param-type"> string(uri)¦null</span>|Download this URL to retreive the full export of the organization<br>in JSON format. It will be compressed in a gzip (.gz) container.<br><br>*Note: May be null if the export is still in progress or<br>failed.  If present, this URL may only be valid for 1 hour from<br>the time of retrieval. You should avoid persisting this URL<br>somewhere and rather refresh on demand to ensure you do not keep<br>stale URLs.*|
| organization<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
| gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
| resource_type<span class="param-type"> string</span>|The base type of this resource.|
| name<span class="param-type"> string</span>|The name of the workspace.|
| state<span class="param-type"> string</span>|The current state of the export.|

#### Enumerated Values

|Property|Value|
|---|---|
|state|pending|
|state|started|
|state|finished|
|state|error|

</section><hr class="half-line">
<section>
## Get details on an org export request

<a id="opIdgetOrganizationExport"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/organization_exports/{organization_export_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "organization_export",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
    "organization": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "state": "started"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /organization_exports/{organization_export_gid}</code>
</p>

Returns details of a previously-requested Organization export.

<h3 id="get-details-on-an-org-export-request-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/organization_export_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the organization export.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-details-on-an-org-export-request-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully retrieved organization export object.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="get-details-on-an-org-export-request-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [OrganizationExportResponse](#schemaorganizationexportresponse)</span>|An *organization_export* object represents a request to export the complete data of an Organization in JSON format.|
| gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
| resource_type<span class="param-type"> string</span>|The base type of this resource.|
| created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
| download_url<span class="param-type"> string(uri)¦null</span>|Download this URL to retreive the full export of the organization<br>in JSON format. It will be compressed in a gzip (.gz) container.<br><br>*Note: May be null if the export is still in progress or<br>failed.  If present, this URL may only be valid for 1 hour from<br>the time of retrieval. You should avoid persisting this URL<br>somewhere and rather refresh on demand to ensure you do not keep<br>stale URLs.*|
| organization<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
| gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
| resource_type<span class="param-type"> string</span>|The base type of this resource.|
| name<span class="param-type"> string</span>|The name of the workspace.|
| state<span class="param-type"> string</span>|The current state of the export.|

#### Enumerated Values

|Property|Value|
|---|---|
|state|pending|
|state|started|
|state|finished|
|state|error|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-portfolios">Portfolios</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-portfolios"><span class="get-verb">GET</span> <span class=""nn>/portfolios</span></a><br><a href="#create-a-portfolio"><span class="post-verb">POST</span> <span class=""nn>/portfolios</span></a><br><a href="#get-a-portfolio"><span class="get-verb">GET</span> <span class=""nn>/portfolios/{portfolio_gid}</span></a><br><a href="#update-a-portfolio"><span class="put-verb">PUT</span> <span class=""nn>/portfolios/{portfolio_gid}</span></a><br><a href="#delete-a-portfolio"><span class="delete-verb">DELETE</span> <span class=""nn>/portfolios/{portfolio_gid}</span></a><br><a href="#get-portfolio-items"><span class="get-verb">GET</span> <span class=""nn>/portfolios/{portfolio_gid}/items</span></a><br><a href="#add-a-portfolio-item"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/addItem</span></a><br><a href="#remove-a-portfolio-item"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/removeItem</span></a><br><a href="#add-a-custom-field-to-a-portfolio"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/addCustomFieldSetting</span></a><br><a href="#remove-a-custom-field-from-a-portfolio"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/removeCustomFieldSetting</span></a><br><a href="#add-users-to-a-portfolio"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/addMembers</span></a><br><a href="#remove-users-from-a-portfolio"><span class="post-verb">POST</span> <span class=""nn>/portfolios/{portfolio_gid}/removeMembers</span></a></code>
</pre>

A 'portfolio' gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.
Portfolios have some restrictions on size. Each portfolio has a max of 250 items and, like projects, a max of 20 custom fields.

</section>
<hr class="half-line">
<section>
## Get multiple portfolios

<a id="opIdgetPortfolios"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios?workspace=1331&owner=14916 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Portfolio"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolios</code>
</p>

Returns a list of the portfolios in compact representation that are owned by the current API user.

<h3 id="get-multiple-portfolios-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace or organization to filter portfolios on.|
|?owner<span class="param-type"> string</span><div class="param-required">required</div>|The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-multiple-portfolios-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [PortfolioCompact](#schemaportfoliocompact)</span>|Successfully retrieved portfolios.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a portfolio

<a id="opIdcreatePortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "light-green",
    "members": [
      "52164",
      "15363"
    ],
    "name": "Bug Portfolio",
    "workspace": "167589"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Portfolio",
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting",
        "custom_field": {
          "gid": "12345",
          "resource_type": "custom_field",
          "currency_code": "EUR",
          "custom_label": "gold pieces",
          "custom_label_position": "suffix",
          "description": "Development team priority",
          "enabled": true,
          "enum_options": [
            {
              "gid": "12345",
              "resource_type": "enum_option",
              "color": "blue",
              "enabled": true,
              "name": "Low"
            }
          ],
          "enum_value": {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          },
          "format": "custom",
          "has_notifications_enabled": true,
          "is_global_to_workspace": true,
          "name": "Status",
          "number_value": 5.2,
          "precision": 2,
          "resource_subtype": "text",
          "text_value": "Some Value",
          "type": "text"
        },
        "is_important": false,
        "parent": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        }
      }
    ],
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios</code>
</p>

Creates a new portfolio in the given workspace with the supplied name.

Note that portfolios created in the Asana UI may have some state
(like the “Priority” custom field) which is automatically added
to the portfolio when it is created. Portfolios created via our
API will *not* be created with the same initial state to allow
integrations to create their own starting state on a portfolio.

<h3 id="create-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The portfolio to create.|
|» data<span class="param-type"> object</span>|A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.|
|»» color<span class="param-type"> string</span>|Color of the portfolio.|
|»» members<span class="param-type"> [string]</span>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|»» name<span class="param-type"> string</span>|The name of the portfolio.|
|»» workspace<span class="param-type"> string</span>|Gid of an object.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|

<h3 id="create-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Portfolio](#schemaportfolio)</span>|Successfully created portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a portfolio

<a id="opIdgetPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Portfolio",
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting",
        "custom_field": {
          "gid": "12345",
          "resource_type": "custom_field",
          "currency_code": "EUR",
          "custom_label": "gold pieces",
          "custom_label_position": "suffix",
          "description": "Development team priority",
          "enabled": true,
          "enum_options": [
            {
              "gid": "12345",
              "resource_type": "enum_option",
              "color": "blue",
              "enabled": true,
              "name": "Low"
            }
          ],
          "enum_value": {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          },
          "format": "custom",
          "has_notifications_enabled": true,
          "is_global_to_workspace": true,
          "name": "Status",
          "number_value": 5.2,
          "precision": 2,
          "resource_subtype": "text",
          "text_value": "Some Value",
          "type": "text"
        },
        "is_important": false,
        "parent": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        }
      }
    ],
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolios/{portfolio_gid}</code>
</p>

Returns the complete portfolio record for a single portfolio.

<h3 id="get-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Portfolio](#schemaportfolio)</span>|Successfully retrieved the requested portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a portfolio

<a id="opIdupdatePortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "light-green",
    "members": [
      "52164",
      "15363"
    ],
    "name": "Bug Portfolio",
    "workspace": "167589"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Portfolio",
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting",
        "custom_field": {
          "gid": "12345",
          "resource_type": "custom_field",
          "currency_code": "EUR",
          "custom_label": "gold pieces",
          "custom_label_position": "suffix",
          "description": "Development team priority",
          "enabled": true,
          "enum_options": [
            {
              "gid": "12345",
              "resource_type": "enum_option",
              "color": "blue",
              "enabled": true,
              "name": "Low"
            }
          ],
          "enum_value": {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          },
          "format": "custom",
          "has_notifications_enabled": true,
          "is_global_to_workspace": true,
          "name": "Status",
          "number_value": 5.2,
          "precision": 2,
          "resource_subtype": "text",
          "text_value": "Some Value",
          "type": "text"
        },
        "is_important": false,
        "parent": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        }
      }
    ],
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /portfolios/{portfolio_gid}</code>
</p>

An existing portfolio can be updated by making a PUT request on the URL for
that portfolio. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated portfolio record.

<h3 id="update-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The updated fields for the portfolio.|
|» data<span class="param-type"> object</span>|A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.|
|»» color<span class="param-type"> string</span>|Color of the portfolio.|
|»» members<span class="param-type"> [string]</span>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|»» name<span class="param-type"> string</span>|The name of the portfolio.|
|»» workspace<span class="param-type"> string</span>|Gid of an object.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|

<h3 id="update-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Portfolio](#schemaportfolio)</span>|Successfully updated the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a portfolio

<a id="opIddeletePortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /portfolios/{portfolio_gid}</code>
</p>

An existing portfolio can be deleted by making a DELETE request on
the URL for that portfolio.

Returns an empty data record.

<h3 id="delete-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-portfolio-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get portfolio items

<a id="opIdgetItemsForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolios/{portfolio_gid}/items</code>
</p>

Get a list of the items in compact form in a portfolio.

<h3 id="get-portfolio-items-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-portfolio-items-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectCompact](#schemaprojectcompact)</span>|Successfully retrieved the requested portfolio's items.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Add a portfolio item

<a id="opIdaddItemForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "insert_after": "1331",
    "insert_before": "1331",
    "item": "1331"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/addItem</code>
</p>

Add an item to a portfolio.
Returns an empty data block.

<h3 id="add-a-portfolio-item-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the item being inserted.|
|» data<span class="param-type"> object</span>|none|
|»» insert_after<span class="param-type"> string</span>|An id of an item in this portfolio. The new item will be added after the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.|
|»» insert_before<span class="param-type"> string</span>|An id of an item in this portfolio. The new item will be added before the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.|
|»» item<span class="param-type"> string</span><div class="param-required">required</div>|The item to add to the portfolio.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-a-portfolio-item-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the item to the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-a-portfolio-item-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove a portfolio item

<a id="opIdremoveItemForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "item": "1331"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/removeItem</code>
</p>

Remove an item from a portfolio.
Returns an empty data block.

<h3 id="remove-a-portfolio-item-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the item being removed.|
|» data<span class="param-type"> object</span>|none|
|»» item<span class="param-type"> string</span><div class="param-required">required</div>|The item to remove from the portfolio.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-a-portfolio-item-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the item from the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-portfolio-item-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Add a custom field to a portfolio

<a id="opIdaddCustomFieldSettingForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "custom_field": "14916",
    "insert_after": "1331",
    "insert_before": "1331",
    "is_important": true
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/addCustomFieldSetting</code>
</p>

Custom fields are associated with portfolios by way of custom field settings.  This method creates a setting for the portfolio.

<h3 id="add-a-custom-field-to-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the custom field setting.|
|» data<span class="param-type"> object</span>|none|
|»» custom_field<span class="param-type"> string</span><div class="param-required">required</div>|The custom field to associate with this container.|
|»» insert_after<span class="param-type"> string</span>|A gid of a Custom Field Setting on this container, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|»» insert_before<span class="param-type"> string</span>|A gid of a Custom Field Setting on this container, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|»» is_important<span class="param-type"> boolean</span>|Whether this field should be considered important to this container (for instance, to display in the list view of items in the container).|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|

<h3 id="add-a-custom-field-to-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the custom field to the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-a-custom-field-to-a-portfolio-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove a custom field from a portfolio

<a id="opIdremoveCustomFieldSettingForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "custom_field": "14916"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/removeCustomFieldSetting</code>
</p>

Removes a custom field setting from a portfolio.

<h3 id="remove-a-custom-field-from-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the custom field setting being removed.|
|» data<span class="param-type"> object</span>|none|
|»» custom_field<span class="param-type"> string</span><div class="param-required">required</div>|The custom field to remove from this portfolio.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|

<h3 id="remove-a-custom-field-from-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the custom field from the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-custom-field-from-a-portfolio-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Add users to a portfolio

<a id="opIdaddMembersForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addMembers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "members": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/addMembers</code>
</p>

Adds the specified list of users as members of the portfolio.
Returns the updated portfolio record.

<h3 id="add-users-to-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the members being added.|
|» data<span class="param-type"> object</span>|none|
|»» members<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-users-to-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added members to the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-users-to-a-portfolio-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove users from a portfolio

<a id="opIdremoveMembersForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeMembers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "members": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /portfolios/{portfolio_gid}/removeMembers</code>
</p>

Removes the specified list of users from members of the portfolio.
Returns the updated portfolio record.

<h3 id="remove-users-from-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the members being removed.|
|» data<span class="param-type"> object</span>|none|
|»» members<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-users-from-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the members from the portfolio.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-users-from-a-portfolio-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-portfolio-memberships">Portfolio Memberships</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-portfolio-memberships"><span class="get-verb">GET</span> <span class=""nn>/portfolio_memberships</span></a><br><a href="#get-a-portfolio-membership"><span class="get-verb">GET</span> <span class=""nn>/portfolio_memberships/{portfolio_membership_gid}</span></a><br><a href="#get-memberships-from-a-portfolio"><span class="get-verb">GET</span> <span class=""nn>/portfolios/{portfolio_gid}/portfolio_memberships</span></a></code>
</pre>

This object determines if a user is a member of a portfolio.

</section>
<hr class="half-line">
<section>
## Get multiple portfolio memberships

<a id="opIdgetPortfolioMemberships"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolio_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "portfolio_membership",
      "portfolio": {
        "gid": "12345",
        "resource_type": "portfolio",
        "name": "Bug Portfolio"
      },
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolio_memberships</code>
</p>

Returns a list of portfolio memberships in compact representation. You must specify `portfolio`, `portfolio` and `user`, or `workspace` and `user`.

<h3 id="get-multiple-portfolio-memberships-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?portfolio<span class="param-type"> string</span>|The portfolio to filter results on.|
|?workspace<span class="param-type"> string</span>|The workspace to filter results on.|
|?user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-multiple-portfolio-memberships-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [PortfolioMembershipCompact](#schemaportfoliomembershipcompact)</span>|Successfully retrieved portfolio memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a portfolio membership

<a id="opIdgetPortfolioMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_membership_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "portfolio_membership",
    "portfolio": {
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Portfolio"
    },
    "user": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolio_memberships/{portfolio_membership_gid}</code>
</p>

Returns the complete portfolio record for a single portfolio membership.

<h3 id="get-a-portfolio-membership-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_membership_gid<span class="param-type"> string</span><div class="param-required">required</div>|none|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-portfolio-membership-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [PortfolioMembership](#schemaportfoliomembership)</span>|Successfully retrieved the requested portfolio membership.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get memberships from a portfolio

<a id="opIdgetPortfolioMembershipsForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "portfolio_membership",
      "portfolio": {
        "gid": "12345",
        "resource_type": "portfolio",
        "name": "Bug Portfolio"
      },
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /portfolios/{portfolio_gid}/portfolio_memberships</code>
</p>

Returns the compact portfolio membership records for the portfolio.

<h3 id="get-memberships-from-a-portfolio-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/portfolio_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the portfolio.|
|?user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-memberships-from-a-portfolio-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [PortfolioMembershipCompact](#schemaportfoliomembershipcompact)</span>|Successfully retrieved the requested portfolio's memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-projects">Projects</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-projects"><span class="get-verb">GET</span> <span class=""nn>/projects</span></a><br><a href="#create-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects</span></a><br><a href="#get-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}</span></a><br><a href="#update-a-project"><span class="put-verb">PUT</span> <span class=""nn>/projects/{project_gid}</span></a><br><a href="#delete-a-project"><span class="delete-verb">DELETE</span> <span class=""nn>/projects/{project_gid}</span></a><br><a href="#duplicate-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/duplicate</span></a><br><a href="#get-projects-a-task-is-in"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/projects</span></a><br><a href="#get-a-team-39-s-projects"><span class="get-verb">GET</span> <span class=""nn>/teams/{team_gid}/projects</span></a><br><a href="#create-a-project-in-a-team"><span class="post-verb">POST</span> <span class=""nn>/teams/{team_gid}/projects</span></a><br><a href="#get-all-projects-in-a-workspace"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/projects</span></a><br><a href="#create-a-project-in-a-workspace"><span class="post-verb">POST</span> <span class=""nn>/workspaces/{workspace_gid}/projects</span></a><br><a href="#add-a-custom-field-to-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/addCustomFieldSetting</span></a><br><a href="#remove-a-custom-field-from-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/removeCustomFieldSetting</span></a><br><a href="#get-task-count-of-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/task_counts</span></a><br><a href="#add-users-to-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/addMembers</span></a><br><a href="#remove-users-from-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/removeMembers</span></a><br><a href="#add-followers-to-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/addFollowers</span></a><br><a href="#remove-followers-from-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/removeFollowers</span></a></code>
</pre>

A `project` represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.

Projects in organizations are shared with a single team. You cannot currently change the team of a project via the API. Non-organization workspaces do not have teams and so you should not specify the team of project in a regular workspace.

Followers of a project are a subset of the members of that project. Followers of a project will receive all updates including tasks created, added and removed from that project. Members of the project have access to and will receive status updates of the project. Adding followers to a project will add them as members if they are not already, removing followers from a project will not affect membership.

</section>
<hr class="half-line">
<section>
## Get multiple projects

<a id="opIdgetProjects"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects</code>
</p>

Returns the compact project records for some filtered set of projects. Use one or more of the parameters provided to filter the projects returned.

<h3 id="get-multiple-projects-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?workspace<span class="param-type"> string</span>|The workspace or organization to filter projects on.|
|?team<span class="param-type"> string</span>|The team to filter projects on.|
|?archived<span class="param-type"> boolean</span>|Only return projects whose `archived` field takes on the value of this parameter.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-multiple-projects-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectCompact](#schemaprojectcompact)</span>|Successfully retrieved projects.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a project

<a id="opIdcreateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "created_by": {
        "name": "Greg Sanchez"
      },
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "text": "The project is moving forward according to plan...",
      "title": "Status Update - Jun 15"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "followers": "12345,23456",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "name": "Stuff to buy",
    "notes": "These are things we need to purchase.",
    "owner": "12345",
    "public": false,
    "start_on": "2019-09-14",
    "team": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "current_status": {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "color": "green",
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "project": "123456",
      "text": "The project is moving forward according to plan...",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting"
      }
    ],
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "public": false,
    "start_on": "2019-09-14",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "name": "Status",
        "number_value": 5.2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /projects</code>
</p>

Create a new project in a workspace or team.

Every project is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the `workspace` parameter regardless of whether or not it is an
organization.

If the workspace for your project is an organization, you must also
supply a `team` to share the project with.

Returns the full record of the newly created project.

<h3 id="create-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The project to create.|
|» data<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|»» archived<span class="param-type"> boolean</span>|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|»» color<span class="param-type"> string¦null</span>|Color of the project.|
|»» current_status<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|»»» color<span class="param-type"> string</span><div class="param-required">required</div>|The color associated with the status update.|
|»»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|»»» text<span class="param-type"> string</span><div class="param-required">required</div>|The text content of the status update.|
|»»» title<span class="param-type"> string</span>|The title of the project status update.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» default_view<span class="param-type"> string</span>|The default view (list, board, calendar, or timeline) of a project.|
|»» due_date<span class="param-type"> string(date-time)¦null</span>|*Deprecated: new integrations should prefer the due_on field.*|
|»» due_on<span class="param-type"> string(date-time)¦null</span>|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|»» followers<span class="param-type"> string</span>|*Create-only*. Comma separated string of users. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the project with formatting as HTML.|
|»» is_template<span class="param-type"> boolean</span>|[Opt In](#input-output-options). Determines if the project is a template.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the project.|
|»» owner<span class="param-type"> string¦null</span>|The current owner of the project, may be null.|
|»» public<span class="param-type"> boolean</span>|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|»» team<span class="param-type"> string</span>|*Create-only*. The team that this project is shared with. This field only exists for projects in organizations.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|
| color|green|
| color|yellow|
| color|red|
| default_view|list|
| default_view|board|
| default_view|calendar|
| default_view|timeline|

<h3 id="create-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Project](#schemaproject)</span>|Successfully retrieved projects.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a project

<a id="opIdgetProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "current_status": {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "color": "green",
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "project": "123456",
      "text": "The project is moving forward according to plan...",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting"
      }
    ],
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "public": false,
    "start_on": "2019-09-14",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "name": "Status",
        "number_value": 5.2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}</code>
</p>

Returns the complete project record for a single project.

<h3 id="get-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Project](#schemaproject)</span>|Successfully retrieved the requested project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a project

<a id="opIdupdateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "created_by": {
        "name": "Greg Sanchez"
      },
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "text": "The project is moving forward according to plan...",
      "title": "Status Update - Jun 15"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "followers": "12345,23456",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "name": "Stuff to buy",
    "notes": "These are things we need to purchase.",
    "owner": "12345",
    "public": false,
    "start_on": "2019-09-14",
    "team": "12345"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "current_status": {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "color": "green",
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "project": "123456",
      "text": "The project is moving forward according to plan...",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting"
      }
    ],
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "public": false,
    "start_on": "2019-09-14",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "name": "Status",
        "number_value": 5.2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /projects/{project_gid}</code>
</p>

A specific, existing project can be updated by making a PUT request on
the URL for that project. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated project record.

<h3 id="update-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The updated fields for the project.|
|» data<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|»» archived<span class="param-type"> boolean</span>|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|»» color<span class="param-type"> string¦null</span>|Color of the project.|
|»» current_status<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|»»» color<span class="param-type"> string</span><div class="param-required">required</div>|The color associated with the status update.|
|»»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|»»» text<span class="param-type"> string</span><div class="param-required">required</div>|The text content of the status update.|
|»»» title<span class="param-type"> string</span>|The title of the project status update.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» default_view<span class="param-type"> string</span>|The default view (list, board, calendar, or timeline) of a project.|
|»» due_date<span class="param-type"> string(date-time)¦null</span>|*Deprecated: new integrations should prefer the due_on field.*|
|»» due_on<span class="param-type"> string(date-time)¦null</span>|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|»» followers<span class="param-type"> string</span>|*Create-only*. Comma separated string of users. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the project with formatting as HTML.|
|»» is_template<span class="param-type"> boolean</span>|[Opt In](#input-output-options). Determines if the project is a template.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the project.|
|»» owner<span class="param-type"> string¦null</span>|The current owner of the project, may be null.|
|»» public<span class="param-type"> boolean</span>|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|»» team<span class="param-type"> string</span>|*Create-only*. The team that this project is shared with. This field only exists for projects in organizations.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|
| color|green|
| color|yellow|
| color|red|
| default_view|list|
| default_view|board|
| default_view|calendar|
| default_view|timeline|

<h3 id="update-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Project](#schemaproject)</span>|Successfully updated the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a project

<a id="opIddeleteProject"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /projects/{project_gid}</code>
</p>

A specific, existing project can be deleted by making a DELETE request on
the URL for that project.

Returns an empty data record.

<h3 id="delete-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Duplicate a project

<a id="opIdduplicateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/duplicate \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "include": [
      "members",
      "task_notes"
    ],
    "name": "New Project Name",
    "schedule_dates": {
      "due_on": "2019-05-21",
      "should_skip_weekends": true,
      "start_on": "2019-05-21"
    },
    "team": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "job",
    "new_project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "resource_subtype": "duplicate_task",
    "status": "in_progress"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/duplicate</code>
</p>

Creates and returns a job that will asynchronously handle the duplication.

<h3 id="duplicate-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|Describes the duplicate's name and the elements that will be duplicated.|
|» data<span class="param-type"> object</span>|none|
|»» include<span class="param-type"> string</span>|The elements that will be duplicated to the new project. Tasks are always included.|
|»» name<span class="param-type"> string</span><div class="param-required">required</div>|The name of the new project.|
|»» schedule_dates<span class="param-type"> object</span>|A dictionary of options to auto-shift dates. `task_dates` must be included to use this option. Requires either `start_on` or `due_on`, but not both.|
|»»» due_on<span class="param-type"> string</span>|Sets the last due date in the duplicated project to the given date. The rest of the due dates will be offset by the same amount as the due dates in the original project.|
|»»» should_skip_weekends<span class="param-type"> boolean</span><div class="param-required">required</div>|Determines if the auto-shifted dates should skip weekends.|
|»»» start_on<span class="param-type"> string</span>|Sets the first start date in the duplicated project to the given date. The rest of the start dates will be offset by the same amount as the start dates in the original project.|
|»» team<span class="param-type"> string</span>|Sets the team of the new project. If team is not defined, the new project will be in the same team as the the original project.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| include|members|
| include|notes|
| include|task_notes|
| include|task_assignee|
| include|task_subtasks|
| include|task_attachments|
| include|task_dates|
| include|task_dependencies|
| include|task_followers|
| include|task_tags|
| include|task_projects|

<h3 id="duplicate-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Job](#schemajob)</span>|Successfully created the job to handle duplication.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get projects a task is in

<a id="opIdgetProjectsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/projects</code>
</p>

Returns a compact representation of all of the projects the task is in.

<h3 id="get-projects-a-task-is-in-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-projects-a-task-is-in-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectCompact](#schemaprojectcompact)</span>|Successfully retrieved the projects for the given task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a team's projects

<a id="opIdgetProjectsForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /teams/{team_gid}/projects</code>
</p>

Returns the compact project records for all projects in the team.

<h3 id="get-a-team's-projects-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?archived<span class="param-type"> boolean</span>|Only return projects whose `archived` field takes on the value of this parameter.|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-team's-projects-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectCompact](#schemaprojectcompact)</span>|Successfully retrieved the requested team's projects.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a project in a team

<a id="opIdcreateProjectForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "created_by": {
        "name": "Greg Sanchez"
      },
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "text": "The project is moving forward according to plan...",
      "title": "Status Update - Jun 15"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "followers": "12345,23456",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "name": "Stuff to buy",
    "notes": "These are things we need to purchase.",
    "owner": "12345",
    "public": false,
    "start_on": "2019-09-14",
    "team": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "current_status": {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "color": "green",
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "project": "123456",
      "text": "The project is moving forward according to plan...",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting"
      }
    ],
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "public": false,
    "start_on": "2019-09-14",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "name": "Status",
        "number_value": 5.2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /teams/{team_gid}/projects</code>
</p>

Creates a project shared with the given team.

Returns the full record of the newly created project.

<h3 id="create-a-project-in-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The new project to create.|
|» data<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|»» archived<span class="param-type"> boolean</span>|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|»» color<span class="param-type"> string¦null</span>|Color of the project.|
|»» current_status<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|»»» color<span class="param-type"> string</span><div class="param-required">required</div>|The color associated with the status update.|
|»»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|»»» text<span class="param-type"> string</span><div class="param-required">required</div>|The text content of the status update.|
|»»» title<span class="param-type"> string</span>|The title of the project status update.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» default_view<span class="param-type"> string</span>|The default view (list, board, calendar, or timeline) of a project.|
|»» due_date<span class="param-type"> string(date-time)¦null</span>|*Deprecated: new integrations should prefer the due_on field.*|
|»» due_on<span class="param-type"> string(date-time)¦null</span>|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|»» followers<span class="param-type"> string</span>|*Create-only*. Comma separated string of users. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the project with formatting as HTML.|
|»» is_template<span class="param-type"> boolean</span>|[Opt In](#input-output-options). Determines if the project is a template.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the project.|
|»» owner<span class="param-type"> string¦null</span>|The current owner of the project, may be null.|
|»» public<span class="param-type"> boolean</span>|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|»» team<span class="param-type"> string</span>|*Create-only*. The team that this project is shared with. This field only exists for projects in organizations.|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|
| color|green|
| color|yellow|
| color|red|
| default_view|list|
| default_view|board|
| default_view|calendar|
| default_view|timeline|

<h3 id="create-a-project-in-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Project](#schemaproject)</span>|Successfully created the specified project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get all projects in a workspace

<a id="opIdgetProjectsForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/projects</code>
</p>

Returns the compact project records for all projects in the workspace.

<h3 id="get-all-projects-in-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?archived<span class="param-type"> boolean</span>|Only return projects whose `archived` field takes on the value of this parameter.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-all-projects-in-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectCompact](#schemaprojectcompact)</span>|Successfully retrieved the requested workspace's projects.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a project in a workspace

<a id="opIdcreateProjectForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "created_by": {
        "name": "Greg Sanchez"
      },
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "text": "The project is moving forward according to plan...",
      "title": "Status Update - Jun 15"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "followers": "12345,23456",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "name": "Stuff to buy",
    "notes": "These are things we need to purchase.",
    "owner": "12345",
    "public": false,
    "start_on": "2019-09-14",
    "team": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "created_at": "2012-02-22T02:06:58.147Z",
    "current_status": {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "color": "green",
      "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
      "project": "123456",
      "text": "The project is moving forward according to plan...",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    },
    "custom_field_settings": [
      {
        "gid": "12345",
        "resource_type": "custom_field_setting"
      }
    ],
    "default_view": "calendar",
    "due_date": "2019-09-15",
    "due_on": "2019-09-15",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "members": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "public": false,
    "start_on": "2019-09-14",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "name": "Status",
        "number_value": 5.2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /workspaces/{workspace_gid}/projects</code>
</p>

Returns the compact project records for all projects in the workspace.

If the workspace for your project is an organization, you must also
supply a team to share the project with.

Returns the full record of the newly created project.

<h3 id="create-a-project-in-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The new project to create.|
|» data<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|»» archived<span class="param-type"> boolean</span>|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|»» color<span class="param-type"> string¦null</span>|Color of the project.|
|»» current_status<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|»»» color<span class="param-type"> string</span><div class="param-required">required</div>|The color associated with the status update.|
|»»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|»»» text<span class="param-type"> string</span><div class="param-required">required</div>|The text content of the status update.|
|»»» title<span class="param-type"> string</span>|The title of the project status update.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» default_view<span class="param-type"> string</span>|The default view (list, board, calendar, or timeline) of a project.|
|»» due_date<span class="param-type"> string(date-time)¦null</span>|*Deprecated: new integrations should prefer the due_on field.*|
|»» due_on<span class="param-type"> string(date-time)¦null</span>|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|»» followers<span class="param-type"> string</span>|*Create-only*. Comma separated string of users. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the project with formatting as HTML.|
|»» is_template<span class="param-type"> boolean</span>|[Opt In](#input-output-options). Determines if the project is a template.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the project.|
|»» owner<span class="param-type"> string¦null</span>|The current owner of the project, may be null.|
|»» public<span class="param-type"> boolean</span>|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|»» team<span class="param-type"> string</span>|*Create-only*. The team that this project is shared with. This field only exists for projects in organizations.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|
| color|green|
| color|yellow|
| color|red|
| default_view|list|
| default_view|board|
| default_view|calendar|
| default_view|timeline|

<h3 id="create-a-project-in-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Project](#schemaproject)</span>|Successfully created a new project in the specified workspace.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Add a custom field to a project

<a id="opIdaddCustomFieldSettingForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "custom_field": "14916",
    "insert_after": "1331",
    "insert_before": "1331",
    "is_important": true
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/addCustomFieldSetting</code>
</p>

Custom fields are associated with projects by way of custom field settings.  This method creates a setting for the project.

<h3 id="add-a-custom-field-to-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the custom field setting.|
|» data<span class="param-type"> object</span>|none|
|»» custom_field<span class="param-type"> string</span><div class="param-required">required</div>|The custom field to associate with this container.|
|»» insert_after<span class="param-type"> string</span>|A gid of a Custom Field Setting on this container, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|»» insert_before<span class="param-type"> string</span>|A gid of a Custom Field Setting on this container, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|»» is_important<span class="param-type"> boolean</span>|Whether this field should be considered important to this container (for instance, to display in the list view of items in the container).|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|

<h3 id="add-a-custom-field-to-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the custom field to the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-a-custom-field-to-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove a custom field from a project

<a id="opIdremoveCustomFieldSettingForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "custom_field": "14916"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/removeCustomFieldSetting</code>
</p>

Removes a custom field setting from a project.

<h3 id="remove-a-custom-field-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the custom field setting being removed.|
|» data<span class="param-type"> object</span>|none|
|»» custom_field<span class="param-type"> string</span><div class="param-required">required</div>|The custom field to remove from this portfolio.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|

<h3 id="remove-a-custom-field-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the custom field from the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-custom-field-from-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get task count of a project

<a id="opIdgetTaskCountsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/task_counts \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "num_completed_milestones": 3,
    "num_completed_tasks": 150,
    "num_incomplete_milestones": 7,
    "num_incomplete_tasks": 50,
    "num_milestones": 10,
    "num_tasks": 200
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/task_counts</code>
</p>

Get an object that holds task count fields. **All fields are excluded by default**. You must [opt in](#input-output-options) using `opt_fields` to get any information from this endpoint.

This endpoint has an additional [rate limit](#standard-rate-limits) and each field counts especially high against our [cost limits](#cost-limits).

Milestones are just tasks, so they are included in the `num_tasks`, `num_incomplete_tasks`, and `num_completed_tasks` counts.

<h3 id="get-task-count-of-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-task-count-of-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully retrieved the requested project's task counts.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="get-task-count-of-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [TaskCountResponse](#schemataskcountresponse)</span>|A response object returned from the task count endpoint.|
| num_completed_milestones<span class="param-type"> integer</span>|The number of completed milestones in a project.|
| num_completed_tasks<span class="param-type"> integer</span>|The number of completed tasks in a project.|
| num_incomplete_milestones<span class="param-type"> integer</span>|The number of incomplete milestones in a project.|
| num_incomplete_tasks<span class="param-type"> integer</span>|The number of incomplete tasks in a project.|
| num_milestones<span class="param-type"> integer</span>|The number of milestones in a project.|
| num_tasks<span class="param-type"> integer</span>|The number of tasks in a project.|

</section><hr class="half-line">
<section>
## Add users to a project

<a id="opIdaddMembersForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/addMembers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "members": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/addMembers</code>
</p>

Adds the specified list of users as members of the project.
Returns the updated project record.

<h3 id="add-users-to-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the members being added.|
|» data<span class="param-type"> object</span>|none|
|»» members<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-users-to-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added members to the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-users-to-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove users from a project

<a id="opIdremoveMembersForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/removeMembers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "members": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/removeMembers</code>
</p>

Removes the specified list of users from members of the project.
Returns the updated project record.

<h3 id="remove-users-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the members being removed.|
|» data<span class="param-type"> object</span>|none|
|»» members<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-users-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the members from the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-users-from-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Add followers to a project

<a id="opIdaddFollowersForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/addFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "followers": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/addFollowers</code>
</p>

Adds the specified list of users as followers to the project. Followers are a subset of members, therefore if the users are not already members of the project they will also become members as a result of this operation.
Returns the updated project record.

<h3 id="add-followers-to-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the followers being added.|
|» data<span class="param-type"> object</span>|none|
|»» followers<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-followers-to-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added followers to the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-followers-to-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove followers from a project

<a id="opIdremoveFollowersForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/removeFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "followers": "521621,621373"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/removeFollowers</code>
</p>

Removes the specified list of users from following the project, this will not affect project membership status.
Returns the updated project record.

<h3 id="remove-followers-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Information about the followers being removed.|
|» data<span class="param-type"> object</span>|none|
|»» followers<span class="param-type"> string</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-followers-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed followers from the project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-followers-from-a-project-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-project-memberships">Project Memberships</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-project-membership"><span class="get-verb">GET</span> <span class=""nn>/project_memberships/{project_membership_gid}</span></a><br><a href="#get-memberships-from-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/project_memberships</span></a></code>
</pre>

With the introduction of “comment-only” projects in Asana, a user’s membership in a project comes with associated permissions. These permissions (whether a user has full access to the project or comment-only access) are accessible through the project memberships endpoints described here.

</section>
<hr class="half-line">
<section>
## Get a project membership

<a id="opIdgetProjectMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/project_memberships/{project_membership_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project_membership",
    "user": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "write_access": "full_write"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /project_memberships/{project_membership_gid}</code>
</p>

Returns the complete project record for a single project membership.

<h3 id="get-a-project-membership-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_membership_gid<span class="param-type"> string</span><div class="param-required">required</div>|none|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-project-membership-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectMembership](#schemaprojectmembership)</span>|Successfully retrieved the requested project membership.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get memberships from a project

<a id="opIdgetProjectMembershipsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project_membership",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/project_memberships</code>
</p>

Returns the compact project membership records for the project.

<h3 id="get-memberships-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-memberships-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectMembershipCompact](#schemaprojectmembershipcompact)</span>|Successfully retrieved the requested project's memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-project-statuses">Project Statuses</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-project-status"><span class="get-verb">GET</span> <span class=""nn>/project_statuses/{project_status_gid}</span></a><br><a href="#delete-a-project-status"><span class="delete-verb">DELETE</span> <span class=""nn>/project_statuses/{project_status_gid}</span></a><br><a href="#get-statuses-from-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/project_statuses</span></a><br><a href="#create-a-project-status"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/project_statuses</span></a></code>
</pre>

A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: “green” for projects that are on track, “yellow” for projects at risk, and “red” for projects that are behind.

Project statuses can be created and deleted, but not modified.

</section>
<hr class="half-line">
<section>
## Get a project status

<a id="opIdgetProjectStatus"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/project_statuses/{project_status_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project_status",
    "title": "Status Update - Jun 15",
    "color": "green",
    "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
    "project": "123456",
    "text": "The project is moving forward according to plan...",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /project_statuses/{project_status_gid}</code>
</p>

Returns the complete record for a single status update.

<h3 id="get-a-project-status-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_status_gid<span class="param-type"> string</span><div class="param-required">required</div>|The project status update to get.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-project-status-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectStatus](#schemaprojectstatus)</span>|Successfully retrieved the specified project's status updates.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a project status

<a id="opIddeleteProjectStatus"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/project_statuses/{project_status_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /project_statuses/{project_status_gid}</code>
</p>

Deletes a specific, existing project status update.

Returns an empty data record.

<h3 id="delete-a-project-status-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_status_gid<span class="param-type"> string</span><div class="param-required">required</div>|The project status update to get.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-project-status-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified project status.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-project-status-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get statuses from a project

<a id="opIdgetProjectStatusesForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/project_statuses</code>
</p>

Returns the compact project status update records for all updates on the project.

<h3 id="get-statuses-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-statuses-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [ProjectStatusCompact](#schemaprojectstatuscompact)</span>|Successfully retrieved the specified project's status updates.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a project status

<a id="opIdcreateProjectStatusForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "green",
    "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
    "text": "The project is moving forward according to plan...",
    "title": "Status Update - Jun 15"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "project_status",
    "title": "Status Update - Jun 15",
    "color": "green",
    "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
    "project": "123456",
    "text": "The project is moving forward according to plan...",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/project_statuses</code>
</p>

Creates a new status update on the project.
Returns the full record of the newly created project status update.

<h3 id="create-a-project-status-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The project status to create.|
|» data<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|»» color<span class="param-type"> string</span><div class="param-required">required</div>|The color associated with the status update.|
|»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|»» text<span class="param-type"> string</span><div class="param-required">required</div>|The text content of the status update.|
|»» title<span class="param-type"> string</span>|The title of the project status update.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|green|
| color|yellow|
| color|red|

<h3 id="create-a-project-status-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [ProjectStatus](#schemaprojectstatus)</span>|Successfully created a new story.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-sections">Sections</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-section"><span class="get-verb">GET</span> <span class=""nn>/sections/{section_gid}</span></a><br><a href="#update-a-section"><span class="put-verb">PUT</span> <span class=""nn>/sections/{section_gid}</span></a><br><a href="#delete-a-section"><span class="delete-verb">DELETE</span> <span class=""nn>/sections/{section_gid}</span></a><br><a href="#get-sections-in-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/sections</span></a><br><a href="#create-a-section-in-a-project"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/sections</span></a><br><a href="#add-task-to-section"><span class="post-verb">POST</span> <span class=""nn>/sections/{section_gid}/addTask</span></a><br><a href="#move-or-insert-sections"><span class="post-verb">POST</span> <span class=""nn>/projects/{project_gid}/sections/insert</span></a></code>
</pre>

A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.

Sections are largely a shared idiom in Asana’s API for both list and board views of a project regardless of the project’s layout.

The ‘memberships’ property when [getting a task](#get-a-task) will return the information for the section or the column under ‘section’ in the response.

</section>
<hr class="half-line">
<section>
## Get a section

<a id="opIdgetSection"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ]
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /sections/{section_gid}</code>
</p>

Returns the complete record for a single section.

<h3 id="get-a-section-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/section_gid<span class="param-type"> string</span><div class="param-required">required</div>|The globally unique identifier for the section.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-section-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Section](#schemasection)</span>|Successfully retrieved section.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a section

<a id="opIdupdateSection"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "name": "Next Actions",
    "project": "13579"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ]
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /sections/{section_gid}</code>
</p>

A specific, existing section can be updated by making a PUT request on
the URL for that project. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged. (note that
at this time, the only field that can be updated is the `name` field.)

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated section record.

<h3 id="update-a-section-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The section to create.|
|» data<span class="param-type"> object</span>|none|
|»» name<span class="param-type"> string</span><div class="param-required">required</div>|The text to be displayed as the section name. This cannot be an empty string.|
|»» project<span class="param-type"> string</span><div class="param-required">required</div>|*Create-Only* The project to create the section in|
|/section_gid<span class="param-type"> string</span><div class="param-required">required</div>|The globally unique identifier for the section.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="update-a-section-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Section](#schemasection)</span>|Successfully updated the specified section.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a section

<a id="opIddeleteSection"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /sections/{section_gid}</code>
</p>

A specific, existing section can be deleted by making a DELETE request on
the URL for that section.

Note that sections must be empty to be deleted.

The last remaining section in a board view cannot be deleted.

Returns an empty data block.

<h3 id="delete-a-section-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/section_gid<span class="param-type"> string</span><div class="param-required">required</div>|The globally unique identifier for the section.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-section-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified section.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-section-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get sections in a project

<a id="opIdgetSectionsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/sections \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/sections</code>
</p>

Returns the compact records for all sections in the specified project.

<h3 id="get-sections-in-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-sections-in-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [SectionCompact](#schemasectioncompact)</span>|Successfully retrieved sections in project.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a section in a project

<a id="opIdcreateSectionForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/sections \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "name": "Next Actions",
    "project": "13579"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ]
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/sections</code>
</p>

Creates a new section in a project.
Returns the full record of the newly created section.

<h3 id="create-a-section-in-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The section to create.|
|» data<span class="param-type"> object</span>|none|
|»» name<span class="param-type"> string</span><div class="param-required">required</div>|The text to be displayed as the section name. This cannot be an empty string.|
|»» project<span class="param-type"> string</span><div class="param-required">required</div>|*Create-Only* The project to create the section in|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="create-a-section-in-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Section](#schemasection)</span>|Successfully created the specified section.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Add task to section

<a id="opIdaddTaskForSection"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/sections/{section_gid}/addTask \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "insert_after": "987654",
    "insert_before": "86420",
    "task": "123456"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /sections/{section_gid}/addTask</code>
</p>

Add a task to a specific, existing section. This will remove the task from other sections of the project.

The task will be inserted at the top of a section unless an insert_before or insert_after parameter is declared.

This does not work for separators (tasks with the resource_subtype of section).

<h3 id="add-task-to-section-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The task and optionally the insert location.|
|» data<span class="param-type"> object</span>|none|
|»» insert_after<span class="param-type"> string</span>|An existing task within this section after which the added task should be inserted. Cannot be provided together with insert_before.|
|»» insert_before<span class="param-type"> string</span>|An existing task within this section before which the added task should be inserted. Cannot be provided together with insert_after.|
|»» task<span class="param-type"> string</span><div class="param-required">required</div>|The task to add to this section.|
|/section_gid<span class="param-type"> string</span><div class="param-required">required</div>|The globally unique identifier for the section.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-task-to-section-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-task-to-section-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Move or Insert sections

<a id="opIdinsertSectionForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "after_section": "987654",
    "before_section": "86420",
    "project": "123456",
    "section": "321654"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /projects/{project_gid}/sections/insert</code>
</p>

Move sections relative to each other in a board view. One of
`before_section` or `after_section` is required.

Sections cannot be moved between projects.

Returns an empty data block.

<h3 id="move-or-insert-sections-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The section's move action.|
|» data<span class="param-type"> object</span>|none|
|»» after_section<span class="param-type"> string</span>|Insert the given section immediately after the section specified by this parameter.|
|»» before_section<span class="param-type"> string</span>|Insert the given section immediately before the section specified by this parameter.|
|»» project<span class="param-type"> string</span><div class="param-required">required</div>|The project in which to reorder the given section.|
|»» section<span class="param-type"> string</span><div class="param-required">required</div>|The section to reorder.|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="move-or-insert-sections-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully moved the specified section.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="move-or-insert-sections-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-stories">Stories</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-story"><span class="get-verb">GET</span> <span class=""nn>/stories/{story_gid}</span></a><br><a href="#update-a-story"><span class="put-verb">PUT</span> <span class=""nn>/stories/{story_gid}</span></a><br><a href="#delete-a-story"><span class="delete-verb">DELETE</span> <span class=""nn>/stories/{story_gid}</span></a><br><a href="#get-stories-from-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/stories</span></a><br><a href="#create-a-story-on-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/stories</span></a></code>
</pre>

*See [our forum post](https://forum.asana.com/t/no-more-parsing-story-text-new-fields-on-stories/42924) for more info on when conditional fields are returned.*

A *story* represents an activity associated with an object in the Asana system. Stories are generated by the system whenever users take actions such as creating or assigning tasks, or moving tasks between projects. *Comments* are also a form of user-generated story.

</section>
<hr class="half-line">
<section>
## Get a story

<a id="opIdgetStory"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "story",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "resource_subtype": "comment_added",
    "text": "This is a comment.",
    "type": "comment",
    "html_text": "<body>This is a comment.<body>",
    "is_pinned": false,
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field": {
      "gid": "12345",
      "resource_type": "custom_field",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "name": "Status",
      "number_value": 5.2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    },
    "dependency": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicate_of": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "follower": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "hearted": false,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "is_edited": false,
    "liked": false,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "new_approval_status": "approved",
    "new_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "new_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "new_name": "This is the New Name",
    "new_number_value": 2,
    "new_resource_subtype": "milestone",
    "new_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_text_value": "This is the New Text",
    "num_hearts": 5,
    "num_likes": 5,
    "old_approval_status": "pending",
    "old_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "old_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "old_name": "This was the Old Name",
    "old_number_value": 1,
    "old_resource_subtype": "default_task",
    "old_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "old_text_value": "This was the Old Text",
    "previews": [
      {
        "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
        "footer": "Mar 17, 2019 1:25 PM",
        "header": "Asana for Slack",
        "header_link": "https://asana.comn/apps/slack",
        "html_text": "<body>Great! I like this idea.</body>",
        "text": "Great! I like this idea.",
        "title": "Greg",
        "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
      }
    ],
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "source": "web",
    "story": {
      "gid": "12345",
      "resource_type": "story",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "resource_subtype": "comment_added",
      "text": "marked today",
      "type": "comment"
    },
    "tag": {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "target": {
      "gid": "1234",
      "name": "Bug Task"
    },
    "task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /stories/{story_gid}</code>
</p>

Returns the full record for a single story.

<h3 id="get-a-story-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|/story_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the story.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-story-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Story](#schemastory)</span>|Successfully retrieved the specified story.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a story

<a id="opIdupdateStory"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "created_by": {
      "name": "Greg Sanchez"
    },
    "html_text": "<body>This is a comment.<body>",
    "is_pinned": false,
    "text": "This is a comment."
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "story",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "resource_subtype": "comment_added",
    "text": "This is a comment.",
    "type": "comment",
    "html_text": "<body>This is a comment.<body>",
    "is_pinned": false,
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field": {
      "gid": "12345",
      "resource_type": "custom_field",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "name": "Status",
      "number_value": 5.2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    },
    "dependency": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicate_of": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "follower": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "hearted": false,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "is_edited": false,
    "liked": false,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "new_approval_status": "approved",
    "new_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "new_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "new_name": "This is the New Name",
    "new_number_value": 2,
    "new_resource_subtype": "milestone",
    "new_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_text_value": "This is the New Text",
    "num_hearts": 5,
    "num_likes": 5,
    "old_approval_status": "pending",
    "old_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "old_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "old_name": "This was the Old Name",
    "old_number_value": 1,
    "old_resource_subtype": "default_task",
    "old_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "old_text_value": "This was the Old Text",
    "previews": [
      {
        "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
        "footer": "Mar 17, 2019 1:25 PM",
        "header": "Asana for Slack",
        "header_link": "https://asana.comn/apps/slack",
        "html_text": "<body>Great! I like this idea.</body>",
        "text": "Great! I like this idea.",
        "title": "Greg",
        "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
      }
    ],
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "source": "web",
    "story": {
      "gid": "12345",
      "resource_type": "story",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "resource_subtype": "comment_added",
      "text": "marked today",
      "type": "comment"
    },
    "tag": {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "target": {
      "gid": "1234",
      "name": "Bug Task"
    },
    "task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /stories/{story_gid}</code>
</p>

Updates the story and returns the full record for the updated story. Only comment stories can have their text updated, and only comment stories and attachment stories can be pinned. Only one of `text` and `html_text` can be specified.

<h3 id="update-a-story-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The comment story to update.|
|» data<span class="param-type"> object</span>|A story represents an activity associated with an object in the Asana system.|
|»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). HTML formatted text for a comment. This will not include the name of the creator.|
|»» is_pinned<span class="param-type"> boolean</span>|*Conditional*. Whether the story should be pinned on the resource.|
|»» text<span class="param-type"> string</span>|The plain text of the comment to add. Cannot be used with html_text.|
|/story_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the story.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="update-a-story-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Story](#schemastory)</span>|Successfully retrieved the specified story.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a story

<a id="opIddeleteStory"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /stories/{story_gid}</code>
</p>

Deletes a story. A user can only delete stories they have created.

Returns an empty data record.

<h3 id="delete-a-story-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/story_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the story.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-story-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified story.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-story-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Get stories from a task

<a id="opIdgetStoriesForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/stories \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "story",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "resource_subtype": "comment_added",
      "text": "marked today",
      "type": "comment"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/stories</code>
</p>

Returns the compact records for all stories on the task.

<h3 id="get-stories-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-stories-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [StoryCompact](#schemastorycompact)</span>|Successfully retrieved the specified task's stories.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a story on a task

<a id="opIdcreateStoryForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/stories \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "created_by": {
      "name": "Greg Sanchez"
    },
    "html_text": "<body>This is a comment.<body>",
    "is_pinned": false,
    "text": "This is a comment."
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "story",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "resource_subtype": "comment_added",
    "text": "This is a comment.",
    "type": "comment",
    "html_text": "<body>This is a comment.<body>",
    "is_pinned": false,
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_field": {
      "gid": "12345",
      "resource_type": "custom_field",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "name": "Status",
      "number_value": 5.2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    },
    "dependency": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicate_of": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "follower": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "hearted": false,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "is_edited": false,
    "liked": false,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "new_approval_status": "approved",
    "new_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "new_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "new_name": "This is the New Name",
    "new_number_value": 2,
    "new_resource_subtype": "milestone",
    "new_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_text_value": "This is the New Text",
    "num_hearts": 5,
    "num_likes": 5,
    "old_approval_status": "pending",
    "old_dates": {
      "due_at": "2019-09-15T02:06:58.158Z",
      "due_on": "2019-09-15",
      "start_on": "2019-09-14"
    },
    "old_enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "old_name": "This was the Old Name",
    "old_number_value": 1,
    "old_resource_subtype": "default_task",
    "old_section": {
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "old_text_value": "This was the Old Text",
    "previews": [
      {
        "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
        "footer": "Mar 17, 2019 1:25 PM",
        "header": "Asana for Slack",
        "header_link": "https://asana.comn/apps/slack",
        "html_text": "<body>Great! I like this idea.</body>",
        "text": "Great! I like this idea.",
        "title": "Greg",
        "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
      }
    ],
    "project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "source": "web",
    "story": {
      "gid": "12345",
      "resource_type": "story",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "resource_subtype": "comment_added",
      "text": "marked today",
      "type": "comment"
    },
    "tag": {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "target": {
      "gid": "1234",
      "name": "Bug Task"
    },
    "task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/stories</code>
</p>

Adds a story to a task. This endpoint currently only allows for comment
stories to be created. The comment will be authored by the currently
authenticated user, and timestamped when the server receives the request.

Returns the full record for the new story added to the task.

<h3 id="create-a-story-on-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The story to create.|
|» data<span class="param-type"> object</span>|A story represents an activity associated with an object in the Asana system.|
|»» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). HTML formatted text for a comment. This will not include the name of the creator.|
|»» is_pinned<span class="param-type"> boolean</span>|*Conditional*. Whether the story should be pinned on the resource.|
|»» text<span class="param-type"> string</span>|The plain text of the comment to add. Cannot be used with html_text.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="create-a-story-on-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Story](#schemastory)</span>|Successfully created a new story.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-tags">Tags</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-tags"><span class="get-verb">GET</span> <span class=""nn>/tags</span></a><br><a href="#create-a-tag"><span class="post-verb">POST</span> <span class=""nn>/tags</span></a><br><a href="#get-a-tag"><span class="get-verb">GET</span> <span class=""nn>/tags/{tag_gid}</span></a><br><a href="#update-a-tag"><span class="put-verb">PUT</span> <span class=""nn>/tags/{tag_gid}</span></a><br><a href="#get-a-task-39-s-tags"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/tags</span></a><br><a href="#get-tags-in-a-workspace"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/tags</span></a><br><a href="#create-a-tag-in-a-workspace"><span class="post-verb">POST</span> <span class=""nn>/workspaces/{workspace_gid}/tags</span></a></code>
</pre>

A tag is a label that can be attached to any task in Asana. It exists in a single workspace or organization.

Tags have some metadata associated with them, but it is possible that we will simplify them in the future so it is not encouraged to rely too heavily on it. Unlike projects, tags do not provide any ordering on the tasks they are associated with.

</section>
<hr class="half-line">
<section>
## Get multiple tags

<a id="opIdgetTags"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tags</code>
</p>

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

<h3 id="get-multiple-tags-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?workspace<span class="param-type"> string</span>|The workspace to filter tags on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-multiple-tags-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TagCompact](#schematagcompact)</span>|Successfully retrieved the specified set of tags.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a tag

<a id="opIdcreateTag"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tags \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "light-green",
    "followers": [
      "12345",
      "42563"
    ],
    "name": "Stuff to buy",
    "workspace": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "tag",
    "color": "light-green",
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "name": "Stuff to buy",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tags</code>
</p>

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

<h3 id="create-a-tag-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The tag to create.|
|» data<span class="param-type"> object</span>|A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.|
|»» color<span class="param-type"> string</span>|Color of the tag.|
|»» followers<span class="param-type"> [string]</span>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|»» name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» workspace<span class="param-type"> string</span>|Gid of an object.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|

<h3 id="create-a-tag-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Tag](#schematag)</span>|Successfully created the newly specified tag.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a tag

<a id="opIdgetTag"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags/{tag_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "tag",
    "color": "light-green",
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "name": "Stuff to buy",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /tags/{tag_gid}</code>
</p>

Returns the complete tag record for a single tag.

<h3 id="get-a-tag-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/tag_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the tag.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-tag-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Tag](#schematag)</span>|Successfully retrieved the specified tag.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a tag

<a id="opIdupdateTag"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/tags/{tag_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "tag",
    "color": "light-green",
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "name": "Stuff to buy",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /tags/{tag_gid}</code>
</p>

Updates the properties of a tag. Only the fields provided in the `data`
block will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated tag record.

<h3 id="update-a-tag-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/tag_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the tag.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="update-a-tag-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Tag](#schematag)</span>|Successfully updated the specified tag.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a task's tags

<a id="opIdgetTagsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/tags</code>
</p>

Get a compact representation of all of the tags the task has.

<h3 id="get-a-task's-tags-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-task's-tags-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TagCompact](#schematagcompact)</span>|Successfully retrieved the tags for the given task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get tags in a workspace

<a id="opIdgetTagsForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/tags</code>
</p>

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

<h3 id="get-tags-in-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-tags-in-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TagCompact](#schematagcompact)</span>|Successfully retrieved the specified set of tags.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a tag in a workspace

<a id="opIdcreateTagForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "color": "light-green",
    "name": "Stuff to buy",
    "workspace": {
      "name": "My Company Workspace"
    }
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "tag",
    "color": "light-green",
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "name": "Stuff to buy",
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /workspaces/{workspace_gid}/tags</code>
</p>

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

<h3 id="create-a-tag-in-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The tag to create.|
|» data<span class="param-type"> [TagResponse](#schematagresponse)</span>|A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.|
|»» color<span class="param-type"> string</span>|Color of the tag.|
|»» name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|»»» name<span class="param-type"> string</span>|The name of the workspace.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|dark-pink|
| color|dark-green|
| color|dark-blue|
| color|dark-red|
| color|dark-teal|
| color|dark-brown|
| color|dark-orange|
| color|dark-purple|
| color|dark-warm-gray|
| color|light-pink|
| color|light-green|
| color|light-blue|
| color|light-red|
| color|light-teal|
| color|light-brown|
| color|light-orange|
| color|light-purple|
| color|light-warm-gray|

<h3 id="create-a-tag-in-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Tag](#schematag)</span>|Successfully created the newly specified tag.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-tasks">Tasks</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-tasks"><span class="get-verb">GET</span> <span class=""nn>/tasks</span></a><br><a href="#create-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks</span></a><br><a href="#get-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}</span></a><br><a href="#update-a-task"><span class="put-verb">PUT</span> <span class=""nn>/tasks/{task_gid}</span></a><br><a href="#delete-a-task"><span class="delete-verb">DELETE</span> <span class=""nn>/tasks/{task_gid}</span></a><br><a href="#duplicate-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/duplicate</span></a><br><a href="#get-tasks-from-a-project"><span class="get-verb">GET</span> <span class=""nn>/projects/{project_gid}/tasks</span></a><br><a href="#get-tasks-from-a-section"><span class="get-verb">GET</span> <span class=""nn>/sections/{section_gid}/tasks</span></a><br><a href="#get-tasks-from-a-tag"><span class="get-verb">GET</span> <span class=""nn>/tags/{tag_gid}/tasks</span></a><br><a href="#get-tasks-from-a-user-task-list"><span class="get-verb">GET</span> <span class=""nn>/user_task_lists/{user_task_list_gid}/tasks</span></a><br><a href="#get-subtasks-from-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/subtasks</span></a><br><a href="#create-a-subtask"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/subtasks</span></a><br><a href="#set-the-parent-of-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/setParent</span></a><br><a href="#get-dependencies-from-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/dependencies</span></a><br><a href="#set-dependencies-for-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/addDependencies</span></a><br><a href="#unlink-dependencies-from-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/removeDependencies</span></a><br><a href="#get-dependents-from-a-task"><span class="get-verb">GET</span> <span class=""nn>/tasks/{task_gid}/dependents</span></a><br><a href="#set-dependents-for-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/addDependents</span></a><br><a href="#unlink-dependents-from-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/removeDependents</span></a><br><a href="#add-a-project-to-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/addProject</span></a><br><a href="#remove-a-project-from-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/removeProject</span></a><br><a href="#add-a-tag-to-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/addTag</span></a><br><a href="#remove-a-tag-from-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/removeTag</span></a><br><a href="#add-followers-to-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/addFollowers</span></a><br><a href="#remove-followers-from-a-task"><span class="post-verb">POST</span> <span class=""nn>/tasks/{task_gid}/removeFollowers</span></a><br><a href="#search-tasks-in-a-workspace"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/tasks/search</span></a></code>
</pre>

The task is the basic object around which many operations in Asana are centered. In the Asana application, multiple tasks populate the middle pane according to some view parameters, and the set of selected tasks determines the more detailed information presented in the details pane.

Sections are unique in that they will be included in the *memberships* field of task objects returned in the API when the task is within a section. They can also be used to manipulate the ordering of a task within a project.

[Queries](#get-a-set-of-tasks) return a compact representation of each object which is typically the id and name fields. Interested in a specific set of fields or all of the fields? Use [field selectors](#input-output-options) to manipulate what data is included in a response.

</section>
<hr class="half-line">
<section>
## Get multiple tasks

<a id="opIdgetTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks</code>
</p>

Returns the compact task records for some filtered set of tasks. Use one or more of the parameters provided to filter the tasks returned. You must specify a `project` or `tag` if you do not specify `assignee` and `workspace`.

For more complex task retrieval, use [workspaces/{workspace_gid}/tasks/search](#search-tasks-in-a-workspace).

<h3 id="get-multiple-tasks-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?assignee<span class="param-type"> string</span>|The assignee to filter tasks on.|
|?project<span class="param-type"> string</span>|The project to filter tasks on.|
|?section<span class="param-type"> string</span>|The section to filter tasks on.|
|?workspace<span class="param-type"> string</span>|The workspace to filter tasks on.|
|?completed_since<span class="param-type"> string(date-time)</span>|Only return tasks that are either incomplete or that have been completed since this time.|
|?modified_since<span class="param-type"> string(date-time)</span>|Only return tasks that have been modified since the given time.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**assignee**: The assignee to filter tasks on.
*Note: If you specify `assignee`, you must also specify the `workspace` to filter on.*

**section**: The section to filter tasks on.
*Note: Currently, this is only supported in board views.*

**workspace**: The workspace to filter tasks on.
*Note: If you specify `workspace`, you must also specify the `assignee` to filter on.*

**modified_since**: Only return tasks that have been modified since the given time.

*Note: A task is considered “modified” if any of its properties
change, or associations between it and other objects are modified
(e.g.  a task being added to a project). A task is not considered
modified just because another object it is associated with (e.g. a
subtask) is modified. Actions that count as modifying the task
include assigning, renaming, completing, and adding stories.*

<h3 id="get-multiple-tasks-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved requested tasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a task

<a id="opIdcreateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "approval_status": "pending",
    "assignee": "12345",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_by": {
      "name": "Greg Sanchez"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "followers": [
      "12345"
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "liked": true,
    "name": "Buy catnip",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": "12345",
    "projects": [
      "12345"
    ],
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "tags": [
      "12345"
    ],
    "workspace": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "approval_status": "pending",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "completed_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "created_at": "2012-02-22T02:06:58.147Z",
    "dependencies": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "dependents": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "hearted": true,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "is_rendered_as_separator": false,
    "liked": true,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "memberships": [
      {
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "section": {
          "gid": "12345",
          "resource_type": "section",
          "name": "Next Actions"
        }
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ],
    "tags": [
      {
        "gid": "59746",
        "name": "Grade A"
      }
    ],
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks</code>
</p>

Creating a new task is as easy as POSTing to the `/tasks` endpoint with a
data block containing the fields you’d like to set on the task. Any
unspecified fields will take on default values.

Every task is required to be created in a specific workspace, and this
workspace cannot be changed once set. The workspace need not be set
explicitly if you specify `projects` or a `parent` task instead.

<h3 id="create-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The task to create.|
|» data<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|»» approval_status<span class="param-type"> string</span>|*Conditional* Reflects the approval status of this task. This field is kept in sync with `completed`, meaning `pending` translates to false while `approved`, `rejected`, and `changes_requested` translate to true. If you set completed to true, this field will be set to `approved`.|
|»» assignee<span class="param-type"> string¦null</span>|Gid of a user.|
|»» assignee_status<span class="param-type"> string</span>|Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.|
|»» completed<span class="param-type"> boolean</span>|True if the task is currently marked complete, false if not.|
|»» completed_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» due_at<span class="param-type"> string(date)¦null</span>|Date and time on which this task is due, or null if the task has no due time. This takes a UTC timestamp and should not be used together with `due_on`.|
|»» due_on<span class="param-type"> string(date)¦null</span>|Date on which this task is due, or null if the task has no due date.  This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.|
|»» external<span class="param-type"> object</span>|*OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).|
|»»» data<span class="param-type"> string</span>|none|
|»»» gid<span class="param-type"> string</span>|none|
|»» followers<span class="param-type"> [string]</span>|*Create-Only* An array of strings identifying users. These can either be the string "me", an email, or the gid of a user. In order to change followers on an existing task use `addFollowers` and `removeFollowers`.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the text with formatting as HTML.|
|»» liked<span class="param-type"> boolean</span>|True if the task is liked by the authorized user, false if not.|
|»» name<span class="param-type"> string</span>|Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the task.|
|»» parent<span class="param-type"> string¦null</span>|Gid of a task.|
|»» projects<span class="param-type"> [string]</span>|*Create-Only* Array of project gids. In order to change projects on an existing task use `addProject` and `removeProject`.|
|»» resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.|
|»» tags<span class="param-type"> [string]</span>|*Create-Only* Array of tag gids. In order to change tags on an existing task use `addTag` and `removeTag`.|
|»» workspace<span class="param-type"> string</span>|Gid of a workspace.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**assignee_status**: Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.
Setting this field to "inbox" or "upcoming" inserts it at the top of the section, while the other options will insert at the bottom.

**external**: *OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).
The external field allows you to store app-specific metadata on tasks, including a gid that can be used to retrieve tasks and a data blob that can store app-specific character strings. Note that you will need to authenticate with Oauth to access or modify this data. Once an external gid is set, you can use the notation `external:custom_gid` to reference your object anywhere in the API where you may use the original object gid. See the page on Custom External Data for more details.

**resource_subtype**: The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
The resource_subtype `milestone` represent a single moment in time. This means tasks with this subtype cannot have a start_date.

**start_on**: The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.
*Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*

#### Enumerated Values

|Parameter|Value|
|---|---|
| approval_status|pending|
| approval_status|approved|
| approval_status|rejected|
| approval_status|changes_requested|
| assignee_status|today|
| assignee_status|upcoming|
| assignee_status|later|
| assignee_status|new|
| assignee_status|inbox|
| resource_subtype|default_task|
| resource_subtype|milestone|
| resource_subtype|section|
| resource_subtype|approval|

<h3 id="create-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Task](#schematask)</span>|Successfully created a new task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a task

<a id="opIdgetTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "approval_status": "pending",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "completed_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "created_at": "2012-02-22T02:06:58.147Z",
    "dependencies": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "dependents": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "hearted": true,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "is_rendered_as_separator": false,
    "liked": true,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "memberships": [
      {
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "section": {
          "gid": "12345",
          "resource_type": "section",
          "name": "Next Actions"
        }
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ],
    "tags": [
      {
        "gid": "59746",
        "name": "Grade A"
      }
    ],
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}</code>
</p>

Returns the complete task record for a single task.

<h3 id="get-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Task](#schematask)</span>|Successfully retrieved the specified task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a task

<a id="opIdupdateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "approval_status": "pending",
    "assignee": "12345",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_by": {
      "name": "Greg Sanchez"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "followers": [
      "12345"
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "liked": true,
    "name": "Buy catnip",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": "12345",
    "projects": [
      "12345"
    ],
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "tags": [
      "12345"
    ],
    "workspace": "12345"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "approval_status": "pending",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "completed_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "created_at": "2012-02-22T02:06:58.147Z",
    "dependencies": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "dependents": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "hearted": true,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "is_rendered_as_separator": false,
    "liked": true,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "memberships": [
      {
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "section": {
          "gid": "12345",
          "resource_type": "section",
          "name": "Next Actions"
        }
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ],
    "tags": [
      {
        "gid": "59746",
        "name": "Grade A"
      }
    ],
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /tasks/{task_gid}</code>
</p>

A specific, existing task can be updated by making a PUT request on the
URL for that task. Only the fields provided in the `data` block will be
updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated task record.

<h3 id="update-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The task to update.|
|» data<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|»» approval_status<span class="param-type"> string</span>|*Conditional* Reflects the approval status of this task. This field is kept in sync with `completed`, meaning `pending` translates to false while `approved`, `rejected`, and `changes_requested` translate to true. If you set completed to true, this field will be set to `approved`.|
|»» assignee<span class="param-type"> string¦null</span>|Gid of a user.|
|»» assignee_status<span class="param-type"> string</span>|Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.|
|»» completed<span class="param-type"> boolean</span>|True if the task is currently marked complete, false if not.|
|»» completed_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» due_at<span class="param-type"> string(date)¦null</span>|Date and time on which this task is due, or null if the task has no due time. This takes a UTC timestamp and should not be used together with `due_on`.|
|»» due_on<span class="param-type"> string(date)¦null</span>|Date on which this task is due, or null if the task has no due date.  This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.|
|»» external<span class="param-type"> object</span>|*OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).|
|»»» data<span class="param-type"> string</span>|none|
|»»» gid<span class="param-type"> string</span>|none|
|»» followers<span class="param-type"> [string]</span>|*Create-Only* An array of strings identifying users. These can either be the string "me", an email, or the gid of a user. In order to change followers on an existing task use `addFollowers` and `removeFollowers`.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the text with formatting as HTML.|
|»» liked<span class="param-type"> boolean</span>|True if the task is liked by the authorized user, false if not.|
|»» name<span class="param-type"> string</span>|Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the task.|
|»» parent<span class="param-type"> string¦null</span>|Gid of a task.|
|»» projects<span class="param-type"> [string]</span>|*Create-Only* Array of project gids. In order to change projects on an existing task use `addProject` and `removeProject`.|
|»» resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.|
|»» tags<span class="param-type"> [string]</span>|*Create-Only* Array of tag gids. In order to change tags on an existing task use `addTag` and `removeTag`.|
|»» workspace<span class="param-type"> string</span>|Gid of a workspace.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**assignee_status**: Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.
Setting this field to "inbox" or "upcoming" inserts it at the top of the section, while the other options will insert at the bottom.

**external**: *OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).
The external field allows you to store app-specific metadata on tasks, including a gid that can be used to retrieve tasks and a data blob that can store app-specific character strings. Note that you will need to authenticate with Oauth to access or modify this data. Once an external gid is set, you can use the notation `external:custom_gid` to reference your object anywhere in the API where you may use the original object gid. See the page on Custom External Data for more details.

**resource_subtype**: The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
The resource_subtype `milestone` represent a single moment in time. This means tasks with this subtype cannot have a start_date.

**start_on**: The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.
*Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*

#### Enumerated Values

|Parameter|Value|
|---|---|
| approval_status|pending|
| approval_status|approved|
| approval_status|rejected|
| approval_status|changes_requested|
| assignee_status|today|
| assignee_status|upcoming|
| assignee_status|later|
| assignee_status|new|
| assignee_status|inbox|
| resource_subtype|default_task|
| resource_subtype|milestone|
| resource_subtype|section|
| resource_subtype|approval|

<h3 id="update-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Task](#schematask)</span>|Successfully updated the specified task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a task

<a id="opIddeleteTask"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /tasks/{task_gid}</code>
</p>

A specific, existing task can be deleted by making a DELETE request on
the URL for that task. Deleted tasks go into the “trash” of the user
making the delete request. Tasks can be recovered from the trash within a
period of 30 days; afterward they are completely removed from the system.

Returns an empty data record.

<h3 id="delete-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully deleted the specified task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Duplicate a task

<a id="opIdduplicateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "include": [
      "notes",
      "assignee"
    ],
    "name": "New Task Name"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "job",
    "new_project": {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "resource_subtype": "duplicate_task",
    "status": "in_progress"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/duplicate</code>
</p>

Creates and returns a job that will asynchronously handle the duplication.

<h3 id="duplicate-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Describes the duplicate's name and the fields that will be duplicated.|
|» data<span class="param-type"> object</span>|none|
|»» include<span class="param-type"> string</span>|The fields that will be duplicated to the new task.|
|»» name<span class="param-type"> string</span>|The name of the new task.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| include|notes|
| include|assignee|
| include|subtasks|
| include|attachments|
| include|tags|
| include|followers|
| include|projects|
| include|dates|
| include|dependencies|
| include|parent|

<h3 id="duplicate-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Job](#schemajob)</span>|Successfully created the job to handle duplication.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get tasks from a project

<a id="opIdgetTasksForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /projects/{project_gid}/tasks</code>
</p>

Returns the compact task records for all tasks within the given project, ordered by their priority within the project. Tasks can exist in more than one project at a time.

<h3 id="get-tasks-from-a-project-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/project_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the project.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-tasks-from-a-project-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the requested project's tasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get tasks from a section

<a id="opIdgetTasksForSection"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/sections/{section_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /sections/{section_gid}/tasks</code>
</p>

*Board view only*: Returns the compact section records for all tasks within the given section.

<h3 id="get-tasks-from-a-section-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/section_gid<span class="param-type"> string</span><div class="param-required">required</div>|The globally unique identifier for the section.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-tasks-from-a-section-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the section's tasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get tasks from a tag

<a id="opIdgetTasksForTag"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags/{tag_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tags/{tag_gid}/tasks</code>
</p>

Returns the compact task records for all tasks with the given tag. Tasks can have more than one tag at a time.

<h3 id="get-tasks-from-a-tag-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/tag_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the tag.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-tasks-from-a-tag-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the tasks associated with the specified tag.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get tasks from a user task list

<a id="opIdgetTasksForUserTaskList"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /user_task_lists/{user_task_list_gid}/tasks</code>
</p>

Returns the compact list of tasks in a user’s My Tasks list. The returned tasks will be in order within each assignee status group of `Inbox`, `Today`, and `Upcoming`.
*Note: tasks in `Later` have a different ordering in the Asana web app than the other assignee status groups; this endpoint will still return them in list order in `Later` (differently than they show up in Asana, but the same order as in Asana’s mobile apps).*
*Note: Access control is enforced for this endpoint as with all Asana API endpoints, meaning a user’s private tasks will be filtered out if the API-authenticated user does not have access to them.*
*Note: Both complete and incomplete tasks are returned by default unless they are filtered out (for example, setting `completed_since=now` will return only incomplete tasks, which is the default view for “My Tasks” in Asana.)*

<h3 id="get-tasks-from-a-user-task-list-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?completed_since<span class="param-type"> string</span>|Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.|
|/user_task_list_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the user task list.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

#### Detailed descriptions

**completed_since**: Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.

<h3 id="get-tasks-from-a-user-task-list-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the user task list's tasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get subtasks from a task

<a id="opIdgetSubtasksForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/subtasks</code>
</p>

Returns a compact representation of all of the subtasks of a task.

<h3 id="get-subtasks-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-subtasks-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the specified task's subtasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Create a subtask

<a id="opIdcreateSubtaskForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "approval_status": "pending",
    "assignee": "12345",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_by": {
      "name": "Greg Sanchez"
    },
    "custom_fields": {
      "4578152156": "Not Started",
      "5678904321": "On Hold"
    },
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "followers": [
      "12345"
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "liked": true,
    "name": "Buy catnip",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": "12345",
    "projects": [
      "12345"
    ],
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "tags": [
      "12345"
    ],
    "workspace": "12345"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "approval_status": "pending",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "completed_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "created_at": "2012-02-22T02:06:58.147Z",
    "dependencies": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "dependents": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "hearted": true,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "is_rendered_as_separator": false,
    "liked": true,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "memberships": [
      {
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "section": {
          "gid": "12345",
          "resource_type": "section",
          "name": "Next Actions"
        }
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ],
    "tags": [
      {
        "gid": "59746",
        "name": "Grade A"
      }
    ],
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/subtasks</code>
</p>

Creates a new subtask and adds it to the parent task. Returns the full record for the newly created subtask.

<h3 id="create-a-subtask-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The new subtask to create.|
|» data<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|»» approval_status<span class="param-type"> string</span>|*Conditional* Reflects the approval status of this task. This field is kept in sync with `completed`, meaning `pending` translates to false while `approved`, `rejected`, and `changes_requested` translate to true. If you set completed to true, this field will be set to `approved`.|
|»» assignee<span class="param-type"> string¦null</span>|Gid of a user.|
|»» assignee_status<span class="param-type"> string</span>|Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.|
|»» completed<span class="param-type"> boolean</span>|True if the task is currently marked complete, false if not.|
|»» completed_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|»» custom_fields<span class="param-type"> object</span>|An object where each key is a Custom Field gid and each value is an enum gid, string, or number.|
|»» due_at<span class="param-type"> string(date)¦null</span>|Date and time on which this task is due, or null if the task has no due time. This takes a UTC timestamp and should not be used together with `due_on`.|
|»» due_on<span class="param-type"> string(date)¦null</span>|Date on which this task is due, or null if the task has no due date.  This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.|
|»» external<span class="param-type"> object</span>|*OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).|
|»»» data<span class="param-type"> string</span>|none|
|»»» gid<span class="param-type"> string</span>|none|
|»» followers<span class="param-type"> [string]</span>|*Create-Only* An array of strings identifying users. These can either be the string "me", an email, or the gid of a user. In order to change followers on an existing task use `addFollowers` and `removeFollowers`.|
|»» html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the text with formatting as HTML.|
|»» liked<span class="param-type"> boolean</span>|True if the task is liked by the authorized user, false if not.|
|»» name<span class="param-type"> string</span>|Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the task.|
|»» parent<span class="param-type"> string¦null</span>|Gid of a task.|
|»» projects<span class="param-type"> [string]</span>|*Create-Only* Array of project gids. In order to change projects on an existing task use `addProject` and `removeProject`.|
|»» resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»» start_on<span class="param-type"> string(date)¦null</span>|The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.|
|»» tags<span class="param-type"> [string]</span>|*Create-Only* Array of tag gids. In order to change tags on an existing task use `addTag` and `removeTag`.|
|»» workspace<span class="param-type"> string</span>|Gid of a workspace.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Detailed descriptions

**assignee_status**: Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.
Setting this field to "inbox" or "upcoming" inserts it at the top of the section, while the other options will insert at the bottom.

**external**: *OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).
The external field allows you to store app-specific metadata on tasks, including a gid that can be used to retrieve tasks and a data blob that can store app-specific character strings. Note that you will need to authenticate with Oauth to access or modify this data. Once an external gid is set, you can use the notation `external:custom_gid` to reference your object anywhere in the API where you may use the original object gid. See the page on Custom External Data for more details.

**resource_subtype**: The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
The resource_subtype `milestone` represent a single moment in time. This means tasks with this subtype cannot have a start_date.

**start_on**: The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.
*Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*

#### Enumerated Values

|Parameter|Value|
|---|---|
| approval_status|pending|
| approval_status|approved|
| approval_status|rejected|
| approval_status|changes_requested|
| assignee_status|today|
| assignee_status|upcoming|
| assignee_status|later|
| assignee_status|new|
| assignee_status|inbox|
| resource_subtype|default_task|
| resource_subtype|milestone|
| resource_subtype|section|
| resource_subtype|approval|

<h3 id="create-a-subtask-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Task](#schematask)</span>|Successfully created the specified subtask.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Set the parent of a task

<a id="opIdsetParentForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/setParent \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "insert_after": "null",
    "insert_before": "124816",
    "parent": "987654"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "approval_status": "pending",
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "completed_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "created_at": "2012-02-22T02:06:58.147Z",
    "dependencies": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "dependents": [
      {
        "gid": "12345",
        "resource_type": "task"
      }
    ],
    "due_at": "2019-09-15T02:06:58.147Z",
    "due_on": "2019-09-15",
    "external": {
      "data": "A blob of information",
      "gid": "my_gid"
    },
    "hearted": true,
    "hearts": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "is_rendered_as_separator": false,
    "liked": true,
    "likes": [
      {
        "gid": "12345",
        "user": {
          "gid": "12345",
          "resource_type": "user",
          "name": "Greg Sanchez"
        }
      }
    ],
    "memberships": [
      {
        "project": {
          "gid": "12345",
          "resource_type": "project",
          "name": "Stuff to buy"
        },
        "section": {
          "gid": "12345",
          "resource_type": "section",
          "name": "Next Actions"
        }
      }
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "resource_subtype": "default_task",
    "start_on": "2019-09-14",
    "assignee": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "custom_fields": [
      {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      }
    ],
    "followers": [
      {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    ],
    "parent": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "projects": [
      {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    ],
    "tags": [
      {
        "gid": "59746",
        "name": "Grade A"
      }
    ],
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/setParent</code>
</p>

parent, or no parent task at all. Returns an empty data block. When using `insert_before` and `insert_after`, at most one of those two options can be specified, and they must already be subtasks of the parent.

<h3 id="set-the-parent-of-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The new parent of the subtask.|
|» data<span class="param-type"> object</span>|none|
|»» insert_after<span class="param-type"> string</span>|A subtask of the parent to insert the task after, or `null` to insert at the beginning of the list.|
|»» insert_before<span class="param-type"> string</span>|A subtask of the parent to insert the task before, or `null` to insert at the end of the list.|
|»» parent<span class="param-type"> string</span><div class="param-required">required</div>|The new parent of the task, or `null` for no parent.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="set-the-parent-of-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Task](#schematask)</span>|Successfully changed the parent of the specified subtask.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get dependencies from a task

<a id="opIdgetDependenciesForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/dependencies</code>
</p>

Returns the compact representations of all of the dependencies of a task.

<h3 id="get-dependencies-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-dependencies-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the specified task's dependencies.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Set dependencies for a task

<a id="opIdaddDependenciesForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "dependencies": [
      "133713",
      "184253"
    ]
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/addDependencies</code>
</p>

Marks a set of tasks as dependencies of this task, if they are not already dependencies. *A task can have at most 15 dependencies*.

<h3 id="set-dependencies-for-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The list of tasks to set as dependencies.|
|» data<span class="param-type"> object</span>|none|
|»» dependencies<span class="param-type"> [string]</span>|An array of task gids that a task depends on.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="set-dependencies-for-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully set the specified dependencies on the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="set-dependencies-for-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Unlink dependencies from a task

<a id="opIdremoveDependenciesForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "dependencies": [
      "133713",
      "184253"
    ]
  }
}
```

> 200 Response

```json
{
  "data": [
    {}
  ]
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/removeDependencies</code>
</p>

Unlinks a set of dependencies from this task.

<h3 id="unlink-dependencies-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The list of tasks to unlink as dependencies.|
|» data<span class="param-type"> object</span>|none|
|»» dependencies<span class="param-type"> [string]</span>|An array of task gids that a task depends on.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="unlink-dependencies-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully unlinked the dependencies from the specified task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="unlink-dependencies-from-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [[](#schemaemptyresponse)]</span>|[An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.]|

</section><hr class="half-line">
<section>
## Get dependents from a task

<a id="opIdgetDependentsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/dependents \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /tasks/{task_gid}/dependents</code>
</p>

Returns the compact representations of all of the dependents of a task.

<h3 id="get-dependents-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-dependents-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the specified dependents of the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Set dependents for a task

<a id="opIdaddDependentsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "dependents": [
      "133713",
      "184253"
    ]
  }
}
```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/addDependents</code>
</p>

Marks a set of tasks as dependents of this task, if they are not already dependents. *A task can have at most 30 dependents*.

<h3 id="set-dependents-for-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The list of tasks to add as dependents.|
|» data<span class="param-type"> object</span>|A set of dependent tasks.|
|»» dependents<span class="param-type"> [string]</span>|An array of task gids that are dependents of the given task.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="set-dependents-for-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully set the specified dependents on the given task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Unlink dependents from a task

<a id="opIdremoveDependentsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "dependents": [
      "133713",
      "184253"
    ]
  }
}
```

> 200 Response

```json
{
  "data": [
    {}
  ]
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/removeDependents</code>
</p>

Unlinks a set of dependents from this task.

<h3 id="unlink-dependents-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The list of tasks to remove as dependents.|
|» data<span class="param-type"> object</span>|A set of dependent tasks.|
|»» dependents<span class="param-type"> [string]</span>|An array of task gids that are dependents of the given task.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="unlink-dependents-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully unlinked the specified tasks as dependents.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="unlink-dependents-from-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [[](#schemaemptyresponse)]</span>|[An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.]|

</section><hr class="half-line">
<section>
## Add a project to a task

<a id="opIdaddProjectForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addProject \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "insert_after": "124816",
    "insert_before": "432134",
    "project": "13579",
    "section": "987654"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/addProject</code>
</p>

Adds the task to the specified project, in the optional location
specified. If no location arguments are given, the task will be added to
the end of the project.

`addProject` can also be used to reorder a task within a project or
section that already contains it.

At most one of `insert_before`, `insert_after`, or `section` should be
specified. Inserting into a section in an non-order-dependent way can be
done by specifying section, otherwise, to insert within a section in a
particular place, specify `insert_before` or `insert_after` and a task
within the section to anchor the position of this task.

Returns an empty data block.

<h3 id="add-a-project-to-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The project to add the task to.|
|» data<span class="param-type"> object</span>|none|
|»» insert_after<span class="param-type"> string¦null</span>|A task in the project to insert the task after, or `null` to insert at the beginning of the list.|
|»» insert_before<span class="param-type"> string¦null</span>|A task in the project to insert the task before, or `null` to insert at the end of the list.|
|»» project<span class="param-type"> string</span><div class="param-required">required</div>|The project to add the task to.|
|»» section<span class="param-type"> string¦null</span>|A section in the project to insert the task into. The task will be inserted at the bottom of the section.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-a-project-to-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the specified project to the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-a-project-to-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove a project from a task

<a id="opIdremoveProjectForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "project": "13579"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/removeProject</code>
</p>

Removes the task from the specified project. The task will still exist in
the system, but it will not be in the project anymore.

Returns an empty data block.

<h3 id="remove-a-project-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The project to remove the task from.|
|» data<span class="param-type"> object</span>|none|
|»» project<span class="param-type"> string</span><div class="param-required">required</div>|The project to remove the task from.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-a-project-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the specified project from the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-project-from-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Add a tag to a task

<a id="opIdaddTagForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addTag \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "tag": "13579"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/addTag</code>
</p>

Adds a tag to a task. Returns an empty data block.

<h3 id="add-a-tag-to-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The tag to add to the task.|
|» data<span class="param-type"> object</span>|none|
|»» tag<span class="param-type"> string</span><div class="param-required">required</div>|The tag to add to the task.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-a-tag-to-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the specified tag to the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-a-tag-to-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove a tag from a task

<a id="opIdremoveTagForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "tag": "13579"
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/removeTag</code>
</p>

Removes a tag from a task. Returns an empty data block.

<h3 id="remove-a-tag-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The tag to remove from the task.|
|» data<span class="param-type"> object</span>|none|
|»» tag<span class="param-type"> string</span><div class="param-required">required</div>|The tag to remove from the task.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-a-tag-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the specified tag from the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-tag-from-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Add followers to a task

<a id="opIdaddFollowersForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "followers": [
      "13579",
      "321654"
    ]
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/addFollowers</code>
</p>

Adds followers to a task. Returns an empty data block.
Each task can be associated with zero or more followers in the system.
Requests to add/remove followers, if successful, will return the complete updated task record, described above.

<h3 id="add-followers-to-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The followers to add to the task.|
|» data<span class="param-type"> object</span>|none|
|»» followers<span class="param-type"> [string]</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-followers-to-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully added the specified followers to the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="add-followers-to-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Remove followers from a task

<a id="opIdremoveFollowerForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "followers": [
      "13579",
      "321654"
    ]
  }
}
```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /tasks/{task_gid}/removeFollowers</code>
</p>

Removes each of the specified followers from the task if they are following. Returns the complete, updated record for the affected task.

<h3 id="remove-followers-from-a-task-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The followers to remove from the task.|
|» data<span class="param-type"> object</span>|none|
|»» followers<span class="param-type"> [string]</span><div class="param-required">required</div>|An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.|
|/task_gid<span class="param-type"> string</span><div class="param-required">required</div>|The task to operate on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-followers-from-a-task-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully removed the specified followers from the task.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-followers-from-a-task-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="half-line">
<section>
## Search tasks in a workspace

<a id="opIdsearchTasksForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/tasks/search</code>
</p>

To mirror the functionality of the Asana web app's advanced search feature, the Asana API has a task search endpoint that allows you to build complex filters to find and retrieve the exact data you need.
#### Premium access
Like the Asana web product's advance search feature, this search endpoint will only be available to premium Asana users. A user is premium if any of the following is true:

- The workspace in which the search is being performed is a premium workspace - The user is a member of a premium team inside the workspace

Even if a user is only a member of a premium team inside a non-premium workspace, search will allow them to find data anywhere in the workspace, not just inside the premium team. Making a search request using credentials of a non-premium user will result in a `402 Payment Required` error.
#### Pagination
Search results are not stable; repeating the same query multiple times may return the data in a different order, even if the data do not change. Because of this, the traditional [pagination](https://developers.asana.com/docs/#pagination) available elsewhere in the Asana API is not available here. However, you can paginate manually by sorting the search results by their creation time and then modifying each subsequent query to exclude data you have already seen. Page sizes are limited to a maximum of 100 items, and can be specified by the `limit` query parameter.
#### Eventual consistency
Changes in Asana (regardless of whether they’re made though the web product or the API) are forwarded to our search infrastructure to be indexed. This process can take between 10 and 60 seconds to complete under normal operation, and longer during some production incidents. Making a change to a task that would alter its presence in a particular search query will not be reflected immediately. This is also true of the advanced search feature in the web product.
#### Rate limits
You may receive a `429 Too Many Requests` response if you hit any of our [rate limits](https://developers.asana.com/docs/#rate-limits).
#### Custom field parameters
| Parameter name | Custom field type | Accepted type |
|---|---|---|
| custom_fields.{gid}.is_set | All | Boolean |
| custom_fields.{gid}.value | Text | String |
| custom_fields.{gid}.value | Number | Number |
| custom_fields.{gid}.value | Enum | Enum option ID |
| custom_fields.{gid}.starts_with | Text only | String |
| custom_fields.{gid}.ends_with | Text only | String |
| custom_fields.{gid}.contains | Text only | String |
| custom_fields.{gid}.less_than | Number only | Number |
| custom_fields.{gid}.greater_than | Number only | Number |

For example, if the gid of the custom field is 12345, these query parameter to find tasks where it is set would be `custom_fields.12345.is_set=true`. To match an exact value for an enum custom field, use the gid of the desired enum option and not the name of the enum option: `custom_fields.12345.value=67890`.

Searching for multiple exact matches of a custom field is not supported.

<h3 id="search-tasks-in-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?text<span class="param-type"> string</span>|Performs full-text search on both task name and description|
|?resource_subtype<span class="param-type"> string</span>|Filters results by the task's resource_subtype|
|?assignee.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?assignee.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?assignee_status<span class="param-type"> string</span>|One of `inbox`, `today`, `upcoming`, or `later`|
|?projects.any<span class="param-type"> string</span>|Comma-separated list of project IDs|
|?projects.not<span class="param-type"> string</span>|Comma-separated list of project IDs|
|?projects.all<span class="param-type"> string</span>|Comma-separated list of project IDs|
|?sections.any<span class="param-type"> string</span>|Comma-separated list of section or column IDs|
|?sections.not<span class="param-type"> string</span>|Comma-separated list of section or column IDs|
|?sections.all<span class="param-type"> string</span>|Comma-separated list of section or column IDs|
|?tags.any<span class="param-type"> string</span>|Comma-separated list of tag IDs|
|?tags.not<span class="param-type"> string</span>|Comma-separated list of tag IDs|
|?tags.all<span class="param-type"> string</span>|Comma-separated list of tag IDs|
|?teams.any<span class="param-type"> string</span>|Comma-separated list of team IDs|
|?followers.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?followers.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?created_by.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?created_by.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?assigned_by.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?assigned_by.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?liked_by.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?liked_by.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?commented_on_by.any<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?commented_on_by.not<span class="param-type"> string</span>|Comma-separated list of user identifiers|
|?due_on.before<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?due_on.after<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?due_on<span class="param-type"> string(date)</span>|ISO 8601 date string or `null`|
|?due_at.before<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?due_at.after<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?start_on.before<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?start_on.after<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?start_on<span class="param-type"> string(date)</span>|ISO 8601 date string or `null`|
|?created_on.before<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?created_on.after<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?created_on<span class="param-type"> string(date)</span>|ISO 8601 date string or `null`|
|?created_at.before<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?created_at.after<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?completed_on.before<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?completed_on.after<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?completed_on<span class="param-type"> string(date)</span>|ISO 8601 date string or `null`|
|?completed_at.before<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?completed_at.after<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?modified_on.before<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?modified_on.after<span class="param-type"> string(date)</span>|ISO 8601 date string|
|?modified_on<span class="param-type"> string(date)</span>|ISO 8601 date string or `null`|
|?modified_at.before<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?modified_at.after<span class="param-type"> string(date-time)</span>|ISO 8601 datetime string|
|?is_blocking<span class="param-type"> boolean</span>|Filter to incomplete tasks with dependents|
|?is_blocked<span class="param-type"> boolean</span>|Filter to tasks with incomplete dependencies|
|?has_attachment<span class="param-type"> boolean</span>|Filter to tasks with attachments|
|?completed<span class="param-type"> boolean</span>|Filter to completed tasks|
|?is_subtask<span class="param-type"> boolean</span>|Filter to subtasks|
|?sort_by<span class="param-type"> string</span>|One of `due_date`, `created_at`, `completed_at`, `likes`, or `modified_at`, defaults to `modified_at`|
|?sort_ascending<span class="param-type"> boolean</span>|Default `false`|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_subtype|default_task|
|resource_subtype|milestone|
|assignee_status|inbox|
|assignee_status|today|
|assignee_status|upcoming|
|assignee_status|later|
|sort_by|due_date|
|sort_by|created_at|
|sort_by|completed_at|
|sort_by|likes|
|sort_by|modified_at|

<h3 id="search-tasks-in-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TaskCompact](#schemataskcompact)</span>|Successfully retrieved the section's tasks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-teams">Teams</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-team"><span class="get-verb">GET</span> <span class=""nn>/teams/{team_gid}</span></a><br><a href="#get-teams-in-an-organization"><span class="get-verb">GET</span> <span class=""nn>/organizations/{workspace_gid}/teams</span></a><br><a href="#get-teams-for-a-user"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}/teams</span></a><br><a href="#add-a-user-to-a-team"><span class="post-verb">POST</span> <span class=""nn>/teams/{team_gid}/addUser</span></a><br><a href="#remove-a-user-from-a-team"><span class="post-verb">POST</span> <span class=""nn>/teams/{team_gid}/removeUser</span></a></code>
</pre>

A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.

</section>
<hr class="half-line">
<section>
## Get a team

<a id="opIdgetTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "team",
    "name": "Marketing",
    "description": "All developers should be members of this team.",
    "html_description": "<body><em>All</em> developers should be members of this team.</body>",
    "organization": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /teams/{team_gid}</code>
</p>

Returns the full record for a single team.

<h3 id="get-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Team](#schemateam)</span>|Successsfully retrieved the record for a single team.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get teams in an organization

<a id="opIdgetTeamsForOrganization"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/organizations/{workspace_gid}/teams \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /organizations/{workspace_gid}/teams</code>
</p>

Returns the compact records for all teams in the organization visible to the authorized user.

<h3 id="get-teams-in-an-organization-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-teams-in-an-organization-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamCompact](#schemateamcompact)</span>|Returns the team records for all teams in the organization or workspace accessible to the authenticated user.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get teams for a user

<a id="opIdgetTeamsForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/teams?organization=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}/teams</code>
</p>

Returns the compact records for all teams to which the given user is assigned.

<h3 id="get-teams-for-a-user-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?organization<span class="param-type"> string</span><div class="param-required">required</div>|The workspace or organization to filter teams on.|

<h3 id="get-teams-for-a-user-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamCompact](#schemateamcompact)</span>|Returns the team records for all teams in the organization or workspace to which the given user is assigned.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Add a user to a team

<a id="opIdaddUserForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/addUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "user": "12345"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com",
    "photo": {
      "image_128x128": "https://...",
      "image_21x21": "https://...",
      "image_27x27": "https://...",
      "image_36x36": "https://...",
      "image_60x60": "https://..."
    },
    "workspaces": [
      {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    ]
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /teams/{team_gid}/addUser</code>
</p>

The user making this call must be a member of the team in order to add others. The user being added must exist in the same organization as the team.

<h3 id="add-a-user-to-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The user to add to the team.|
|» data<span class="param-type"> object</span>|A user identification object for specification with the addUser/removeUser endpoints.|
|»» user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-a-user-to-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [User](#schemauser)</span>|Returns the full user record for the added user.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Remove a user from a team

<a id="opIdremoveUserForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/removeUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "user": "12345"
  }
}
```

> 204 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /teams/{team_gid}/removeUser</code>
</p>

The user making this call must be a member of the team in order to remove themselves or others.

<h3 id="remove-a-user-from-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The user to remove from the team.|
|» data<span class="param-type"> object</span>|A user identification object for specification with the addUser/removeUser endpoints.|
|»» user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-a-user-from-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|204<span class="param-type"> Inline</span>|Returns an empty data record|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-user-from-a-team-responseschema">Response Schema</h3>

Status Code **204**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-team-memberships">Team Memberships</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-team-membership"><span class="get-verb">GET</span> <span class=""nn>/team_memberships/{team_membership_gid}</span></a><br><a href="#get-team-memberships"><span class="get-verb">GET</span> <span class=""nn>/team_memberships</span></a><br><a href="#get-memberships-from-a-team"><span class="get-verb">GET</span> <span class=""nn>/teams/{team_gid}/team_memberships</span></a><br><a href="#get-memberships-from-a-user"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}/team_memberships</span></a></code>
</pre>

This object determines if a user is a member of a team.

</section>
<hr class="half-line">
<section>
## Get a team membership

<a id="opIdgetTeamMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/team_memberships/{team_membership_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "team_membership",
    "is_guest": false,
    "team": {
      "gid": "12345",
      "resource_type": "team",
      "name": "Marketing"
    },
    "user": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /team_memberships/{team_membership_gid}</code>
</p>

Returns the complete team membership record for a single team membership.

<h3 id="get-a-team-membership-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/team_membership_gid<span class="param-type"> string</span><div class="param-required">required</div>|none|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-team-membership-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamMembership](#schemateammembership)</span>|Successfully retrieved the requested team membership.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get team memberships

<a id="opIdgetTeamMemberships"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/team_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "team_membership",
      "is_guest": false,
      "team": {
        "gid": "12345",
        "resource_type": "team",
        "name": "Marketing"
      },
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /team_memberships</code>
</p>

Returns compact team membership records.

<h3 id="get-team-memberships-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?team<span class="param-type"> string</span>|Globally unique identifier for the team.|
|?user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user. This parameter must be used with the workspace parameter.|
|?workspace<span class="param-type"> string</span>|Globally unique identifier for the workspace. This parameter must be used with the user parameter.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-team-memberships-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamMembershipCompact](#schemateammembershipcompact)</span>|Successfully retrieved the requested team memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get memberships from a team

<a id="opIdgetTeamMembershipsForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid}/team_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "team_membership",
      "is_guest": false,
      "team": {
        "gid": "12345",
        "resource_type": "team",
        "name": "Marketing"
      },
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /teams/{team_gid}/team_memberships</code>
</p>

Returns the compact team memberships for the team.

<h3 id="get-memberships-from-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-memberships-from-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamMembershipCompact](#schemateammembershipcompact)</span>|Successfully retrieved the requested team's memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get memberships from a user

<a id="opIdgetTeamMembershipsForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/team_memberships?workspace=31326 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "team_membership",
      "is_guest": false,
      "team": {
        "gid": "12345",
        "resource_type": "team",
        "name": "Marketing"
      },
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}/team_memberships</code>
</p>

Returns the compact team membership records for the user.

<h3 id="get-memberships-from-a-user-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace.|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-memberships-from-a-user-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TeamMembershipCompact](#schemateammembershipcompact)</span>|Successfully retrieved the requested users's memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-typeahead">Typeahead</h1>

<pre class="highlight http tab-http">
<code><a href="#get-objects-via-typeahead"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/typeahead</span></a></code>
</pre>

The typeahead search API provides search for objects from a single workspace.

</section>
<hr class="half-line">
<section>
## Get objects via typeahead

<a id="opIdtypeaheadForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead?resource_type=user \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/typeahead</code>
</p>

Retrieves objects in the workspace based via an auto-completion/typeahead
search algorithm. This feature is meant to provide results quickly, so do
not rely on this API to provide extremely accurate search results. The
result set is limited to a single page of results with a maximum size, so
you won’t be able to fetch large numbers of results.

The typeahead search API provides search for objects from a single
workspace. This endpoint should be used to query for objects when
creating an auto-completion/typeahead search feature. This API is meant
to provide results quickly and should not be relied upon for accurate or
exhaustive search results. The results sets are limited in size and
cannot be paginated.

Queries return a compact representation of each object which is typically
the gid and name fields. Interested in a specific set of fields or all of
the fields?! Of course you are. Use field selectors to manipulate what
data is included in a response.

<h3 id="get-objects-via-typeahead-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?resource_type<span class="param-type"> string</span><div class="param-required">required</div>|The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `project`, `portfolio`, `tag`, `task`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported.|
|?type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_type field.*|
|?query<span class="param-type"> string</span>|The string that will be used to search for relevant objects. If an empty string is passed in, the API will currently return an empty result set.|
|?count<span class="param-type"> integer</span>|The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_type|custom_field|
|resource_type|portfolio|
|resource_type|project|
|resource_type|tag|
|resource_type|task|
|resource_type|user|
|type|custom_field|
|type|portfolio|
|type|project|
|type|tag|
|type|task|
|type|user|

<h3 id="get-objects-via-typeahead-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AsanaNamedResource](#schemaasananamedresource)</span>|Successfully retrieved objects via a typeahead search algorithm.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-users">Users</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-users"><span class="get-verb">GET</span> <span class=""nn>/users</span></a><br><a href="#get-a-user"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}</span></a><br><a href="#get-a-user-39-s-favorites"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}/favorites</span></a><br><a href="#get-users-in-a-team"><span class="get-verb">GET</span> <span class=""nn>/teams/{team_gid}/users</span></a><br><a href="#get-users-in-a-workspace-or-organization"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/users</span></a></code>
</pre>

A user object represents an account in Asana that can be given access to various workspaces, projects, and tasks.

Like other objects in the system, users are referred to by numerical IDs. However, the special string identifier `me` can be used anywhere a user ID is accepted, to refer to the current authenticated user.

</section>
<hr class="half-line">
<section>
## Get multiple users

<a id="opIdgetUsers"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /users</code>
</p>

Returns the user records for all users in all workspaces and organizations accessible to the authenticated user. Accepts an optional workspace ID parameter.
Results are sorted by user ID.

<h3 id="get-multiple-users-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?workspace<span class="param-type"> string</span>|The workspace or organization ID to filter users on.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-multiple-users-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [UserCompact](#schemausercompact)</span>|Successfully retrieved the requested user records.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a user

<a id="opIdgetUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com",
    "photo": {
      "image_128x128": "https://...",
      "image_21x21": "https://...",
      "image_27x27": "https://...",
      "image_36x36": "https://...",
      "image_60x60": "https://..."
    },
    "workspaces": [
      {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    ]
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}</code>
</p>

Returns the full user record for the single user with the provided ID.
Results are sorted by user ID.

<h3 id="get-a-user-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-user-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [User](#schemauser)</span>|Returns the user specified.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a user's favorites

<a id="opIdgetFavoritesForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/favorites?resource_type=project&workspace=1234 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}/favorites</code>
</p>

Returns all of a user's favorites in the given workspace, of the given type.
Results are given in order (The same order as Asana's sidebar).

<h3 id="get-a-user's-favorites-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?resource_type<span class="param-type"> string</span><div class="param-required">required</div>|The resource type of favorites to be returned.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace in which to get favorites.|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_type|portfolio|
|resource_type|project|
|resource_type|tag|
|resource_type|task|
|resource_type|user|

<h3 id="get-a-user's-favorites-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AsanaNamedResource](#schemaasananamedresource)</span>|Returns the specified user's favorites.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get users in a team

<a id="opIdgetUsersForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid}/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /teams/{team_gid}/users</code>
</p>

Returns the compact records for all users that are members of the team.

<h3 id="get-users-in-a-team-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/team_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the team.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-users-in-a-team-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [UserCompact](#schemausercompact)</span>|Returns the user records for all the members of the team, including guests and limited access users|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get users in a workspace or organization

<a id="opIdgetUsersForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/users</code>
</p>

Returns the user records for all users in the specified workspace or organization.
Results are sorted alphabetically by user names.

<h3 id="get-users-in-a-workspace-or-organization-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-users-in-a-workspace-or-organization-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [UserCompact](#schemausercompact)</span>|Return the users in the specified workspace or org.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-user-task-lists">User Task Lists</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-user-task-list"><span class="get-verb">GET</span> <span class=""nn>/user_task_lists/{user_task_list_gid}</span></a><br><a href="#get-a-user-39-s-task-list"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}/user_task_list</span></a></code>
</pre>

A user task list represents the tasks assigned to a particular user.

A user’s “My Tasks” represent all of the tasks assigned to that user. It is visually divided into regions based on the task’s [`assignee_status`](#tocS_Task) for Asana users to triage their tasks based on when they can address them. When building an integration it’s worth noting that tasks with due dates will automatically move through `assignee_status` states as their due dates approach; read up on [task auto-promotion](https://asana.com/guide/help/fundamentals/my-tasks#gl-auto-promote) for more information.

</section>
<hr class="half-line">
<section>
## Get a user task list

<a id="opIdgetUserTaskList"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "user_task_list",
    "name": "My Tasks in My Workspace",
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /user_task_lists/{user_task_list_gid}</code>
</p>

Returns the full record for a user task list.

<h3 id="get-a-user-task-list-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_task_list_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the user task list.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-user-task-list-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [UserTaskList](#schemausertasklist)</span>|Successfully retrieved the user task list.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a user's task list

<a id="opIdgetUserTaskListForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/user_task_list?workspace=1234 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "user_task_list",
    "name": "My Tasks in My Workspace",
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}/user_task_list</code>
</p>

Returns the full record for a user's task list.

<h3 id="get-a-user's-task-list-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace in which to get the user task list.|

<h3 id="get-a-user's-task-list-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [UserTaskList](#schemausertasklist)</span>|Successfully retrieved the user's task list.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-webhooks">Webhooks</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-webhooks"><span class="get-verb">GET</span> <span class=""nn>/webhooks</span></a><br><a href="#establish-a-webhook"><span class="post-verb">POST</span> <span class=""nn>/webhooks</span></a><br><a href="#get-a-webhook"><span class="get-verb">GET</span> <span class=""nn>/webhooks/{webhook_gid}</span></a><br><a href="#delete-a-webhook"><span class="delete-verb">DELETE</span> <span class=""nn>/webhooks/{webhook_gid}</span></a></code>
</pre>

Webhooks allow an application to be notified of changes. This is in addition to the ability to fetch those changes directly as [Events](#asana-events) - in fact, Webhooks are just a way to receive Events via HTTP POST at the time they occur instead of polling for them. For services accessible via HTTP this is often vastly more convenient, and if events are not too frequent can be significantly more efficient.

In both cases, however, changes are represented as Event objects - refer to the [Events documentation](#asana-events) for more information on what data these events contain.

**NOTE:** While Webhooks send arrays of Event objects to their target, the Event objects themselves contain *only IDs*, rather than the actual resource they are referencing. So while a normal event you receive via GET /events would look like an [Event](#tocS_Event). In a Webhook payload you will instead receive a [WebhookEvent](#tocS_WebhookEvent) (a simplified version of the event object).

[Webhooks](#tocS_Webhook) themselves contain only the information necessary to deliver the events to the desired target as they are generated.

#### Receiving Events

Because multiple events often happen in short succession, a webhook payload is designed to be able to transmit multiple events at once. The exact model of events is described in the [Events documentation](#asana-events).

The HTTP POST that the target receives contains:

 * An `X-Hook-Signature` header, which allows verifying that the payload
 is genuine.  The signature is a SHA256 HMAC using the shared secret
 (transmitted during the handshake) of the request body. Verification is
 **strongly recommended**, as it would otherwise be possible for an
 attacker to POST a malicious payload to the same endpoint. If the target
 endpoint can be kept secret this risk is mitigated somewhat, of course.
 * A JSON body with a single key, `events`, containing an array of the
 events that have occurred since the last webhook delivery. Note that this
 list may be empty, as periodically we may send a "heartbeat" webhook to
 verify that the endpoint is available.

Note that events are "skinny" - we expect consumers who desire syncing data to make additional calls to the API to retrieve the latest state. Because the data may have already changed by the time we send the event, it would be misleading to send a snapshot of the data along with the event.

#### Error Handling and Retry

If we attempt to send a webhook payload and we receive an error status code, or the request times out, we will retry delivery with exponential backoff. In general, if your servers are not available for an hour, you can expect it to take no longer than approximately an hour after they come back before the paused delivery resumes. However, if we are unable to deliver a message for 24 hours the webhook will be deactivated.

</section>
<hr class="half-line">
<section>
## Get multiple webhooks

<a id="opIdgetWebhooks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/webhooks?workspace=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "webhook",
      "active": false,
      "resource": {
        "gid": "12345",
        "resource_type": "task",
        "name": "Bug Task"
      },
      "target": "https://example.com/receive-webhook/7654",
      "created_at": "2012-02-22T02:06:58.147Z",
      "last_failure_at": "2012-02-22T02:06:58.147Z",
      "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
      "last_success_at": "2012-02-22T02:06:58.147Z"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /webhooks</code>
</p>

Get the compact representation of all webhooks your app has registered for the authenticated user in the given workspace.

<h3 id="get-multiple-webhooks-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace to query for webhooks in.|
|?resource<span class="param-type"> string</span>|Only return webhooks for the given resource.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-multiple-webhooks-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Webhook](#schemawebhook)</span>|Successfully retrieved the requested webhooks.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Establish a webhook

<a id="opIdcreateWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/webhooks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "resource": "12345",
    "target": "https://example.com/receive-webhook/7654"
  }
}
```

> 201 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "webhook",
    "active": false,
    "resource": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "target": "https://example.com/receive-webhook/7654",
    "created_at": "2012-02-22T02:06:58.147Z",
    "last_failure_at": "2012-02-22T02:06:58.147Z",
    "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
    "last_success_at": "2012-02-22T02:06:58.147Z"
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /webhooks</code>
</p>

Establishing a webhook is a two-part process. First, a simple HTTP POST
similar to any other resource creation. Since you could have multiple
webhooks we recommend specifying a unique local id for each target.

Next comes the confirmation handshake. When a webhook is created, we will
send a test POST to the target with an `X-Hook-Secret` header as
described in the [Resthooks Security
documentation](http://resthooks.org/docs/security/). The target must
respond with a `200 OK` and a matching `X-Hook-Secret` header to confirm
that this webhook subscription is indeed expected.

If you do not acknowledge the webhook’s confirmation handshake it will
fail to setup, and you will receive an error in response to your attempt
to create it. This means you need to be able to receive and complete the
webhook *while* the POST request is in-flight.

```
# Request
curl -H "Authorization: Bearer <personal_access_token>" \
-X POST https://app.asana.com/api/1.0/webhooks \
-d "resource=8675309" \
-d "target=https://example.com/receive-webhook/7654"
```

```
# Handshake sent to https://example.com/
POST /receive-webhook/7654
X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
```

```
# Handshake response sent by example.com
HTTP/1.1 200
X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
```

```
# Response
HTTP/1.1 201
{
  "data": {
    "gid": "43214",
    "resource": {
      "gid": "8675309",
      "name": "Bugs"
    },
    "target": "https://example.com/receive-webhook/7654",
    "active": false,
    "last_success_at": null,
    "last_failure_at": null,
    "last_failure_content": null
  }
}
```

<h3 id="establish-a-webhook-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The webhook workspace and target.|
|» data<span class="param-type"> object</span>|none|
|»» resource<span class="param-type"> string</span><div class="param-required">required</div>|A resource ID to subscribe to. The resource can be a task or project.|
|»» target<span class="param-type"> string(uri)</span><div class="param-required">required</div>|The URL to receive the HTTP POST.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="establish-a-webhook-responses">Responses</h3>

|Status|Description|
|---|---|
|201<span class="param-type"> [Webhook](#schemawebhook)</span>|Successfully created the requested webhook.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a webhook

<a id="opIdgetWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/webhooks/{webhook_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "webhook",
    "active": false,
    "resource": {
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "target": "https://example.com/receive-webhook/7654",
    "created_at": "2012-02-22T02:06:58.147Z",
    "last_failure_at": "2012-02-22T02:06:58.147Z",
    "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
    "last_success_at": "2012-02-22T02:06:58.147Z"
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /webhooks/{webhook_gid}</code>
</p>

Returns the full record for the given webhook.

<h3 id="get-a-webhook-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/webhook_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the webhook.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-webhook-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Webhook](#schemawebhook)</span>|Successfully retrieved the requested webhook.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Delete a webhook

<a id="opIddeleteWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/webhooks/{webhook_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="delete-verb">DELETE</span> /webhooks/{webhook_gid}</code>
</p>

This method *permanently* removes a webhook. Note that it may be possible to receive a request that was already in flight after deleting the webhook, but no further requests will be issued.

<h3 id="delete-a-webhook-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/webhook_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the webhook.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="delete-a-webhook-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully retrieved the requested webhook.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="delete-a-webhook-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-workspaces">Workspaces</h1>

<pre class="highlight http tab-http">
<code><a href="#get-multiple-workspaces"><span class="get-verb">GET</span> <span class=""nn>/workspaces</span></a><br><a href="#get-a-workspace"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}</span></a><br><a href="#update-a-workspace"><span class="put-verb">PUT</span> <span class=""nn>/workspaces/{workspace_gid}</span></a><br><a href="#add-a-user-to-a-workspace-or-organization"><span class="post-verb">POST</span> <span class=""nn>/workspaces/{workspace_gid}/addUser</span></a><br><a href="#remove-a-user-from-a-workspace-or-organization"><span class="post-verb">POST</span> <span class=""nn>/workspaces/{workspace_gid}/removeUser</span></a></code>
</pre>

A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.

An *organization* is a special kind of workspace that represents a company. In an organization, you can group your projects into teams. You can read more about how organizations work on the Asana Guide. To tell if your workspace is an organization or not, check its `is_organization` property.

Over time, we intend to migrate most workspaces into organizations and to release more organization-specific functionality. We may eventually deprecate using workspace-based APIs for organizations. Currently, and until after some reasonable grace period following any further announcements, you can still reference organizations in any `workspace` parameter.

</section>
<hr class="half-line">
<section>
## Get multiple workspaces

<a id="opIdgetWorkspaces"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces</code>
</p>

Returns the compact records for all workspaces visible to the authorized user.

<h3 id="get-multiple-workspaces-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-multiple-workspaces-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WorkspaceCompact](#schemaworkspacecompact)</span>|Return all workspaces visible to the authorized user.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get a workspace

<a id="opIdgetWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}</code>
</p>

Returns the full workspace record for a single workspace.

<h3 id="get-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Workspace](#schemaworkspace)</span>|Return the full workspace record.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Update a workspace

<a id="opIdupdateWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/workspaces/{workspace_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "name": "My Company Workspace"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}
```

<p>
<code> <span class="put-verb">PUT</span> /workspaces/{workspace_gid}</code>
</p>

A specific, existing workspace can be updated by making a PUT request on the URL for that workspace. Only the fields provided in the data block will be updated; any unspecified fields will remain unchanged.
Currently the only field that can be modified for a workspace is its name.
Returns the complete, updated workspace record.

<h3 id="update-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The workspace object with all updated properties.|
|» data<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|»» name<span class="param-type"> string</span>|The name of the workspace.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="update-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [Workspace](#schemaworkspace)</span>|Update for the workspace was successful.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Add a user to a workspace or organization

<a id="opIdaddUserForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "user": "12345"
  }
}
```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com",
    "photo": {
      "image_128x128": "https://...",
      "image_21x21": "https://...",
      "image_27x27": "https://...",
      "image_36x36": "https://...",
      "image_60x60": "https://..."
    },
    "workspaces": [
      {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    ]
  }
}
```

<p>
<code> <span class="post-verb">POST</span> /workspaces/{workspace_gid}/addUser</code>
</p>

Add a user to a workspace or organization.
The user can be referenced by their globally unique user ID or their email address. Returns the full user record for the invited user.

<h3 id="add-a-user-to-a-workspace-or-organization-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The user to add to the workspace.|
|» data<span class="param-type"> object</span>|A user identification object for specification with the addUser/removeUser endpoints.|
|»» user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="add-a-user-to-a-workspace-or-organization-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [User](#schemauser)</span>|The user was added successfully to the workspace or organization.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Remove a user from a workspace or organization

<a id="opIdremoveUserForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> Body parameter

```json
{
  "data": {
    "user": "12345"
  }
}
```

> 204 Response

```json
{
  "data": {}
}
```

<p>
<code> <span class="post-verb">POST</span> /workspaces/{workspace_gid}/removeUser</code>
</p>

Remove a user from a workspace or organization.
The user making this call must be an admin in the workspace. The user can be referenced by their globally unique user ID or their email address.
Returns an empty data record.

<h3 id="remove-a-user-from-a-workspace-or-organization-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|The user to remove from the workspace.|
|» data<span class="param-type"> object</span>|A user identification object for specification with the addUser/removeUser endpoints.|
|»» user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="remove-a-user-from-a-workspace-or-organization-responses">Responses</h3>

|Status|Description|
|---|---|
|204<span class="param-type"> Inline</span>|The user was removed successfully to the workspace or organization.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

<h3 id="remove-a-user-from-a-workspace-or-organization-responseschema">Response Schema</h3>

Status Code **204**

|Name|Description|
|---|---|
| data<span class="param-type"> [](#schemaemptyresponse)</span>|An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.|

</section><hr class="full-line">
<section class="full-section">
<h1 id="asana-workspace-memberships">Workspace Memberships</h1>

<pre class="highlight http tab-http">
<code><a href="#get-a-workspace-membership"><span class="get-verb">GET</span> <span class=""nn>/workspace_memberships/{workspace_membership_gid}</span></a><br><a href="#get-workspace-memberships-for-a-user"><span class="get-verb">GET</span> <span class=""nn>/users/{user_gid}/workspace_memberships</span></a><br><a href="#get-the-workspace-memberships-for-a-workspace"><span class="get-verb">GET</span> <span class=""nn>/workspaces/{workspace_gid}/workspace_memberships</span></a></code>
</pre>

This object determines if a user is a member of a workspace.

</section>
<hr class="half-line">
<section>
## Get a workspace membership

<a id="opIdgetWorkspaceMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspace_memberships/{workspace_membership_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": {
    "gid": "12345",
    "resource_type": "workspace_membership",
    "user": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    },
    "is_active": true,
    "is_admin": true,
    "is_guest": true,
    "user_task_list": {
      "gid": "12345",
      "resource_type": "user_task_list",
      "name": "My Tasks in My Workspace",
      "owner": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "workspace": {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    }
  }
}
```

<p>
<code> <span class="get-verb">GET</span> /workspace_memberships/{workspace_membership_gid}</code>
</p>

Returns the complete workspace record for a single workspace membership.

<h3 id="get-a-workspace-membership-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_membership_gid<span class="param-type"> string</span><div class="param-required">required</div>|none|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|

<h3 id="get-a-workspace-membership-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WorkspaceMembership](#schemaworkspacemembership)</span>|Successfully retrieved the requested workspace membership.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get workspace memberships for a user

<a id="opIdgetWorkspaceMembershipsForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/workspace_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "workspace_membership",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "workspace": {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /users/{user_gid}/workspace_memberships</code>
</p>

Returns the compact workspace membership records for the user.

<h3 id="get-workspace-memberships-for-a-user-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/user_gid<span class="param-type"> string</span><div class="param-required">required</div>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-workspace-memberships-for-a-user-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WorkspaceMembershipCompact](#schemaworkspacemembershipcompact)</span>|Successfully retrieved the requested user's workspace memberships.|
|400<span class="param-type"> [Error](#schemaerror)</span>|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|
|401<span class="param-type"> [Error](#schemaerror)</span>|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|
|403<span class="param-type"> [Error](#schemaerror)</span>|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|
|404<span class="param-type"> [Error](#schemaerror)</span>|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|
|500<span class="param-type"> [Error](#schemaerror)</span>|There was a problem on Asana’s end. In the event of a server error the response body should contain an error phrase. These phrases can be used by Asana support to quickly look up the incident that caused the server error. Some errors are due to server load, and will not supply an error phrase.|

</section><hr class="half-line">
<section>
## Get the workspace memberships for a workspace

<a id="opIdgetWorkspaceMembershipsForWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/workspace_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

> 200 Response

```json
{
  "data": [
    {
      "gid": "12345",
      "resource_type": "workspace_membership",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      },
      "workspace": {
        "gid": "12345",
        "resource_type": "workspace",
        "name": "My Company Workspace"
      }
    }
  ]
}
```

<p>
<code> <span class="get-verb">GET</span> /workspaces/{workspace_gid}/workspace_memberships</code>
</p>

Returns the compact workspace membership records for the workspace.

<h3 id="get-the-workspace-memberships-for-a-workspace-parameters">Parameters</h3>

|Name|Description|
|---|---|
|/workspace_gid<span class="param-type"> string</span><div class="param-required">required</div>|Globally unique identifier for the workspace or organization.|
|?user<span class="param-type"> string</span>|A string identifying a user. This can either be the string "me", an email, or the gid of a user.|
|?opt_pretty<span class="param-type"> boolean</span>|Provides “pretty” output.|
|?opt_fields<span class="param-type"> array[string]</span>|Defines fields to return.|
|?limit<span class="param-type"> integer</span>|Results per page.|
|?offset<span class="param-type"> string</span>|Offset token.|

<h3 id="get-the-workspace-memberships-for-a-workspace-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WorkspaceMembershipCompact](#schemaworkspacemembershipcompact)</span>|Successfully retrieved the requested workspace's memberships.|

</section><hr class="full-line">
<section class="full-section">
# Schemas
</section>
<hr>
<section>
<a id="schemaasananamedresource"></a>
<a id="schema_AsanaNamedResource"></a>
<a id="tocSasananamedresource"></a>
<a id="tocsasananamedresource"></a>
<h2 id="tocS_AsanaNamedResource">AsanaNamedResource</h2>

```json
{
  "gid": "12345",
  "resource_type": "task",
  "name": "Bug Task"
}

```

A generic Asana Resource, containing a globally unique identifier.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the object.|

</section><hr>
<section>
<a id="schemaasanaresource"></a>
<a id="schema_AsanaResource"></a>
<a id="tocSasanaresource"></a>
<a id="tocsasanaresource"></a>
<h2 id="tocS_AsanaResource">AsanaResource</h2>

```json
{
  "gid": "12345",
  "resource_type": "task"
}

```

A generic Asana Resource, containing a globally unique identifier.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|

</section><hr>
<section>
<a id="schemaattachmentcompact"></a>
<a id="schema_AttachmentCompact"></a>
<a id="tocSattachmentcompact"></a>
<a id="tocsattachmentcompact"></a>
<h2 id="tocS_AttachmentCompact">AttachmentCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "attachment",
  "name": "Screenshot.png"
}

```

A `Compact` object is the same as the [full response object](#tocS_Attachment), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the file.|

</section><hr>
<section>
<a id="schemaattachment"></a>
<a id="schema_Attachment"></a>
<a id="tocSattachment"></a>
<a id="tocsattachment"></a>
<h2 id="tocS_Attachment">Attachment</h2>

```json
{
  "gid": "12345",
  "resource_type": "attachment",
  "name": "Screenshot.png",
  "created_at": "2012-02-22T02:06:58.147Z",
  "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
  "host": "dropbox",
  "parent": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
}

```

An *attachment* object represents any file attached to a task in Asana, whether it’s an uploaded file or one associated via a third-party service such as Dropbox or Google Drive.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the file.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|download_url<span class="param-type"> string(uri)¦null</span>|The URL containing the content of the attachment.<br>*Note:* May be null if the attachment is hosted by [Box](https://www.box.com/). If present, this URL may only be valid for 1 hour from the time of retrieval. You should avoid persisting this URL somewhere and just refresh it on demand to ensure you do not keep stale URLs.|
|host<span class="param-type"> string</span>|The service hosting the attachment. Valid values are `asana`, `dropbox`, `gdrive` and `box`.|
|parent<span class="param-type"> object</span>|The task this attachment is attached to.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|view_url<span class="param-type"> string(uri)¦null</span>|The URL where the attachment can be viewed, which may be friendlier to users in a browser than just directing them to a raw file. May be null if no view URL exists for the service.|

</section><hr>
<section>
<a id="schemabatch"></a>
<a id="schema_Batch"></a>
<a id="tocSbatch"></a>
<a id="tocsbatch"></a>
<h2 id="tocS_Batch">Batch</h2>

```json
{
  "body": {
    "data": {
      "completed": false,
      "gid": "1967",
      "name": "Hello, world!",
      "notes": "How are you today?"
    }
  },
  "headers": {
    "location": "/tasks/1234"
  },
  "status_code": 200
}

```

A response object returned from a batch request.

### Properties

|Name|Description|
|---|---|
|body<span class="param-type"> object</span>|The JSON body that the invoked endpoint returned.|
|headers<span class="param-type"> object</span>|A map of HTTP headers specific to this result. This is primarily used for returning a `Location` header to accompany a `201 Created` result.  The parent HTTP response will contain all common headers.|
|status_code<span class="param-type"> integer</span>|The HTTP status code that the invoked endpoint returned.|

</section><hr>
<section>
<a id="schemacustomfieldcompact"></a>
<a id="schema_CustomFieldCompact"></a>
<a id="tocScustomfieldcompact"></a>
<a id="tocscustomfieldcompact"></a>
<h2 id="tocS_CustomFieldCompact">CustomFieldCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "custom_field",
  "enabled": true,
  "enum_options": [
    {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    }
  ],
  "name": "Status",
  "number_value": 5.2,
  "resource_subtype": "text",
  "text_value": "Some Value",
  "type": "text"
}

```

A `Compact` object is the same as the [full response object](#tocS_CustomField), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|» name<span class="param-type"> string</span>|The name of the enum option.|
|name<span class="param-type"> string</span>|The name of the custom field.|
|number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|

#### Enumerated Values

|Property|Value|
|---|---|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemacustomfield"></a>
<a id="schema_CustomField"></a>
<a id="tocScustomfield"></a>
<a id="tocscustomfield"></a>
<h2 id="tocS_CustomField">CustomField</h2>

```json
{
  "gid": "12345",
  "resource_type": "custom_field",
  "currency_code": "EUR",
  "custom_label": "gold pieces",
  "custom_label_position": "suffix",
  "description": "Development team priority",
  "enabled": true,
  "enum_options": [
    {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    }
  ],
  "enum_value": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  },
  "format": "custom",
  "has_notifications_enabled": true,
  "is_global_to_workspace": true,
  "name": "Status",
  "number_value": 5.2,
  "precision": 2,
  "resource_subtype": "text",
  "text_value": "Some Value",
  "type": "text"
}

```

Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](#asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.

Users in Asana can [lock custom fields](https://asana.com/guide/help/premium/custom-fields#gl-lock-fields), which will make them read-only when accessed by other users. Attempting to edit a locked custom field will return HTTP error code `403 Forbidden`.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|» name<span class="param-type"> string</span>|The name of the enum option.|
|enum_value<span class="param-type"> object</span>|*Conditional*. Only relevant for custom fields of type `enum`. This object is the chosen value of an enum custom field.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|» name<span class="param-type"> string</span>|The name of the enum option.|
|format<span class="param-type"> string</span>|The format of this custom field.|
|has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|is_global_to_workspace<span class="param-type"> boolean</span>|This flag describes whether this custom field is available to every container in the workspace. Before project-specific custom fields, this field was always true.|
|name<span class="param-type"> string</span>|The name of the custom field.|
|number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.<br>For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.<br>The identifier format will always have a precision of 0.|
|resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|

#### Enumerated Values

|Property|Value|
|---|---|
|custom_label_position|prefix|
|custom_label_position|suffix|
|format|currency|
|format|identifier|
|format|percentage|
|format|custom|
|format|none|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemacustomfieldsettingcompact"></a>
<a id="schema_CustomFieldSettingCompact"></a>
<a id="tocScustomfieldsettingcompact"></a>
<a id="tocscustomfieldsettingcompact"></a>
<h2 id="tocS_CustomFieldSettingCompact">CustomFieldSettingCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "custom_field_setting"
}

```

A `Compact` object is the same as the [full response object](#tocS_CustomFieldSetting), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|

</section><hr>
<section>
<a id="schemacustomfieldsetting"></a>
<a id="schema_CustomFieldSetting"></a>
<a id="tocScustomfieldsetting"></a>
<a id="tocscustomfieldsetting"></a>
<h2 id="tocS_CustomFieldSetting">CustomFieldSetting</h2>

```json
{
  "gid": "12345",
  "resource_type": "custom_field_setting",
  "custom_field": {
    "gid": "12345",
    "resource_type": "custom_field",
    "currency_code": "EUR",
    "custom_label": "gold pieces",
    "custom_label_position": "suffix",
    "description": "Development team priority",
    "enabled": true,
    "enum_options": [
      {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "enum_value": {
      "gid": "12345",
      "resource_type": "enum_option",
      "color": "blue",
      "enabled": true,
      "name": "Low"
    },
    "format": "custom",
    "has_notifications_enabled": true,
    "is_global_to_workspace": true,
    "name": "Status",
    "number_value": 5.2,
    "precision": 2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "type": "text"
  },
  "is_important": false,
  "parent": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  }
}

```

Custom Fields Settings objects represent the many-to-many join of the Custom Field and Project as well as stores information that is relevant to that particular pairing.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|custom_field<span class="param-type"> object</span>|The custom field that is applied to the `parent`.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|» custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|» custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|» description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» enum_value<span class="param-type"> object</span>|*Conditional*. Only relevant for custom fields of type `enum`. This object is the chosen value of an enum custom field.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» format<span class="param-type"> string</span>|The format of this custom field.|
|» has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|» is_global_to_workspace<span class="param-type"> boolean</span>|This flag describes whether this custom field is available to every container in the workspace. Before project-specific custom fields, this field was always true.|
|» name<span class="param-type"> string</span>|The name of the custom field.|
|» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|» precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.<br>For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.<br>The identifier format will always have a precision of 0.|
|» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|
|is_important<span class="param-type"> boolean</span>|`is_important` is used in the Asana web application to determine if this custom field is displayed in the list/grid view of a project or portfolio.|
|parent<span class="param-type"> object</span>|The parent to which the custom field is applied. This can be a project or portfolio and indicates that the tasks or projects that the parent contains may be given custom field values for this custom field.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|project<span class="param-type"> object</span>|*Deprecated: new integrations should prefer the `parent` field.* The id of the project that this custom field settings refers to.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

#### Enumerated Values

|Property|Value|
|---|---|
|custom_label_position|prefix|
|custom_label_position|suffix|
|format|currency|
|format|identifier|
|format|percentage|
|format|custom|
|format|none|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemaenumoption"></a>
<a id="schema_EnumOption"></a>
<a id="tocSenumoption"></a>
<a id="tocsenumoption"></a>
<h2 id="tocS_EnumOption">EnumOption</h2>

```json
{
  "gid": "12345",
  "resource_type": "enum_option",
  "color": "blue",
  "enabled": true,
  "name": "Low"
}

```

Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.

You can add enum options to a custom field by using the `POST /custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum options can be disabled by updating the `enabled` field to false with the `PUT /enum_options/enum_option_gid` endpoint. Other attributes can be updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning the enum option is a selectable value for the custom field. Setting `enabled=false` is equivalent to “trashing” the enum option in the Asana web app within the “Edit Fields” dialog. The enum option will no longer be selectable but, if the enum option value was previously set within a task, the task will retain the value.

Enum options are an ordered list and by default new enum options are inserted at the end. Ordering in relation to existing enum options can be specified on creation by using `insert_before` or `insert_after` to reference an existing enum option. Only one of `insert_before` and `insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST /custom_fields/custom_field_gid/enum_options/insert` endpoint.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|name<span class="param-type"> string</span>|The name of the enum option.|

</section><hr>
<section>
<a id="schemaerror"></a>
<a id="schema_Error"></a>
<a id="tocSerror"></a>
<a id="tocserror"></a>
<h2 id="tocS_Error">Error</h2>

```json
{
  "errors": [
    {
      "help": "For more information on API status codes and how to handle them, read the docs on errors: https://asana.github.io/developer-docs/#errors'",
      "message": "project: Missing input",
      "phrase": "6 sad squid snuggle softly"
    }
  ]
}

```

Sadly, sometimes requests to the API are not successful. Failures can
occur for a wide range of reasons. In all cases, the API should return
an HTTP Status Code that indicates the nature of the failure,
with a response body in JSON format containing additional information.

In the event of a server error the response body will contain an error
phrase. These phrases are automatically generated using the
[node-asana-phrase
library](https://github.com/Asana/node-asana-phrase) and can be used by
Asana support to quickly look up the incident that caused the server
error.

### Properties

|Name|Description|
|---|---|
|errors<span class="param-type"> [object]</span>|none|
|» help<span class="param-type"> string</span>|Additional information directing developers to resources on how to address and fix the problem, if available.|
|» message<span class="param-type"> string</span>|Message providing more detail about the error that occurred, if available.|
|» phrase<span class="param-type"> string</span>|*500 errors only*. A unique error phrase which can be used when contacting developer support to help identify the exact occurrence of the problem in Asana’s logs.|

</section><hr>
<section>
<a id="schemaevent"></a>
<a id="schema_Event"></a>
<a id="tocSevent"></a>
<a id="tocsevent"></a>
<h2 id="tocS_Event">Event</h2>

```json
{
  "action": "changed",
  "created_at": "2012-02-22T02:06:58.147Z",
  "parent": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "resource": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "type": "task",
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

An *event* is an object representing a change to a resource that was
observed by an event subscription.

The event may be triggered by a different `user` than the
subscriber. For example, if user A subscribes to a task and user B
modified it, the event’s user will be user B. Note: Some events
are generated by the system, and will have `null` as the user. API
consumers should make sure to handle this case.

The `resource` that triggered the event may be different from
the one that the events were requested for. For example, a
subscription to a project will contain events for tasks contained
within the project.

For added/removed events, the `parent` that resource was added to or
removed from. The parent will be `null` for other event types.

### Properties

|Name|Description|
|---|---|
|action<span class="param-type"> string</span>|The type of action taken that triggered the event.|
|created_at<span class="param-type"> string(date-time)</span>|The timestamp when the event occurred.|
|parent<span class="param-type"> object</span>|A generic Asana Resource, containing a globally unique identifier.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the object.|
|resource<span class="param-type"> object</span>|A generic Asana Resource, containing a globally unique identifier.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the object.|
|type<span class="param-type"> string</span>|*Deprecated: Refer to the resource_type of the resource.*<br>The type of the resource that generated the event.<br><br>*Note: Currently, only tasks, projects and stories generate<br>events.*|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemajobcompact"></a>
<a id="schema_JobCompact"></a>
<a id="tocSjobcompact"></a>
<a id="tocsjobcompact"></a>
<h2 id="tocS_JobCompact">JobCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "job",
  "new_project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "new_task": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "resource_subtype": "duplicate_task",
  "status": "in_progress"
}

```

A `Compact` object is the same as the [full response object](#tocS_Job), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|new_project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|new_task<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|status<span class="param-type"> string</span>|none|

#### Enumerated Values

|Property|Value|
|---|---|
|status|not_started|
|status|in_progress|
|status|completed|
|status|failed|

</section><hr>
<section>
<a id="schemajob"></a>
<a id="schema_Job"></a>
<a id="tocSjob"></a>
<a id="tocsjob"></a>
<h2 id="tocS_Job">Job</h2>

```json
{
  "gid": "12345",
  "resource_type": "job",
  "new_project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "new_task": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "resource_subtype": "duplicate_task",
  "status": "in_progress"
}

```

A *job* is an object representing a process that handles asynchronous work.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|new_project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|new_task<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|status<span class="param-type"> string</span>|none|

#### Enumerated Values

|Property|Value|
|---|---|
|status|not_started|
|status|in_progress|
|status|completed|
|status|failed|

</section><hr>
<section>
<a id="schemaportfoliocompact"></a>
<a id="schema_PortfolioCompact"></a>
<a id="tocSportfoliocompact"></a>
<a id="tocsportfoliocompact"></a>
<h2 id="tocS_PortfolioCompact">PortfolioCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "portfolio",
  "name": "Bug Portfolio"
}

```

A `Compact` object is the same as the [full response object](#tocS_Portfolio), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the portfolio.|

</section><hr>
<section>
<a id="schemaportfoliomembershipcompact"></a>
<a id="schema_PortfolioMembershipCompact"></a>
<a id="tocSportfoliomembershipcompact"></a>
<a id="tocsportfoliomembershipcompact"></a>
<h2 id="tocS_PortfolioMembershipCompact">PortfolioMembershipCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "portfolio_membership",
  "portfolio": {
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Portfolio"
  },
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A `Compact` object is the same as the [full response object](#tocS_PortfolioMembership), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|portfolio<span class="param-type"> object</span>|A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.<br>Portfolios have some restrictions on size. Each portfolio has a max of 250 items and, like projects, a max of 20 custom fields.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the portfolio.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemaportfoliomembership"></a>
<a id="schema_PortfolioMembership"></a>
<a id="tocSportfoliomembership"></a>
<a id="tocsportfoliomembership"></a>
<h2 id="tocS_PortfolioMembership">PortfolioMembership</h2>

```json
{
  "gid": "12345",
  "resource_type": "portfolio_membership",
  "portfolio": {
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Portfolio"
  },
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

This object determines if a user is a member of a portfolio.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|portfolio<span class="param-type"> object</span>|A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.<br>Portfolios have some restrictions on size. Each portfolio has a max of 250 items and, like projects, a max of 20 custom fields.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the portfolio.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemaportfolio"></a>
<a id="schema_Portfolio"></a>
<a id="tocSportfolio"></a>
<a id="tocsportfolio"></a>
<h2 id="tocS_Portfolio">Portfolio</h2>

```json
{
  "gid": "12345",
  "resource_type": "portfolio",
  "name": "Bug Portfolio",
  "color": "light-green",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "custom_field_settings": [
    {
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "custom_field": {
        "gid": "12345",
        "resource_type": "custom_field",
        "currency_code": "EUR",
        "custom_label": "gold pieces",
        "custom_label_position": "suffix",
        "description": "Development team priority",
        "enabled": true,
        "enum_options": [
          {
            "gid": "12345",
            "resource_type": "enum_option",
            "color": "blue",
            "enabled": true,
            "name": "Low"
          }
        ],
        "enum_value": {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        },
        "format": "custom",
        "has_notifications_enabled": true,
        "is_global_to_workspace": true,
        "name": "Status",
        "number_value": 5.2,
        "precision": 2,
        "resource_subtype": "text",
        "text_value": "Some Value",
        "type": "text"
      },
      "is_important": false,
      "parent": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      },
      "project": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      }
    }
  ],
  "members": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "owner": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](#asana-project-statuses) update.
Portfolios have some restrictions on size. Each portfolio has a max of 250 items and, like projects, a max of 20 custom fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the portfolio.|
|color<span class="param-type"> string</span>|Color of the portfolio.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|custom_field_settings<span class="param-type"> [object]</span>|Array of custom field settings applied to the portfolio.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» custom_field<span class="param-type"> object</span>|The custom field that is applied to the `parent`.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|»» custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|»» custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|»» description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|»» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|»» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»»» name<span class="param-type"> string</span>|The name of the enum option.|
|»» enum_value<span class="param-type"> object</span>|*Conditional*. Only relevant for custom fields of type `enum`. This object is the chosen value of an enum custom field.|
|»»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»»» name<span class="param-type"> string</span>|The name of the enum option.|
|»» format<span class="param-type"> string</span>|The format of this custom field.|
|»» has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|»» is_global_to_workspace<span class="param-type"> boolean</span>|This flag describes whether this custom field is available to every container in the workspace. Before project-specific custom fields, this field was always true.|
|»» name<span class="param-type"> string</span>|The name of the custom field.|
|»» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|»» precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.<br>For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.<br>The identifier format will always have a precision of 0.|
|»» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|»» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|»» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|
|» is_important<span class="param-type"> boolean</span>|`is_important` is used in the Asana web application to determine if this custom field is displayed in the list/grid view of a project or portfolio.|
|» parent<span class="param-type"> object</span>|The parent to which the custom field is applied. This can be a project or portfolio and indicates that the tasks or projects that the parent contains may be given custom field values for this custom field.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|» project<span class="param-type"> object</span>|*Deprecated: new integrations should prefer the `parent` field.* The id of the project that this custom field settings refers to.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|members<span class="param-type"> [object]</span>|none|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|owner<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|workspace<span class="param-type"> object</span>|*Create-only*. The workspace or organization that the portfolio belongs to.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|
|custom_label_position|prefix|
|custom_label_position|suffix|
|format|currency|
|format|identifier|
|format|percentage|
|format|custom|
|format|none|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemaprojectcompact"></a>
<a id="schema_ProjectCompact"></a>
<a id="tocSprojectcompact"></a>
<a id="tocsprojectcompact"></a>
<h2 id="tocS_ProjectCompact">ProjectCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "project",
  "name": "Stuff to buy"
}

```

A `Compact` object is the same as the [full response object](#tocS_Project), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

</section><hr>
<section>
<a id="schemaprojectmembershipcompact"></a>
<a id="schema_ProjectMembershipCompact"></a>
<a id="tocSprojectmembershipcompact"></a>
<a id="tocsprojectmembershipcompact"></a>
<h2 id="tocS_ProjectMembershipCompact">ProjectMembershipCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "project_membership",
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A `Compact` object is the same as the [full response object](#tocS_ProjectMembership), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemaprojectmembership"></a>
<a id="schema_ProjectMembership"></a>
<a id="tocSprojectmembership"></a>
<a id="tocsprojectmembership"></a>
<h2 id="tocS_ProjectMembership">ProjectMembership</h2>

```json
{
  "gid": "12345",
  "resource_type": "project_membership",
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "write_access": "full_write"
}

```

With the introduction of “comment-only” projects in Asana, a user’s membership in a project comes with associated permissions. These permissions (whether a user has full access to the project or comment-only access) are accessible through the project memberships endpoints described here.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|write_access<span class="param-type"> string</span>|Whether the user has full access to the project or has comment-only access.|

#### Enumerated Values

|Property|Value|
|---|---|
|write_access|full_write|
|write_access|comment_only|

</section><hr>
<section>
<a id="schemaproject"></a>
<a id="schema_Project"></a>
<a id="tocSproject"></a>
<a id="tocsproject"></a>
<h2 id="tocS_Project">Project</h2>

```json
{
  "gid": "12345",
  "resource_type": "project",
  "name": "Stuff to buy",
  "archived": false,
  "color": "light-green",
  "created_at": "2012-02-22T02:06:58.147Z",
  "current_status": {
    "gid": "12345",
    "resource_type": "project_status",
    "title": "Status Update - Jun 15",
    "color": "green",
    "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
    "project": "123456",
    "text": "The project is moving forward according to plan...",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  },
  "custom_field_settings": [
    {
      "gid": "12345",
      "resource_type": "custom_field_setting"
    }
  ],
  "default_view": "calendar",
  "due_date": "2019-09-15",
  "due_on": "2019-09-15",
  "html_notes": "These are things we need to purchase.",
  "is_template": false,
  "members": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "modified_at": "2012-02-22T02:06:58.147Z",
  "notes": "These are things we need to purchase.",
  "public": false,
  "start_on": "2019-09-14",
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  },
  "custom_fields": [
    {
      "gid": "12345",
      "resource_type": "custom_field",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "name": "Status",
      "number_value": 5.2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    }
  ],
  "followers": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "owner": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "team": {
    "gid": "12345",
    "resource_type": "team",
    "name": "Marketing"
  }
}

```

A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|archived<span class="param-type"> boolean</span>|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|color<span class="param-type"> string¦null</span>|Color of the project.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|current_status<span class="param-type"> object</span>|A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» title<span class="param-type"> string</span>|The title of the project status update.|
|» color<span class="param-type"> string</span>|The color associated with the status update.|
|» html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|» project<span class="param-type"> string</span>|Globally unique identifier for the project.|
|» text<span class="param-type"> string</span>|The text content of the status update.|
|» created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|custom_field_settings<span class="param-type"> [object]</span>|Array of Custom Field Settings (in compact form).|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|default_view<span class="param-type"> string</span>|The default view (list, board, calendar, or timeline) of a project.|
|due_date<span class="param-type"> string(date-time)¦null</span>|*Deprecated: new integrations should prefer the due_on field.*|
|due_on<span class="param-type"> string(date-time)¦null</span>|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the project with formatting as HTML.|
|is_template<span class="param-type"> boolean</span>|[Opt In](#input-output-options). Determines if the project is a template.|
|members<span class="param-type"> [object]</span>|Array of users who are members of this project.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|modified_at<span class="param-type"> string(date-time)</span>|The time at which this project was last modified.<br>*Note: This does not currently reflect any changes in associations such as tasks or comments that may have been added or removed from the project.*|
|notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the project.|
|public<span class="param-type"> boolean</span>|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|start_on<span class="param-type"> string(date)¦null</span>|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|workspace<span class="param-type"> object</span>|*Create-only*. The workspace or organization this project is associated with. Once created, projects cannot be moved to a different workspace. This attribute can only be specified at creation time.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|
|custom_fields<span class="param-type"> [object]</span>|Array of Custom Fields.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» name<span class="param-type"> string</span>|The name of the custom field.|
|» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|
|followers<span class="param-type"> [object]</span>|Array of users following this project. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|owner<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|team<span class="param-type"> object</span>|*Create-only*. The team that this project is shared with. This field only exists for projects in organizations.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the team.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|
|color|green|
|color|yellow|
|color|red|
|default_view|list|
|default_view|board|
|default_view|calendar|
|default_view|timeline|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemaprojectstatuscompact"></a>
<a id="schema_ProjectStatusCompact"></a>
<a id="tocSprojectstatuscompact"></a>
<a id="tocsprojectstatuscompact"></a>
<h2 id="tocS_ProjectStatusCompact">ProjectStatusCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "project_status",
  "title": "Status Update - Jun 15"
}

```

A `Compact` object is the same as the [full response object](#tocS_ProjectStatus), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|title<span class="param-type"> string</span>|The title of the project status update.|

</section><hr>
<section>
<a id="schemaprojectstatus"></a>
<a id="schema_ProjectStatus"></a>
<a id="tocSprojectstatus"></a>
<a id="tocsprojectstatus"></a>
<h2 id="tocS_ProjectStatus">ProjectStatus</h2>

```json
{
  "gid": "12345",
  "resource_type": "project_status",
  "title": "Status Update - Jun 15",
  "color": "green",
  "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
  "project": "123456",
  "text": "The project is moving forward according to plan...",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|title<span class="param-type"> string</span>|The title of the project status update.|
|color<span class="param-type"> string</span>|The color associated with the status update.|
|html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). The text content of the status update with formatting as HTML.|
|project<span class="param-type"> string</span>|Globally unique identifier for the project.|
|text<span class="param-type"> string</span>|The text content of the status update.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|green|
|color|yellow|
|color|red|

</section><hr>
<section>
<a id="schemasectioncompact"></a>
<a id="schema_SectionCompact"></a>
<a id="tocSsectioncompact"></a>
<a id="tocssectioncompact"></a>
<h2 id="tocS_SectionCompact">SectionCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "section",
  "name": "Next Actions"
}

```

A `Compact` object is the same as the [full response object](#tocS_Section), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the section (i.e. the text displayed as the section header).|

</section><hr>
<section>
<a id="schemasection"></a>
<a id="schema_Section"></a>
<a id="tocSsection"></a>
<a id="tocssection"></a>
<h2 id="tocS_Section">Section</h2>

```json
{
  "gid": "12345",
  "resource_type": "section",
  "name": "Next Actions",
  "created_at": "2012-02-22T02:06:58.147Z",
  "project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "projects": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}

```

A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the section (i.e. the text displayed as the section header).|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|projects<span class="param-type"> [object]</span>|*Deprecated - please use project instead*|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

</section><hr>
<section>
<a id="schemastorycompact"></a>
<a id="schema_StoryCompact"></a>
<a id="tocSstorycompact"></a>
<a id="tocsstorycompact"></a>
<h2 id="tocS_StoryCompact">StoryCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "story",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "resource_subtype": "comment_added",
  "text": "marked today",
  "type": "comment"
}

```

A `Compact` object is the same as the [full response object](#tocS_Story), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|text<span class="param-type"> string</span>|*Create-only*. Human-readable text for the story or comment.<br>This will not include the name of the creator.<br>*Note: This is not guaranteed to be stable for a given type of story. For example, text for a reassignment may not always say “assigned to …” as the text for a story can both be edited and change based on the language settings of the user making the request.*<br>Use the `resource_subtype` property to discover the action that created the story.|
|type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the `resource_subtype` field.*|

</section><hr>
<section>
<a id="schemastory"></a>
<a id="schema_Story"></a>
<a id="tocSstory"></a>
<a id="tocsstory"></a>
<h2 id="tocS_Story">Story</h2>

```json
{
  "gid": "12345",
  "resource_type": "story",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "resource_subtype": "comment_added",
  "text": "This is a comment.",
  "type": "comment",
  "html_text": "<body>This is a comment.<body>",
  "is_pinned": false,
  "assignee": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "custom_field": {
    "gid": "12345",
    "resource_type": "custom_field",
    "enabled": true,
    "enum_options": [
      {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      }
    ],
    "name": "Status",
    "number_value": 5.2,
    "resource_subtype": "text",
    "text_value": "Some Value",
    "type": "text"
  },
  "dependency": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "duplicate_of": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "duplicated_from": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "follower": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "hearted": false,
  "hearts": [
    {
      "gid": "12345",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ],
  "is_edited": false,
  "liked": false,
  "likes": [
    {
      "gid": "12345",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ],
  "new_approval_status": "approved",
  "new_dates": {
    "due_at": "2019-09-15T02:06:58.158Z",
    "due_on": "2019-09-15",
    "start_on": "2019-09-14"
  },
  "new_enum_value": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  },
  "new_name": "This is the New Name",
  "new_number_value": 2,
  "new_resource_subtype": "milestone",
  "new_section": {
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions"
  },
  "new_text_value": "This is the New Text",
  "num_hearts": 5,
  "num_likes": 5,
  "old_approval_status": "pending",
  "old_dates": {
    "due_at": "2019-09-15T02:06:58.158Z",
    "due_on": "2019-09-15",
    "start_on": "2019-09-14"
  },
  "old_enum_value": {
    "gid": "12345",
    "resource_type": "enum_option",
    "color": "blue",
    "enabled": true,
    "name": "Low"
  },
  "old_name": "This was the Old Name",
  "old_number_value": 1,
  "old_resource_subtype": "default_task",
  "old_section": {
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions"
  },
  "old_text_value": "This was the Old Text",
  "previews": [
    {
      "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
      "footer": "Mar 17, 2019 1:25 PM",
      "header": "Asana for Slack",
      "header_link": "https://asana.comn/apps/slack",
      "html_text": "<body>Great! I like this idea.</body>",
      "text": "Great! I like this idea.",
      "title": "Greg",
      "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
    }
  ],
  "project": {
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "source": "web",
  "story": {
    "gid": "12345",
    "resource_type": "story",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "resource_subtype": "comment_added",
    "text": "marked today",
    "type": "comment"
  },
  "tag": {
    "gid": "12345",
    "resource_type": "tag",
    "name": "Stuff to buy"
  },
  "target": {
    "gid": "1234",
    "name": "Bug Task"
  },
  "task": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  }
}

```

A story represents an activity associated with an object in the Asana system.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|text<span class="param-type"> string</span>|The plain text of the comment to add. Cannot be used with html_text.|
|type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the `resource_subtype` field.*|
|html_text<span class="param-type"> string</span>|[Opt In](#input-output-options). HTML formatted text for a comment. This will not include the name of the creator.|
|is_pinned<span class="param-type"> boolean</span>|*Conditional*. Whether the story should be pinned on the resource.|
|assignee<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|custom_field<span class="param-type"> object</span>|Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](#asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.<br><br>Users in Asana can [lock custom fields](https://asana.com/guide/help/premium/custom-fields#gl-lock-fields), which will make them read-only when accessed by other users. Attempting to edit a locked custom field will return HTTP error code `403 Forbidden`.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» name<span class="param-type"> string</span>|The name of the custom field.|
|» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|
|dependency<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|duplicate_of<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|duplicated_from<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|follower<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|hearted<span class="param-type"> boolean</span>|*Deprecated - please use likes instead*<br>*Conditional*. True if the story is hearted by the authorized user, false if not.|
|hearts<span class="param-type"> [object]</span>|*Deprecated - please use likes instead*<br><br>*Conditional*. Array of likes for users who have hearted this story.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the object, as a string.|
|» user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|is_edited<span class="param-type"> boolean</span>|*Conditional*. Whether the text of the story has been edited after creation.|
|liked<span class="param-type"> boolean</span>|*Conditional*. True if the story is liked by the authorized user, false if not.|
|likes<span class="param-type"> [object]</span>|*Conditional*. Array of likes for users who have liked this story.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the object, as a string.|
|» user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|new_approval_status<span class="param-type"> string</span>|*Conditional*|
|new_dates<span class="param-type"> object</span>|*Conditional*|
|» due_at<span class="param-type"> string(date-time)</span>|none|
|» due_on<span class="param-type"> string(date)</span>|none|
|» start_on<span class="param-type"> string(date)</span>|none|
|new_enum_value<span class="param-type"> object</span>|Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.<br><br>You can add enum options to a custom field by using the `POST /custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum options can be disabled by updating the `enabled` field to false with the `PUT /enum_options/enum_option_gid` endpoint. Other attributes can be updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning the enum option is a selectable value for the custom field. Setting `enabled=false` is equivalent to “trashing” the enum option in the Asana web app within the “Edit Fields” dialog. The enum option will no longer be selectable but, if the enum option value was previously set within a task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are inserted at the end. Ordering in relation to existing enum options can be specified on creation by using `insert_before` or `insert_after` to reference an existing enum option. Only one of `insert_before` and `insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST /custom_fields/custom_field_gid/enum_options/insert` endpoint.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|» name<span class="param-type"> string</span>|The name of the enum option.|
|new_name<span class="param-type"> string</span>|*Conditional*|
|new_number_value<span class="param-type"> integer</span>|*Conditional*|
|new_resource_subtype<span class="param-type"> string</span>|*Conditional*|
|new_section<span class="param-type"> object</span>|A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the section (i.e. the text displayed as the section header).|
|new_text_value<span class="param-type"> string</span>|*Conditional*|
|num_hearts<span class="param-type"> integer</span>|*Deprecated - please use likes instead*<br><br>*Conditional*. The number of users who have hearted this story.|
|num_likes<span class="param-type"> integer</span>|*Conditional*. The number of users who have liked this story.|
|old_approval_status<span class="param-type"> string</span>|*Conditional*|
|old_dates<span class="param-type"> object</span>|*Conditional*|
|» due_at<span class="param-type"> string(date-time)</span>|none|
|» due_on<span class="param-type"> string(date)</span>|none|
|» start_on<span class="param-type"> string(date)</span>|none|
|old_enum_value<span class="param-type"> object</span>|Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.<br><br>You can add enum options to a custom field by using the `POST /custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum options can be disabled by updating the `enabled` field to false with the `PUT /enum_options/enum_option_gid` endpoint. Other attributes can be updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning the enum option is a selectable value for the custom field. Setting `enabled=false` is equivalent to “trashing” the enum option in the Asana web app within the “Edit Fields” dialog. The enum option will no longer be selectable but, if the enum option value was previously set within a task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are inserted at the end. Ordering in relation to existing enum options can be specified on creation by using `insert_before` or `insert_after` to reference an existing enum option. Only one of `insert_before` and `insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST /custom_fields/custom_field_gid/enum_options/insert` endpoint.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|» name<span class="param-type"> string</span>|The name of the enum option.|
|old_name<span class="param-type"> string</span>|*Conditional*'|
|old_number_value<span class="param-type"> integer</span>|*Conditional*|
|old_resource_subtype<span class="param-type"> string</span>|*Conditional*|
|old_section<span class="param-type"> object</span>|A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the section (i.e. the text displayed as the section header).|
|old_text_value<span class="param-type"> string</span>|*Conditional*|
|previews<span class="param-type"> [object]</span>|*Conditional*. A collection of previews to be displayed in the story.<br><br>*Note: This property only exists for comment stories.*|
|» fallback<span class="param-type"> string</span>|Some fallback text to display if unable to display the full preview.|
|» footer<span class="param-type"> string</span>|Text to display in the footer.|
|» header<span class="param-type"> string</span>|Text to display in the header.|
|» header_link<span class="param-type"> string</span>|Where the header will link to.|
|» html_text<span class="param-type"> string</span>|HTML formatted text for the body of the preview.|
|» text<span class="param-type"> string</span>|Text for the body of the preview.|
|» title<span class="param-type"> string</span>|Text to display as the title.|
|» title_link<span class="param-type"> string</span>|Where to title will link to.|
|project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|source<span class="param-type"> string</span>|The component of the Asana product the user used to trigger the story.|
|story<span class="param-type"> object</span>|A story represents an activity associated with an object in the Asana system.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|» created_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|» resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|» text<span class="param-type"> string</span>|*Create-only*. Human-readable text for the story or comment.<br>This will not include the name of the creator.<br>*Note: This is not guaranteed to be stable for a given type of story. For example, text for a reassignment may not always say “assigned to …” as the text for a story can both be edited and change based on the language settings of the user making the request.*<br>Use the `resource_subtype` property to discover the action that created the story.|
|» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the `resource_subtype` field.*|
|tag<span class="param-type"> object</span>|A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|target<span class="param-type"> object</span>|The object this story is associated with. Currently may only be a task.|
|» gid<span class="param-type"> string</span>|none|
|» name<span class="param-type"> string</span>|none|
|task<span class="param-type"> object</span>|The *task* is the basic object around which many operations in Asana are centered.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|

#### Enumerated Values

|Property|Value|
|---|---|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|
|source|web|
|source|email|
|source|mobile|
|source|api|
|source|unknown|

</section><hr>
<section>
<a id="schematagcompact"></a>
<a id="schema_TagCompact"></a>
<a id="tocStagcompact"></a>
<a id="tocstagcompact"></a>
<h2 id="tocS_TagCompact">TagCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "tag",
  "name": "Stuff to buy"
}

```

A `Compact` object is the same as the [full response object](#tocS_Tag), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

</section><hr>
<section>
<a id="schematag"></a>
<a id="schema_Tag"></a>
<a id="tocStag"></a>
<a id="tocstag"></a>
<h2 id="tocS_Tag">Tag</h2>

```json
{
  "gid": "12345",
  "resource_type": "tag",
  "color": "light-green",
  "followers": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "name": "Stuff to buy",
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|color<span class="param-type"> string</span>|Color of the tag.|
|followers<span class="param-type"> [object]</span>|Array of users following this tag.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|

</section><hr>
<section>
<a id="schemataskcompact"></a>
<a id="schema_TaskCompact"></a>
<a id="tocStaskcompact"></a>
<a id="tocstaskcompact"></a>
<h2 id="tocS_TaskCompact">TaskCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "task",
  "name": "Bug Task"
}

```

A `Compact` object is the same as the [full response object](#tocS_Task), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the task.|

</section><hr>
<section>
<a id="schematask"></a>
<a id="schema_Task"></a>
<a id="tocStask"></a>
<a id="tocstask"></a>
<h2 id="tocS_Task">Task</h2>

```json
{
  "gid": "12345",
  "resource_type": "task",
  "name": "Buy catnip",
  "approval_status": "pending",
  "assignee_status": "upcoming",
  "completed": false,
  "completed_at": "2012-02-22T02:06:58.147Z",
  "completed_by": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "created_at": "2012-02-22T02:06:58.147Z",
  "dependencies": [
    {
      "gid": "12345",
      "resource_type": "task"
    }
  ],
  "dependents": [
    {
      "gid": "12345",
      "resource_type": "task"
    }
  ],
  "due_at": "2019-09-15T02:06:58.147Z",
  "due_on": "2019-09-15",
  "external": {
    "data": "A blob of information",
    "gid": "my_gid"
  },
  "hearted": true,
  "hearts": [
    {
      "gid": "12345",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ],
  "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
  "is_rendered_as_separator": false,
  "liked": true,
  "likes": [
    {
      "gid": "12345",
      "user": {
        "gid": "12345",
        "resource_type": "user",
        "name": "Greg Sanchez"
      }
    }
  ],
  "memberships": [
    {
      "project": {
        "gid": "12345",
        "resource_type": "project",
        "name": "Stuff to buy"
      },
      "section": {
        "gid": "12345",
        "resource_type": "section",
        "name": "Next Actions"
      }
    }
  ],
  "modified_at": "2012-02-22T02:06:58.147Z",
  "notes": "Mittens really likes the stuff from Humboldt.",
  "num_hearts": 5,
  "num_likes": 5,
  "num_subtasks": 3,
  "resource_subtype": "default_task",
  "start_on": "2019-09-14",
  "assignee": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "custom_fields": [
    {
      "gid": "12345",
      "resource_type": "custom_field",
      "currency_code": "EUR",
      "custom_label": "gold pieces",
      "custom_label_position": "suffix",
      "description": "Development team priority",
      "enabled": true,
      "enum_options": [
        {
          "gid": "12345",
          "resource_type": "enum_option",
          "color": "blue",
          "enabled": true,
          "name": "Low"
        }
      ],
      "enum_value": {
        "gid": "12345",
        "resource_type": "enum_option",
        "color": "blue",
        "enabled": true,
        "name": "Low"
      },
      "format": "custom",
      "has_notifications_enabled": true,
      "is_global_to_workspace": true,
      "name": "Status",
      "number_value": 5.2,
      "precision": 2,
      "resource_subtype": "text",
      "text_value": "Some Value",
      "type": "text"
    }
  ],
  "followers": [
    {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "parent": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "projects": [
    {
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ],
  "tags": [
    {
      "gid": "59746",
      "name": "Grade A"
    }
  ],
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

The *task* is the basic object around which many operations in Asana are centered.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|approval_status<span class="param-type"> string</span>|*Conditional* Reflects the approval status of this task. This field is kept in sync with `completed`, meaning `pending` translates to false while `approved`, `rejected`, and `changes_requested` translate to true. If you set completed to true, this field will be set to `approved`.|
|assignee_status<span class="param-type"> string</span>|Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.<br>Setting this field to "inbox" or "upcoming" inserts it at the top of the section, while the other options will insert at the bottom.|
|completed<span class="param-type"> boolean</span>|True if the task is currently marked complete, false if not.|
|completed_at<span class="param-type"> string(date-time)¦null</span>|The time at which this task was completed, or null if the task is incomplete.|
|completed_by<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|dependencies<span class="param-type"> [object]</span>|[Opt In](#input-output-options). Array of resources referencing tasks that this task depends on. The objects contain only the gid of the dependency.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|dependents<span class="param-type"> [object]</span>|[Opt In](#input-output-options). Array of resources referencing tasks that depend on this task. The objects contain only the ID of the dependent.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|due_at<span class="param-type"> string(date)¦null</span>|Date and time on which this task is due, or null if the task has no due time. This takes a UTC timestamp and should not be used together with `due_on`.|
|due_on<span class="param-type"> string(date)¦null</span>|Date on which this task is due, or null if the task has no due date.  This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.|
|external<span class="param-type"> object</span>|*OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (#input-output-options).<br>The external field allows you to store app-specific metadata on tasks, including a gid that can be used to retrieve tasks and a data blob that can store app-specific character strings. Note that you will need to authenticate with Oauth to access or modify this data. Once an external gid is set, you can use the notation `external:custom_gid` to reference your object anywhere in the API where you may use the original object gid. See the page on Custom External Data for more details.|
|» data<span class="param-type"> string</span>|none|
|» gid<span class="param-type"> string</span>|none|
|hearted<span class="param-type"> boolean</span>|*Deprecated - please use liked instead* True if the task is hearted by the authorized user, false if not.|
|hearts<span class="param-type"> [object]</span>|*Deprecated - please use likes instead* Array of likes for users who have hearted this task.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the object, as a string.|
|» user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|html_notes<span class="param-type"> string</span>|[Opt In](#input-output-options). The notes of the text with formatting as HTML.|
|is_rendered_as_separator<span class="param-type"> boolean</span>|[Opt In](#input-output-options). In some contexts tasks can be rendered as a visual separator; for instance, subtasks can appear similar to [sections](#asana-sections) without being true `section` objects. If a `task` object is rendered this way in any context it will have the property `is_rendered_as_separator` set to `true`.|
|liked<span class="param-type"> boolean</span>|True if the task is liked by the authorized user, false if not.|
|likes<span class="param-type"> [object]</span>|Array of likes for users who have liked this task.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the object, as a string.|
|» user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|memberships<span class="param-type"> [object]</span>|*Create-only*. Array of projects this task is associated with and the section it is in. At task creation time, this array can be used to add the task to specific sections. After task creation, these associations can be modified using the `addProject` and `removeProject` endpoints. Note that over time, more types of memberships may be added to this property.|
|» project<span class="param-type"> object</span>|A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|» section<span class="param-type"> object</span>|A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|The name of the section (i.e. the text displayed as the section header).|
|modified_at<span class="param-type"> string(date-time)</span>|The time at which this task was last modified.<br><br>*Note: This does not currently reflect any changes in<br>associations such as projects or comments that may have been<br>added or removed from the task.*|
|notes<span class="param-type"> string</span>|More detailed, free-form textual information associated with the task.|
|num_hearts<span class="param-type"> integer</span>|*Deprecated - please use likes instead* The number of users who have hearted this task.|
|num_likes<span class="param-type"> integer</span>|The number of users who have liked this task.|
|num_subtasks<span class="param-type"> integer</span>|[Opt In](#input-output-options). The number of subtasks on this task.|
|resource_subtype<span class="param-type"> string</span>|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.<br>The resource_subtype `milestone` represent a single moment in time. This means tasks with this subtype cannot have a start_date.|
|start_on<span class="param-type"> string(date)¦null</span>|The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.<br>*Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.*|
|assignee<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|custom_fields<span class="param-type"> [object]</span>|Array of custom field values applied to the task. These represent the custom field values recorded on this project for a particular custom field. For example, these custom field values will contain an `enum_value` property for custom fields of type `enum`, a `text_value` property for custom fields of type `text`, and so on. Please note that the `gid` returned on each custom field value *is identical* to the `gid` of the custom field, which allows referencing the custom field metadata through the `/custom_fields/custom_field-gid` endpoint.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» currency_code<span class="param-type"> string¦null</span>|ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.|
|» custom_label<span class="param-type"> string¦null</span>|This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.|
|» custom_label_position<span class="param-type"> string</span>|Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.|
|» description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the custom field.|
|» enabled<span class="param-type"> boolean</span>|*Conditional*. Determines if the custom field is enabled or not.|
|» enum_options<span class="param-type"> [object]</span>|*Conditional*. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](#create-an-enum-option).|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» enum_value<span class="param-type"> object</span>|*Conditional*. Only relevant for custom fields of type `enum`. This object is the chosen value of an enum custom field.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» color<span class="param-type"> string</span>|Whether or not the enum option is a selectable value for the custom field.|
|»» enabled<span class="param-type"> boolean</span>|The color of the enum option. Defaults to ‘none’.|
|»» name<span class="param-type"> string</span>|The name of the enum option.|
|» format<span class="param-type"> string</span>|The format of this custom field.|
|» has_notifications_enabled<span class="param-type"> boolean</span>|*Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.|
|» is_global_to_workspace<span class="param-type"> boolean</span>|This flag describes whether this custom field is available to every container in the workspace. Before project-specific custom fields, this field was always true.|
|» name<span class="param-type"> string</span>|The name of the custom field.|
|» number_value<span class="param-type"> number</span>|*Conditional*. This number is the value of a number custom field.|
|» precision<span class="param-type"> integer</span>|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.<br>For percentage format, this may be unintuitive, as a value of 0.25 has a precision of 0, while a value of 0.251 has a precision of 1. This is due to 0.25 being displayed as 25%.<br>The identifier format will always have a precision of 0.|
|» resource_subtype<span class="param-type"> string</span>|The type of the custom field. Must be one of the given values.|
|» text_value<span class="param-type"> string</span>|*Conditional*. This string is the value of a text custom field.|
|» type<span class="param-type"> string</span>|*Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.|
|followers<span class="param-type"> [object]</span>|Array of users following this task.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|parent<span class="param-type"> object¦null</span>|The parent of this task, or `null` if this is not a subtask. This property cannot be modified using a PUT request but you can change it with the `setParent` endpoint. You can create subtasks by using the subtasks endpoint.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the task.|
|projects<span class="param-type"> [object]</span>|*Create-only.* Array of projects this task is associated with. At task creation time, this array can be used to add the task to many projects at once. After task creation, these associations can be modified using the addProject and removeProject endpoints.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|tags<span class="param-type"> [object]</span>|Array of tags associated with this task. In order to change tags on an existing task use `addTag` and `removeTag`.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|workspace<span class="param-type"> object</span>|*Create-only*. The workspace this task is associated with. Once created, task cannot be moved to a different workspace. This attribute can only be specified at creation time.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

#### Enumerated Values

|Property|Value|
|---|---|
|approval_status|pending|
|approval_status|approved|
|approval_status|rejected|
|approval_status|changes_requested|
|assignee_status|today|
|assignee_status|upcoming|
|assignee_status|later|
|assignee_status|new|
|assignee_status|inbox|
|resource_subtype|default_task|
|resource_subtype|milestone|
|resource_subtype|section|
|resource_subtype|approval|
|custom_label_position|prefix|
|custom_label_position|suffix|
|format|currency|
|format|identifier|
|format|percentage|
|format|custom|
|format|none|
|resource_subtype|text|
|resource_subtype|enum|
|resource_subtype|number|
|type|text|
|type|enum|
|type|number|

</section><hr>
<section>
<a id="schemateamcompact"></a>
<a id="schema_TeamCompact"></a>
<a id="tocSteamcompact"></a>
<a id="tocsteamcompact"></a>
<h2 id="tocS_TeamCompact">TeamCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "team",
  "name": "Marketing"
}

```

A `Compact` object is the same as the [full response object](#tocS_Team), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the team.|

</section><hr>
<section>
<a id="schemateammembershipcompact"></a>
<a id="schema_TeamMembershipCompact"></a>
<a id="tocSteammembershipcompact"></a>
<a id="tocsteammembershipcompact"></a>
<h2 id="tocS_TeamMembershipCompact">TeamMembershipCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "team_membership",
  "is_guest": false,
  "team": {
    "gid": "12345",
    "resource_type": "team",
    "name": "Marketing"
  },
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A `Compact` object is the same as the [full response object](#tocS_TeamMembership), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|is_guest<span class="param-type"> boolean</span>|Describes if the user is a guest in the team.|
|team<span class="param-type"> object</span>|A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the team.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemateammembership"></a>
<a id="schema_TeamMembership"></a>
<a id="tocSteammembership"></a>
<a id="tocsteammembership"></a>
<h2 id="tocS_TeamMembership">TeamMembership</h2>

```json
{
  "gid": "12345",
  "resource_type": "team_membership",
  "is_guest": false,
  "team": {
    "gid": "12345",
    "resource_type": "team",
    "name": "Marketing"
  },
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

This object represents a user's connection to a team.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|is_guest<span class="param-type"> boolean</span>|Describes if the user is a guest in the team.|
|team<span class="param-type"> object</span>|A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the team.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemateam"></a>
<a id="schema_Team"></a>
<a id="tocSteam"></a>
<a id="tocsteam"></a>
<h2 id="tocS_Team">Team</h2>

```json
{
  "gid": "12345",
  "resource_type": "team",
  "name": "Marketing",
  "description": "All developers should be members of this team.",
  "html_description": "<body><em>All</em> developers should be members of this team.</body>",
  "organization": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the team.|
|description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the team.|
|html_description<span class="param-type"> string</span>|[Opt In](#input-output-options). The description of the team with formatting as HTML.|
|organization<span class="param-type"> object</span>|The organization/workspace the team belongs to.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemausercompact"></a>
<a id="schema_UserCompact"></a>
<a id="tocSusercompact"></a>
<a id="tocsusercompact"></a>
<h2 id="tocS_UserCompact">UserCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "user",
  "name": "Greg Sanchez"
}

```

A `Compact` object is the same as the [full response object](#tocS_User), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|

</section><hr>
<section>
<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>
<h2 id="tocS_User">User</h2>

```json
{
  "gid": "12345",
  "resource_type": "user",
  "name": "Greg Sanchez",
  "email": "gsanchez@example.com",
  "photo": {
    "image_128x128": "https://...",
    "image_21x21": "https://...",
    "image_27x27": "https://...",
    "image_36x36": "https://...",
    "image_60x60": "https://..."
  },
  "workspaces": [
    {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  ]
}

```

A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|email<span class="param-type"> string(email)</span>|The user's email address.|
|photo<span class="param-type"> object¦null</span>|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|» image_128x128<span class="param-type"> string(uri)</span>|none|
|» image_21x21<span class="param-type"> string(uri)</span>|none|
|» image_27x27<span class="param-type"> string(uri)</span>|none|
|» image_36x36<span class="param-type"> string(uri)</span>|none|
|» image_60x60<span class="param-type"> string(uri)</span>|none|
|workspaces<span class="param-type"> [object]</span>|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemausertasklistcompact"></a>
<a id="schema_UserTaskListCompact"></a>
<a id="tocSusertasklistcompact"></a>
<a id="tocsusertasklistcompact"></a>
<h2 id="tocS_UserTaskListCompact">UserTaskListCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "user_task_list",
  "name": "My Tasks in My Workspace",
  "owner": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A `Compact` object is the same as the [full response object](#tocS_UserTaskList), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the user task list.|
|owner<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemausertasklist"></a>
<a id="schema_UserTaskList"></a>
<a id="tocSusertasklist"></a>
<a id="tocsusertasklist"></a>
<h2 id="tocS_UserTaskList">UserTaskList</h2>

```json
{
  "gid": "12345",
  "resource_type": "user_task_list",
  "name": "My Tasks in My Workspace",
  "owner": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A user task list represents the tasks assigned to a particular user. It provides API access to a user’s “My Tasks” view in Asana.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the user task list.|
|owner<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemawebhookcompact"></a>
<a id="schema_WebhookCompact"></a>
<a id="tocSwebhookcompact"></a>
<a id="tocswebhookcompact"></a>
<h2 id="tocS_WebhookCompact">WebhookCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "webhook",
  "active": false,
  "resource": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "target": "https://example.com/receive-webhook/7654"
}

```

A `Compact` object is the same as the [full response object](#tocS_Webhook), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|active<span class="param-type"> boolean</span>|If true, the webhook will send events - if false it is considered inactive and will not generate events.|
|resource<span class="param-type"> object</span>|A generic Asana Resource, containing a globally unique identifier.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the object.|
|target<span class="param-type"> string(uri)</span>|The URL to receive the HTTP POST.|

</section><hr>
<section>
<a id="schemawebhook"></a>
<a id="schema_Webhook"></a>
<a id="tocSwebhook"></a>
<a id="tocswebhook"></a>
<h2 id="tocS_Webhook">Webhook</h2>

```json
{
  "gid": "12345",
  "resource_type": "webhook",
  "active": false,
  "resource": {
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "target": "https://example.com/receive-webhook/7654",
  "created_at": "2012-02-22T02:06:58.147Z",
  "last_failure_at": "2012-02-22T02:06:58.147Z",
  "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
  "last_success_at": "2012-02-22T02:06:58.147Z"
}

```

Webhooks allow an application to be notified of changes. This is in addition to the ability to fetch those changes directly as Events - in fact, Webhooks are just a way to receive [Events](#asana-events) via HTTP POST at the time they occur instead of polling for them. For services accessible via HTTP this is often vastly more convenient, and if events are not too frequent can be significantly more efficient.

In both cases, however, changes are represented as Event objects - refer to the [Events documentation](#asana-events) for more information on what data these events contain.

*Note: While Webhooks send arrays of Event objects to their target, the Event objects themselves contain *only gids*, rather than the actual resource they are referencing. Webhooks themselves contain only the information necessary to deliver the events to the desired target as they are generated.*

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|active<span class="param-type"> boolean</span>|If true, the webhook will send events - if false it is considered inactive and will not generate events.|
|resource<span class="param-type"> object</span>|A generic Asana Resource, containing a globally unique identifier.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the object.|
|target<span class="param-type"> string(uri)</span>|The URL to receive the HTTP POST.|
|created_at<span class="param-type"> string(date-time)</span>|The time at which this resource was created.|
|last_failure_at<span class="param-type"> string(date-time)</span>|The timestamp when the webhook last received an error when sending an event to the target.|
|last_failure_content<span class="param-type"> string</span>|The contents of the last error response sent to the webhook when attempting to deliver events to the target.|
|last_success_at<span class="param-type"> string(date-time)</span>|The timestamp when the webhook last successfully sent an event to the target.|

</section><hr>
<section>
<a id="schemaworkspacecompact"></a>
<a id="schema_WorkspaceCompact"></a>
<a id="tocSworkspacecompact"></a>
<a id="tocsworkspacecompact"></a>
<h2 id="tocS_WorkspaceCompact">WorkspaceCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "workspace",
  "name": "My Company Workspace"
}

```

A `Compact` object is the same as the [full response object](#tocS_Workspace), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemaworkspacemembershipcompact"></a>
<a id="schema_WorkspaceMembershipCompact"></a>
<a id="tocSworkspacemembershipcompact"></a>
<a id="tocsworkspacemembershipcompact"></a>
<h2 id="tocS_WorkspaceMembershipCompact">WorkspaceMembershipCompact</h2>

```json
{
  "gid": "12345",
  "resource_type": "workspace_membership",
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  }
}

```

A `Compact` object is the same as the [full response object](#tocS_WorkspaceMembership), but with less fields included by default. See
[Input/Output Options](#input-output-options) to include more fields.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemaworkspacemembership"></a>
<a id="schema_WorkspaceMembership"></a>
<a id="tocSworkspacemembership"></a>
<a id="tocsworkspacemembership"></a>
<h2 id="tocS_WorkspaceMembership">WorkspaceMembership</h2>

```json
{
  "gid": "12345",
  "resource_type": "workspace_membership",
  "user": {
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "workspace": {
    "gid": "12345",
    "resource_type": "workspace",
    "name": "My Company Workspace"
  },
  "is_active": true,
  "is_admin": true,
  "is_guest": true,
  "user_task_list": {
    "gid": "12345",
    "resource_type": "user_task_list",
    "name": "My Tasks in My Workspace",
    "owner": {
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "workspace": {
      "gid": "12345",
      "resource_type": "workspace",
      "name": "My Company Workspace"
    }
  }
}

```

This object determines if a user is a member of a workspace.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|user<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the workspace.|
|is_active<span class="param-type"> boolean</span>|Reflects if this user still a member of the workspace.|
|is_admin<span class="param-type"> boolean</span>|Reflects if this user is an admin of the workspace.|
|is_guest<span class="param-type"> boolean</span>|Reflects if this user is a guest of the workspace.|
|user_task_list<span class="param-type"> object</span>|A user task list represents the tasks assigned to a particular user. It provides API access to a user’s “My Tasks” view in Asana.|
|» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|» name<span class="param-type"> string</span>|The name of the user task list.|
|» owner<span class="param-type"> object</span>|A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|*Read-only except when same user as requester*. The user’s name.|
|» workspace<span class="param-type"> object</span>|A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.|
|»» gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|»» resource_type<span class="param-type"> string</span>|The base type of this resource.|
|»» name<span class="param-type"> string</span>|The name of the workspace.|

</section><hr>
<section>
<a id="schemaworkspace"></a>
<a id="schema_Workspace"></a>
<a id="tocSworkspace"></a>
<a id="tocsworkspace"></a>
<h2 id="tocS_Workspace">Workspace</h2>

```json
{
  "gid": "12345",
  "resource_type": "workspace",
  "name": "My Company Workspace",
  "email_domains": [
    "asana.com"
  ],
  "is_organization": false
}

```

A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.

### Properties

|Name|Description|
|---|---|
|gid<span class="param-type"> string</span>|Globally unique identifier of the resource, as a string.|
|resource_type<span class="param-type"> string</span>|The base type of this resource.|
|name<span class="param-type"> string</span>|The name of the workspace.|
|email_domains<span class="param-type"> [string]</span>|The email domains that are associated with this workspace.|
|is_organization<span class="param-type"> boolean</span>|Whether the workspace is an *organization*.|

</section>

