# Channel History
 
With the channel history, you can get information on the last exports of a channel

## Get
To list the history, you can 

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

`GET https://platform-api.productsup.io/platform/v1/sites/123/channels/321/history`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
site_id | Integer | ID of the referenced site
site_channel_id | String | Internal id for the combination of an [Export](#channels) and [Site](#sites)
export_time | DateTime | Time when the process was finished
export_start | DateTime | Time when the process was started
product_count | Integer | Number of products exported
pid | String | Internal ID for the process
product_count_new | Integer | Only for delta exports, number of new products
product_count_modified | Integer | Only for delta exports, number of updated products
product_count_deleted | Integer | Only for delta exports, number of deleted products
product_count_unchanged | Integer | Only for delta exports, number of unchanged products
uploaded | Integer | Indicator if the export was uploaded to it's destination


<aside class="notice">Creating and deleting import history are not available</aside>