# Process
Process can be used to trigger processing actions on your site. You can can use 
the Platform API Client with the Process object or make the call to the endpoint
yourself.
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication).</aside>

## Post
Trigger a processing action on your site.

```php
<?php
$processAction = new Productsup\Service\Process($Client);

// Only required if not setting the site_id property for the model
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey($reference::REFERENCE_SITE);
$reference->setValue(123456789); 

$processModel = new Process();
$processModel->action = 'import';
// Only required for types 'export' or 'channel'
// $processModel->action_id = 1234567890;
$processModel->addReference($reference);
// Instead of a reference you can also set the site id manually
// $processModel->site_id = 123457890;

$result = $processAction->post($processModel);

var_dump($result);

/*
result will look like this:
bool(true)
*/
```

```shell
# Triggering an action on your site
curl -X POST H "Content-Type:application/json" -d '{"action": "import"}' https://platform-api.productsup.io/platform/v2/process/<siteId>
```
    
```shell    
{
    "success": true,
    "pid": "[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{12}"
}
```
### HTTP Request

`POST https://platform-api.productsup.io/platform/v2/process/<siteId>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteId | integer | Site you want to trigger processing for

#### HTTP headers
Name | Value
--- | ---
Content-Type | application/json

The data to be inserted has to be provided as a JSON-Object.

#### Request body fields
Field | Type | Description
------ | -------- | --------------
action | string | [Action value](#process-request-action)
id | integer | Export or channel id, only required for action types _export_ and _channel_

#### <a name="process-request-action"></a> Action value explanation
Action value | Description
------ | ------
import | Trigger an import on the site
export | Trigger an export, export id is required (old style of exporting)
channel | Trigger a channel, channel id is required (new style of exporting)
export-all | Trigger all exports and channels
all | Trigger an import, all exports and channels

### Response body fields
Field | Type | Description
------ | -------- | --------------
success | Boolean | Indicates status of job scheduling on the Jenkins server
pid | string | The Process Identifier (PID) (format: `[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{7}-[a-z0-9]{12}`)
