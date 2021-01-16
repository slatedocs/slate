# Cache Bundle

Enables PSR-6 and PSR-16 caching. Check: [Symfony Cache Component](https://symfony.com/doc/3.4/components/cache.html)

## Namespace versus tag

This bundle introduces tags to cache. All its adapters are fully tag
aware which makes the use of namespace obsolete for daily use.

Previously if you wanted to keep control on cache section and did not want to hold
the index of all keys to clear you would have to use namespace.

Disadvantage of this approach is a new adapter being created for each namespace.

[Symfony 3.4 Cache](https://symfony.com/doc/3.4/components/cache.html) uses tag-aware adapters. If you want to clear all records related to your bundle
or component you just need to tag them.

```php
    /** @var CacheProvider $cache */
    $cache = $this->get('mautic.cache.provider');

    /** @var CacheItemInterface $item */
    $item = $cache->getItem('test_tagged_Item');
    $item->set('yesa!!!');
    $item->tag(['firstTag', 'secondTag']);
    $item->expiresAfter(20000);
```

All you need to do now is to clear all tagged items:

```php
$cache->invalidateTags(['firstTag']);
```

### Pools clearing

Removing Cache Items¶

Cache Pools include methods to delete a cache item, some of them or all of them.
The most common is `Psr\\Cache\\CacheItemPoolInterface::deleteItem`, which deletes the cache item identified by the given key.

```php
$isDeleted = $cache->deleteItem('user_'.$userId);
```

Use the Psr\\Cache\\CacheItemPoolInterface::deleteItems method to delete several cache items simultaneously (it returns true only if all the items have been deleted, even when any or some of them don't exist):

## Configuration

Plugin comes preconfigured to utilize filesystem caching.

These are the default settings:
```php
'cache_adapter'  => 'mautic.cache.adapter.filesystem',
'cache_prefix'   => 'app',
'cache_lifetime' => 86400
```


They can be overridden in **local.php** like this:

```php
'cache_adapter'  => 'mautic.cache.adapter.redis',
'cache_prefix'   => 'app_cache',
'cache_lifetime' => 86400,
```


## Delivered adapters
 * mautic.cache.adapter.filesystem
 * mautic.cache.adapter.memcached
```php
 'memcached' => [
         'servers' => ['memcached://localhost'],
         'options' => [
             'compression'          => true,
             'libketama_compatible' => true,
             'serializer'           => 'igbinary',
         ],
     ],
```
 * mautic.cache.adapter.redis
 Redis configuration in **local.php**:
 ```php
 'redis' => [
         'dsn' => 'redis://localhost',
         'options' => [
             'lazy' => false,
             'persistent' => 0,
             'persistent_id' => null,
             'timeout' => 30,
             'read_timeout' => 0,
             'retry_interval' => 0,
         ]
     ],
```

In order to use another adapter just set it up as a service

## Clearing the cache

The cache is cleared when **cache:clear** command is run. The cache can be cleared by running

```bash
bin/console mautic:cache:clear
```

## Features auto pruning on adapter initialization

## Usage

### PSR-6

```php
    /** @var CacheProvider $cache */
    $cache = $this->get('mautic.cache.provider');

    /** @var CacheItemInterface $item */
    $item = $cache->getItem('test_tagged_Item');
    $item->set('yesa!!!');
    $item->tag(['firstTag', 'secondTag']);
    $item->expiresAfter(20000);

    $cache->save($item);

    $item = $cache->getItem('test_nottagged_Item2');
    $item->tag(['firstTag']);
    $cache->save($item);

    $item = $cache->getItem('test_nottagged_Item3');
    $item->tag(['secondTag']);
    $cache->save($item);

    $cache->commit();

    var_dump($cache->getItem('test_nottagged_Item2')->isHit());
    var_dump($cache->getItem('test_nottagged_Item3')->isHit());

    $cache->invalidateTags(['firstTag']);

    var_dump($cache->getItem('test_nottagged_Item2')->isHit());
    var_dump($cache->getItem('test_nottagged_Item3')->isHit());

    $cache->commit();
```

### PSR-16

```php
        /** @var CacheProvider $cache */
        $cache = $this->get('mautic.cache.provider');


        $simpleCache = $cache->getSimpleCache();
        $test = $simpleCache->get('test_value');

        var_dump($test);
```
