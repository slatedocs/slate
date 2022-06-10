<!-- Generator: Widdershins v3.6.6 -->

<hr class="full-line">
<section class="full-section">
<h1 id="app-components">App Component Reference</h1>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

<span class="description">
This is the interface for handling requests for [App Components](https://developers.asana.com/docs/app-components-overview). This reference is generated from an [OpenAPI spec] (https://raw.githubusercontent.com/Asana/developer-docs/master/defs/app_components_oas.yaml).
</span>

Base URLs:

* {siteUrl}

Note that <i>{siteUrl}</i> refers to the base URL for your [App Server](/docs/app-server) endpoints.

Additional resources:

* <a href="https://asana.com/terms">Terms & Policies</a>
* <a href="https://asana.com/support">Asana Support</a> 
</section><hr class="full-line">
<section class="full-section">
<a id="asana-modal-forms"></a>
<h1 id="modal-forms">Modal Forms</h1>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<pre class="highlight http tab-http">
<code><a href="/docs/get-form-metadata"><span class="get-verb">GET</span> <span class=""nn>/{form_metadata_url}</span></a><br><a href="/docs/get-modal-form-typeahead-results"><span class="get-verb">GET</span> <span class=""nn>/{modal_form_typeahead_url}</span></a><br><a href="/docs/on-change-callback"><span class="post-verb">POST</span> <span class=""nn>/{on_change_callback}</span></a><br><a href="/docs/on-submit-callback"><span class="post-verb">POST</span> <span class=""nn>/{on_submit_callback}</span></a></code>
</pre>

<span class="description">
The Modal Form is displayed when the user starts the flow to create a resource. Asana will make a signed request to the specified `form_metadata_url` in the configuration, and expect a response with the metadata needed to create the form. This process is also used for forms within Rule Actions.
</span>

</section>
<hr class="half-line">
<section>
## Get form metadata

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetFormMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{form_metadata_url}?workspace=string&task=string&user=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getFormMetadata

```

```python
getFormMetadata

```

```ruby
getFormMetadata

```

```java
getFormMetadata

```

```php
getFormMetadata

```

> 200 Response

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{form_metadata_url}</code>
</p>

<span class="description">
Get the metadata from the App Server to render a form.
</span>

<h3 id="get-form-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace `gid` this hook is coming from.|
|?task<span class="param-type"> string</span><div class="param-required">required</div>|The task gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user `gid` this hook is coming from.|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-form-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully retrieved the metadata for a single form.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## Get Modal Form typeahead results

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetModalFormTypeaheadResults"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{modal_form_typeahead_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```javascript--nodejs
getModalFormTypeaheadResults

```

```python
getModalFormTypeaheadResults

```

```ruby
getModalFormTypeaheadResults

```

```java
getModalFormTypeaheadResults

```

```php
getModalFormTypeaheadResults

```

> Body parameter

```json
{
  "expires_at": "2019-04-15T01:01:46.055Z",
  "query": "Messages",
  "task": "67890",
  "user": "54321",
  "workspace": "12345"
}
```

> 200 Response

```json
{
  "header": "List of messages",
  "items": [
    {
      "icon_url": "https://example-icon.png",
      "subtitle": "OTP",
      "title": "OTP Team PF",
      "value": "OTP"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{modal_form_typeahead_url}</code>
</p>

<span class="description">
If a Modal Form form field is of type `typehead`, this operation gets typeahead results to render as a dropdown list.

When the user types into a Modal Form form field, Asana will send a request containing the entered string to the application's `typeahead_url`. The list of [TypeaheadItem](/docs/typeahead-item)s in the response will then be rendered in a dropdown list.
</span>

<h3 id="get-modal-form-typeahead-results-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to retrieve typeahead results in a Modal Form typeahead form field.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 format) when the request should expire|
|» query<span class="param-type"> string</span>|The user's input in the typeahead text input.|
|» task<span class="param-type"> string</span>|*Conditional*. The task `gid` this hook is coming from. `task` is only present in the [Modal Form](/docs/modal-form) (as there is a "context task"), but not in the [Rule Action](/docs/rule-action) (as rules are associated with a _project_).|
|» user<span class="param-type"> string</span>|The user `gid` this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace `gid` this hook is coming from.|

<h3 id="get-modal-form-typeahead-results-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TypeaheadList](#schematypeaheadlist)</span>|Successfully retrieved typeahead results.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## On change callback

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdonFormChange"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{on_change_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onFormChange

```

```python
onFormChange

```

```ruby
onFormChange

```

```java
onFormChange

```

```php
onFormChange

```

> Body parameter

```json
{
  "changed_field": "string",
  "expires_at": "string",
  "task": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{on_change_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a watched field's value changes within a form.
</span>

<h3 id="on-change-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an on change event.|
|» changed_field<span class="param-type"> string</span>|The name of the changed FormField|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="on-change-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully returned the new state of the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## On submit callback

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdonFormSubmit"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{on_submit_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onFormSubmit

```

```python
onFormSubmit

```

```ruby
onFormSubmit

```

```java
onFormSubmit

```

```php
onFormSubmit

```

> Body parameter

```json
{
  "expires_at": "string",
  "task": "string",
  "user": "string",
  "values": {
    "property1": {
      "field_name": "string",
      "field_object": {}
    },
    "property2": {
      "field_name": "string",
      "field_object": {}
    }
  },
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{on_submit_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a form is submitted.
</span>

<h3 id="on-submit-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of a form submission.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» values<span class="param-type"> object</span>|A FormValues object mapping each FormField’s name to its value|
|»» field_name<span class="param-type"> string</span>|none|
|»» field_object<span class="param-type"> object</span>|A form field object.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

#### Detailed descriptions

**field_object**: A form field object.

Valid object schemas: [FormField-Checkbox](/docs/form-field-checkbox), [FormField-Date](/docs/form-field-date),  [FormField-Datetime](/docs/form-field-datetime), [FormField-Dropdown](/docs/form-field-dropdown),  [FormField-MultiLineText](/docs/form-field-multi-line-text), [FormField-RadioButton](/docs/form-field-radio-button),  [FormField-RichText](/docs/form-field-rich-text), [FormField-SingleLineText](/docs/form-field-single-line-text),  [FormField-StaticText](/docs/form-field-static-text), [FormField-Typeahead](/docs/form-field-typeahead)

<h3 id="on-submit-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AttachedResource](#schemaattachedresource)</span>|Successfully attached the resource created by the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-rule-actions"></a>
<h1 id="rule-actions">Rule Actions</h1>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<pre class="highlight http tab-http">
<code><a href="/docs/get-rule-action-typeahead-results"><span class="get-verb">GET</span> <span class=""nn>/{rule_action_typeahead_url}</span></a><br><a href="/docs/run-action"><span class="post-verb">POST</span> <span class=""nn>/{run_action_url}</span></a><br><a href="/docs/get-action-metadata"><span class="get-verb">GET</span> <span class=""nn>/{action.metadata_url}</span></a><br><a href="/docs/on-action-change-callback"><span class="post-verb">POST</span> <span class=""nn>/{action.on_change_callback}</span></a><br><a href="/docs/on-action-submit-callback"><span class="post-verb">POST</span> <span class=""nn>/{action.on_submit_callback}</span></a></code>
</pre>

<span class="description">
When a rule containing a Rule Action is triggered, the Rules Engine will make a request to the app to inform the app to run the configured Rule Action. The resulting status code will indicate to the Rules Engine whether the action was successfully completed and, if not, specify a cause for the error.
</span>

</section>
<hr class="half-line">
<section>
## Get Rule Action typeahead results

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetRuleActionTypeaheadResults"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{rule_action_typeahead_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```javascript--nodejs
getRuleActionTypeaheadResults

```

```python
getRuleActionTypeaheadResults

```

```ruby
getRuleActionTypeaheadResults

```

```java
getRuleActionTypeaheadResults

```

```php
getRuleActionTypeaheadResults

```

> Body parameter

```json
{
  "expires_at": "2019-04-15T01:01:46.055Z",
  "query": "Messages",
  "task": "67890",
  "user": "54321",
  "workspace": "12345"
}
```

> 200 Response

```json
{
  "header": "List of messages",
  "items": [
    {
      "icon_url": "https://example-icon.png",
      "subtitle": "OTP",
      "title": "OTP Team PF",
      "value": "OTP"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{rule_action_typeahead_url}</code>
</p>

<span class="description">
In a Rule Action typeahead form field, this operation gets typeahead results to render as a dropdown list.

When the user types into a Rule Action form field, Asana will send a request containing the entered string to the application's `typeahead_url`. The list of [TypeaheadItem](/docs/typeahead-item)s in the response will then be rendered in a dropdown list.
</span>

<h3 id="get-rule-action-typeahead-results-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to retrieve typeahead results in a Rule Action typeahead form field.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 format) when the request should expire|
|» query<span class="param-type"> string</span>|The user's input in the typeahead text input.|
|» task<span class="param-type"> string</span>|*Conditional*. The task `gid` this hook is coming from. `task` is only present in the [Modal Form](/docs/modal-form) (as there is a "context task"), but not in the [Rule Action](/docs/rule-action) (as rules are associated with a _project_).|
|» user<span class="param-type"> string</span>|The user `gid` this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace `gid` this hook is coming from.|

<h3 id="get-rule-action-typeahead-results-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TypeaheadList](#schematypeaheadlist)</span>|Successfully retrieved typeahead results.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## Run action

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdrunAction"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{run_action_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
runAction

```

```python
runAction

```

```ruby
runAction

```

```java
runAction

```

```php
runAction

```

> Body parameter

```json
{
  "action": "string",
  "action_type": "string",
  "expires_at": "string",
  "idempotency_key": "string",
  "target_object": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "action_result": "ok",
  "error": "That resource no longer exists",
  "resources_created": [
    {
      "error": "No resource matched that input",
      "resource_name": "Build the Thing",
      "resource_url": "https://example.atlassian.net/browse/CP-1"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{run_action_url}</code>
</p>

<span class="description">
The request made when an action is triggered.
</span>

<h3 id="run-action-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an action running.|
|» action<span class="param-type"> string</span>|The action ID generated from rule creation.|
|» action_type<span class="param-type"> string</span>|The ID from the configuration used to create the Rule Action.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» idempotency_key<span class="param-type"> string</span>|A unique key associated with the "Run action" request. App Servers should use this key to implement idempotency.|
|» target_object<span class="param-type"> string</span>|The ID of the target object that the Rule Action is acting on. Currently, this is always a Task `gid`.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="run-action-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [RanAction](#schemaranaction)</span>|Successfully attached the resource created by the form.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|410<span class="param-type"> None</span>|Gone|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## Get action metadata

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetActionMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{action.metadata_url}?action_type=string&project=string&workspace=string&user=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getActionMetadata

```

```python
getActionMetadata

```

```ruby
getActionMetadata

```

```java
getActionMetadata

```

```php
getActionMetadata

```

> 200 Response

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{action.metadata_url}</code>
</p>

<span class="description">
When a user has navigated to the [Custom Rule builder](https://asana.com/guide/help/premium/rules#gl-create-rule) UI and selected a Rule Action (either through the sidebar or via a Rule Preset), Asana will make a request to the app to get the configuration form definition for the chosen Rule Action. This will initiate the flow to configure a new Rule Action or edit the configuration of an existing Rule Action. This is the endpoint and schema for updating Rule Actions; app triggers (V2) will be analogous.
</span>

<h3 id="get-action-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?action<span class="param-type"> string</span>|The ID of an existing Rule Action that is being edited. Should be omitted when configuring a new Rule Action.|
|?action_type<span class="param-type"> string</span><div class="param-required">required</div>|The ID of the configuration used to create the Rule Action.|
|?project<span class="param-type"> string</span><div class="param-required">required</div>|The project gid this hook is coming from.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace `gid` this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user `gid` this hook is coming from.|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-action-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully retrieved the metadata for a single action.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## On action change callback

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdonActionFormChange"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{action.on_change_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onActionFormChange

```

```python
onActionFormChange

```

```ruby
onActionFormChange

```

```java
onActionFormChange

```

```php
onActionFormChange

```

> Body parameter

```json
{
  "action": "string",
  "action_type": "string",
  "changed_field": "string",
  "expires_at": "string",
  "project": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{action.on_change_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a watched field's value changes within an action form.
</span>

<h3 id="on-action-change-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an on change event.|
|» action<span class="param-type"> string</span>|The ID of an existing Rule Action that is being edited.|
|» action_type<span class="param-type"> string</span>|The ID of the configuration used to create the Rule Action.|
|» changed_field<span class="param-type"> string</span>|The name of the changed FormField|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» project<span class="param-type"> string</span>|The project `gid` this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="on-action-change-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully returned the new state of the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## On action submit callback

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdonActionFormSubmit"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{action.on_submit_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onActionFormSubmit

```

```python
onActionFormSubmit

```

```ruby
onActionFormSubmit

```

```java
onActionFormSubmit

```

```php
onActionFormSubmit

```

> Body parameter

```json
{
  "action": "string",
  "action_type": "string",
  "expires_at": "string",
  "project": "string",
  "rule_name": "string",
  "task": "string",
  "user": "string",
  "values": {
    "property1": {
      "field_name": "string",
      "field_object": {}
    },
    "property2": {
      "field_name": "string",
      "field_object": {}
    }
  },
  "workspace": "string"
}
```

> 400 Response

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{action.on_submit_callback}</code>
</p>

<span class="description">
The form is submitted when the user chooses to create their Rule. Asana will create the Rule Action data model object and make a signed request to the on_submit_callback specified in the form metadata returned from the fetch/update Rule Action form endpoints. Information about the created Rule Action should be included in the response if it was successfully created. This is the endpoint and schema for updating Rule Actions; app triggers (V2) will be analogous.
</span>

<h3 id="on-action-submit-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to submit an action form.|
|» action<span class="param-type"> string</span>|The ID of an existing Rule Action that is being edited|
|» action_type<span class="param-type"> string</span>|The ID of the configuration used to create the Rule Action.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» project<span class="param-type"> string</span>|The project `gid` this hook is coming from.|
|» rule_name<span class="param-type"> string</span>|The name of the rule being created|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» values<span class="param-type"> object</span>|A FormValues object mapping each FormField’s name to its value|
|»» field_name<span class="param-type"> string</span>|none|
|»» field_object<span class="param-type"> object</span>|A form field object.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

#### Detailed descriptions

**field_object**: A form field object.

Valid object schemas: [FormField-Checkbox](/docs/form-field-checkbox), [FormField-Date](/docs/form-field-date),  [FormField-Datetime](/docs/form-field-datetime), [FormField-Dropdown](/docs/form-field-dropdown),  [FormField-MultiLineText](/docs/form-field-multi-line-text), [FormField-RadioButton](/docs/form-field-radio-button),  [FormField-RichText](/docs/form-field-rich-text), [FormField-SingleLineText](/docs/form-field-single-line-text),  [FormField-StaticText](/docs/form-field-static-text), [FormField-Typeahead](/docs/form-field-typeahead)

<h3 id="on-action-submit-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> None</span>|Successfully handled form submission.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-lookups"></a>
<h1 id="lookups">Lookups</h1>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<pre class="highlight http tab-http">
<code><a href="/docs/attach-resource"><span class="post-verb">POST</span> <span class=""nn>/{resource_attach_url}</span></a><br><a href="/docs/get-lookup-typeahead-results"><span class="get-verb">GET</span> <span class=""nn>/{resource_typeahead_url}</span></a></code>
</pre>

<span class="description">
If the app defined a resource attach URL, tasks without a Widget offer the Lookup functionality. This appears as a text input to the user. When the user submits the text, the app responds with either a resource attachment or with an error.
</span>

</section>
<hr class="half-line">
<section>
## Attach resource

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdattachResource"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{resource_attach_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
attachResource

```

```python
attachResource

```

```ruby
attachResource

```

```java
attachResource

```

```php
attachResource

```

> Body parameter

```json
{
  "attachment": "string",
  "expires_at": "string",
  "query": "string",
  "task": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{resource_attach_url}</code>
</p>

<span class="description">
When the user attaches a resource URL to a task, Asana will make a signed request to the specified `resource_attach_url` in the app configuration. Information about the attached resource should be included in the response.
</span>

<h3 id="attach-resource-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to attach a resource.|
|» attachment<span class="param-type"> string</span>|The attachment id of the URL attachment|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» query<span class="param-type"> string</span>|The user’s input in the Lookup text input (this is often a resource URL or resource key, such as CP-1 or https://abcde.atlassian.net/browse/CP-1)|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="attach-resource-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AttachedResource](#schemaattachedresource)</span>|Successfully attached the resource to the given object.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="half-line">
<section>
## Get Lookup typeahead results

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetTypeaheadResults"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{resource_typeahead_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```javascript--nodejs
getTypeaheadResults

```

```python
getTypeaheadResults

```

```ruby
getTypeaheadResults

```

```java
getTypeaheadResults

```

```php
getTypeaheadResults

```

> Body parameter

```json
{
  "expires_at": "2019-04-15T01:01:46.055Z",
  "query": "Messages",
  "task": "67890",
  "user": "54321",
  "workspace": "12345"
}
```

> 200 Response

```json
{
  "header": "List of messages",
  "items": [
    {
      "icon_url": "https://example-icon.png",
      "subtitle": "OTP",
      "title": "OTP Team PF",
      "value": "OTP"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{resource_typeahead_url}</code>
</p>

<span class="description">
Gets typeahead results to render as a dropdown list in the resource lookup input field.

When the user types into the lookup input field, Asana will send a request containing the entered string to the application's `typeahead_url`. The list of [TypeaheadItem](/docs/typeahead-item)s in the response will then be rendered in a dropdown list. When the user selects an item from the list, Asana will send a [resource attach](/docs/resource-attach) request to the app server, then process the response and render the attached resource in the widget.
</span>

<h3 id="get-lookup-typeahead-results-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to retrieve typeahead results for a resource lookup query.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 format) when the request should expire|
|» query<span class="param-type"> string</span>|The user's input in the typeahead text input.|
|» task<span class="param-type"> string</span>|*Conditional*. The task `gid` this hook is coming from. `task` is only present in the [Modal Form](/docs/modal-form) (as there is a "context task"), but not in the [Rule Action](/docs/rule-action) (as rules are associated with a _project_).|
|» user<span class="param-type"> string</span>|The user `gid` this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace `gid` this hook is coming from.|

<h3 id="get-lookup-typeahead-results-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [TypeaheadList](#schematypeaheadlist)</span>|Successfully retrieved typeahead results.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-widgets"></a>
<h1 id="widgets">Widgets</h1>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<pre class="highlight http tab-http">
<code><a href="/docs/get-widget-metadata"><span class="get-verb">GET</span> <span class=""nn>/{widget_metadata_url}</span></a></code>
</pre>

<span class="description">
The Widget is displayed when the user views a task with an attachment with a resource URL matching your capability’s `match_resource_url_pattern`. When this happens, Asana will make a signed request to your `widget_metadata_url`, and expect a response with information to render in the Widget.
</span>

</section>
<hr class="half-line">
<section>
## Get widget metadata

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<a id="opIdgetWidgetMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{widget_metadata_url}?resource_url=string&workspace=string&task=string&user=string&attachment=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getWidgetMetadata

```

```python
getWidgetMetadata

```

```ruby
getWidgetMetadata

```

```java
getWidgetMetadata

```

```php
getWidgetMetadata

```

> 200 Response

```json
{
  "metadata": {
    "error": "The resource cannot be accessed",
    "fields": [],
    "footer": {},
    "num_comments": 2,
    "subicon_url": "https://example-icon.png",
    "subtitle": "Custom App Story · Open in Custom App",
    "title": "Status"
  },
  "template": "summary_with_details_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{widget_metadata_url}</code>
</p>

<span class="description">
Get the metadata from the App Server to render a widget.
</span>

<h3 id="get-widget-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?resource_url<span class="param-type"> string</span><div class="param-required">required</div>|The URL of the URL attachment on the task (i.e. Jira issue, GitHub pull request)|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace `gid` this hook is coming from.|
|?task<span class="param-type"> string</span><div class="param-required">required</div>|The task gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user `gid` this hook is coming from.|
|?attachment<span class="param-type"> string</span><div class="param-required">required</div>|The attachment ID of the URL attachment.|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-widget-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WidgetMetadata](#schemawidgetmetadata)</span>|Successfully retrieved the metadata for a single widget.|
|400<span class="param-type"> [BadRequest](#schemabadrequest)</span>|Bad request|
|401<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|403<span class="param-type"> [Forbidden](#schemaforbidden)</span>|Forbidden|
|404<span class="param-type"> [NotFound](#schemanotfound)</span>|Not found|
|418<span class="param-type"> [Unauthorized](#schemaunauthorized)</span>|Unauthorized|
|500<span class="param-type"> [InternalServerError](#schemainternalservererror)</span>|Server error|

</section><hr class="full-line">
<section class="full-section">
# App Component Schemas

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

<span class="description">
The schema definitions for each object requested or returned from Asana's API. Some fields are not returned by
default and you'll need to use [Input/Output Options](/docs/input-output-options) to include them.
</span>
</section>
<hr>
<section>
<a id="schemaattachedresource"></a>
<a id="schema_AttachedResource"></a>
<a id="tocSattachedresource"></a>
<a id="tocsattachedresource"></a>
<a id="tocS_AttachedResource"></a>
<h2 id="attached-resource">AttachedResource</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}

```

<span class="description">
The response to a successful lookup request.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|The error that should be displayed to the user|
|resource_name<span class="param-type"> string</span>|The name of the attached resource|
|resource_url<span class="param-type"> string</span>|The URL of the attached resource|

</section><hr>
<section>
<a id="schemabadrequest"></a>
<a id="schema_BadRequest"></a>
<a id="tocSbadrequest"></a>
<a id="tocsbadrequest"></a>
<a id="tocS_BadRequest"></a>
<h2 id="bad-request">BadRequest</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "data": {
    "error": "Illegal or malformed request."
  }
}

```

<span class="description">
An error response object indicating a bad request (i.e., a status code of `400`).

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|An object containing an `error` string to display to the user.|
|» error<span class="param-type"> string</span>|The error to display.|

</section><hr>
<section>
<a id="schemaforbidden"></a>
<a id="schema_Forbidden"></a>
<a id="tocSforbidden"></a>
<a id="tocsforbidden"></a>
<a id="tocS_Forbidden"></a>
<h2 id="forbidden">Forbidden</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "data": {
    "error": "Access forbidden."
  }
}

```

<span class="description">
An error response object indicating a forbidden request (i.e., a status code of `403`).

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|An object containing an `error` string to display to the user.|
|» error<span class="param-type"> string</span>|The error to display.|

</section><hr>
<section>
<a id="schemaformfield-checkbox"></a>
<a id="schema_FormField-Checkbox"></a>
<a id="tocSformfield-checkbox"></a>
<a id="tocsformfield-checkbox"></a>
<a id="tocS_FormField-Checkbox"></a>
<h2 id="form-field-checkbox">FormField-Checkbox</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "options": [
    {
      "id": "opt-in",
      "label": "Opt in"
    }
  ],
  "type": "checkbox",
  "value": [
    "opt-in"
  ]
}

```

<span class="description">
A Modal Form field that accepts checkbox input. Limit 10 options.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|options<span class="param-type"> [object]</span>|An array (minimum length: 1) of CheckboxOption objects.|
|» id<span class="param-type"> string</span>|The ID of the option.|
|» label<span class="param-type"> string</span>|The label of the option. Limit 80 characters.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> [string]</span>|*Optional*. The values for the form field, which are the IDs of the chosen CheckboxOption objects.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|checkbox|

</section><hr>
<section>
<a id="schemaformfield-date"></a>
<a id="schema_FormField-Date"></a>
<a id="tocSformfield-date"></a>
<a id="tocsformfield-date"></a>
<a id="tocS_FormField-Date"></a>
<h2 id="form-field-date">FormField-Date</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "date-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Date",
  "placeholder": "2022-02-01",
  "type": "date"
}

```

<span class="description">
A Modal Form field that accepts date input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|placeholder<span class="param-type"> string</span>|The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|date|

</section><hr>
<section>
<a id="schemaformfield-datetime"></a>
<a id="schema_FormField-Datetime"></a>
<a id="tocSformfield-datetime"></a>
<a id="tocsformfield-datetime"></a>
<a id="tocS_FormField-Datetime"></a>
<h2 id="form-field-datetime">FormField-Datetime</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "datetime-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Datetime",
  "placeholder": "2022-02-01T14:48:00.000Z",
  "type": "datetime"
}

```

<span class="description">
A Modal Form field that accepts datetime input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|placeholder<span class="param-type"> string</span>|The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|datetime|

</section><hr>
<section>
<a id="schemaformfield-dropdown"></a>
<a id="schema_FormField-Dropdown"></a>
<a id="tocSformfield-dropdown"></a>
<a id="tocsformfield-dropdown"></a>
<a id="tocS_FormField-Dropdown"></a>
<h2 id="form-field-dropdown">FormField-Dropdown</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "options": [
    {
      "icon_url": "https://example.com/red.png",
      "id": "red",
      "label": "Red"
    }
  ],
  "type": "dropdown",
  "value": "dropdown_option_1",
  "width": "full"
}

```

<span class="description">
A Modal Form field that accepts input via a dropdown list. Limit 50 options.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|options<span class="param-type"> [object]</span>|An array (minimum length: 1) of DropdownOption objects.|
|» icon_url<span class="param-type"> string</span>|*Optional*. The URL for the icon beside the label. If not present, no icon will be displayed.|
|» id<span class="param-type"> string</span>|The ID of the option.|
|» label<span class="param-type"> string</span>|The label of the option. Limit 80 characters.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> string</span>|*Optional*. The value for the form field, which is the ID of the chosen DropdownOption object.|
|width<span class="param-type"> string</span>|*Optional*. The width of the form field. If not provided, the default value will be `"full"`.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|dropdown|
|width|full|
|width|half|

</section><hr>
<section>
<a id="schemaformfield-multilinetext"></a>
<a id="schema_FormField-MultiLineText"></a>
<a id="tocSformfield-multilinetext"></a>
<a id="tocsformfield-multilinetext"></a>
<a id="tocS_FormField-MultiLineText"></a>
<h2 id="form-field-multi-line-text">FormField-MultiLineText</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "placeholder": "Enter the full title of the resource here",
  "type": "multi_line_text",
  "value": "Annual Kick-Off Meeting"
}

```

<span class="description">
A Modal Form field that accepts multi-line text input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|placeholder<span class="param-type"> string</span>|The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> string</span>|The value of the field. If not provided, the field will be empty and the form cannot be submitted if it is required. Limit 3000 characters.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|multi_line_text|

</section><hr>
<section>
<a id="schemaformfield-radiobutton"></a>
<a id="schema_FormField-RadioButton"></a>
<a id="tocSformfield-radiobutton"></a>
<a id="tocsformfield-radiobutton"></a>
<a id="tocS_FormField-RadioButton"></a>
<h2 id="form-field-radio-button">FormField-RadioButton</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "options": [
    {
      "id": "blue",
      "label": "Blue",
      "sub_label": "#0000FF"
    }
  ],
  "type": "radio_button",
  "value": "radio_option_1"
}

```

<span class="description">
A Modal Form field that accepts radio button input. Limit 5 options.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|options<span class="param-type"> [object]</span>|An array (minimum length: 1) of RadioOption objects.|
|» id<span class="param-type"> string</span>|The ID of the option.|
|» label<span class="param-type"> string</span>|The label of the option. Limit 80 characters.|
|» sub_label<span class="param-type"> string</span>|*Optional*. The label to display as subtext for the `label`.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> string</span>|*Optional*. The value for the form field, which is the ID of the chosen RadioOption object.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|radio_button|

</section><hr>
<section>
<a id="schemaformfield-richtext"></a>
<a id="schema_FormField-RichText"></a>
<a id="tocSformfield-richtext"></a>
<a id="tocsformfield-richtext"></a>
<a id="tocS_FormField-RichText"></a>
<h2 id="form-field-rich-text">FormField-RichText</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "placeholder": "Enter the full title of the resource here",
  "type": "rich_text",
  "value": "Annual Kick-Off Meeting"
}

```

<span class="description">
A Modal Form field that accepts rich text input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|placeholder<span class="param-type"> string</span>|The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> string</span>|The value of the field. If not provided, the field will be empty and the form cannot be submitted if it is required. Limit 3000 characters.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|rich_text|

</section><hr>
<section>
<a id="schemaformfield-singlelinetext"></a>
<a id="schema_FormField-SingleLineText"></a>
<a id="tocSformfield-singlelinetext"></a>
<a id="tocsformfield-singlelinetext"></a>
<a id="tocS_FormField-SingleLineText"></a>
<h2 id="form-field-single-line-text">FormField-SingleLineText</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "create-resource-field-1",
  "is_required": true,
  "is_watched": true,
  "name": "Resource name",
  "placeholder": "Enter the full title of the resource here",
  "type": "single_line_text",
  "value": "Annual Kick-Off Meeting",
  "width": "full"
}

```

<span class="description">
A Modal Form field that accepts single-line text input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|placeholder<span class="param-type"> string</span>|The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|value<span class="param-type"> string</span>|The value of the field. If not provided, the field will be empty and the form cannot be submitted if it is required. Limit 200 characters.|
|width<span class="param-type"> string</span>|*Optional*. The width of the form field. If not provided, the default value will be `"full"`.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|single_line_text|
|width|full|
|width|half|

</section><hr>
<section>
<a id="schemaformfield-statictext"></a>
<a id="schema_FormField-StaticText"></a>
<a id="tocSformfield-statictext"></a>
<a id="tocsformfield-statictext"></a>
<a id="tocS_FormField-StaticText"></a>
<h2 id="form-field-static-text">FormField-StaticText</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "id": "create-resource-field-1",
  "name": "Please enter the following details:",
  "type": "static_text"
}

```

<span class="description">
A Modal Form "field" that displays static text. Fields of this type do not collect user input.

</span>

### Properties

|Name|Description|
|---|---|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|name<span class="param-type"> string</span>|The text (i.e., label) for the field. Limit 50 characters.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|static_text|

</section><hr>
<section>
<a id="schemaformfield-typeahead"></a>
<a id="schema_FormField-Typeahead"></a>
<a id="tocSformfield-typeahead"></a>
<a id="tocsformfield-typeahead"></a>
<a id="tocS_FormField-Typeahead"></a>
<h2 id="form-field-typeahead">FormField-Typeahead</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "error": "Please review and change your input",
  "id": "typeahead_field_1",
  "is_required": true,
  "is_watched": true,
  "name": "Statuses",
  "type": "typeahead",
  "typeahead_url": "https://www.app-server.com/app/typeahead",
  "value": "typeahead_1",
  "width": "full"
}

```

<span class="description">
A Modal Form field that accepts typeahead input.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|*Optional*. The developer-specified error message displayed to the user if there is an error with the chosen value.|
|id<span class="param-type"> string</span>|The ID of the field, which is used to reference the field. These should be unique across the entire form.|
|is_required<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field is required to submit the form. If this property is not specified, the value is assumed `false`.|
|is_watched<span class="param-type"> boolean</span>|*Optional*. Indicates whether the field should be watched. Fields that are watched send requests to the `on_change` URL specified in the form metadata to get updated form information. If this property is not specified, the value is assumed `false`.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 50 characters.|
|type<span class="param-type"> string</span>|The type of Modal Form field.|
|typeahead_url<span class="param-type"> string</span>|The URL that Asana uses to request typehead results from the application server.|
|value<span class="param-type"> string</span>|*Optional*. The value for the form field, which is the ID of the chosen TypeaheadListItem object.|
|width<span class="param-type"> string</span>|*Optional*. The width of the form field. If not provided, the default value will be `"full"`.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|typeahead|
|width|full|
|width|half|

</section><hr>
<section>
<a id="schemaformmetadata"></a>
<a id="schema_FormMetadata"></a>
<a id="tocSformmetadata"></a>
<a id="tocsformmetadata"></a>
<a id="tocS_FormMetadata"></a>
<h2 id="form-metadata">FormMetadata</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "metadata": {
    "fields": [],
    "on_change_callback": "https://www.example.com/on_change",
    "on_submit_callback": "https://www.example.com/on_submit",
    "submit_button_text": "Create New Issue",
    "title": "Create New Issue"
  },
  "template": "form_metadata_v0"
}

```

<span class="description">
Contains the metadata that describes how to display and manage a form.

</span>

### Properties

|Name|Description|
|---|---|
|metadata<span class="param-type"> object</span>|The metadata (i.e., underlying definition) of a form. `metadata` must exist alongside a `template`, and its schema must be specific to the value of that `template`.|
|» fields<span class="param-type"> array</span>|An array of form field objects that are rendered in the order they are in the array. Limit of 30 fields.<br><br>Valid object schemas: [FormField-Checkbox](/docs/form-field-checkbox), [FormField-Date](/docs/form-field-date),  [FormField-Datetime](/docs/form-field-datetime), [FormField-Dropdown](/docs/form-field-dropdown),  [FormField-MultiLineText](/docs/form-field-multi-line-text), [FormField-RadioButton](/docs/form-field-radio-button),  [FormField-RichText](/docs/form-field-rich-text), [FormField-SingleLineText](/docs/form-field-single-line-text),  [FormField-StaticText](/docs/form-field-static-text), [FormField-Typeahead](/docs/form-field-typeahead)|
|» on_change_callback<span class="param-type"> string</span>|The URL to POST the form to whenever watched field values are changed.|
|» on_submit_callback<span class="param-type"> string</span>|The URL to POST the form to when the user clicks the submit button. If this is field is omitted then the submission button will be disabled. This is useful if the user must enter information in a watched field first, such as to show additional fields.|
|» submit_button_text<span class="param-type"> string</span>|The text to display on the form’s submit button. If not provided, the default text “Submit” will be displayed on the button.|
|» title<span class="param-type"> string</span>|The title of the form, which is displayed at the top of the creation form|
|template<span class="param-type"> string</span>|The interface name and version of a distinct form UI layout. A `template` is directly associated with a particular `metadata` schema.|

#### Enumerated Values

|Property|Value|
|---|---|
|template|form_metadata_v0|

</section><hr>
<section>
<a id="schemainternalservererror"></a>
<a id="schema_InternalServerError"></a>
<a id="tocSinternalservererror"></a>
<a id="tocsinternalservererror"></a>
<a id="tocS_InternalServerError"></a>
<h2 id="internal-server-error">InternalServerError</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "data": {
    "error": "Internal server error."
  }
}

```

<span class="description">
An error response object indicating a request that could not be found (i.e., a status code of `500`).

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|An object containing an `error` string to display to the user.|
|» error<span class="param-type"> string</span>|The error to display.|

</section><hr>
<section>
<a id="schemanotfound"></a>
<a id="schema_NotFound"></a>
<a id="tocSnotfound"></a>
<a id="tocsnotfound"></a>
<a id="tocS_NotFound"></a>
<h2 id="not-found">NotFound</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "data": {
    "error": "Not found."
  }
}

```

<span class="description">
An error response object indicating a request that could not be found (i.e., a status code of `404`).

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|An object containing an `error` string to display to the user.|
|» error<span class="param-type"> string</span>|The error to display.|

</section><hr>
<section>
<a id="schemaranaction"></a>
<a id="schema_RanAction"></a>
<a id="tocSranaction"></a>
<a id="tocsranaction"></a>
<a id="tocS_RanAction"></a>
<h2 id="ran-action">RanAction</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "action_result": "ok",
  "error": "That resource no longer exists",
  "resources_created": [
    {
      "error": "No resource matched that input",
      "resource_name": "Build the Thing",
      "resource_url": "https://example.atlassian.net/browse/CP-1"
    }
  ]
}

```

<span class="description">
The response to an action request.

</span>

### Properties

|Name|Description|
|---|---|
|action_result<span class="param-type"> string</span>|Specifies any additional information that the app wants to send to Asana on completion of the action. Can only be `resources_created` or `ok`.|
|error<span class="param-type"> string</span>|The error that should be displayed to the user|
|resources_created<span class="param-type"> [object]</span>|A field with the data corresponding to the action_result value. Each action_result has its own data field shape that Asana expects. `resources_created` expects the name and url of the resources that the action created.|
|» error<span class="param-type"> string</span>|The error that should be displayed to the user|
|» resource_name<span class="param-type"> string</span>|The name of the attached resource|
|» resource_url<span class="param-type"> string</span>|The URL of the attached resource|

#### Enumerated Values

|Property|Value|
|---|---|
|action_result|resources_created|
|action_result|ok|

</section><hr>
<section>
<a id="schematypeaheaditem"></a>
<a id="schema_TypeaheadItem"></a>
<a id="tocStypeaheaditem"></a>
<a id="tocstypeaheaditem"></a>
<a id="tocS_TypeaheadItem"></a>
<h2 id="typeahead-item">TypeaheadItem</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "icon_url": "https://example-icon.png",
  "subtitle": "OTP",
  "title": "OTP Team PF",
  "value": "OTP"
}

```

<span class="description">
An object describing a typeahead result.

</span>

### Properties

|Name|Description|
|---|---|
|icon_url<span class="param-type"> string</span>|The URL of the icon to display next to the title|
|subtitle<span class="param-type"> string</span>|The subtitle of the typeahead item|
|title<span class="param-type"> string</span>|The title of the typeahead item|
|value<span class="param-type"> string</span>|The value of the typeahead item|

</section><hr>
<section>
<a id="schematypeaheadlist"></a>
<a id="schema_TypeaheadList"></a>
<a id="tocStypeaheadlist"></a>
<a id="tocstypeaheadlist"></a>
<a id="tocS_TypeaheadList"></a>
<h2 id="typeahead-list">TypeaheadList</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "header": "List of messages",
  "items": [
    {
      "icon_url": "https://example-icon.png",
      "subtitle": "OTP",
      "title": "OTP Team PF",
      "value": "OTP"
    }
  ]
}

```

<span class="description">
The response to a successful typeahead request.

</span>

### Properties

|Name|Description|
|---|---|
|header<span class="param-type"> string</span>|*Optional*. Header text to display above the list of typeahead results. If no `header` is passed in or the value is an empty string, only the typeahead results with be rendered.|
|items<span class="param-type"> [object]</span>|Array of [TypeaheadItem](/docs/typeahead-item) objects that indicate typeahead results.|
|» icon_url<span class="param-type"> string</span>|The URL of the icon to display next to the title|
|» subtitle<span class="param-type"> string</span>|The subtitle of the typeahead item|
|» title<span class="param-type"> string</span>|The title of the typeahead item|
|» value<span class="param-type"> string</span>|The value of the typeahead item|

</section><hr>
<section>
<a id="schemaunauthorized"></a>
<a id="schema_Unauthorized"></a>
<a id="tocSunauthorized"></a>
<a id="tocsunauthorized"></a>
<a id="tocS_Unauthorized"></a>
<h2 id="unauthorized">Unauthorized</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "data": {
    "error": "Authorization required."
  }
}

```

<span class="description">
An error response object indicating a unauthorized request (i.e., a status code of `401`).

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|An object containing an `error` string to display to the user.|
|» error<span class="param-type"> string</span>|The error to display.|

</section><hr>
<section>
<a id="schemawidgetfield-datetimewithicon"></a>
<a id="schema_WidgetField-DatetimeWithIcon"></a>
<a id="tocSwidgetfield-datetimewithicon"></a>
<a id="tocswidgetfield-datetimewithicon"></a>
<a id="tocS_WidgetField-DatetimeWithIcon"></a>
<h2 id="widget-field-datetime-with-icon">WidgetField-DatetimeWithIcon</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "datetime": "2012-02-22T02:06:58.147Z",
  "icon_url": "https://example-icon.png",
  "name": "Status",
  "type": "datetime_with_icon"
}

```

<span class="description">
A Widget field that displays a timestamp and an optional icon.

</span>

### Properties

|Name|Description|
|---|---|
|datetime<span class="param-type"> string</span>|The time (in ISO-8601 date format) to display next to the icon.|
|icon_url<span class="param-type"> string</span>|*Optional*. The URL of the icon to display next to the time.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 40 characters.|
|type<span class="param-type"> string</span>|The type of Widget field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|datetime_with_icon|

</section><hr>
<section>
<a id="schemawidgetfield-pill"></a>
<a id="schema_WidgetField-Pill"></a>
<a id="tocSwidgetfield-pill"></a>
<a id="tocswidgetfield-pill"></a>
<a id="tocS_WidgetField-Pill"></a>
<h2 id="widget-field-pill">WidgetField-Pill</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "color": "gray",
  "name": "Status",
  "text": "In Progress",
  "type": "pill"
}

```

<span class="description">
A Widget field that displays custom text in a colored "pill" format.

</span>

### Properties

|Name|Description|
|---|---|
|color<span class="param-type"> string</span>|The color of the pill.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 40 characters.|
|text<span class="param-type"> string</span>|The text to show in the field. Limit 40 characters.|
|type<span class="param-type"> string</span>|The type of Widget field.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|none|
|color|red|
|color|orange|
|color|yellow-orange|
|color|yellow|
|color|yellow-green|
|color|green|
|color|blue-green|
|color|aqua|
|color|blue|
|color|indigo|
|color|purple|
|color|magenta|
|color|hot-pink|
|color|pink|
|color|cool-gray|
|type|pill|

</section><hr>
<section>
<a id="schemawidgetfield-textwithicon"></a>
<a id="schema_WidgetField-TextWithIcon"></a>
<a id="tocSwidgetfield-textwithicon"></a>
<a id="tocswidgetfield-textwithicon"></a>
<a id="tocS_WidgetField-TextWithIcon"></a>
<h2 id="widget-field-text-with-icon">WidgetField-TextWithIcon</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "icon_url": "https://example-icon.png",
  "name": "Status",
  "text": "In Progress",
  "type": "text_with_icon"
}

```

<span class="description">
A Widget field that displays custom text with an optional icon.

</span>

### Properties

|Name|Description|
|---|---|
|icon_url<span class="param-type"> string</span>|*Optional*. The URL of the icon to display next to the text.|
|name<span class="param-type"> string</span>|The text (i.e., label) to show in the title of the field. Limit 40 characters.|
|text<span class="param-type"> string</span>|The text to show in the field. Limit 40 characters.|
|type<span class="param-type"> string</span>|The type of Widget field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|text_with_icon|

</section><hr>
<section>
<a id="schemawidgetfooter-created"></a>
<a id="schema_WidgetFooter-Created"></a>
<a id="tocSwidgetfooter-created"></a>
<a id="tocswidgetfooter-created"></a>
<a id="tocS_WidgetFooter-Created"></a>
<h2 id="widget-footer-created">WidgetFooter-Created</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "created_at": "2012-02-22T02:06:58.147Z",
  "footer_type": "created"
}

```

<span class="description">
A Widget footer that displays the timestamp of the resource's creation time.

</span>

### Properties

|Name|Description|
|---|---|
|created_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) to show in the footer.|
|footer_type<span class="param-type"> string</span>|The type of Widget footer.|

#### Enumerated Values

|Property|Value|
|---|---|
|footer_type|created|

</section><hr>
<section>
<a id="schemawidgetfooter-customtext"></a>
<a id="schema_WidgetFooter-CustomText"></a>
<a id="tocSwidgetfooter-customtext"></a>
<a id="tocswidgetfooter-customtext"></a>
<a id="tocS_WidgetFooter-CustomText"></a>
<h2 id="widget-footer-custom-text">WidgetFooter-CustomText</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "footer_type": "custom_text",
  "icon_url": "https://example-icon.png",
  "text": "This is a custom footer message"
}

```

<span class="description">
A Widget footer that displays custom text and an optional icon.

</span>

### Properties

|Name|Description|
|---|---|
|footer_type<span class="param-type"> string</span>|The text to show in the footer.|
|icon_url<span class="param-type"> string</span>|*Optional*. The icon to show in the footer next to the text. If not provided, no icon will be shown.|
|text<span class="param-type"> string</span>|The text to show in the footer.|

#### Enumerated Values

|Property|Value|
|---|---|
|footer_type|custom_text|

</section><hr>
<section>
<a id="schemawidgetfooter-updated"></a>
<a id="schema_WidgetFooter-Updated"></a>
<a id="tocSwidgetfooter-updated"></a>
<a id="tocswidgetfooter-updated"></a>
<a id="tocS_WidgetFooter-Updated"></a>
<h2 id="widget-footer-updated">WidgetFooter-Updated</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "footer_type": "updated",
  "last_updated_at": "2012-02-22T02:06:58.147Z"
}

```

<span class="description">
A Widget footer that displays the timestamp of the resource's last updated time.

</span>

### Properties

|Name|Description|
|---|---|
|footer_type<span class="param-type"> string</span>|The type of Widget footer.|
|last_updated_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) to show in the footer.|

#### Enumerated Values

|Property|Value|
|---|---|
|footer_type|updated|

</section><hr>
<section>
<a id="schemawidgetmetadata"></a>
<a id="schema_WidgetMetadata"></a>
<a id="tocSwidgetmetadata"></a>
<a id="tocswidgetmetadata"></a>
<a id="tocS_WidgetMetadata"></a>
<h2 id="widget-metadata">WidgetMetadata</h2>

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```json
{
  "metadata": {
    "error": "The resource cannot be accessed",
    "fields": [],
    "footer": {},
    "num_comments": 2,
    "subicon_url": "https://example-icon.png",
    "subtitle": "Custom App Story · Open in Custom App",
    "title": "Status"
  },
  "template": "summary_with_details_v0"
}

```

<span class="description">
An object containing information about the widget.

</span>

### Properties

|Name|Description|
|---|---|
|metadata<span class="param-type"> object</span>|The metadata (i.e., underlying definition) of a widget. `metadata` must exist alongside a `template`, and its schema must be specific to the value of that `template`.|
|» error<span class="param-type"> string</span>|The error that should be displayed to the user|
|» fields<span class="param-type"> array</span>|A list of fields showing data from external resources (i.e., an array of WidgetField objects). A Widget must contain at least 1 field and no more than 5 fields.<br><br>Valid object schemas: [WidgetField-DatetimeWithIcon](/docs/widget-field-datetime-with-icon), [WidgetField-Pill](/docs/widget-field-pill), [WidgetField-TextWithIcon](/docs/widget-field-text-with-icon).|
|» footer<span class="param-type"> object</span>|Contains the information to display a footer on the Widget. <br><br>Valid schemas: [WidgetFooter-Created](/docs/widget-footer-created), [WidgetFooter-CustomText](/docs/widget-footer-custom-text), [WidgetFooter-Updated](/docs/widget-footer-updated).|
|» num_comments<span class="param-type"> integer</span>|The number of comments to display on the lower right corner of the widget. If not provided, no comment count will be shown|
|» subicon_url<span class="param-type"> string</span>|The URL of the subicon next to the subtitle . If not provided, no icon will be shown|
|» subtitle<span class="param-type"> string</span>|The text to show under the title of the widget, next to "Open in {App Name}". If not provided, the resource_name from the app definition will be used as default|
|» title<span class="param-type"> string</span>|The text to show in the title of the widget. Max length of 200 chars.|
|template<span class="param-type"> string</span>|The interface name and version of a distinct widget UI layout. A `template` is directly associated with a particular `metadata` schema.|

#### Enumerated Values

|Property|Value|
|---|---|
|template|summary_with_details_v0|

</section>

