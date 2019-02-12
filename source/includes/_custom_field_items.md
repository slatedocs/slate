# Custom Field Items

A Custom Field Item represents an allowable value for a Custom Field Object of _managed-list_ type.  Each item represents a single drop-down choice displayed to the user in the web UI.  The API provides methods to Create, Read, and Update custom field items.  Set the `active` property _false_ to archive (i.e. soft delete) a custom field item.

## The Custom Field Item Object

> **Example**: Custom Field Object

```json
{
  "id": 3875655,
  "customfield_id": 143369,
  "active": true,
  "short_code": "JS",
  "name": "Jungle Safari",
  "last_modified": "2019-02-11T17:42:45+00:00",
  "required_customfields": []
}
```

Name | Access | Type | Format | Description
---- | ------ | ---- | ------ | -----------
`id` | R/O | _Int_ | | Unique identifier of customfielditem
`customfield_id` | R/O | _Int_ | | Id for the customfield that this item belongs to
`name` | R/W | _String_ | | Name of the customfielditem.
`short_code` | R/W | _String_ | | This is a short alias that is associated with the customfielditem. It may only consist of letters and numbers.
`active` | R/W | _Boolean_ | | If false, the custom field item is considered archived
`last_modified` |R/O | _DateTime_ | ISO8601 | Date/time when last modified
`created` | R/O | _DateTime_ | ISO8601 | Date/time when created 
`required_customfields` | R/W | _Int Array_ | | Ids of customfields that should be displayed when this customfielditem is selected on a timecard.

<aside class="notice">
Custom Field Item <code>short_code</code> values must be unique.
</aside>

## Retrieve Custom Field Items

> **Examples**

> Retrieve a list of all active customfielditems belonging to the given customfield

```shell
curl "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  qs: { customfield_id: '143369' },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'customfield_id' => '143369'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
));

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

querystring = {"customfield_id":"143369"}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```
> Retrieve a list of all customfielditems (active or deleted) belonging to the given customfield, and set pagination to 10 results/page.

```shell
curl "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  qs: { customfield_id: '143369',
        per_page: '10',
        active: 'both'
  },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'customfield_id' => '143369',
  'per_page' => '10',
  'active' => 'both'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
));

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

querystring = {
  "customfield_id":"143369",
  "per_page":"10",
  "active":"both"
}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of customfielditems belonging to the given customfield and having given ids

```shell
curl "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  qs: { customfield_id: '143369',
        ids: '3875655,3875657'
  },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'customfield_id' => '143369',
  'ids' => '3875655,3875657'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
));

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

querystring = {
  "customfield_id":"143369",
  "ids":"3875655,3875657"
}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of customfielditems belonging to a given customfield that have been modified since a particular date

```shell
curl "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  qs: { customfield_id: '143369',
        modified_since: '2019-02-11T12:00:00+00:00'
  },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'customfield_id' => '143369',
  'modified_since' => '2019-02-11T12:00:00+00:00'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
));

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

querystring = {
  "customfield_id":"143369",
  "modified_since":"2019-02-11T12:00:00+00:00"
}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> The above examples return JSON with the following structure:

```json
{
  "results": {
    "customfielditems": {
      "3875653": {
        "id": 3875653,
        "customfield_id": 143369,
        "active": true,
        "short_code": "DA",
        "name": "DeepSea Adventure",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "required_customfields": []
      },
      "3875655": {
        "id": 3875655,
        "customfield_id": 143369,
        "active": true,
        "short_code": "JS",
        "name": "Jungle Safari",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "required_customfields": []
      },
      "3875657": {
        "id": 3875657,
        "customfield_id": 143369,
        "active": true,
        "short_code": "SE",
        "name": "Space Explorer",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "required_customfields": []
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "customfields": {
      "143369": {
        "id": 143369,
        "active": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "UNI",
        "regex_filter": "",
        "name": "Uniform",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "created": "2019-02-11T17:42:45+00:00",
        "ui_preference": "drop_down",
        "required_customfields": []
      }
    }
  }
}
```
Retrieves a list of all customfielditems associated with a customfield, with optional filters to narrow down the results.

### HTTP Request

`GET https://rest.tsheets.com/api/v1/customfielditems`

### Query Parameters

 * The `customfield_id` parameter is **_required_**.
 * All other parameters are **_optional_**.
 * Results are unfiltered with respect to any parameters not provided.

Parameter | Type | Format | Default | Description
--------- | ---- | ------- | ------ | -----------
`customfield_id` | _Int_ | | N/A | Id of the custom field whose items you'd like to list.
`ids` | _String_ | comma-separated | null | List of customfielditem ids to include.
`active` | _String Enum_ | 'yes', 'no' or 'both' | 'yes' | Include only customfielditems with given status.
`modified_before` | _DateTime_ | ISO8601 | null | Include only customfielditems modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | null | Include only customfielditems modified since this date/time.
`supplemental_data` |  _String Enum_ | 'yes' or 'no'| 'yes' | Indicates whether supplemental data should be returned.
`per_page` | _Int_ | 1 - 50 | 50 | The number of results to retrieve per request.
`page` | _Int_ | >= 1 | 1 | The page of results to retrieve.

## Create Custom Field Items

> **Example**

> Create two new customfielditems. One succeeds and the other fails because of a duplicate `short_code` on an existing customfielditem

> Request Body

```json
{
 "data":
  [
    {
     "name":"Bavarian Villager",
     "customfield_id":"143369",
     "short_code":"bv"
    },
    {
     "name":"Racecar Driver",
     "customfield_id":"143369",
     "short_code":"bv"
    }
  ]
}
```

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/customfielditems \
  -H 'Authorization: Bearer <INSERT TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<INSERT REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
request.AddParameter("undefined", "<INSERT REQUEST BODY>",	ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<INSERT REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems")
  .post(body)
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  headers: 
   { 'Content-Type': 'application/json',
     Authorization: 'Bearer <INSERT TOKEN>' },
  body: '<INSERT REQUEST BODY>',
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <INSERT TOKEN>
));

$request->setBody('<INSERT REQUEST BODY>');

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<INSERT REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

payload = "<INSERT REQUEST BODY>"
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
    'Content-Type': "application/json"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
	"fmt"
	"strings"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://rest.tsheets.com/api/v1/customfielditems"

	payload := strings.NewReader("<INSERT REQUEST BODY>")

	req, _ := http.NewRequest("POST", url, payload)

	req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")
	req.Header.Add("Content-Type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
```

> The above example returns JSON with the following structure:

```json
{
  "results": {
    "customfielditems": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 3890433,
        "customfield_id": 143369,
        "active": true,
        "short_code": "bv",
        "name": "Bavarian Villager",
        "last_modified": "2019-02-11T23:17:47+00:00",
        "required_customfields": []
      },
      "2": {
        "_status_code": 417,
        "_status_message": "Expectation Failed",
        "_status_extra": "The name or short code conflicts with another item named \"Bavarian Villager\". Try choosing another name/short code or deleting the other conflicting item first",
        "name": "Racecar Driver"
      }
    }
  },
  "supplemental_data": {
    "customfields": {
      "143369": {
        "id": 143369,
        "active": true,
        "global": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "UNI",
        "regex_filter": "",
        "name": "Uniform",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "created": "2019-02-11T17:42:45+00:00",
        "ui_preference": "drop_down",
        "required_customfields": []
      }
    }
  }
}
```

Add one or more customfielditems to a customfield.

### HTTP Request

`POST https://rest.tsheets.com/api/v1/customfielditems`

