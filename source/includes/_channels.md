# Channels
 
Channels are targets of the data (like "Google Shopping", Amazon,..)
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>


## Get
To list all channels of your account, or only certain sites, you can use get.

```php
<?php
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$channelService = new \Productsup\Service\Channels($client);
$channelService->setReference($reference);
$channels = $channelService->get();

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Channel Object
        (
            [id] => 321
            [site_id] => 123
            [name] => Criteo DE
            [export_name] => Criteo
            [history] => 
            [links:protected] => ...
        )

    [1] => Productsup\Platform\Channel Object
        (
            [id] => 543
            [site_id] => 123
            [name] => Zanox DE
            [export_name] => Zanox
            [history] => 
            [links:protected] => ...
        )
...
*/
```

```shell
# requesting all channels of one site
curl https://platform-api.productsup.io/platform/v1/sites/123/channels

# requesting a specific channel
curl https://platform-api.productsup.io/platform/v1/sites/123/channels/321
```

```shell    
response: 
{
    "success": true,
    "Channels": [{
                "id": "321",
                "site_id": "123",
                "channel_id": "111",
                "name": "Criteo DE",
                "export_name": "Criteo",
                "links": [...]
            }, {
                "id": "541",
                "site_id": "123",
                "channel_id": "222",
                "name": "Zanox DE",
                "export_name": "FZanox",
                "links": [...]
            }
```
### HTTP Request - Get all channels for a site

`GET https://platform-api.productsup.io/platform/v1/sites/<siteId>/channels`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteId | integer | Site to list channels for

### <a name="channel-request-by-id"></a> HTTP Request - Get a channel by it's identifier

`GET https://platform-api.productsup.io/platform/v1/sites/<siteId>/channels/<channelId>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteId | integer | Site under which channel exists
channelId | integer | Channel to get

### Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Channels | array | List of [channels](#channel-response-channel)

#### <a name="channel-response-channel"></a> Channel fields
Field | Type | Description
------ | -------- | --------------
id | integer | Internal ID
site_id | integer | ID of the referenced site
channel_id | integer | ID of the referenced site
name | string | Name of the export you provided while creating the channel
export_name | string | Generic name of the export in the productsup system
links | array | List of [relevant resources](#channel-response-links)

#### <a name="channel-response-links"></a> Links fields and values
Name | Description
--- | ---
self | Link to [channel detail](#channel-request-by-id)
site | Link to [site](#sites-request-by-id) 
