## Upload Files

 > **Example**: Upload a file.

 > Request Body

```json
{
 "data":
  [
    {
     "file_data":"data:image/png;base64,iVBORw0KGgoAAA...< actual data here >...ANI=",
     "file_name":"invisible_minion.png",   
     "meta_data": {
           "file_description":"Ba-ba-ba-ba-ba-nana",
           "image_rotation": 0
     }
    }
  ]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/files \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -H 'Content-Length: <LENGTH>' \  
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddHeader("Content-Length", "<LENGTH>");
request.AddParameter("undefined", "<REQUEST BODY>", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/files")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .addHeader("Content-Length", "<LENGTH>")  
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/files',
  headers: 
   { 'Content-Type': 'application/json',
     'Content-Length': '<LENGTH>',
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
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Content-Length' => '<LENGTH>',  
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

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Bearer <TOKEN>'
request["Content-Type"] = 'application/json'
request["Content-Length"] = '<LENGTH>'
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
    'Content-Type': "application/json",
    'Content-Length': "<Length>"    
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

  url := "https://rest.tsheets.com/api/v1/files"

  payload := strings.NewReader("<REQUEST BODY>")

  req, _ := http.NewRequest("POST", url, payload)

  req.Header.Add("Authorization", "Bearer <TOKEN>")
  req.Header.Add("Content-Type", "application/json")
  req.Header.Add("Content-Length", "<LENGTH>")  

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
    "files": {
      "1": {
        "_status_code": 200,
        "_status_message": "Uploaded",
        "id": 123828,
        "uploaded_by_user_id": 19128,
        "file_name": "invisible_minion.png",
        "active": true,
        "size": 95,
        "last_modified": "2018-08-24T00:09:32+00:00",
        "created": "2018-08-24T00:09:32+00:00",
        "linked_objects": [],
        "meta_data": {
          "file_description": "Ba-ba-ba-ba-ba-nana",
          "image_rotation": 0
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

Add one or more files that can be attached to objects. Currently we only allow .png, .jpeg, .jpg file formats.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/files</api>

### Properties
_Pass an array of file objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **file_name**<br/>required | _String_ | Name of the file. |
| **file_data**<br/>required | _String_ | Base64 encoded string of the file. |

For a full list of the properties that may be set on a file, see the [File object](#the-file-object).

### Status Codes
Each file that is uploaded will come back with a `_status_code` and `_status_message` that will indicate whether the file was uploaded successfully. If there was a problem uploading a file, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. File was uploaded successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this file. See the `_status_extra` value for more detail. |

<aside class="warning">
The <code>Content-Length</code> header <bold>must</bold> be provided when using this method.
</aside>

<aside class="notice">
The entire request size may not exceed 2 MB. For example, you could submit a request with 10 files that are each 200 KB in size, or a single file that is no larger than 2 MB in size.
</aside>

<aside class="notice">
Currently files can only be attached to Timesheet objects. See <a href="#update-timesheets" alt="update-timesheets">Update Timesheets</a> for details.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> files. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>