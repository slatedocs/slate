## Retrieve Geolocations

> **Example**: Retrieve a list of all geolocations modified since a given date

> Request

```shell
curl "https://rest.tsheets.com/api/v1/geolocations?modified_since=2018-08-01T12%3A00%3A00-06%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/geolocations?modified_since=2018-08-01T12%3A00%3A00-06%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/geolocations?modified_since=2018-08-01T12%3A00%3A00-06%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/geolocations',
  qs: { modified_since: '2018-08-01T12:00:00-06:00'
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
$request->setUrl('https://rest.tsheets.com/api/v1/geolocations');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2018-08-01T12:00:00-06:00'
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

url = URI("https://rest.tsheets.com/api/v1/geolocations?modified_since=2018-08-01T12%3A00%3A00-06%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/geolocations"

querystring = {
  "modified_since":"2018-08-01T12:00:00-06:00"
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

  url := "https://rest.tsheets.com/api/v1/geolocations?modified_since=2018-08-01T12%3A00%3A00-06%3A00"

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
    "geolocations": {
      "185648268": {
      "id": 185648268,
      "user_id": 29474,
      "accuracy": 21,
      "altitude": 0,
      "latitude": 43.6866258,
      "longitude": -116.3516646,
      "device_identifier": "",
      "source": "gps",
      "heading": 0,
      "speed": 0,        
      "created": "2018-08-16T17:56:57+00:00"
    },
    "185648270": {
      "id": 185648270,
      "user_id": 29474,
      "accuracy": 20,
      "altitude": 0,
      "latitude": 43.6866377,
      "longitude": -116.3516499,
      "device_identifier": "",
      "source": "gps",
      "heading": 0,
      "speed": 0,        
      "created": "2018-08-16T17:57:24+00:00"
    },
    "185648320": {
      "id": 185648320,
      "user_id": 29474,
      "accuracy": 20,
      "altitude": 0,
      "latitude": 43.6866377,
      "longitude": -116.3516499,
      "device_identifier": "",
      "source": "gps",
      "heading": 0,
      "speed": 0,        
      "created": "2018-08-16T17:57:27+00:00"
    },
    ...
  }
}
```

Retrieves a list of geolocations associated with your company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/geolocations</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>required (unless `modified_before` or `modified_since` is set) | _Int_ | Comma separated list of one or more geolocation ids you'd like to filter on. Only geolocations with an id set to one of these values will be returned. |
| **modified_before**<br/>required (unless `ids` or `modified_since` is set) | _String_ | Only geolocations modified before this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **modified_since**<br/>required unless `ids` or `modified_before` is set) | _String_ | Only geolocations modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only geolocations linked to these users will be returned. |
| **group_ids**<br/>optional | _Int_ | A comma-separated list of group ids. Only geolocations linked to users from these groups will be returned. |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |