## Install/Upgrade

**THIS IS NOW DEPRECATED AND DISCOURAGED FROM USE. USE THE [INTEGRATION FRAMEWORK'S MIGRATION](#plugin-schema) INSTEAD.**

```php
<?php
// plugins/HelloWorldBundle/HelloWorldBundle.php

namespace MauticPlugin\HelloWorldBundle;

use Doctrine\DBAL\Schema\Schema;
use Mautic\PluginBundle\Bundle\PluginBundleBase;
use Mautic\PluginBundle\Entity\Plugin;
use Mautic\CoreBundle\Factory\MauticFactory;

class HelloWorldBundle extends PluginBundleBase
{

    /**
     * Called by PluginController::reloadAction when adding a new plugin that's not already installed
     *
     * @param Plugin        $plugin
     * @param MauticFactory $factory
     * @param null          $metadata
     */

    static public function onPluginInstall(Plugin $plugin, MauticFactory $factory, $metadata = null)
    {
        if ($metadata !== null) {
            self::installPluginSchema($metadata, $factory);
        }
        
        // Do other install stuff
    }

    /**
    * Called by PluginController::reloadAction when the plugin version does not match what's installed
    *
    * @param Plugin        $plugin
    * @param MauticFactory $factory
    * @param null          $metadata
    * @param Schema        $installedSchema
    *
    * @throws \Exception
    */
    static public function onPluginUpdate(Plugin $plugin, MauticFactory $factory, $metadata = null, Schema $installedSchema = null)
    {
        $db             = $factory->getDatabase();
        $platform       = $db->getDatabasePlatform()->getName();
        $queries        = array();
        $fromVersion    = $plugin->getVersion();
    
        // Simple example
        switch ($fromVersion) {
            case '1.0':
                switch ($platform) {
                    case 'mysql':
                        $queries[] = 'ALTER TABLE ' . MAUTIC_TABLE_PREFIX . 'worlds CHANGE description LONGTEXT DEFAULT NULL';
                        break;
    
                    case 'postgresql':
                        $queries[] = 'ALTER TABLE ' . MAUTIC_TABLE_PREFIX . 'worlds ALTER description ALTER TYPE TEXT';
                        break;
                }
    
                break;
        }
    
        if (!empty($queries)) {
    
            $db->beginTransaction();
            try {
                foreach ($queries as $q) {
                    $db->query($q);
                }
    
                $db->commit();
            } catch (\Exception $e) {
                $db->rollback();
    
                throw $e;
            }
        }
    }
}
```

Currently, plugins are installed by uploading the plugin to the plugins folder and the cache manually deleted (`app/cache/prod`). Then, the admin must click the Install/Upgrade Plugins button in the Plugin manager. When that happens, new plugins found will have the static method `onPluginInstall()` called from the [plugin's bundle file](#plugin-directory-structure). If the plugin has already been installed, and the version has changed, then `onPluginUpdate()` is called.

By default, `onPluginInstall()` will execute `installPluginSchema()`. This function will generate and execute schema based on found [Entity](#Database) classes.

`updatePluginSchema()` is available for use with `onPluginUpdate()`, however it is not called by default. The reason is that it uses Doctrine to generate schema differences and executes the queries. This is not recommended due to the risk of Doctrine making incorrect assumptions that will lead to data loss. If `updatePluginSchema()` is relied upon, it is very important to test thoroughly to ensure the desired outcome. It is recommended to write a migration path for both MySQL and PostgreSQL with native queries instead.

### onPluginInstall()

Executed when a plugin is first installed. By default, the plugin's database schema will be generated and installed based on the Entity class' `loadMetadata` function.

Argument|Type|Description
--------|----|-----------
$plugin|Mautic\PluginBundle\Entity\Plugin|The plugin entity with information gleaned from the plugin's config file.
$factory|Mautic\CoreBundle\Factory\MauticFactory|Mautic's factory class to provide access to Mautic's services. 
$metadata|array\|null|Array of found Entity classes to be used by Doctrine's SchemaTool to generate installation schema.

### installPluginSchema()

Argument|Type|Description
--------|----|-----------
$metadata|array\|null|Array of found Entity classes to be used by Doctrine's SchemaTool to generate installation schema.
$factory|Mautic\CoreBundle\Factory\MauticFactory|Mautic's factory class to provide access to Mautic's services. 

### onPluginUpdate()

Argument|Type|Description
--------|----|-----------
$plugin|Mautic\PluginBundle\Entity\Plugin|The plugin entity with information gleaned from the plugin's config file.
$factory|Mautic\CoreBundle\Factory\MauticFactory|Mautic's factory class to provide access to Mautic's services. 
$metadata|array\|null|Array of found Entity classes to be used by Doctrine's SchemaTool to generate update schema.
$installedSchema|\Doctrine\DBAL\Schema\Schema|Schema of currently installed tables

### updatePluginSchema()

Argument|Type|Description
--------|----|-----------
$metadata|array\|null|Array of found Entity classes to be used by Doctrine's SchemaTool to generate update schema.
$installedSchema|\Doctrine\DBAL\Schema\Schema|Schema of currently installed tables
$factory|Mautic\CoreBundle\Factory\MauticFactory|Mautic's factory class to provide access to Mautic's services.
