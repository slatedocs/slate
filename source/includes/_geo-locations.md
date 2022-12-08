# Geo Locations

## Bing

<span class="label label-info">Account Method</span>

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v1/geo-locations/bing', [
    'country'  => 'USA',
    'location' => '12555'
]);
var_dump($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v1/geo-locations/bing?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&country=USA&location=12555'
```

```csharp
Api api = new Api("<YOUR_API_KEY>", "<YOUR_API_SECRET>");
var results = api.get("v1/geo-locations/bing");
```

> Success (200 OK)

```json
```

> Validation Failure (400 Bad Request)

```json
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/geo-locations/bing`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
country | <span class="label label-required">Required</span> One of USA, GBR, CAN or AUS.
location | <span class="label label-required">Required</span> Like "new york".

## Google

<span class="label label-info">Account Method</span>

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v1/geo-locations/google', [
    'location' => "12555"
]);
var_dump($response->getResult());

```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v1/geo-locations/google?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&location=12555'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
var results = api.get("v1/geo-locations/google");
```

> Success (200 OK)

```json

```

> Validation Failure (400 Bad Request)

```json

```
### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/geo-locations/google`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
country | <span class="label label-required">Required</span> One of USA, GBR, CAN or AUS.
location | <span class="label label-required">Required</span> Like "new york".
