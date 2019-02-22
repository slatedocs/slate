## Create Jobcode Assignments

 > **Example**: Create two new jobcode assignments. One succeeds. The other fails because of a permissions issue with the <code>user_id</code>.

 > Request Body

```json
{
  "data":
  [
    {
      "user_id":"1234",
      "jobcode_id":"37"
    },
    {
      "user_id":"4567",
      "jobcode_id":"37"
    }
  ]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/jobcode_assignments \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcode_assignments");
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
  .url("https://rest.tsheets.com/api/v1/jobcode_assignments")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/jobcode_assignments',
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcode_assignments');
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

url = URI("https://rest.tsheets.com/api/v1/jobcode_assignments")

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

url = "https://rest.tsheets.com/api/v1/jobcode_assignments"

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

  url := "https://rest.tsheets.com/api/v1/jobcode_assignments"

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
    "jobcode_assignments": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 106063,
        "user_id": "1234",
        "jobcode_id": "37",
        "last_modified": "2018-01-17 21:15:18",
        "created": "2018-01-17 21:15:18"
      },
      "2": {
        "_status_code": 417,
        "_status_message": "Expectation Failed",
        "_status_extra": "Oops! You don't have permission to manage that user",
        "user_id": "4567",
        "jobcode_id": "37"
      }
    }
  },
  "supplemental_data": {
    "users": {
      "1234": {
        "id": "1234",
        "first_name": "John",
        "last_name": "Smith",
        "group_id": "983247",
        "active": 1,
        "employee_number": 0,
        "salaried": 1,
        "exempt": 1,
        "username": "jsmith",
        "email": "jsmith@example.com",
        "payroll_id": 127,
        "hire_date": "2017-04-01",
        "term_date": "0000-00-00",
        "last_modified": "2017-04-20T16:21:56+00:00",
        "last_active": "2018-01-28T05:24:59+00:00",
        "created": "2017-04-19T16:20:20+00:00",
        "client_url": "fake",
        "mobile_number": "",
        "approved_to": "2000-01-01",
        "submitted_to": "2000-01-01",
        "manager_of_group_ids": {
          "permissions": {
            "admin": 1,
            "mobile": "",
            "status_box": "",
            "reports": "",
            "manage_timesheets": "",
            "manage_authorization": "",
            "manage_users": "",
            "manage_my_timesheets": "",
            "manage_jobcodes": "",
            "approve_timesheets": "",
            "manage_no_schedules": false,
            "manage_my_schedule": false,
            "manage_schedules": true,
            "manage_company_schedules": false,
            "view_my_schedules": false,
            "view_group_schedules": false,
            "view_company_schedules": false
          }
        }
      }
    },
    "jobcodes": {
      "37": {
        "id": 37,
        "parent_id": 0,
        "assigned_to_all": "",
        "billable": "",
        "active": 1,
        "type": "regular",
        "has_children": "",
        "billable_rate": "0",
        "short_code": "",
        "name": "My Jobcode Name",
        "last_modified": "2018-06-27T21:34:05+00:00",
        "created": "2018-06-27T21:33:45+00:00",
        "required_customfields": {}
        "filtered_customfielditems": {}
      }
    }
  }
}
```

Add one or more jobcode assignments to a user.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/jobcode_assignments</api>

### Properties
_Pass an array of jobcode assignment objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>required | _Int_ | User id for this jobcode assignment. _(See note below)_|
| **jobcode_id**<br/>required | _Int_ | Jobcode id for this jobcode assignment. |

### Status Codes
Each jobcode assignment that is created will come back with a `_status_code` and `_status_message` that will indicate whether the jobcode assignment was created successfully. If there was a problem creating a jobcode assignment, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Jobcode assignment was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this jobcode assignment. See the `_status_extra` value for more detail. |

<aside class="warning">
To use this method, you must be a group manager of the user you're making assignments for, be an admin, or have the <code>manage_users</code> permission.
</aside>

<aside class="notice">
Specify a <code>user_id</code> of <i>0</i> to indicate that this <code>jobcode_assignment</code> should apply to all users. This is equivalent to setting the <code>assigned_to_all</code> property to <i>true</i> on a jobcode object.
</aside>

<aside class="notice">
When assigning jobcodes, keep in mind that when assigning a parent jobcode (in a multi-level jobcode scenario), all child jobcodes will also be assigned to the user.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> jobcode assignments. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

