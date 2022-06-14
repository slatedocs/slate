### Integration Builders
Builders can register itself as a "builder" for email and/or landing pages. 

#### Registering the Integration as a Builder
To tell the IntegrationsBundle that this integration has configuration options, tag the integration or support class with `mautic.config_integration` in the plugin's `app/config.php`.

```php
<?php
return [
    // ...
    'services' => [
        // ...
        'integrations' => [
            // ...
            'helloworld.integration.builder' => [
                'class' => \MauticPlugin\HelloWorldBundle\Integration\Support\BuilderSupport::class,
                'tags'  => [
                    'mautic.builder_integration',
                ],
            ],
            // ...
        ],
        // ...
    ],
    // ...
];
```

The `BuilderSupport` class must implement `\Mautic\IntegrationsBundle\Integration\Interfaces\BuilderInterface`.

The only method currently defined for the interface is `isSupported` which should return a boolean if it supports the given feature. Currently, Mautic supports `email` and `page` (landing pages). This will determine what themes should be displayed as an option for the given builder/feature. 
