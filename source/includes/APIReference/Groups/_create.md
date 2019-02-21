## Create Groups

 > **Example**: Create two new groups

 > Request Body

 ```json
{
  "data":
  [
    {
      "name":"Group 1",
      "manager_ids":"300, 316"
    },
    {
      "name":"Group 2",
      "manager_ids":"316"
    }
  ]
} 
 ```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/groups \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/groups");
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
  .url("https://rest.tsheets.com/api/v1/groups")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/groups',
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
$request->setUrl('https://rest.tsheets.com/api/v1/groups');
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

url = URI("https://rest.tsheets.com/api/v1/groups")

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

url = "https://rest.tsheets.com/api/v1/groups"

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

  url := "https://rest.tsheets.com/api/v1/groups"

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
    "groups": {
      "1": {
        "id": 6,
        "name": "Group 1",
        "last_modified": "2018-08-19T16:29:28+00:00",
        "created": "2018-08-19T16:29:28+00:00",
        "manager_ids": [
          "300",
          "316"
        ]
      },
      "2": {
        "id": 8,
        "name": "Group 2",
        "last_modified": "2018-08-19T16:29:35+00:00",
        "created": "2018-08-19T16:29:35+00:00",
        "manager_ids": [
          "316"
        ]
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "users": {
      "300": {
        "id": 300,
        "first_name": "Joseph",
        "last_name": "",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "joseph@example.com",
        "email": "joseph@example.com",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-08-20T15:55:26+00:00",
        "last_active": "2018-08-24T15:43:46+00:00",
        "created": "2018-08-17T17:31:12+00:00",
        "client_url": "joseph",
        "company_name": "joseph",
        "mobile_number": "",
        "pto_balances": {
          "8606": 0,
          "8608": 0,
          "8610": 0,
          "8770": 0
        },
        "approved_to": "",
        "submitted_to": "",
        "manager_of_group_ids": [
          6
        ],
        "require_password_change": false,
        "permissions": {
          "admin": true,
          "mobile": false,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "approve_timesheets": false,
          "manage_no_schedules": false,
          "manage_my_schedule": false,
          "manage_schedules": false,
          "manage_company_schedules": false,
          "view_my_schedules": false,
          "view_group_schedules": false,
          "view_company_schedules": false
        }
      },
      "316": {
        "id": 316,
        "first_name": "Bill",
        "last_name": "Franklin",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "bill",
        "email": "",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-08-20T15:57:14+00:00",
        "last_active": "",
        "created": "2018-08-20T15:56:48+00:00",
        "client_url": "bfrank",
        "company_name": "bfrank",
        "mobile_number": "",
        "pto_balances": {
          "8606": 0,
          "8608": 0,
          "8610": 0,
          "8770": 0
        },
        "approved_to": "",
        "submitted_to": "",
        "manager_of_group_ids": [
          6,
          8
        ],
        "require_password_change": false,
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "approve_timesheets": false,
          "manage_no_schedules": false,
          "manage_my_schedule": false,
          "manage_schedules": false,
          "manage_company_schedules": false,
          "view_my_schedules": false,
          "view_group_schedules": false,
          "view_company_schedules": false
        }
      }
    }
  }
}
```



Add one or more groups to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/groups</api>

### Properties
_Pass an array of group objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **name**<br/>required | _String_ | Name of the group. |

For a full list of properties that may be set on a group, see [the Group object](#the-group-object).

### Status Codes

Each group that is created will come back with a `_status_code` and `_status_message` that will indicate whether the group was created successfully. If there was a problem creating a group, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Group was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this group. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> groups. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>