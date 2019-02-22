## Update Jobcodes

 > **Example**: Change some information for each of these jobcodes.

 > Request Body

```json
{
  "data":
  [
    {
      "id": 10606354,
      "short_code": "cc3",
      "billable": "false",
      "name": "Customer30",
      "billable_rate": "57.50"
    },
    {
      "id": 10608414,
      "short_code": "cc4",
      "billable": "false",
      "name": "Customer40",
      "billable_rate": "57.50"
    },
    {
      "id": 10608424,
      "short_code": "cc1",
      "billable": "false",
      "name": "Customer10",
      "billable_rate": "57.50"
    }
  ]
}
```

 > Request

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/jobcodes \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcodes");
var request = new RestRequest(Method.PUT);
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
  .put(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
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
$request->setMethod(HTTP_METH_PUT);

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

request = Net::HTTP::Put.new(url)
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

response = requests.request("PUT", url, data=payload, headers=headers)

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

  req, _ := http.NewRequest("PUT", url, payload)

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
        "_status_message": "Updated",
        "id": 18059008,
        "parent_id": 17288279,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 57.5,
        "short_code": "cc3",
        "name": "Customer30",
        "last_modified": "2018-07-22T22:12:04+00:00",
        "created": "2018-07-22T19:19:28+00:00"
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 18064850,
        "parent_id": 17288279,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 57.5,
        "short_code": "cc4",
        "name": "Customer40",
        "last_modified": "2018-07-22T22:12:05+00:00",
        "created": "2018-07-22T21:20:43+00:00"
      },
      "3": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 18064852,
        "parent_id": 17288279,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 57.5,
        "short_code": "cc1",
        "name": "Customer10",
        "last_modified": "2018-07-22T22:12:06+00:00",
        "created": "2018-07-22T21:20:51+00:00"
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
        "created": "2018-05-28T20:18:17+00:00"
      }
    }
  }
}
```

Edit one or more jobcodes in your company.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/jobcodes</api>

### Properties
_Pass an array of jobcode objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Id of the jobcode. |

Other properties defined on a [jobcode object](#the-jobcode-object) may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

<aside class="notice">
You cannot edit a jobcode that is <i>archived</i>. You must restore the jobcode first. It is permissible to make an edit to a jobcode and restore it in a single edit request (i.e. change active to <i>1</i> and rename the jobcode in one step).
</aside>

### Status Codes

Each jobcode that is edited will come back with a `_status_code` and `_status_message` that will indicate whether the jobcode was edited successfully. If there was a problem editing a jobcode, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Jobcode was edited successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this jobcode. See the `_status_extra` value for more detail. |
 
<aside class="notice">
The maximum batch size is <i>50</i> jobcodes. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>