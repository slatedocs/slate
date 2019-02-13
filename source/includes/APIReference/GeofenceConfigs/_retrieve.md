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

<api>GET https://rest.tsheets.com/api/v1/geofence_configs</api>

### Parameters
All parameters are **_optional_** and results are unfiltered with respect to any not provided.

Parameter | Type | Format | Default | Description
--------- | ---- | ------- | ------ | -----------
`ids` | _String_ | comma-separated | null | List of customfield ids to include.
`active` | _String Enum_ | 'yes', 'no' or 'both' | 'yes' | Include only customfields with given status.
`applies_to` | _String Enum_ | 'timesheet', 'user', 'jobcode' or 'all' | 'timesheet' | Include only customfields that apply to the given type.
`value_type` | _String Enum_ | 'managed-list', 'free-form' or 'both' | 'both' | Include only customfields that have the given value type.
`modified_before` | _DateTime_ | ISO8601 | null | Include only customfields modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | null | Include only customfields modified since this date/time.
`supplemental_data` |  _String Enum_ | 'yes' or 'no'| 'yes' | Indicates whether supplemental data should be returned.
`per_page` | _Int_ | 1 - 50 | 50 | The number of results to retrieve per request.
`page` | _Int_ | >= 1 | 1 | The page of results to retrieve.

