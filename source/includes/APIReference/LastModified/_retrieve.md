## Retrieve Last Modified Timestamps

 > **Example**: Retrieve the default list of last modified timestamps. 

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/last_modified_timestamps"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/last_modified_timestamps");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/last_modified_timestamps")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/last_modified_timestamps',
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
$request->setUrl('https://rest.tsheets.com/api/v1/last_modified_timestamps');
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

url = URI("https://rest.tsheets.com/api/v1/last_modified_timestamps")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/last_modified_timestamps"

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

  url := "https://rest.tsheets.com/api/v1/last_modified_timestamps"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(example will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "last_modified_timestamps": {
      "current_user": "2018-03-28T17:24:20+00:00",
      "customfields": "2018-04-05T19:47:19+00:00",
      "customfielditems": "2018-04-04T16:10:44+00:00",
      "effective_settings": "2018-04-05T19:47:19+00:00",
      "geolocations": "2018-03-27T16:13:28+00:00",
      "jobcodes": "2018-04-05T19:47:19+00:00",
      "jobcode_assignments": "2018-04-05T19:47:19+00:00",
      "timesheets": "2018-03-28T20:16:39+00:00",
      "timesheets_deleted": "2018-03-27T16:13:28+00:00",
      "users": "2018-04-05T19:47:18+00:00",
      "reminders": "2018-03-27T16:13:29+00:00",
      "locations": "2018-07-16T23:36:27+00:00",
      "geofence_configs": "2018-05-20T12:34:56+00:00"
    }
  }
}
```

 > **Example**: Retrieve the last modified timestamps for 'timesheets' and 'groups'. 

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/last_modified_timestamps?endpoints=timesheets%2Cgroups"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/last_modified_timestamps?endpoints=timesheets%2Cgroups");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/last_modified_timestamps?endpoints=timesheets%2Cgroups")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/last_modified_timestamps',
  qs: { endpoints: 'timesheets,groups'
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
$request->setUrl('https://rest.tsheets.com/api/v1/last_modified_timestamps');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'endpoints' => 'timesheets,groups'
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

url = URI("https://rest.tsheets.com/api/v1/last_modified_timestamps?endpoints=timesheets%2Cgroups")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/last_modified_timestamps"

querystring = {
  "endpoints":"timesheets,groups"
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

  url := "https://rest.tsheets.com/api/v1/last_modified_timestamps?endpoints=timesheets%2Cgroups"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(example will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
 "results": {
  "last_modified_timestamps": {
   "timesheets": "2018-03-28T20:16:39+00:00",
   "groups": "2018-03-27T16:13:30+00:00"
  }
 }
}
```

Retrieves a list of `last_modified` timestamps associated with each requested API endpoint. This is especially useful because you can see, with just one request, what endpoints may need to be queried to get changes since the last time you connected to the API.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/last_modified_timestamps</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **endpoints**<br/>optional | _String_ | Comma separated list of one or more endpoints. You can specify any endpoint - see each respective endpoint for the endpoint 'name' that you can use in this list. E.g. if you wanted to only check for changed timesheets and jobcodes, you'd specify _'timesheets,timesheets_deleted,jobcodes'_ as the value of this filter.<br/><br/>If a list of endpoints is not specified, then the following list is returned by default.:<br/><ul><li>`current_user`</li><li>`customfields`</li><li>`customfielditems`</li><li>`effective_settings`</li><li>`geolocations`</li><li>`jobcodes`</li><li>`jobcode_assignments`</li><li>`timesheets`</li><li>`timesheets_deleted`</li><li>`users`</li><li>`reminders`</li><li>`locations`</li><li>`geofence_configs`</li></ul> |