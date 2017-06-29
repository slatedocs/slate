# Package API

## Installing Packages

The following resources allow you to install and import Intelex packages

### Install a Package

> Example Request

```javascript
var fs = require("fs");
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/packages/install',
  headers: { 'content-type': 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' },
  formData: 
   { '': 
      { value: 'fs.createReadStream("C:\\Package.ipack")',
        options: 
         { filename: 'C:\\Package.ipack',
           contentType: null } } } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/packages/install");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW");
request.AddParameter("multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW", "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"\"; filename=\"C:\\Package.ipack\"\r\nContent-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document\r\n\r\n\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
    "PackageId": "string",
    "Name": "string",
    "Description": "string",
    "PackageVersion": "string",
    "BuildDate": "2017-06-26T10:09:37.19",
    "DateInstalled": "2017-06-29T08:56:37.077",
    "PlatformVersion": "string",
    "Status": "string"
}
```

Installs an Intelex package. This request will only accept one of two body parameters. If you want to install and package that already has been imported, then provide the PackageId in your request. If you want to import and install a package, then provide the package file as multipart/formdata.  Do not provide both parameters.

#### POST /api/v2/packages/install

##### Body Parameters

Parameter | Description
--------- | --------- 
PackageId | The ID of an existing package that has been imported
multipart/formData (file) | The Intelex ipack file you want to install


### Import a Package

> Example Request

```javascript
var fs = require("fs");
var request = require("request");

var options = { method: 'POST',
  url: 'https://intelex_url/api/v2/packages/import',
  headers: { 'content-type': 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' },
  formData: 
   { '': 
      { value: 'fs.createReadStream("C:\\Package.ipack")',
        options: 
         { filename: 'C:\\Package.ipack',
           contentType: null } } } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```csharp
var client = new RestClient("https://intelex_url/api/v2/packages/import");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW");
request.AddParameter("multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW", "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"\"; filename=\"C:\\Package.ipack\"\r\nContent-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document\r\n\r\n\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

> Example Response

```json
{
    "PackageId": "string",
    "Name": "string",
    "Description": "string",
    "PackageVersion": "string",
    "BuildDate": "2017-06-26T10:09:37.19",
    "DateInstalled": "2017-06-29T08:56:37.077",
    "PlatformVersion": "string",
    "Status": "string"
}
```

Imports an Intelex package

#### POST /api/v2/packages/import

##### Body Parameters

Parameter | Description
--------- | --------- 
multipart/formData (file) | The Intelex ipack file you want to import