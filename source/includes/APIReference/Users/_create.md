## Create Users

> **Example**: Create two new users.

> Request Body

```json
{
  "data":
  [ 
    {
      "username": "wwallace",
      "first_name": "William",
      "last_name": "Wallace",
      "email": "wwallace@example.com"
    },
    {
      "username": "mcurie",
      "first_name": "Marie",
      "last_name": "Curie"
    }    
  ]
}
```

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/users \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddParameter("undefined", "<REQUEST BODY>",	ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/users',
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
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <TOKEN>
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

url = URI("https://rest.tsheets.com/api/v1/users")

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

url = "https://rest.tsheets.com/api/v1/users"

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

	url := "https://rest.tsheets.com/api/v1/users"

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

> The above example returns JSON with the following structure:

```json
{
  "results": {
    "users": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2385283,
        "first_name": "William",
        "last_name": "Wallace",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "wwallace",
        "email": "wwallace@example.com",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T21:24:10+00:00",
        "last_active": "",
        "created": "2019-02-09T21:24:10+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/b88b293d792c7dd7ad953a5fd83da9b3",
        "mobile_number": "",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
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
          "pin_login": true,
          "approve_timesheets": false,
          "manage_schedules": false,
          "external_access": false,
          "manage_my_schedule": false,
          "manage_company_schedules": false,
          "view_company_schedules": false,
          "view_group_schedules": false,
          "manage_no_schedules": false,
          "view_my_schedules": false
        },
        "customfields": ""
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2385285,
        "first_name": "Marie",
        "last_name": "Curie",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "mcurie",
        "email": "",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T21:24:10+00:00",
        "last_active": "",
        "created": "2019-02-09T21:24:10+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "",
        "mobile_number": "",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
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
          "pin_login": true,
          "approve_timesheets": false,
          "manage_schedules": false,
          "external_access": false,
          "manage_my_schedule": false,
          "manage_company_schedules": false,
          "view_company_schedules": false,
          "view_group_schedules": false,
          "manage_no_schedules": false,
          "view_my_schedules": false
        },
        "customfields": ""
      }
    }
  },
  "supplemental_data": {
    "jobcodes": {
      "2913946": {
        "id": 2913946,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Sick",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      },
      "2913948": {
        "id": 2913948,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Vacation",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      },
      "2913950": {
        "id": 2913950,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Holiday",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      }
    }
  }
}
```

Add one or more users to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/users</api>

### Properties
_Pass an array of user objects as the value to a 'data' property (see example)._

|                |             |
| -------------: | ----------- |
| **username**<br/>required | Username that will be used by the employee to log on to TSheets. |
| **first_name**<br/>required | First name of the employee. |
| **last_name**<br/>required | Last name of the employee. |

For a full list of properties that may be set on a user, see [the User object](#the-user-object).

### Status Codes
Each user that is created will come back with a `_status_code` and `_status_message` that will indicate whether the user was created successfully. If there was a problem creating a user, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. User was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this user. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> users. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>


