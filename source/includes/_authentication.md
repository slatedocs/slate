# Authentication

> Example Request:

```shell
curl https://app.beyonic.com/api -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey('ab594c14986612f6167a975e1c369e71edab6900');
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'
```

All requests must use [https](http://en.wikipedia.org/wiki/HTTP_Secure).

The Beyonic API uses Token Based Authentication, and requires an API key for authentication. You can generate or change your API key by logging into your account. Keep your API key secret to maintain the integrity of your account.

You must supply your API key with all API requests using the “Authorization” header as shown in the examples. You should inculde your API key with all requests.

The API key in all the examples is a valid test key, so you can test the examples immediately.
