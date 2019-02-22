## Retrieve Timesheets

 > **Example**: Retrieve a list of `on_the_cloc`k and not `on_the_clock` timesheets over a 10-day period.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets?start_date=2018-07-15&end_date=2018-07-25&on_the_clock=both"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-07-15&end_date=2018-07-25&on_the_clock=both");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-07-15&end_date=2018-07-25&on_the_clock=both")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
  qs: { start_date: '2018-07-15',
        end_date: '2018-07-25',
        on_the_clock: 'both'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'start_date' => '2018-07-15',
  'end_date' => '2018-07-25',
  'on_the_clock' => 'both'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-07-15&end_date=2018-07-25&on_the_clock=both")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

querystring = {
  "start_date":"2018-07-15",
  "end_date":"2018-07-25",
  "on_the_clock":"both"
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

  url := "https://rest.tsheets.com/api/v1/timesheets?start_date=2018-07-15&end_date=2018-07-25&on_the_clock=both"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of all timesheets within a certain date range which were recorded against a given jobcode id. Set pagination to 10 results/page.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets?start_date=2018-01-01&end_date=2018-01-31&on_the_clock=no&jobcode_ids=235494&per_page=10"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-01-01&end_date=2018-01-31&on_the_clock=no&jobcode_ids=235494&per_page=10");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-01-01&end_date=2018-01-31&on_the_clock=no&jobcode_ids=235494&per_page=10")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
  qs: { start_date: '2018-01-01',
        end_date: '2018-01-31',
        on_the_clock: 'no',
        jobcode_ids: '235494',
        per_page: '10'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'start_date' => '2018-01-01',
  'end_date' => '2018-01-31',
  'on_the_clock' => 'no',
  'jobcode_ids' => '235494',
  'per_page' => '10'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets?start_date=2018-01-01&end_date=2018-01-31&on_the_clock=no&jobcode_ids=235494&per_page=10")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

querystring = {
  "start_date":"2018-01-01",
  "end_date":"2018-01-31",
  "on_the_clock":"no",
  "jobcode_ids":"235494",
  "per_page":"10"
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

  url := "https://rest.tsheets.com/api/v1/timesheets?start_date=2018-01-01&end_date=2018-01-31&on_the_clock=no&jobcode_ids=235494&per_page=10"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of timesheets with given ids

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets?ids=12%2C367%2C348"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets?ids=12%2C367%2C348");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets?ids=12%2C367%2C348")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
  qs: { ids: '12,367,348'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'ids' => '12,367,348'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets?ids=12%2C367%2C348")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

querystring = {
  "ids":"12,367,348"
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

  url := "https://rest.tsheets.com/api/v1/timesheets?ids=12%2C367%2C348"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve page 3 of a list of timesheets linked to a specific user within a given time range.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets?page=3&user_ids=1123&start_date=2018-01-01&end_date=2018-02-01"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets?page=3&user_ids=1123&start_date=2018-01-01&end_date=2018-02-01");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets?page=3&user_ids=1123&start_date=2018-01-01&end_date=2018-02-01")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
  qs: { page: '3',
        user_ids: '1123',
        start_date: '2018-01-01',
        end_date: '2018-02-01'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'page' => '3',
  'user_ids' => '1123',
  'start_date' => '2018-01-01',
  'end_date' => '2018-02-01'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets?page=3&user_ids=1123&start_date=2018-01-01&end_date=2018-02-01")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

querystring = {
  "page":"3",
  "user_ids":"1123",
  "start_date":"2018-01-01",
  "end_date":"2018-02-01"
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

  url := "https://rest.tsheets.com/api/v1/timesheets?page=3&user_ids=1123&start_date=2018-01-01&end_date=2018-02-01"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of timesheets that have been modified since a given date

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
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

url = URI("https://rest.tsheets.com/api/v1/timesheets?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

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

  url := "https://rest.tsheets.com/api/v1/timesheets?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"

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
    "timesheets": {
      "135288482": {
        "id": 135288482,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-16T09:04:00-06:00",
        "end": "2018-07-16T15:57:00-06:00",
        "duration": 24780,
        "date": "2018-07-16",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock": false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135288514": {
        "id": 135288514,
        "user_id": 1242509,
        "jobcode_id": 18080900,
        "start": "2018-07-16T13:07:00-06:00",
        "end": "2018-07-16T17:29:00-06:00",
        "duration": 15720,
        "date": "2018-07-16",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135288460": {
        "id": 135288460,
        "user_id": 1242509,
        "jobcode_id": 18080900,
        "start": "2018-07-18T08:09:00-06:00",
        "end": "2018-07-18T14:58:00-06:00",
        "duration": 24540,
        "date": "2018-07-18",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135288162": {
        "id": 135288162,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-19T12:06:00-06:00",
        "end": "2018-07-19T14:59:00-06:00",
        "duration": 10380,
        "date": "2018-07-19",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135288102": {
        "id": 135288102,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-22T13:05:00-06:00",
        "end": "2018-07-22T18:07:00-06:00",
        "duration": 18120,
        "date": "2018-07-22",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135522568": {
        "id": 135522568,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-23T08:00:00-06:00",
        "end": "2018-07-23T12:19:12-06:00",
        "duration": 15552,
        "date": "2018-07-23",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "This is a test of a manual time entry",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135366264": {
        "id": 135366264,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-23T08:00:00-06:00",
        "end": "2018-07-23T12:19:12-06:00",
        "duration": 15552,
        "date": "2018-07-23",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "This is a test of a manual time entry",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135288084": {
        "id": 135288084,
        "user_id": 1242509,
        "jobcode_id": 18080900,
        "start": "2018-07-23T09:07:00-06:00",
        "end": "2018-07-23T15:02:00-06:00",
        "duration": 21300,
        "date": "2018-07-23",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135366260": {
        "id": 135366260,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-23T11:00:00-06:00",
        "end": "2018-07-23T14:10:23-06:00",
        "duration": 11423,
        "date": "2018-07-23",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "This is a test of the emergency broadcast system",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "135366262": {
        "id": 135366262,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-25T10:30:00-06:00",
        "end": "2018-07-25T14:10:23-06:00",
        "duration": 13223,
        "date": "2018-07-25",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock",
        false,
        "locked": 0,
        "notes": "This is a test",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "jobcodes": {
      "17288283": {
        "id": 17288283,
        "parent_id": 0,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "dev",
        "name": "Development Team",
        "last_modified": "2018-07-24T19:05:53+00:00",
        "created": "2018-05-28T20:19:33+00:00"
      },
      "18080900": {
        "id": 18080900,
        "parent_id": 17288279,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Customer10",
        "last_modified": "2018-07-23T22:31:28+00:00",
        "created": "2018-07-23T22:31:28+00:00"
      },
      "17288279": {
        "id": 17288279,
        "parent_id": 0,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": true,
        "billable_rate": 0,
        "short_code": "asm",
        "name": "Assembly Line",
        "last_modified": "2018-07-24T19:05:46+00:00",
        "created": "2018-05-28T20:18:17+00:00"
      }
    },
    "users": {
      "1242515": {
        "id": 1242515,
        "first_name": "Alexander",
        "last_name": "Luzzana",
        "group_id": 144959,
        "active": true,
        "employee_number": 4,
        "salaried": true,
        "exempt": false,
        "username": "aluzzana",
        "email": "garrett@tsheets.com",
        "payroll_id": "4",
        "hire_date": "2012-07-01",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:52:00+00:00",
        "last_active": "2018-07-30T20:06:13+00:00",
        "created": "2018-05-28T20:23:44+00:00",
        "mobile_number": ""
      },
      "1242509": {
        "id": 1242509,
        "first_name": "Courtney",
        "last_name": "Ballenger",
        "group_id": 144961,
        "active": true,
        "employee_number": 1,
        "salaried": false,
        "exempt": false,
        "username": "cballenger",
        "email": "garrett@tsheets.com",
        "payroll_id": "1",
        "hire_date": "2018-05-28",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:52:36+00:00",
        "last_active": "2018-07-25T17:13:06+00:00",
        "created": "2018-05-28T20:14:53+00:00",
        "mobile_number": ""
      }
    },
    "customfields": {
      "19142": {
        "id": 19142,
        "required": false,
        "type": "timesheet",
        "ui_preference": "managed-list",
        "short_code": "cf1",
        "regex_filter": "",
        "name": "Custom Field 1",
        "last_modified": "2018-07-26T18:58:23+00:00",
        "created": "2018-07-23T23:09:14+00:00"
      },
      "19144": {
        "id": 19144,
        "required": false,
        "type": "timesheet",
        "ui_preference": "managed-list",
        "short_code": "cf2",
        "regex_filter": "",
        "name": "Custom Field 2",
        "last_modified": "2018-07-26T18:58:32+00:00",
        "created": "2018-07-23T23:09:32+00:00"
      }
    },
    "files": {
      "50692": {
        "id": 50692,
        "uploaded_by_user_id": 1242515,
        "file_name": "minion.jpg",
        "active": true,
        "size": 54839,
        "last_modified": "2018-08-23T19:12:18+00:00",
        "created": "2018-08-23T19:12:18+00:00",
        "linked_objects": {
          "timesheets": [
            "135288482",
            "135288514",
            "135288460",
            "135288102",
            "135522568",
            "135288084",
            "135366262",
          ]
        },
        "meta_data": {
          "file_description": "selfie"
        }
      },
      "44878": {
        "id": 44878,
        "uploaded_by_user_id": 1242515,
        "file_name": "minion.jpg",
        "active": true,
        "size": 14336,
        "last_modified": "2018-08-24T00:09:32+00:00",
        "created": "2018-08-24T00:09:32+00:00",
        "linked_objects": {
          "timesheets": [
            "135288482",
            "135288514",
            "135288460",
            "135288102",
            "135522568",
            "135288084",
            "135366262",
          ]
        },
        "meta_data": {
          "file_description": "image file"
        }
      }
    }
  }
}
```

Retrieves a list of all timesheets associated with your company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/timesheets</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>required (unless `modified_before`, `modified_since`, or `start_date` are set) | _Int_ | Comma separated list of one or more timesheet ids you'd like to filter on. Only timesheets with an id set to one of these values will be returned. If omitted, all timesheets matching other specified filters are returned. |
| **start_date**<br/>required (unless `modified_before`, `modified_since`, or `ids` is set) | _String_ | `YYYY-MM-DD` formatted date. Any timesheets with a date falling on or after this date will be returned. |
| **end_date**<br/>optional | _String_ | `YYYY-MM-DD` formatted date. Any timesheets with a date falling on or before this date will be returned. |
| **jobcode_ids**<br/>optional | _Int_ | A comma-separated string of jobcode ids. Only time recorded against these jobcodes or one of their children will be returned. |
| **payroll_ids**<br/>optional | _Int_ | A comma-separated string of payroll ids. Only time recorded against users with these payroll ids will be returned. |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only timesheets linked to these users will be returned. |
| **group_ids**<br/>optional | _Int_ | A comma-separated list of group ids. Only timesheets linked to users from these groups will be returned. |
| **on_the_clock**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'no'. If a timesheet is on_the_clock, it means the user is currently working (has not clocked out yet). |
| **jobcode_type**<br/>optional | _String_ | 'regular', 'pto', 'paid_break', 'unpaid_break', or 'all'. Default is 'all'. Only timesheets linked to a jobcode of the given type are returned. |
| **modified_before**<br/>required (unless `modified_since`, `ids`, or `start_date` are set) | _String_ | Only timesheets modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>required (unless `modified_before`, `ids`, or `start_date` are set) | _String_ | Only timesheets modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

