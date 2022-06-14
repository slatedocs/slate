### Integration Sync Engine
The sync engine supports bidirectional syncing between Mautic's contact and companies with 3rd party objects. The engine generates a "sync report" from Mautic that it converts to a "sync order" for the integration to process. It then asks for a "sync report" from the integration which it converts to a "sync order" for Mautic to process. 

When building the report, Mautic or the integration will fetch the objects that have been modified or created within the specified timeframe. If the integration supports changes at the field level, it should tell the report on a per field basis when the field was last updated. Otherwise, it should tell the report when the object itself was last modified. These dates are used by the "sync judge" to determine which value should be used in a bi-directional sync.

The sync is initiated using the `mautic:integrations:sync` command. For example:
`php app/console mautic:integrations:sync HelloWorld --start-datetime="2020-01-01 00:00:00" --end-datetime="2020-01-02 00:00:00"`. (Use `php bin/console` for Mautic 3). 

#### Registering the Integration for the Sync Engine
To tell the IntegrationsBundle that this integration provides a syncing feature, tag the integration or support class with `mautic.sync_integration` in the plugin's `app/config.php`.

```php
<?php
return [
    // ...
    'services' => [
        // ...
        'integrations' => [
            // ...
            'helloworld.integration.sync' => [
                'class' => \MauticPlugin\HelloWorldBundle\Integration\Support\SyncSupport::class,
                'tags'  => [
                    'mautic.sync_integration',
                ],
            ],
            // ...
        ],
        // ...
    ],
    // ...
];
```

The `SyncSupport` class must implement `\Mautic\IntegrationsBundle\Integration\Interfaces\SyncInterface`.


#### Syncing

##### The Mapping Manual
The mapping manual tells the sync engine which integration should be synced with which Mautic object (contact or company), the integration fields that were mapped to Mautic fields, and the direction the data is supposed to flow. 

See [https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/Mapping/Manual/MappingManualFactory.php]( https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/Mapping/Manual/MappingManualFactory.php)

##### The Sync Data Exchange
This is where the sync takes place and is executed by the `mautic:integrations:sync` command. Mautic and the integration will build their respective reports of new or modified objects then execute the order from the other side. 

See [https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/SyncDataExchange.php](https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/SyncDataExchange.php)

###### Building Sync Report
The sync report tells the sync engine what objects are new and/or modified between the two timestamps given by the engine (or up to the integration discretion if it is a first time sync). Objects should be processed in batches which can be done using the `RequestDAO::getSyncIteration()`. The sync engine will execute `SyncDataExchangeInterface::getSyncReport()` until a report comes back with no objects.

If the integration supports field level change tracking, it should tell the report so that the sync engine can merge the two data sets more accurately. 

See [https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/ReportBuilder.php](https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/ReportBuilder.php)

###### Executing the Sync Order
The sync order contains all the changes the sync engine has determined should be written to the integration. The integration should communicate back the ID of any objects created or adjust objects as needed such as if they were converted from one to another or deleted.

See [https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/OrderExecutioner.php](https://github.com/mautic/plugin-helloworld/blob/mautic-2/Sync/DataExchange/OrderExecutioner.php)
