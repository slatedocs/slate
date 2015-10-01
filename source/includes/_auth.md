# Authentication
> To authorize, use this code:

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


For every request to our API you have to provide authorization. The token gets issued by our team and you need to provide it as X-Auth-Token header for every request.

