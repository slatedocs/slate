# Authentication
All requests to our API require valid authorization. The  authentication token
can be built with the _client ID_ and _client secret_, which will be issued 
by our team. The token has the following format: `client_id:client_secret`, it 
needs to be sent as value for the _X-Auth-Token_ header.  
The client id and secret are account specific, so you can only access projects,
sites and other resources which lie under your account.

```php
<?php
$Client = new Productsup\Client();
$Client->id = 1234;
$Client->secret = 'simsalabim';
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "X-Auth-Token: 1234:simsalabim"
```

> Make sure to replace `1234` and `simsalabim` with the client id and secret you got provided.

