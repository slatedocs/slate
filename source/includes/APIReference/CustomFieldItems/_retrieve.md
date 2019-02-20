## Retrieve Custom Field Items

> **Examples**

> Retrieve a list of all active customfielditems belonging to the given customfield

```shell
curl "https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  qs: { customfield_id: '143369' },
  headers: 
   { Authorization: 'Bearer <TOKEN>' } };

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
  'Authorization' => 'Bearer <TOKEN>'
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
    'Authorization': "Bearer <TOKEN>"
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

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&per_page=10&active=both")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
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
   { Authorization: 'Bearer <TOKEN>' } };

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
  'Authorization' => 'Bearer <TOKEN>'
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
    'Authorization': "Bearer <TOKEN>"
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

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&ids=3875655,3875657")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
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
   { Authorization: 'Bearer <TOKEN>' } };

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
  'Authorization' => 'Bearer <TOKEN>'
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
    'Authorization': "Bearer <TOKEN>"
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

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems?customfield_id=143369&modified_since=2019-02-11T12%3A00%3A00%2B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
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
   { Authorization: 'Bearer <TOKEN>' } };

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
  'Authorization' => 'Bearer <TOKEN>'
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
    'Authorization': "Bearer <TOKEN>"
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

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/customfielditems</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **customfield_id**<br/>required | _Int_ | Id of the custom field whose items you'd like to list. |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more customfielditem ids you'd like to filter on. Only customfielditems with an `id` set to one of these values will be returned. If omitted, all customfielditems matching other specified filters are returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. If a customfielditem is active, it is available for selection during time entry. |
| **modified_before**<br/>optional | _String_ | Only customfielditems modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only customfielditems modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

