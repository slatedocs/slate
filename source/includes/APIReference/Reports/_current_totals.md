## Retrieve Current Totals Report

> **Response Layout**

```json
{
  "results": {
    "current_totals": {
      "1751136": {                             # Totals are indexed by unique 
        "user_id": 1751136,                    #   user_id.
        "on_the_clock": true,                  # Whether this user is currently
                                               #   on the clock.
        "timesheet_id": 173523290,             # Timesheet id for the current 
                                               #   timesheet.
        "jobcode_id": 26730062,                # Jobcode id for the current 
                                               #   timesheet.
        "group_id": 180010,                    # Unique group id for this user,
                                               #   value of zero represents those
                                               #   without a group.
        "shift_geolocations_available": true,  # If geolocations are available 
                                               #   for the current timesheet.
        "shift_seconds": 25275,                # Total time for the current
                                               #   shift, in seconds.
        "day_seconds": 25275                   # Total time for the day, 
                                               #   in seconds.
      },
      "1738864": {
        "user_id": 1738864,
        "on_the_clock": false,
        "timesheet_id": null,
        "jobcode_id": null,
        "group_id": 180010,
        "shift_geolocations_available": false,
        "shift_seconds": 0,
        "day_seconds": 25719
      },
      ...
    }
  }
}
```

 > **Example**: Retrieve a `current_totals` report for all users on an account.

 > Request Body

```json
{
  "data": {
    "on_the_clock": "both"
  }
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/reports/current_totals \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reports/current_totals");
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
  .url("https://rest.tsheets.com/api/v1/reports/current_totals")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/reports/current_totals',
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
$request->setUrl('https://rest.tsheets.com/api/v1/reports/current_totals');
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

url = URI("https://rest.tsheets.com/api/v1/reports/current_totals")

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

url = "https://rest.tsheets.com/api/v1/reports/current_totals"

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

  url := "https://rest.tsheets.com/api/v1/reports/current_totals"

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

> Response<br/><i>(shortened for readability)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "current_totals": {
      "1751136": {
        "user_id": 1751136,
        "on_the_clock": true,
        "timesheet_id": 173523290,
        "jobcode_id": 26730062,
        "group_id": 180010,
        "shift_geolocations_available": true,
        "shift_seconds": 25275,
        "day_seconds": 25275
      },
      "1738864": {
        "user_id": 1738864,
        "on_the_clock": false,
        "timesheet_id": null,
        "jobcode_id": null,
        "group_id": 180010,
        "shift_geolocations_available": false,
        "shift_seconds": 0,
        "day_seconds": 25719
      },
      ...
    }
  },
  "supplemental_data": {
    "users": {
      "1751136": {
        "id": 1751136,
        "first_name": "Leeroy",
        "last_name": "Jenkins",
        "group_id": 180010,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "ljenkins",
        "email": "",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-10-30T16:09:00+00:00",
        "last_active": "2018-11-03T16:07:27+00:00",
        "created": "2018-10-30T16:09:00+00:00",
        "client_url": "nate",
        "mobile_number": "",
        "approved_to": "",
        "submitted_to": "",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": true,
          "manage_jobcodes": false,
          "approve_timesheets": false,
          "manage_no_schedules": false,
          "manage_my_schedule": false,
          "manage_schedules": true,
          "manage_company_schedules": false,
          "view_my_schedules": false,
          "view_group_schedules": false,
          "view_company_schedules": false
        }
      },
      ...
    },
    "groups": {
      "0": {
        "id": 0,
        "name": "-",
        "last_modified": "2018-02-11T17:48:39+00:00",
        "created": "2018-02-11T17:47:04+00:00"
      },
      ...
    },
    "timesheets": {
      "173523280": {
        "id": 173523280,
        "user_id": 1751140,
        "jobcode_id": 26730062,
        "start": "2018-11-03T09:07:21-07:00",
        "end": "",
        "duration": 0,
        "date": "2018-11-03",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "TSheets iPhone App",
        "on_the_clock": true,
        "locked": 0,
        "notes": "",
        "customfields": {
          "8184": "",
          "19476": "",
          "19478": "",
          "19618": "",
          "21360": "",
          "37382": "",
          "40028": "",
          "40030": ""
        },
        "last_modified": "2018-11-03T16:07:26+00:00"
      },
      ...
    },
    "jobcodes": {
      "26730062": {
        "id": 26730062,
        "parent_id": 26730016,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "a",
        "name": "Android",
        "last_modified": "2018-10-21T17:06:02+00:00",
        "created": "2018-10-21T17:06:02+00:00",
        "required_customfields": [],
        "filtered_customfielditems": ""
      }
    }
  }
}
```

Retrieves a snapshot report for the current totals (shift and day) along with additional information provided for those who are currently on the clock.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/current_totals</api>

### Filter Properties

_Pass an an object of filters as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only totals for these users will be included. |
| **group_ids**<br/>optional | _Int_ | A comma-separated list of group ids. Only totals for users from these groups will be included. |
| **on_the_clock**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'no'. If a user is `on_the_clock`, it means the user is currently working (has not clocked out yet). |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. Using this filter requires a page to be defined. |
| **order_by**<br/>optional | _String_ | Attribute name by which to order the result data, one of: 'username', 'first_name', 'last_name', 'group_name', 'group_id', 'shift_seconds', or 'day_seconds'. |
| **order_desc**<br/>optional | _Boolean_ | Either _true_ or _false_. If _true_, result data will be ordered descending by the attribute specified in the `order_by` filter. |

<aside class="notice">
When a user is off the clock, both the <code>timesheet_id</code> and <code>jobcode_id</code> attributes will return as <i>null</i> and shift seconds will be <i>0</i>.
</aside>

### Understanding the Output

See explanation of response layout to the right.

