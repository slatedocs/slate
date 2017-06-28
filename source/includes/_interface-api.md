# Interface API

## Requesting System Info

The following resources give you access to system information

### Requesting Apps

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/apps' };

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
		"Group": "string",
		"Icon": "string",
		"NavigationUrl": "string"		
	  }
	]
}
```

Returns the apps that you can use

#### GET /api/v2/apps

Attribute | Description
--------- | -----------
Id | Application ID
Caption | Application name 
Group | Group that the app belongs to
Icon | Icon for the application
NavigationUrl | Navigation URL of application



### Requesting Reports

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

#### GET /api/v2/reports

Attribute | Description
--------- | -----------
Id | Report ID
Caption | Report name
NavigationUrl | URL to view report


### Requesting Dashboards

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/dashboards' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/dashboards");
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

Returns the dashboards that you can view

#### GET /api/v2/dashboards

Attribute | Description
--------- | -----------
Id | Dashboard ID
Caption | Dashboard name 
NavigationUrl | URL to view dashboard

### Requesting Locations

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/locations' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/locations");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"value": [
	  {
		"Id": "string",
		"Code": "string",
		"Name": "string",
		"Enabled": true,
		"Children": [
			{
				"Id": "string",
				"Code": "string",
				"Name": "string",
				"Enabled": true
			}
		]
	  }
	]
}
```

Returns the location hierarchy

#### GET /api/v2/locations

Attribute | Description
--------- | -----------
Id | Location ID
Code | Location code
Name | Location name
Enabled | Determines if the location can be accessed
Children | An array of child locations

### Requesting User Info

> Example Request

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://intelex_url/api/v2/users/me' };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/users/me");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
	"Login": "string",
	"FullName": "string"
}
```

Returns a user's details

#### GET /api/v2/users/me

Attribute | Description
--------- | -----------
Login | Username
FullName | User's full name

