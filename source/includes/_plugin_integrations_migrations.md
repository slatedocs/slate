### Plugin Schema

The integration framework provides a means for plugins to better manage their schema. Queries are in migration files that match the plugin's versions number in it's config. When the a plugin is installed or upgraded, it will loop over the migration files up to the latest version.

#### AbstractPluginBundle

The plugin's root bundle class should extend `MauticPlugin\IntegrationsBundle\Bundle\AbstractPluginBundle`.

```php
<?php

declare(strict_types=1);

namespace MauticPlugin\HelloWorldBundle;

use MauticPlugin\IntegrationsBundle\Bundle\AbstractPluginBundle;

class HelloWorldBundle extends AbstractPluginBundle
{
}
```

#### Plugin Migrations
Each migration file should be stored in the plugin's `Migration` folder with a name that matches `Version_X_Y_Z.php` where `X_Y_Z` matches the semantic versioning of the plugin. Each file should contain the incremental schema changes for the plugin up to the latest version which should match the version in the plugin's Config/config.php file.

There are two methods. `isApplicable` should return true/false if the migration should be ran. `up` should register the SQL to execute.

```php
<?php

declare(strict_types=1);

namespace MauticPlugin\HelloWorldBundle\Migrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\DBAL\Schema\SchemaException;
use Mautic\IntegrationsBundle\Migration\AbstractMigration;

class Version_1_0_1 extends AbstractMigration
{
    private $table = 'hello_world';

    protected function isApplicable(Schema $schema): bool
    {
        try {
            return !$schema->getTable($this->concatPrefix($this->table))->hasColumn('is_enabled');
        } catch (SchemaException $e) {
            return false;
        }
    }

    protected function up(): void
    {
        $this->addSql("ALTER TABLE `{$this->concatPrefix($this->table)}` ADD `is_enabled` tinyint(1) 0");

        $this->addSql("CREATE INDEX {$this->concatPrefix('is_enabled')} ON {$this->concatPrefix($this->table)}(is_enabled);");
    }
}
```
