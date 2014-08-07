# Authentication

> To initialize the client, use this code:

```ruby
require 'buttercoin'

client = Buttercoin::Client.new(
    :public_key => '<public_key>',
    :secret_key => '<secret_key>',
    :mode => '<mode>'
)				
```

```python
from buttercoin.client import ButtercoinClient

client = ButtercoinClient(
    public_key='<public_key>',
    secret_key='<secret_key>',
    mode='<mode>'
)
```

```javascript
var buttercoin = require('buttercoinsdk-node')
var client = buttercoin(
    '<api_key>',
    '<api_secret>',
    '<environment>',
    '<version>'
);
```

```php
<?php
require 'vendor/autoload.php';
use Buttercoin\Client\ButtercoinClient;

$client = ButtercoinClient::factory([
    'publicKey' => '<public_key>',
    'secretKey' => '<secret_key>',
    'environment' => '<environment>' 
]);
?>
```

> The client will automatically sign your requests with the proper headers.

The Buttercoin API provides one publicly accessible endpoint to get the current ticker price and another to view the current exchange order book. All other API calls require a valid API Access Key and secure authentication.

In order to make any secure requests, your account must be verified and enabled for API access. Once enabled, you will be able to create API keys and customize permissions to perform specific exchange operations.  You can create a new API key [here](https://api.buttercoin.com/#/api).  You must be logged in to your account to create a key.

<aside class="warning">
You must always keep your API Keys secure to make sure no one can access your account.  If you think a key might be compromised, simply revoke your API key [here](https://api.buttercoin.com/#/api).
</aside>
