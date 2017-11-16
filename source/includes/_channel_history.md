# Channel History
 
With the channel history, you can get information on the last exports of a channel

## Get
To list the history, you can use get.

```php
<?php
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$channelService = new \Productsup\Service\Channels($client);
$channelService->setReference($reference);
$channels = $channelService->get(321,'history');

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Channel Object
        (
            [id] => 2116
            [site_id] => 368693
            [name] => Criteo DE
            [export_name] => FusePump Criteo
            [history] => Array
                (
                    [0] => Array
                        (
                            [id] => 25190
                            [site_id] => 368693
                            [site_channel_id] => 2116
                            [export_time] => 2015-08-27 16:22:57
                            [export_start] => 2015-08-27 16:22:55
                            [product_count] => 20562
                            [product_count_now] => 20562
                            [product_count_previous] => 0
                            [process_status] => 0
                            [pid] => 55df182bde8e8
                            [product_count_new] => 0
                            [product_count_modified] => 0
                            [product_count_deleted] => 0
                            [product_count_unchanged] => 0
                            [uploaded] => 0
                        )

                    [1] => Array
                        (
                            [id] => 25163
                            [site_id] => 368693
                            [site_channel_id] => 2116
                            [export_time] => 2015-08-27 15:48:03
                            [export_start] => 2015-08-27 15:48:02
                            [product_count] => 20562
                            [product_count_now] => 20562
                            [product_count_previous] => 0
                            [process_status] => 0
                            [pid] => 55df10f8c89d2
                            [product_count_new] => 0
                            [product_count_modified] => 0
                            [product_count_deleted] => 0
                            [product_count_unchanged] => 0
                            [uploaded] => 0
                        )

...
*/
```

```shell
# requesting the history of one channel
curl https://platform-api.productsup.io/platform/v1/sites/123/channels/321/history


```
    
```shell    
{
    "success": true,
    "Channels": [{
                "id": "321",
                "site_id": "123",
                "channel_id": "1",
                "name": "Google Merchant Center DE",
                "export_name": "Google Merchant Center",
                "links": [...],
                "history": [{
                            "id": "333",
                            "site_id": "123",
                            "site_channel_id": "444",
                            "export_time": "2015-09-30 10:18:56",
                            "export_start": "2015-09-30 10:18:54",
                            "product_count": "18697",
                            "product_count_now": "20904",
                            "product_count_previous": "0",
                            "process_status": "0",
                            "pid": "560b96899e334",
                            "product_count_new": "0",
                            "product_count_modified": "0",
                            "product_count_deleted": "0",
                            "product_count_unchanged": "0",
                            "uploaded": "0"
                        }, ...
                    }
                ]
}
```
### HTTP Request

`GET https://platform-api.productsup.io/platform/v1/sites/<siteId>/channels/<channelId>/history`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteId | integer | Site under which channel exists
channelId | integer | Channel to get

### Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Channels | array | List of [channels](#channel-history-response-channel)

#### <a name="channel-history-response-channel"></a> Channel fields
Field | Type | Description
------ | -------- | --------------
id | integer | Internal ID
site_id | integer | ID of the referenced site
channel_id | integer | ID of the referenced site
name | string | Name of the export you provided while creating the channel
export_name | string | Generic name of the export in the productsup system
links | array | List of [relevant resources](#channel-history-response-links)
history | array | List of [channel history](#channel-history-response-history)

#### <a name="channel-history-response-links"></a> Links fields and values
Name | Description
--- | ---
self | Link to [channel detail](#channel-request-by-id)
site | Link to [site](#sites-request-by-id) 

#### <a name="channel-history-response-history"></a> History fields
Field | Type | Description
------ | -------- | --------------
id | integer | Internal identifier
site_id | integer | Identifier of the referenced site
site_channel_id | string | Internal id for the combination of an [Export](#channels) and [Site](#sites)
export_time | dateTime | Time when the process was finished
export_start | dateTime | Time when the process was started
product_count | integer | Number of products exported
pid | string | Internal identifier for the process
product_count_new | integer | Number of new products (only for delta exports)
product_count_modified | integer | Number of updated products (only for delta exports)
product_count_deleted | integer | Number of deleted products (only for delta exports)
product_count_unchanged | integer | Number of unchanged products (only for delta exports)
uploaded | integer | Indicator if the export was uploaded to it's destination

<aside class="notice">Creating and deleting channel history are not available.</aside>
