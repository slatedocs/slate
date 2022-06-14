
## API Rate limiter

You can configure rate limiter cache in local.php
By default, filesystem is used as:
```php
api_rate_limiter_cache => [ 
    'type'      => 'file_system',
], 
```

You can configure memcached server:
```php
'api_rate_limiter_cache' => [
    'memcached' => [
      'servers' =>
        [
          [
            'host' => 'localhost',
            'port' => 11211
          ]
        ]
    ]
  ],
```

Or whatever cache you want described in [Symfony cache documentation](https://symfony.com/doc/current/bundles/DoctrineCacheBundle/reference.html).
