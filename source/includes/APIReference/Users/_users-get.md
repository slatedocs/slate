## Retrieve Users

> **Examples**

> Retrieve a list of all active users.

```shell
curl "https://rest.tsheets.com/api/v1/users"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

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
  'Authorization' => 'Bearer <INSERT TOKEN>'
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
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
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

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of all users (active or deleted) whose last name starts with _J_. Set pagination to 10 results/page.

```shell
curl "https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  qs: { last_name: 'J%2A', per_page: '10' },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

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
  'last_name' => 'J%2A',
  'per_page' => '10'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
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

url = URI("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

querystring = {"last_name":"J%2A","per_page":"10"}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
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

	url := "https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10"

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
```

> The above examples return JSON with the following structure:

```json
{
  "results": {
    "users": {
      "317044": {
        "id": 317044,
        "first_name": "Bob",
        "last_name": "Jones",
        "group_id": 6908,
        "active": true,
        "employee_number": 10,
        "salaried": false,
        "exempt": false,
        "username": "bjones",
        "email": "bob_jones@anymail.com",
        "email_verified": false,
        "payroll_id": "SC010",
        "mobile_number": "2085551234",
        "hire_date": "2018-07-02",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T17:59:06+00:00",
        "last_active": "2019-02-09T18:45:39+00:00",
        "created": "2018-10-04T02:25:38+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/6be49c2065c016dcdfcd26d1da111e9f",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 8.26,
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
      "317046": {
        "id": 317046,
        "first_name": "Laura",
        "last_name": "McKenzie",
        "group_id": 6912,
        "active": true,
        "employee_number": 2,
        "salaried": false,
        "exempt": false,
        "username": "lmckenzie",
        "email": "laura_mckenzie@anymail.com",
        "email_verified": false,
        "payroll_id": "SC002",
        "mobile_number": "2085551235",
        "hire_date": "2018-07-02",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T18:33:58+00:00",
        "last_active": "2019-02-09T18:45:39+00:00",
        "created": "2018-10-04T02:25:38+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/ad30131c700cbb1ad59a19879ac66e7e",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2018-10-01",
        "approved_to": "2018-10-01",
        "manager_of_group_ids": [
          6912
        ],
        "require_password_change": false,
        "pay_rate": 12.25,
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
      "317072": {
        "id": 317072,
        "first_name": "Duwayne",
        "last_name": "Jackson",
        "group_id": 6910,
        "active": true,
        "employee_number": 14,
        "salaried": false,
        "exempt": false,
        "username": "djackson",
        "email": "duwayne_jackson@anymail.com",
        "email_verified": false,
        "payroll_id": "SC014",
        "mobile_number": "2085551243",
        "hire_date": "2018-07-09",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T18:33:31+00:00",
        "last_active": "2019-02-09T18:45:38+00:00",
        "created": "2018-10-04T02:32:34+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/d136015ad7d20d180e6903eaffa7624b",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2018-10-01",
        "approved_to": "2018-10-01",
        "manager_of_group_ids": [
          6910
        ],
        "require_password_change": false,
        "pay_rate": 8.25,
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
  "more": false,
  "supplemental_data": {
    "groups": {
      "6908": {
        "id": 6908,
        "active": true,
        "name": "Ride Operators",
        "last_modified": "2019-02-09T18:34:22+00:00",
        "created": "2018-10-04T02:27:15+00:00",
        "manager_ids": [
          "300806",
          "317076"
        ]
      },
      "6910": {
        "id": 6910,
        "active": true,
        "name": "Food Workers",
        "last_modified": "2019-02-09T18:33:31+00:00",
        "created": "2018-10-04T02:27:26+00:00",
        "manager_ids": [
          "300806",
          "317072"
        ]
      },
      "6912": {
        "id": 6912,
        "active": true,
        "name": "Game Attendants",
        "last_modified": "2019-02-09T18:33:58+00:00",
        "created": "2018-10-04T02:27:43+00:00",
        "manager_ids": [
          "300806",
          "317046"
        ]
      }
    },
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

Retrieves a list of all users associated with your company, with optional filters to narrow down the results.

### HTTP Request

`GET https://rest.tsheets.com/api/v1/users`

### Query Parameters
All parameters are **_optional_** and results are unfiltered with respect to any not provided.

Parameter | Type | Format | Default | Description
--------- | ---- | ------- | ------ | -----------
`ids` | _String_ | comma-separated | null | List of user ids to include.
`not_ids` | _String_ | comma-separated | null | List of user ids to exclude.
`employee_numbers` | _String_ | comma-separated | null | List of employee numbers to include.
`usernames` | _String_ | comma-separated | null | List of usernames to include.
`group_ids` | _String_ | comma-separated | null | List of group ids to include.
`not_group_ids` | _String_ | comma-separated | null | List of group ids to exclude.
`payroll_ids` |  _String_ | comma-separated | null | List of payroll ids to filter the included users.
`active` | _String Enum_ | 'yes', 'no' or 'both' | 'yes' | Include only users with given status.
`first_name` | _String_ | wildcardable | '*' | The search pattern for filtering users by first name.
`last_name` | _String_ | wildcardable | '*' | The search pattern for filtering users by last name.
`modified_before` | _DateTime_ | ISO8601 | null | Include only users modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | null | Include only users modified since this date/time.
`supplemental_data` |  _String Enum_ | 'yes' or 'no' | 'yes' | Indicates whether supplemental data should be returned.
`per_page` | _Int_ | 1 - 50 | 50 | The number of results to retrieve per request.
`page` | _Int_ | >= 1 | 1 | The page of results to retrieve.

<aside class="notice">
Wildcard searches start matching from the beginning of the string.
</aside>

