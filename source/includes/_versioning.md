# API Endpoint

You access Beyonic’s API at the following endpoint:

* https://app.beyonic.com/api

This endpoint points to the latest version of our API. The latest version will change from time to time and may break your application. So If you’d like to make sure that your application always accesses the same version, you can specify a specific version in two ways, as shown below.

# Versioning

> Example Request:

```shell
curl -H "Beyonic-Version: v1" https://app.beyonic.com/api
```

```ruby
require 'beyonic'
Beyonic.api_version = 'v1'
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");
?>
```

```python
import beyonic
beyonic.api_version = 'v1'
```

The current version is v1. The default API endpoint to this version.

You can access a specific API version in 2 ways:

* Use version specific URLS like: https://app.beyonic.com/api/v1
* Include the Beyonic-Version header in your request as shown in the examples to the right.

