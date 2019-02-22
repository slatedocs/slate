## Retrieve Locations

 > **Example**: Retrieve a list of all active locations.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations');
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

url = URI("https://rest.tsheets.com/api/v1/locations")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations"

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

  url := "https://rest.tsheets.com/api/v1/locations"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of all locations (active or deleted) with geocoding_status of 'complete'. Set pagination to 10 results/page.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations?geocoding_status=complete&per_page=10&active=both"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations?geocoding_status=complete&per_page=10&active=both");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations?geocoding_status=complete&per_page=10&active=both")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations',
  qs: { geocoding_status: 'complete',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'geocoding_status' => 'complete',
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

url = URI("https://rest.tsheets.com/api/v1/locations?geocoding_status=complete&per_page=10&active=both")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations"

querystring = {
  "geocoding_status":"complete",
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

  url := "https://rest.tsheets.com/api/v1/locations?geocoding_status=complete&per_page=10&active=both"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of locations with given ids

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations?ids=12%2C367%2C3489"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations?ids=12%2C367%2C3489");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations?ids=12%2C367%2C3489")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations');
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

url = URI("https://rest.tsheets.com/api/v1/locations?ids=12%2C367%2C3489")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations"

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

  url := "https://rest.tsheets.com/api/v1/locations?ids=12%2C367%2C3489"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of locations that have been modified since a given date

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations');
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

url = URI("https://rest.tsheets.com/api/v1/locations?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations"

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

  url := "https://rest.tsheets.com/api/v1/locations?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"

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
    "locations": {
      "65305": {
        "id": 65305,
        "addr1": "235 E Colchester Dr",
        "addr2": "101",
        "city": "Eagle",
        "state": "ID",
        "zip": "83616",
        "country": "US",
        "formatted_address": "235 E Colchester Dr 101, Eagle, ID 83616",
        "active": true,
        "latitude": 43.6700273,
        "longitude": -116.3520972,
        "place_id": "",
        "place_id_hash": "0ba5eaf96c5f63c3b76d5084c365b6e4",
        "label": "TSheets, East Colchester Drive, Eagle, ID, USA",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2018-03-09T18:26:57+00:00",
        "last_modified": "2018-03-15T16:51:14+00:00",
        "linked_objects": {
          "jobcodes": [
            2589531
          ]
        },
        "geofence_config_id": null
      },
      "78135": {
        "id": 78135,
        "addr1": "Hollywood Blvd",
        "addr2": "",
        "city": "Los Angeles",
        "state": "CA",
        "zip": "",
        "country": "US",
        "formatted_address": "Hollywood Blvd, Los Angeles, CA",
        "active": true,
        "latitude": 34.1015885,
        "longitude": -118.3336436,
        "place_id": "",
        "place_id_hash": "8c43103323bb0b1ce7c4094029029914",
        "label": "Hollywood Boulevard, Los Angeles, CA, USA",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2018-03-19T22:52:04+00:00",
        "last_modified": "2018-04-19T16:29:14+00:00",
        "linked_objects": {},
        "geofence_config_id": 1393
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "jobcodes": {
      "2589531": {
        "id": 2589531,
        "active": true,
        "parent_id": 0,
        "assigned_to_all": false,
        "type": "regular",
        "billable": false,
        "billable_rate": 5,
        "short_code": "",
        "name": "Technology",
        "created": "2018-03-15T15:50:50+0000",
        "last_modified": "2018-03-15T23:09:27+0000",
        "has_children": false,
        "required_customfields": [],
        "filtered_customfielditems": "",
        "locations": [
          65305
        ]
      }
    },
    "geofence_configs": {
      "1393": {
        "id": 1393,
        "active": true,
        "type": "locations",
        "type_id": 78135,
        "enabled": true,
        "radius": 125,
        "created": "2018-05-20T12:34:56+00:00",
        "last_modified": "2018-05-20T12:34:56+00:00"
      }
    }
  }
}
```

Retrieves a list of all locations associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/locations</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more location ids you'd like to filter on. Only locations with an id set to one of these values will be returned. If omitted, all locations matching other specified filters are returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. If a location is active, it is available for selection during time entry. |
| **geocoding_status**<br/>optional | _String_ | Comma separated list of one or more of the following values: 'none', 'in_progress', 'retry', 'error', or 'complete'. If omitted, all locations matching other specified filters are returned. |
| **modified_before**<br/>optional | _String_ | Only locations modified before this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **modified_since**<br/>optional | _String_ | Only locations modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |
| **by_jobcode_assignment**<br/>optional | _Boolean_ | true or false. If specified, only locations mapped to a jobcode the user is assigned to will be returned. |

