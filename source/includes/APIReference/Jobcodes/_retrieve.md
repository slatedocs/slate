## Retrieve Jobcodes

 > **Example**: Retrieve a list of all active top-level jobcodes.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcodes"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcodes")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcodes',
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcodes');
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

url = URI("https://rest.tsheets.com/api/v1/jobcodes")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcodes"

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

  url := "https://rest.tsheets.com/api/v1/jobcodes"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of jobcodes with given ids

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcodes?ids=12%2C367%2C3489"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes?ids=12%2C367%2C3489");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcodes?ids=12%2C367%2C3489")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcodes',
  qs: { ids: '12,367,3489'
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcodes');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'ids' => '12,367,3489'
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

url = URI("https://rest.tsheets.com/api/v1/jobcodes?ids=12%2C367%2C3489")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcodes"

querystring = {
  "ids":"12,367,3489"
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

  url := "https://rest.tsheets.com/api/v1/jobcodes?ids=12%2C367%2C3489"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of jobcodes that have been modified since a particular date

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcodes?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcodes?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcodes',
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcodes');
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

url = URI("https://rest.tsheets.com/api/v1/jobcodes?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcodes"

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

  url := "https://rest.tsheets.com/api/v1/jobcodes?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(above examples will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
 "results": {
  "jobcodes": {
   "17288279": {
    "id": 17288279,
    "parent_id": 0,
    "assigned_to_all": false,
    "billable": false,
    "active": true,
    "type": "regular",
    "has_children": false,
    "billable_rate": 0,
    "short_code": "asm",
    "name": "Assembly Line",
    "last_modified": "2018-07-12T21:13:14+00:00",
    "created": "2018-05-28T20:18:17+00:00",
    "filtered_customfielditems": "",
    "required_customfields": [],    
    "locations": []
   },
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
    "last_modified": "2018-05-28T20:19:33+00:00",
    "created": "2018-05-28T20:19:33+00:00",
    "filtered_customfielditems": "",
    "required_customfields": [],     
    "locations": []
   }
  }
 },
 "more": false
}
```

 > **Example**: Retrieve a list of all jobcodes (active or deleted) with given parent jobcode id. Set pagination to 10 results/page. Locations related to parent jobcodes will be returned with the supplemental data.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcodes?parent_ids=235494&per_page=10&active=both"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes?parent_ids=235494&per_page=10&active=both");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcodes?parent_ids=235494&per_page=10&active=both")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcodes',
  qs: { parent_ids: '235494',
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcodes');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'parent_ids' => '235494',
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

url = URI("https://rest.tsheets.com/api/v1/jobcodes?parent_ids=235494&per_page=10&active=both")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcodes"

querystring = {
  "parent_ids":"235494",
  "per_page":"10",
  "active":"both"
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

  url := "https://rest.tsheets.com/api/v1/jobcodes?parent_ids=235494&per_page=10&active=both"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response

> <code class="level200">200 OK</code>

```json
{
 "results": {
  "jobcodes": {
   "17973881": {
    "id": 17973881,
    "parent_id": 17288281,
    "assigned_to_all": false,
    "billable": false,
    "active": true,
    "type": "regular",
    "has_children": false,
    "billable_rate": 0,
    "short_code": "mop",
    "name": "Mopping",
    "last_modified": "2018-07-12T21:13:46+00:00",
    "created": "2018-07-12T21:13:46+00:00",
    "locations": [63534554, 635389373]
   },
   "17973879": {
    "id": 17973879,
    "parent_id": 17288281,
    "assigned_to_all": false,
    "billable": false,
    "active": true,
    "type": "regular",
    "has_children": false,
    "billable_rate": 0,
    "short_code": "swp",
    "name": "Sweeping",
    "last_modified": "2018-07-12T21:13:38+00:00",
    "created": "2018-07-12T21:13:38+00:00",
    "locations": [635389373]
   }
  }
 },
 "more": false,
 "supplemental_data": {
  "jobcodes": {
   "17288281": {
    "id": 17288281,
    "parent_id": 0,
    "assigned_to_all": false,
    "billable": false,
    "active": true,
    "type": "regular",
    "has_children": true,
    "billable_rate": 0,
    "short_code": "jan",
    "name": "Janatorial Work",
    "last_modified": "2018-07-12T21:13:02+00:00",
    "created": "2018-05-28T20:18:38+00:00",
    "locations": [63538272]
   }
  },
  "locations": {
   "63534554": {
    "id": 63534554,
    "addr1": "5555 W Ridge Way",
    "addr2": "Suite 101",
    "city": "Boise",
    "state": "ID",
    "zip": 83702,
    "country": "US",
    "active": true,
    "latitude": 1.143,
    "longitude": -2.7346,
    "place_id": "ChIJrTLr-GyuEmsRBfy61i59si0",
    "label": "Home Office",
    "notes": "Key under the rug.",
    "last_modified": "2019-01-23T00:10:25+0000",
    "jobcodes": [17973881]
   },
   "635389373": {
    "id": 635389373,
    "addr1": "2544 E Summer Way",
    "addr2": "Suite 202",
    "city": "Boise",
    "state": "ID",
    "zip": 83703,
    "country": "US",
    "active": true,
    "latitude": 1.243,
    "longitude": -4.422,
    "place_id": "ChIJrTLr-GyuEmsRBfy61i584373",
    "label": "Work Office",
    "notes": "Use back door",
    "last_modified": "2019-01-23T00:10:25+0000",
    "jobcodes": [17973879]
   },
   "63538272": {
    "id": 63538272,
    "addr1": "1268 W River St",
    "addr2": "Suite 101",
    "city": "Boise",
    "state": "ID",
    "zip": 83702,
    "country": "US",
    "active": true,
    "latitude": 1.143,
    "longitude": -2.7346,
    "place_id": "ChIJrTLr-GyuEmsRBfy61i59si0",
    "label": "Home Office",
    "notes": "Key under the rug.",
    "last_modified": "2019-01-23T00:10:25+0000",
    "jobcodes": [17288281]
   }
  }
 }
}
```

Retrieves a list of all jobcodes associated with your company, with optional filters to narrow down the results. For a more efficient way of retrieving jobcodes assigned to a _specific user_, please see the [Jobcode Assignments](#the-jobcode-assignments-object) endpoint.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/jobcodes</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more jobcode ids you'd like to filter on. Only jobcodes with an id set to one of these values will be returned. If omitted, all jobcodes matching other specified filters are returned. |
| **parent_ids**<br/>optional | _Int_ | Default is _-1_ (meaning all jobcodes will be returned regardless of `parent_id`).<br/><br/>Comma separated list of one or more jobcode `parent_ids` you'd like to filter on. Only jobcodes with a `parent_id` set to one of these values will be returned. Additionally you can use _0_ to get only the top-level jobcodes. Then get the `id` of any results with `has_children`=_yes_ and feed that in as the value of `parent_ids` for your next request to get the 2nd level of jobcodes, and so on, to traverse an entire tree of jobcodes.<br/><br/>Use _-1_ to return all jobcodes regardless of `parent_id`. This is especially useful when combined with the `modified_since` filter. When `parent_ids` is _-1_, you'll have the jobcode records needed to trace each result back to it's top level parent in the `supplemental_data` section of the response. |
| **type**<br/>optional | _String_ | Indicates jobcode type. One of 'regular', 'pto', 'paid_break', 'unpaid_break', or 'all'.  Default is 'regular'. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. If a jobcode is active, it is available for selection during time entry. |
| **modified_before**<br/>optional | _String_ | Only jobcodes modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only jobcodes modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |
