# Duplicate Requests

> Example Request:

```shell
curl https://app.beyonic.com/api -H "Duplicate-Check-Key: ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.duplicate_check_key = 'ab594c14986612f6167a975e1c369e71edab6900'
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setDuplicateCheckKey('ab594c14986612f6167a975e1c369e71edab6900');
?>
```

```python
import beyonic
beyonic.duplicate_check_key = 'ab594c14986612f6167a975e1c369e71edab6900'
```

Beyonic provides a way for you to make sure that duplicate requests do not result in multiple transactions. This allows you to safely retry a request if you're not sure that it worked the first time.

You do this by adding a "Duplicate-Check-Key" header to your request. The value of this header can be any string value of your choosing. If Beyonic finds a previous request with the same Duplicate-Check-Key, we will reject the new request with a DuplicateRequestException.