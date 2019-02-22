## Create Locations

 > **Example**: Create two new locations. One of them linked to an existing jobcode.

 > Request Body

```json
{
  "data": [{
    "addr1": "235 E Colchester Dr",
    "addr2": "101",
    "city": "Eagle",
    "state": "ID",
    "zip": "83616",
    "country": "US",
    "formatted_address": "235 E Colchester Dr, Meridian, ID 83646",
    "active": true,
    "label": "TSheets HQ",
    "notes": "Please use front door",
    "linked_objects": {
      "jobcodes": [
        3656485
      ]
    }
  }, {
    "addr1": "7 Any Street",
    "addr2": "",
    "city": "Meridian",
    "state": "ID",
    "zip": "83646",
    "country": "US",
    "formatted_address": "7 Any Street, Meridian, ID 83646",
    "active": true,
    "label": "Any House on Any Street",
    "notes": "Beware the dog!"
  }]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/locations \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/locations");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddParameter("undefined", "<REQUEST BODY>", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/locations")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/locations',
  headers: 
   { 'Content-Type': 'application/json',
     Authorization: 'Bearer <TOKEN>' },
  body: '<REQUEST BODY>',
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/locations');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <TOKEN>'
));

$request->setBody('<REQUEST BODY>');

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

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Bearer <TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/locations"

payload = "<REQUEST BODY>"
headers = {
    'Authorization': "Bearer <TOKEN>",
    'Content-Type': "application/json"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "strings"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/locations"

  payload := strings.NewReader("<REQUEST BODY>")

  req, _ := http.NewRequest("POST", url, payload)

  req.Header.Add("Authorization", "Bearer <TOKEN>")
  req.Header.Add("Content-Type", "application/json")

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
    "locations": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 742413,
        "addr1": "235 E Colchester Dr",
        "addr2": "101",
        "city": "Eagle",
        "state": "ID",
        "zip": "83616",
        "formatted_address": "235 E Colchester Dr 101, Eagle, ID 83616",
        "country": "US",
        "active": true,
        "latitude": 0,
        "longitude": 0,
        "place_id": "",
        "place_id_hash": "",
        "label": "TSheets HQ",
        "notes": "Please use the front door",
        "geocoding_status": "none",
        "created": "2018-12-18T18:01:01+00:00",
        "last_modified": "2018-12-18T18:01:01+00:00",
        "linked_objects": {
          "jobcodes": [
            3656485
          ]
        },
        "geofence_config_id": null
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 742415,
        "addr1": "7 Any Street",
        "addr2": "",
        "city": "Meridian",
        "state": "ID",
        "zip": "83646",
        "formatted_address": "7 Any Street, Meridian, ID 83646",
        "country": "US",
        "active": true,
        "latitude": 0,
        "longitude": 0,
        "place_id": "",
        "place_id_hash": "",
        "label": "Any House on Any Street",
        "notes": "Beware the dog!",
        "geocoding_status": "none",
        "created": "2018-12-18T18:01:01+00:00",
        "last_modified": "2018-12-18T18:01:01+00:00",
        "linked_objects": {},
        "geofence_config_id": null
      }
    }
  },
  "supplemental_data": {
    "jobcodes": {
      "3656485": {
        "id": 3656485,
        "active": true,
        "parent_id": 0,
        "assigned_to_all": true,
        "type": "regular",
        "billable": true,
        "billable_rate": 0,
        "short_code": "",
        "name": "Gutter Cleaning",
        "created": "2018-10-31T15:15:25+0000",
        "last_modified": "2018-12-13T15:11:57+0000",
        "has_children": false,
        "required_customfields": [
          326759
        ],
        "filtered_customfielditems": {
          "326759": [
            2207167
          ]
        },
        "locations": [
          742413
        ]
      }
    }
  }
}
```

Add one or more locations to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/locations</api>

### Properties
_Pass an array of location objects as the value to a 'data' property (see example)._

One or more of the following properties are required to create a location:

|                |             |             |
| -------------: | :---------: | ----------- |
| **addr1** | _String_ | The first line of the street for the address. |
| **addr2** | _String_ | The second line of the street for the address. |
| **city** | _String_ | The city of the address. |
| **state** | _String_ | The state of the address. |
| **zip** | _String_ | The postal code for the address. |
| **county** | _String_ | he country of the address. |

For a full list of properties that may be set on a location, see [the Location object](#the-location-object).

### Status Codes

Each location that is created will come back with a `_status_code` and `_status_message` that will indicate whether the location was created successfully. If there was a problem creating a location, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Location was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this location. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> locations. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

