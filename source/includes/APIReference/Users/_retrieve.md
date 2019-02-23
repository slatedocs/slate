## Retrieve Users

 > **Example**: Retrieve a list of all active users.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/users"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  headers: 
   { Authorization: 'Bearer <TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_GET);

$request->setHeaders(array(
  'Authorization' => 'Bearer <TOKEN>'
));

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

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/users"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of all users (active or deleted) whose last name starts with 'sm'. Set pagination to 30 results/page.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/users?per_page=30&last_name=sm%2A"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users?per_page=30&last_name=sm%2A");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users?per_page=30&last_name=sm%2A")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  qs: { per_page: '30',
        last_name: 'sm*'
  },
  headers: 
   { Authorization: 'Bearer <TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'per_page' => '30',
  'last_name' => 'sm*'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <TOKEN>'
));

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

url = URI("https://rest.tsheets.com/api/v1/users?per_page=30&last_name=sm%2A")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

querystring = {
  "per_page":"30",
  "last_name":"sm*"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers, params=querystring)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/users?per_page=30&last_name=sm%2A"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
    "users": {
      "933849": {
        "id": 933849,
        "first_name": "Mary",
        "last_name": "Samsonite",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "admin",
        "email": "admin@example.com",
        "email_verified": false,
        "payroll_id": "",
        "mobile_number": "2087231456",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-03-28T17:24:20+00:00",
        "last_active": "",
        "created": "2018-03-27T16:13:34+00:00",
        "client_url": "api_sample_output",
        "company_name": "API Sample Output Company",
        "profile_image_url": "https:\/\/www.gravatar.com\/avatar\/e64c7d89f26bd1972efa854d13d7dd61",
        "pto_balances": {
          "2624351": 0,
          "2624353": 0,
          "2624355": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [

        ],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": true,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": false,
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
      "933845": {
        "id": 933845,
        "first_name": "Bob",
        "last_name": "Smith",
        "group_id": 64965,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "bobsmith",
        "email": "",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2018-03-27T16:13:33+00:00",
        "last_active": "2018-03-28T20:16:39+00:00",
        "created": "2018-03-27T16:13:33+00:00",
        "client_url": "api_sample_output",
        "company_name": "API Sample Output Company",
        "profile_image_url": "",
        "mobile_number": "",
        "pto_balances": {
          "2624351": 0,
          "2624353": 0,
          "2624355": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [

        ],
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
          "pin_login": false,
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
  "more": false,
  "supplemental_data": {
    "jobcodes": {
      "2624351": {
        "id": 2624351,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Sick",
        "last_modified": "2018-03-27T16:13:28+00:00",
        "created": "2018-03-27T16:13:28+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [

        ],
        "locations": [

        ]
      },
      "2624353": {
        "id": 2624353,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Vacation",
        "last_modified": "2018-03-27T16:13:28+00:00",
        "created": "2018-03-27T16:13:28+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [

        ],
        "locations": [

        ]
      },
      "2624355": {
        "id": 2624355,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Holiday",
        "last_modified": "2018-03-27T16:13:28+00:00",
        "created": "2018-03-27T16:13:28+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [

        ],
        "locations": [

        ]
      }
    },
    "groups": {
      "64965": {
        "id": 64965,
        "active": true,
        "name": "Construction",
        "last_modified": "2018-03-27T16:13:30+00:00",
        "created": "2018-03-27T16:13:29+00:00",
        "manager_ids": [
          "933833"
        ]
      }
    }
  }
}
```

Retrieves a list of all users associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/users</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more user ids you'd like to filter on. |
| **not_ids**<br/>optional | _Int_ | Comma separated list of one or more user ids you'd like to filter on. Specifically, the user ids you'd like to exclude. |
| **employee_numbers**<br/>optional | _Int_ | Comma separated list of one or more employee numbers you'd like to filter on. |
| **usernames**<br/>optional | _String_ | Comma separated list of one or more usernames you'd like to filter on. |
| **group_ids**<br/>optional | _Int_ | Comma separated list of one or more group ids you'd like to filter on. |
| **not_group_ids**<br/>optional | _Int_ | Comma separated list of one or more group ids you'd like to filter on. Specifically, the group ids you'd like to exclude. |
| **payroll_ids**<br/>optional | _String_ | A comma-separated string of payroll ids. Only users with these payroll ids will be returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **first_name**<br/>optional | _String_ | * will be interpreted as a wild card. Starts matching from the beginning of the string. |
| **last_name**<br/>optional | _String_ | * will be interpreted as a wild card. Starts matching from the beginning of the string. |
| **modified_before**<br/>optional | _String_ | Only users modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only users modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

