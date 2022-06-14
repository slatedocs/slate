### Router

```php
<?php 

$router = $this->get('router');

// Relative URL
$url = $router->generateUrl('plugin_helloworld_admin');

// URL with placeholders
$url = $router->generateUrl('plugin_helloworld_world', array('%world%', 'mars'));

// Absolute URL
$absoluteUrl = $router->generateUrl('plugin_helloworld_admin', array(), true);
```

```php
<?php 
// Deprecated - use path or url instead
$url = $view['router']->generate('plugin_helloworld_admin'); // result is /hello/admin

// Generate a path in a view template
$path = $view['router']->path('plugin_helloworld_admin'); // result is /hello/admin
$url  = $view['router']->url('plugin_helloworld_admin'); // result is http://yoursite.com/hello/admin

```

* Service name: `router`
* Class: `Symfony\Bundle\FrameworkBundle\Routing\Router`
* Docs: [https://symfony.com/doc/2.8/routing.html#generating-urls](https://symfony.com/doc/2.8/routing.html#generating-urls)

For views, use the `$view['router']` helper. The difference with the [template helper](#router-helper) is that `url()` or `path()` is used instead of `generateUrl()` of the `router` service.
