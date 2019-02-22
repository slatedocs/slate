## Retrieve Locations Maps

 > **Example**: Retrieve a list of all active locations maps.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations_map"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations_map");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations_map")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations_map',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations_map');
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

url = URI("https://rest.tsheets.com/api/v1/locations_map")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations_map"

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

  url := "https://rest.tsheets.com/api/v1/locations_map"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of locations maps with given ids 

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations_map?ids=12%2C367%2C3489"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations_map?ids=12%2C367%2C3489");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations_map?ids=12%2C367%2C3489")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations_map',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations_map');
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

url = URI("https://rest.tsheets.com/api/v1/locations_map?ids=12%2C367%2C3489")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations_map"

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

  url := "https://rest.tsheets.com/api/v1/locations_map?ids=12%2C367%2C3489"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of locations maps that have been modified since a given date

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/locations_map?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations_map?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations_map?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/locations_map',
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
$request->setUrl('https://rest.tsheets.com/api/v1/locations_map');
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

url = URI("https://rest.tsheets.com/api/v1/locations_map?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations_map"

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

  url := "https://rest.tsheets.com/api/v1/locations_map?modified_since=2018-01-01T00%3A00%3A00%252B00%3A00"

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
    "locations_map": {
      "102839": {
        "id": 102839,
        "x_table": "job_codes",
        "x_id": 2597003,
        "location_id": 237053,
        "created": "2018-06-20T14:14:26+00:00",
        "last_modified": "2018-08-01T10:31:16+00:00"
      },
      "110761": {
        "id": 110761,
        "x_table": "job_codes",
        "x_id": 3003037,
        "location_id": 268919,
        "created": "2018-07-10T14:33:14+00:00",
        "last_modified": "2018-08-01T10:31:16+00:00"
      }
    }
  },
  "supplemental_data": {
    "locations": {
      "237053": {
        "id": 237053,
        "addr1": "1234 N Back Rd",
        "addr2": "",
        "city": "Eagle",
        "state": "ID",
        "zip": "83616",
        "formatted_address": "1234 N Back Rd, Eagle, ID 83616",
        "country": "US",
        "active": true,
        "latitude": 43.648051,
        "longitude": -116.353473,
        "place_id": "",
        "place_id_hash": "a08b7c81255ef0d67f5c2a0e55858c1b",
        "label": "1234 North Back Road, Eagle, ID, USA",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2018-06-26T19:49:55+00:00",
        "last_modified": "2018-06-26T19:49:55+00:00",
        "linked_objects": {
          "jobcodes": [
            2597003
          ]
        },
        "geofence_config_id": 116905
      },
      "268919": {
        "id": 268919,
        "addr1": "5678 E Cole Dr",
        "addr2": "",
        "city": "Eagle",
        "state": "ID",
        "zip": "83616",
        "formatted_address": "5678 E Cole Dr, Eagle, ID 83616",
        "country": "US",
        "active": true,
        "latitude": 43.670013,
        "longitude": -116.3521704,
        "place_id": "",
        "place_id_hash": "d6c4ea86ec37bf0fa5e01194d19adf29",
        "label": "5678 East Cole Drive, Eagle, ID, USA",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2018-07-10T14:33:14+00:00",
        "last_modified": "2018-07-10T14:33:14+00:00",
        "linked_objects": {
          "jobcodes": [
            3003037
          ]
        },
        "geofence_config_id": null
      }
    }
  }
}
```

Retrieves a list of all locations maps associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/locations_maps</api>
 
### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more locations map ids you'd like to filter on. Only locations maps with an id set to one of these values will be returned. If omitted, all locations maps matching other specified filters are returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **modified_before**<br/>optional | _String_ | Only locations maps modified before this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **modified_since**<br/>optional | _String_ | Only locations maps modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. |
| **by_jobcode_assignment**<br/>optional | _Boolean_ | true or false. If specified only locations maps mapped to a jobcode the user is assigned to will be returned. |

