## Integration Framework

The IntegrationsBundle is meant to be a drop in replacement for Mautic's PluginBundle's AbstractIntegration class. It provides cleaner interfaces for configuring, authenticating and syncing contacts/companies with 3rd party integrations.

An example HelloWorld plugin is available [here](https://github.com/mautic/plugin-helloworld).

### Using the Integration Framework

*If the integration requires authentication with the 3rd party service*

1. [Register the integration](#registering-the-integration-for-authentication) as an integration that requires configuration options.
2. Create a custom Symfony form type for the required credentials and return it as part of the [config interface](#mauticpluginintegrationsbundleintegrationinterfacesconfigformauthinterface).
3. Create a custom service that builds and configures the Guzzle client required to authenticate and communicate with the 3rd party service. Use an [existing supported factory or create a new one](#authentication-providers).

*If the integration has extra configuration settings for features unique to it*

1. [Register the integration](#registering-the-integration-for-configuration) as an integration that requires configuration options.
2. Create a custom Symfony form type for the features and return it as part of the [config interface](#mauticpluginintegrationsbundleintegrationinterfacesconfigformfeaturesettingsinterface).

*If the integration syncs with Mautic's contacts and/or companies*

1. Read about [the sync engine](#integration-sync-engine).

*If the integration includes a builder integration (email or landing page)*

1. [Register the integration](#registering-the-integration-for-builders) as an integration that provides a custom builder. 
2. Configure what featured builders the integration supports (Mautic currently supports "email" and "page" builders).

### Basics
Each integration provides its unique name as registered with Mautic, icon, and display name. When an integration is registered, the integration helper classes will manage the `\Mautic\PluginBundle\Entity\Integration` object through `\Mautic\IntegrationsBundle\Integration\Interfaces\IntegrationInterface`. It handles decryption and encryption of the integration's API keys so the implementing code never has to.

##### Registering the Integration
All integrations whether it uses the config, auth or sync interfaces must have a class that registers itself with Mautic. The integration will be listed no the `/s/plugins` page.

In the plugin's `Config/config.php`, register the integration using the tag `mautic.basic_integration`.

```php
<?php
return [
    // ...
    'services' => [
        // ...
        'integrations' => [
            'helloworld.integration' => [
                'class' => \MauticPlugin\HelloWorldBundle\Integration\HelloWorldIntegration::class,
                'tags'  => [
                    'mautic.basic_integration',
                ],
            ],
            // ...
        ],
        // ...
    ],
    // ...
];
```

The `HelloWorldIntegration` will need to implement `\Mautic\IntegrationsBundle\Integration\Interfaces\IntegrationInterface` and `\Mautic\IntegrationsBundle\Integration\Interfaces\BasicInterface` interfaces. Most use cases can simply extend the `\Mautic\IntegrationsBundle\Integration\BasicIntegration` abstract class then define the `getName()`, `getDisplayName()` and `getIcon()` methods.

```php
<?php
namespace MauticPlugin\HelloWorldBundle\Integration;

use MauticPlugin\IntegrationsBundle\Integration\BasicIntegration;
use MauticPlugin\IntegrationsBundle\Integration\Interfaces\BasicInterface;
use MauticPlugin\IntegrationsBundle\Integration\Interfaces\IntegrationInterface;

class HelloWorldIntegration extends BasicIntegration
{
    const NAME = 'HelloWorld';

    public function getName(): string
    {
        return self::NAME;
    }

    public function getDisplayName(): string
    {
        return 'Hello World';
    }

    public function getIcon(): string
    {
        return 'plugins/HelloWorldBundle/Assets/img/helloworld.png';
    }
}
```
