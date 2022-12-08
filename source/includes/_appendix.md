# Appendix

## Supported Local Directories

We now have an API method (shown below) that enables you to retrieve a list of directories for all supported countries.

## Get list of supported local directories


<span class="label label-info">Account Method</span>

> Get list of supported local directories

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$responseForAll = $api->get('v1/directories/all');
print_r($responseForAll->getResult());

$country = 'USA';
$responseByCountry = $api->get('v1/directories/' . $country);
print_r($responseByCountry->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v1/directories/all?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response response = api.Get("v1/directories/all" );
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
		"success": true,
        "count": 375,
        "supported_countries": ["GBR","USA","IRL",...],
        "results": [
	       	{
		        "identifier": "google",
		        "countries": ["GBR","USA"],
		        "url":"google.com",
		        "urls":[
			        {"USA": "google.com"},
			        {"GBR": "google.uk"},...
		        ],
		        "supports_reviews": true
			},...	        
        ]
    
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/directories/all`

`GET https://tools.brightlocal.com/seo-tools/api/v1/directories/<country>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Local directories supported by Local Search Audit tool

### USA

| Directory | Identifier |
|-----------------------|-----------------|
| Brownbook | brownbook |
| Citysearch | citysearch |
| DexKnows | dexknows |
| Facebook | facebook |
| Factual | factual |
| FourSquare | foursquare |
| Google Local | google |
| HotFrog | hotfrog |
| InfoUSA/ExpressUpdate | expressupdate |
| Insider Pages | insiderpages |
| Kudzu | kudzu |
| Local.com | localcom |
| MapQuest | mapquest |
| Neustarlocaleze | neustarlocaleze |
| Super Pages | superpages |
| Yahoo! Local | yahoo |
| Yellow Bot | yellowbot |
| Yellow Pages | yellowpages |
| Yelp | yelp |


### Canada

| Directory | Identifier |
|--------------|---------------|
| 411 Canada | can411 |
| Brownbook | brownbook |
| Canpages | canpages |
| Facebook | facebook |
| Factual | factual |
| FourSquare | foursquare |
| Google Local | google |
| HotFrog | hotfrog |
| iBegin | ibegincan |
| PagesJunes | pagesjaunes |
| Yellow Pages | yellowpagesca |
| Yelp | yelp |


### United Kingdom

| Directory | Identifier |
|---------------|--------------|
| Brownbook | brownbook |
| Facebook | facebook |
| Factual | factual |
| FourSquare | foursquare |
| Google Local | google |
| HotFrog | hotfrog |
| Scoot | scoot |
| Thomson Local | thomsonlocal |
| Touch Local | touchlocal |
| Yahoo! Local | yahoo |
| Yell | yell |
| Yelp | yelp |


### Australia

| Directory | Identifier |
|-----------------------|---------------|
| AussieWeb | aussieweb |
| Brownbook | brownbook |
| dLook | dlook |
| Facebook | facebook |
| Factual | factual |
| FourSquare | foursquare |
| Google Local | google |
| HotFrog | hotfrog |
| Local.com.au | localcomau |
| StartLocal | startlocal |
| Super Pages Australia | superpagesaus |
| TrueLocal | truelocal |
| White Pages | whitepagesaus |
| Yelp | yelp |


## Business Category IDs

We no longer list the supported business categories here. We now have an [endpoint](#business-categories) which enables you to retrieve a list of categories by country.

## Supported Countries

The following countries and codes are supported by our system:

Country|Code
---|---
Australia|AUS
Canada|CAN
Germany|DEU
Hong Kong|HKG
Ireland|IRL
Macau|MAC
Netherlands|NLD
New Zealand|NZL
Philippines|PHL
Taiwan|TWN
United Kingdom|GBR
United States|USA
Singapore|SGP
South Africa|ZAF
