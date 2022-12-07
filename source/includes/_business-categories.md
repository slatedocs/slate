# Business Categories

## Fetch Business Categories

<span class="label label-info">Account Method</span>

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$country = 'USA';
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v1/business-categories/' . $country);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v1/business-categories/USA?api-key=<INSERT_API_KEY>'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
string country = "USA";
Response response = api.Get("/v1/business-categories/" + country);
Console.WriteLine(response.GetContent());
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
