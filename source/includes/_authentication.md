# Authentication

> Example Request:

```shell
curl http://app.beyonic.com/api -H "Authorization: Token my-api-key"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey('my-api-key');
?>
```

```python
import beyonic
beyonic.api_key = 'my-api-key'
```

All requests must use [https](http://en.wikipedia.org/wiki/HTTP_Secure).

The Beyonic API uses Token Based Authentication, and requires an API key for authentication. You can generate or change your API key by logging into your account. Keep your API key secret to maintain the integrity of your account.

You must supply your API key with all API requests using the “Authorization” header as shown in the examples. You should inculde your API key with all requests.