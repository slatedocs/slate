# Business Categories

## Fetch Business Categories

<span class="label label-info">Account Method</span>

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>');
$country = 'USA';
$results = $api->get('/v1/business-categories/' . $country);
print_r($results);
```

```shell
curl -X GET \
 -d 'api-key=<INSERT_API_KEY>' \
  https://tools.brightlocal.com/seo-tools/api/v1/business-categories/USA
```

```csharp
api request = new api("<INSERT_API_KEY>");
var results = request.Get("/seo-tools/api/v1/business-categories/USA");
```

> Success (200 OK)

```json
[
    {
        "id": 503,
        "name": "Advertising Agency"
    }
]
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
     "INVALID_COUNTRY": "Country is not supported"
  }
}
```

### HTTP Request

Get all business categories for certain country. [See here for a full list of supported countries.](#supported-countries)

`GET https://tools.brightlocal.com/seo-tools/api/v1/business-categories/<country>`
