## Update Files

 > **Example**: Update a file.

 > Request Body

```json
{
 "data":
  [
    {
     "id":"123455",   
     "meta_data": {
           "file_description":"Testing PUT request",
           "image_rotation": 180
     }
    }
  ]
}
```

 > Request

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/files \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files");
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
  .url("https://rest.tsheets.com/api/v1/files")
  .put(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
  url: 'https://rest.tsheets.com/api/v1/files',
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
$request->setUrl('https://rest.tsheets.com/api/v1/files');
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

url = URI("https://rest.tsheets.com/api/v1/files")

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

url = "https://rest.tsheets.com/api/v1/files"

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

  url := "https://rest.tsheets.com/api/v1/files"

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

> Response<br/><i>(all examples will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "files": {
      "123455": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 123455,
        "uploaded_by_user_id": 19128,
        "file_name": "invisible_minion.png",
        "active": true,
        "size": 95,
        "last_modified": "2018-09-19T00:09:32+00:00",
        "created": "2018-08-24T00:09:32+00:00",
        "linked_objects": [],
        "meta_data": {
          "file_description": "Testing PUT request",
          "image_rotation": 180
        }
      }
    }
  },
  "supplemental_data": {
    "users": {
      "19128": {
        "id": 19128,
        "first_name": "Shree",
        "last_name": "Yalamanchili",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "shree",
        "email": "shree_dev@tsheets.com",
        "email_verified": true,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-08-16T18:32:46+00:00",
        "last_active": "2018-08-16T15:16:22+00:00",
        "created": "2017-04-05T15:41:30+00:00",
        "client_url": "devrocks",
        "company_name": "DevRocks",
        "profile_image_url": "",
        "mobile_number": "",
        "pto_balances": "",
        "submitted_to": "2018-01-22",
        "approved_to": "2017-04-06",
        "manager_of_group_ids": [
          27520
        ],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": true,
          "mobile": true,
          "status_box": true,
          "reports": true,
          "manage_timesheets": true,
          "manage_authorization": true,
          "manage_users": true,
          "manage_my_timesheets": true,
          "manage_jobcodes": true,
          "pin_login": true,
          "approve_timesheets": true,
          "manage_schedules": true,
          "external_access": false,
          "manage_my_schedule": false,
          "manage_company_schedules": true,
          "view_company_schedules": false,
          "view_group_schedules": false,
          "manage_no_schedules": false,
          "view_my_schedules": false
        },
        "customfields": ""
      }
    }
  }
}
```

Edit one or more files that are attached to objects.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/files</api>

### Properties
_Pass an array of file objects as the value to a 'data' property (see example)._

When editing a file, you must uniquely identify the file by passing in its id. All other properties defined below may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Id of the file to edit. |
| **file_name**<br/>optional | _String_ | Name of this file the file to edit. |
| **meta_data**<br/>read-write | _JSON Object_ | This is a key/value map of any additional data associated with this file. List of allowed keys:<br/><ul><li><b>file_description</b>:  <i>String</i>  Description of this file.</li><li><b>image_rotation</b>:  <i>Int</i>  Original image orientation in degrees. Accepted values are: <i>0</i> (top), <i>90</i> (right), <i>180</i> (bottom), <i>270</i> (left).</li></ul> |

### Status Codes
Each file that is updated will come back with a `_status_code` and `_status_message` that will indicate whether the file was updated successfully. If there was a problem updating a file, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. File was updated successfully. |
| <code class="level400">404</code> | Not Found. File either has never existed or has been deleted. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this file. See the `_status_extra` value for more detail. |

<aside class="notice">
Currently files can only be attached to Timesheet objects. See <a href="#update-timesheets" alt="update-timesheets">Update Timesheets</a> for details.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> files. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>