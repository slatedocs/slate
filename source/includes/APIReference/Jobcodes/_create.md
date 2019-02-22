## Create Jobcodes

 > **Example**: Create two new jobcodes. One succeeds. The other fails because of a duplicate <code>short_code</code> on an existing jobcode.

 > Request Body

```json
{
 "data":
  [
    {
     "name":"Customer1",
     "parent_id":"12788279",
     "short_code":"c1",
     "billable":"yes",
     "assigned_to_all":"yes",
     "billable_rate":"37.50"
    },
    {
     "name":"Customer2",
     "parent_id":"12788279",
     "short_code":"c1",
     "billable":"no",
     "assigned_to_all":"no",
     "billable_rate":"37.50"
    }
  ]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/jobcodes \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes");
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
  .url("https://rest.tsheets.com/api/v1/jobcodes")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/jobcodes',
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcodes');
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

url = URI("https://rest.tsheets.com/api/v1/jobcodes")

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

url = "https://rest.tsheets.com/api/v1/jobcodes"

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

  url := "https://rest.tsheets.com/api/v1/jobcodes"

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
    "jobcodes": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 18059008,
        "parent_id": 17288279,
        "assigned_to_all": true,
        "billable": true,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 37.5,
        "short_code": "c1",
        "name": "Customer1",
        "last_modified": "2018-07-22T19:19:28+00:00",
        "created": "2018-07-22T19:19:28+00:00",
        "required_customfields": [],
        "filtered_customfielditems": ""
      },
      "2": {
        "_status_code": 417,
        "_status_message": "Expectation Failed",
        "_status_extra": "Oops! That Short Code is already in use",
        "name": "Customer2"
      }
    }
  },
  "supplemental_data": {
    "jobcodes": {
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
        "last_modified": "2018-07-12T21:13:14+00:00",
        "created": "2018-05-28T20:18:17+00:00",
        "required_customfields": [],
        "filtered_customfielditems": ""
      }
    }
  }
}
```

Add one or more jobcodes to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/jobcodes</api>

### Properties
_Pass an array of jobcode objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **name**<br/>required | _String_ | Name of the jobcode. |

For a full list of the properties that may be set on a jobcode, see the [Jobcode object](#the-jobcode-object).

### Status Codes

Each jobcode that is created will come back with a `_status_code` and `_status_message` that will indicate whether the jobcode was created successfully. If there was a problem creating a jobcode, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Jobcode was created successfully. |
| <code class="level200">202</code> | 	OK. Jobcode accepted but not created because a jobcode with the same parent_id, name and type already exists. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this jobcode. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> jobcodes. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

