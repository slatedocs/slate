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

>If you are not using a client, Authenticated Requests should include these headers:

```http
POST /endpoint HTTP/1.1
X-Buttercoin-Access-Key: <YOUR_API_KEY>
X-Buttercoin-Signature: <HMAC_SIGNATURE> 
X-Buttercoin-Date: <CURRENT_TIMESTAMP>
```

> The client will automatically sign your requests with the proper headers.

The Buttercoin API provides one publicly accessible endpoint to get the current ticker price and another to view the current exchange order book. All other API calls require a valid API Access Key and secure authentication.

In order to make any secure requests, your account must be verified and enabled for API access. Once enabled, you will be able to create API keys and customize permissions to perform specific exchange operations.  You can create a new API key [here](https://api.buttercoin.com/#/api).  You must be logged in to your account to create a key.

<aside class="warning">
You must always keep your API Keys secure to make sure no one can access your account.  If you think a key might be compromised, simply revoke your API key [here](https://api.buttercoin.com/#/api).
</aside>

*If you are building our own client for the API...*
### Building an HMAC Signature with SHA-256

1. Concatenate the timestamp, request URL and parameters into a UTF-8 String:
2. Convert the message to Base64
3. Sign the message using HMAC with SHA-256 and your API Secret Key
4. Convert to Base64 once again

Encode a get request like this: 

`1403755197367http://api.buttercoin.com/v1/orders?status=filled&orderType=limit`

Encode a post request like this: 

`1403755197367http://api.buttercoin.com/v1/orders{"instrument":"BTC_USD","side":"buy","orderType":"limit","quantity":1,"price":600.01}`

Still not sure?  Find code examples [here](https://github.com/buttercoin/buttercoinsdk-node/blob/master/index.js#L32), [here](https://github.com/buttercoin/buttercoinsdk-php/blob/master/src/Client/ButtercoinClient.php#L144), and [here](https://github.com/buttercoin/buttercoinsdk-ruby/blob/master/lib/buttercoin/client.rb#L91)


