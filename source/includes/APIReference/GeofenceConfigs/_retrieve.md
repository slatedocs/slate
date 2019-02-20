## Retrieve Geofence Configs

> **Examples**

```shell
curl "https://rest.tsheets.com/api/v1/geofence_configs"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/geofence_configs");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/geofence_configs")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/geofence_configs',
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
$request->setUrl('https://rest.tsheets.com/api/v1/geofence_configs');
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

url = URI("https://rest.tsheets.com/api/v1/geofence_configs")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/geofence_configs"

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

  url := "https://rest.tsheets.com/api/v1/geofence_configs"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> The above command returns JSON with the following structure:

```json
{
  "results": {
    "geofence_configs": {
      "151": {
        "id": 151,
        "type": "locations",
        "type_id": 282316,
        "active": true,
        "enabled": true,
        "radius": 150,
        "last_modified": "2017-09-07T19:09:26+00:00",
        "created": "2017-09-07T19:09:26+00:00"
      },
      "297": {
        "id": 297,
        "type": "locations",
        "type_id": 323445,
        "active": true,
        "enabled": false,
        "radius": 125,
        "last_modified": "2017-09-11T13:11:14+00:00",
        "created": "2017-09-11T13:11:14+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "locations": {
      "282316": {
        "id": 282316,
        "addr1": "1234 W Way St",
        "addr2": "",
        "city": "Eagle",
        "state": "Idaho",
        "zip": "83714",
        "country": "US",
        "active": true,
        "latitude": 43.62122110,
        "longitude": -116.34932150,
        "place_id": "",
        "place_id_hash": "8c43103323bb0b1ce7c4094029029914",
        "label": "1234 W Way St Eagle, Idaho 83714 US",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2013-07-12T21:13:14+00:00",
        "last_modified": "2013-07-12T21:13:14+00:00",
        "linked_objects": {},
        "geofence_config_id": 151
      },
      "323445": {
        "id": 323445,
        "addr1": "5678 E End St",
        "addr2": "",
        "city": "Eagle",
        "state": "Idaho",
        "zip": "83714",
        "country": "US",
        "active": true,
        "latitude": -33.87904780,
        "longitude": 151.21133580,
        "place_id": "",
        "place_id_hash": "f6933fee56d6cd9e02d1dbff1a551cfa",
        "label": "5678 E End St Eagle, Idaho 83714 US",
        "notes": "",
        "geocoding_status": "complete",
        "created": "2013-07-12T21:13:14+00:00",
        "last_modified": "2013-07-12T21:13:14+00:00",
        "linked_objects": {
         "jobcodes": [
         2589531
         ]
        },
        "geofence_config_id": 297
      }
    }
  }
}
```

Retrieves a list of all geofence configs, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/geofence_configs</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more geofence config ids you?d like to filter on. Only geofence configs with an id set to one of these values will be returned. If omitted, all geofence configs matching other specified filters are returned. |
| **type**<br/>optional | _String_ | Comma separated list of one or more types. If specified only geofence configs of that type will be returned. |
| **type_ids**<br/>optional | _Int_ | Comma separated list of one or more type ids you'd like to filter on. Only geofence configs with a type_id set to one of these values will be returned. |
| **enabled**<br/>optional | _Boolean_ | _true_ or _false_. If specified only geofence configs with matching enabled values will be returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **modified_before**<br/>optional | _String_ | Only geofence configs modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only geofence configs modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |
| **by_jobcode_assignment**<br/>optional | _Boolean_ | _true_ or _false_. If specified, only geofence configs related to a location that is mapped to a jobcode the user is assigned to will be returned. |

<aside class="notice">
The <code>type</code> parameter must also be included when the <code>type_ids</code> parameter is used.
</aside>