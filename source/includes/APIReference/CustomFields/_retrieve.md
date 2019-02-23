## Retrieve Custom Fields

 > **Example**: Retrieve a list of all customfields.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/customfields"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
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
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

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

url = URI("https://rest.tsheets.com/api/v1/customfields")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

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

  url := "https://rest.tsheets.com/api/v1/customfields"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**:Retrieve a list of customfields with a given id.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/customfields?ids=195923"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields?ids=195923");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields?ids=195923")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
  qs: { ids: '195923'
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
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'ids' => '195923'
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

url = URI("https://rest.tsheets.com/api/v1/customfields?ids=195923")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

querystring = {
  "ids":"195923"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers, params=querystring)

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

  url := "https://rest.tsheets.com/api/v1/customfields?ids=195923"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of customfields that have been modified since a given date

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/customfields?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
  qs: { modified_since: '2018-01-01T00:00:00%2B00:00'
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
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2018-01-01T00:00:00%2B00:00'
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

url = URI("https://rest.tsheets.com/api/v1/customfields?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

querystring = {
  "modified_since":"2018-01-01T00:00:00%2B00:00"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers, params=querystring)

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

  url := "https://rest.tsheets.com/api/v1/customfields?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(all examples will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "customfields": {
      "195923": {
        "id": 195923,
        "active": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "e",
        "regex_filter": "",
        "name": "Equipment",
        "last_modified": "2018-04-04T15:37:30+00:00",
        "created": "2018-03-27T16:13:35+00:00",
        "ui_preference": "drop_down",
        "required_customfields": [

        ]
      },
      "195921": {
        "id": 195921,
        "active": true,
        "required": false,
        "applies_to": "timesheet",
        "type": "free-form",
        "short_code": "m",
        "regex_filter": "",
        "name": "Mood",
        "last_modified": "2018-03-27T16:13:35+00:00",
        "created": "2018-03-27T16:13:35+00:00",
        "ui_preference": "text_box_with_suggest",
        "required_customfields": [

        ]
      },
      "195919": {
        "id": 195919,
        "active": true,
        "required": false,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "w",
        "regex_filter": "",
        "name": "Work Type",
        "last_modified": "2018-03-27T16:13:35+00:00",
        "created": "2018-03-27T16:13:35+00:00",
        "ui_preference": "drop_down",
        "required_customfields": [

        ]
      }
    }
  },
  "more": false
}
```



Retrieves a list of all customfields associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/customfields</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more customfield ids you'd like to filter on. Only customfields with an id set to one of these values will be returned. If omitted, all customfields matching other specified filters are returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **applies_to**<br/>optional | _String_ | 'timesheet', 'user', 'jobcode', or 'all'. Default is 'timesheet'. |
| **value_type**<br/>optional | _String_ | 'managed-list', 'free-form', or 'both'. Default is 'both'. |
| **modified_before**<br/>optional | _String_ | Only customfields modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only customfields modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

