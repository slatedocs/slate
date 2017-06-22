# Package API

## Installing Packages

The following resources allow you to install and import Intelex PIE Packages

### Install a Package

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/packages/install' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/apps");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"Id": "string",
		"Caption": "string",
		"NavigationUrl": "string",
		"Icon": "string",
		"Group": "string"
	  }
	]
}
```

Returns the apps that you can use

#### POST /api/v2/packages/install

Attribute | Description
--------- | -----------
Id | Application ID
Caption | Application name 
NavigationUrl | Navigation URL of application
Icon | Icon for the application
Group | Group that the app belongs to

### Import a Package

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/reports' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/reports");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"Id": "string",
		"Caption": "string",
		"NavigationUrl": "string"
	  }
	]
}
```

Returns the reports that you can view

#### GET /api/v2/packages/import

Attribute | Description
--------- | -----------
Id | Report ID
Caption | Report name
NavigationUrl | URL to view report