### HTTP Request Body

The batch of customfielditems is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`name` | _String_ | Name of the customfielditem.
`customfield_id` | _Int_ | The id of the customfield to which this item should be added.

### Optional Properties

For a full list of the properties that may be set on a customfielditem, see [The Custom Field Item Object](#the-custom-field-item-object).

<aside class="notice">
The maximum batch size is <i>50</i> items. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>

## Update Custom Field Items

> **Examples**

> Change some information for each of these customfielditems

> Request Body

```json
{
 "data":
  [
    {
     "id":"3875653",
     "customfield_id":"143369",
     "short_code":"dsa"
    },
    {
     "id":"3890433",
     "customfield_id":"143369",
     "active":"false"
    }
  ]
}
```

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/customfielditems \
  -H 'Authorization: Bearer <INSERT TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<INSERT REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems");
var request = new RestRequest(Method.PUT);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
request.AddParameter("undefined", "<INSERT REQUEST BODY>",	ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<INSERT REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems")
  .put(body)
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  headers: 
   { 'Content-Type': 'application/json',
     Authorization: 'Bearer <INSERT TOKEN>' },
  body: '<INSERT REQUEST BODY>',
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_PUT);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <INSERT TOKEN>
));

$request->setBody('<INSERT REQUEST BODY>');

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/customfielditems")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<INSERT REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

payload = "<INSERT REQUEST BODY>"
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
    'Content-Type': "application/json"
    }

response = requests.request("PUT", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
	"fmt"
	"strings"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://rest.tsheets.com/api/v1/customfielditems"

	payload := strings.NewReader("<INSERT REQUEST BODY>")

	req, _ := http.NewRequest("PUT", url, payload)

	req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")
	req.Header.Add("Content-Type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
```

> The above example returns JSON with the following structure:

```json
{
  "results": {
    "customfielditems": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 3875653,
        "customfield_id": 143369,
        "active": true,
        "short_code": "dsa",
        "name": "DeepSea Adventure",
        "last_modified": "2019-02-12T00:28:14+00:00",
        "required_customfields": []
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 3890433,
        "customfield_id": 143369,
        "active": false,
        "short_code": "bv",
        "name": "Bavarian Villager",
        "last_modified": "2019-02-12T00:28:58+00:00",
        "required_customfields": []
      }
    }
  },
  "supplemental_data": {
    "customfields": {
      "143369": {
        "id": 143369,
        "active": true,
        "global": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "UNI",
        "regex_filter": "",
        "name": "Uniform",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "created": "2019-02-11T17:42:45+00:00",
        "ui_preference": "drop_down",
        "required_customfields": []
      }
    }
  }
}
```

Update one or more customfielditems for a customfield.

### HTTP Request

`PUT https://rest.tsheets.com/api/v1/customfielditems`

### HTTP Request Body

The batch of customfielditems is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`id` | _Integer_ | Unique identifier of the customfielditem.

### Optional Properties

For a full list of the properties that may be set on a customfielditem, see [The Custom Field Item Object](#the-custom-field-item-object).  All other properties defined on a Custom Field Item object may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

<aside class="notice">
The maximum batch size is <i>50</i> items. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>