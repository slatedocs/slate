## Create Geolocations

> **Example**: Create two new geolocations.

> Request Body

```json
{
  "data":
  [
    {
      "created": "2018-08-19T11:30:09-06:00",
      "user_id": 1242515,
      "accuracy": 20,
      "altitude": 0,
      "latitude": 43.68662580,
      "longitude": -116.35166460
    },
    {
      "created": "2018-08-19T12:38:56-06:00",
      "user_id": 1242515,
      "accuracy": 20,
      "altitude": 0,
      "latitude": 43.68692580,
      "longitude": -116.35169460
    }
  ]
}
```

> Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/geolocations \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/geolocations");
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
  .url("https://rest.tsheets.com/api/v1/geolocations")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/geolocations',
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
$request->setUrl('https://rest.tsheets.com/api/v1/geolocations');
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

url = URI("https://rest.tsheets.com/api/v1/geolocations")

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

url = "https://rest.tsheets.com/api/v1/geolocations"

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

  url := "https://rest.tsheets.com/api/v1/geolocations"

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

> Response<br/><i>(all examples will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "geolocations": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 185899164,
        "user_id": 1242515,
        "accuracy": 20,
        "altitude": 0,
        "latitude": 43.6866258,
        "longitude": -116.3516646,
        "created": "2018-08-19T17:30:09+00:00"
    },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 185899166,
        "user_id": 1242515,
        "accuracy": 20,
        "altitude": 0,
        "latitude": 43.6869258,
        "longitude": -116.3516946,
        "created": "2018-08-19T18:38:56+00:00"
      }
    }
  },
  "supplemental_data": {
    "": {
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
        "payroll_id": "",
        "hire_date": "2018-07-01",
        "term_date": "0000-00-00",
        "last_modified": "2018-07-12T15:52:00+00:00",
        "last_active": "2018-08-22T22:09:37+00:00",
        "created": "2018-05-28T20:23:44+00:00",
        "mobile_number": ""
      }
    }
  }
}
```

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/geolocations</api>

### Properties
_Pass an array of geolocation objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>required | _Int_ | User id for the user that this timesheet belongs to. |
| **accuracy**<br/>required | _Int_ | Indicates the radius of accuracy around the geolocation in meters. |
| **altitude**<br/>required | _Float_ | Indicates the altitude of the geolocation in meters. Enter 0 if altitude is unknown. |
| **latitude**<br/>required | _Float_ | Indicates the latitude of the geolocation in degrees. |
| **longitude**<br/>required | _Float_ | Indicates the longitude of the geolocation in degrees. |
| **device_identifier**<br/>optional | _String_ | Unique identifier (for the given client) for the device associated with this geolocation. |

For a full list of properties that may be set on a geolocation, see [the Geolocation object](#the-geolocation-object).

### Status Codes

Each geolocation that is created will come back with a `_status_code` and `_status_message` that will indicate whether the geolocation was created successfully. If there was a problem creating a geolocation, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. geolocation was created successfully. |
| <code class="level200">202</code> | OK. geolocation was accepted, but not created (because we already have a geolocation with all the same characteristics as the submitted one) |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this geolocation. See the `_status_extra` value for more detail. |


<aside class="notice">
The maximum batch size is <i>50</i> geolocations. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>
 
