## Database

```php
<?php
// plugins/HelloWorldBundle/Entity/World.php

namespace MauticPlugin\HelloWorldBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Mautic\CategoryBundle\Entity\Category;
use Mautic\CoreBundle\Doctrine\Mapping\ClassMetadataBuilder;
use Mautic\CoreBundle\Entity\CommonEntity;

/**
 * Class World
 */
class World extends CommonEntity
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $description;

    /**
     * @var Category
     */
    private $category;

    /**
     * @var int
     */
    private $visitCount;

    /**
     * @var int
     */
    private $population = 0;

    /**
     * @var bool
     */
    private $isInhabited = false;

    /**
     * @param ORM\ClassMetadata $metadata
     */
    public static function loadMetadata (ORM\ClassMetadata $metadata)
    {
        $builder = new ClassMetadataBuilder($metadata);

        $builder->setTable('worlds')
            ->setCustomRepositoryClass('MauticPlugin\HelloWorldBundle\Entity\WorldRepository');

        // Helper functions
        $builder->addIdColumns();
        $builder->addCategory();
        $builder->addNamedField('visitorCount', 'int', 'visitor_count');
        $builder->addField('population', 'int');

        // Native means to build a field
        $builder->createField('isInhabited', 'bool')
            ->columnName('is_inhabited')
            ->nullable(false);
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     *
     * @return World
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     *
     * @return World
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Category
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * @param mixed $category
     *
     * @return World
     */
    public function setCategory(Category $category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getVisitCount()
    {
        return $this->visitCount;
    }

    /**
     * @param mixed $visitCount
     *
     * @return World
     */
    public function setVisitCount($visitCount)
    {
        $this->visitCount = $visitCount;

        return $this;
    }

    /**
     * Increase the visit count by one
     */
    public function upVisitCount()
    {
        $this->visitCount++;
    }

    /**
     * Get planet population
     */
    public function getPopulation()
    {
        return $this->population;
    }

    /**
     * @param int $population
     *
     * @return World
     */
    public function setPopulation($population)
    {
        $this->population = $population;

        return $this;
    }

    /**
     * @return boolean
     */
    public function isIsInhabited()
    {
        return $this->isInhabited;
    }

    /**
     * @param boolean $isInhabited
     *
     * @return World
     */
    public function setIsInhabited($isInhabited)
    {
        $this->isInhabited = $isInhabited;

        return $this;
    }
}
```

```php
<?php
// plugins/HelloWorldBundle/Entity/WorldRepository.php

namespace MauticPlugin\HelloWorldBundle\Entity;

use Mautic\CoreBundle\Entity\CommonRepository;

/**
 * WorldRepository
 */
class WorldRepository extends CommonRepository
{

    public function getEntities($args = array())
    {
        $q = $this
            ->createQueryBuilder('w')
            ->leftJoin('a.category', 'c');

        $args['qb'] = $q;

        return parent::getEntities($args);
    }
}
```

Mautic uses [Doctrine](#http://doctrine-orm.readthedocs.org/en/latest/), a database object relational mapper (ORM) and database abstraction layer (DBAL) library.

Most of Mautic use [entity and repository classes](http://symfony.com/doc/current/book/doctrine.html#creating-an-entity-class) to define the schema and interact with the database.

#### Usage
Refer to [Symfony's](http://symfony.com/doc/current/book/doctrine.html) and [Doctrine's](http://doctrine-orm.readthedocs.org/en/latest) documentation on the specifics of how to interact with the Database.

#### Metadata/Schema
Mautic uses Doctrine's [PHP Driver](http://doctrine-orm.readthedocs.org/en/latest/reference/php-mapping.html#static-function) to define schema. The plugin doesn't necessarily have to use entities but should at least define Entity classes to create it's schema. 

#### Installing/Updating Schema
When an plugin is installed or updated, the bundle's onInstall or onUpgrade functions are called.  These functions can be used to manipulate the database schema. See [Install/Upgrade](#install/upgrade).

#### Table Prefix
Mautic allows custom table prefixes.  If using ORM, there is no need to include the prefix as Mautic will automatically handle it.  However, if there is a need to use Doctrine's DBAL layer directly, the contstant `MAUTIC_TABLE_PREFIX` can be used in conjuction with the table name.

#### Description of tables

This is not yet a comprehensive list of all database tables.  Contributions are [very welcome](https://github.com/mautic/developer-documentation/blob/master/CONTRIBUTING.md).

- `leads`: contacts
- `lead_lists`: segments
- `lead_lists_leads`: membership of contacts within segments
- `lead_tags`: tags
- `lead_tags_xrefs`: associations of tags with contacts
- `migrations`: tracks which [database migrations](https://github.com/mautic/mautic/tree/staging/app/migrations) have been applied

#### ORM Arrays and DateTime 

When using ORM, Mautic will automatically convert DateTime properties to UTC and to the system/user's profile timezone on retrieval.  However, if using DBAL, DateTime strings must be converted to UTC before persisting and to the local timezone on retrieval.  See [Date/Time Helper](#date/time-helper) to assist with conversions.

For arrays, ORM will auto serialize and unserialize. DBAL will need to manually handle this.
