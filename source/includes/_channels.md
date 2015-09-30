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
### HTTP Request

`GET https://platform-api.productsup.io/platform/v1/sites/123/channels`

`GET https://platform-api.productsup.io/platform/v1/sites/123/channels/321`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
site_id | String | ID of the referenced site
name | String | Name of the export you provided while creating the channel
export_name | String | Generic name of the export in the productsup system
history | Array | see [channel history](#channel-history)