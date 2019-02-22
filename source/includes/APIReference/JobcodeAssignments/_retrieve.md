## Retrieve Jobcode Assignments

 > **Example**: Retrieve a list of all jobcode assignments for a given `user_id`. 

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcode_assignments?user_ids=1234"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcode_assignments?user_ids=1234");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcode_assignments?user_ids=1234")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcode_assignments',
  qs: { user_ids: '1234'
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcode_assignments');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'user_ids' => '1234'
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

url = URI("https://rest.tsheets.com/api/v1/jobcode_assignments?user_ids=1234")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcode_assignments"

querystring = {
  "user_ids":"1234"
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

  url := "https://rest.tsheets.com/api/v1/jobcode_assignments?user_ids=1234"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
      "26881275": {
        "id": 26881275,
        "user_id": 1242515,
        "jobcode_id": 17285791,
        "active": true,
        "last_modified": "",
        "created": ""
      },
      "26881277": {
        "id": 26881277,
        "user_id": 1242515,
        "jobcode_id": 17285793,
        "active": true,
        "last_modified": "",
        "created": ""
      },
      "26881273": {
        "id": 26881273,
        "user_id": 1242515,
        "jobcode_id": 17285795,
        "active": true,
        "last_modified": "",
        "created": ""
      },
      "26881271": {
        "id": 26881271,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "active": true,
        "last_modified": "",
        "created": ""
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "users": {
      "1242515": {
        "id": 1242515,
        "first_name": "Alexander",
        "last_name": "Luzzana",
        "group_id": 144959,
        "active": true,
        "employee_number": 4,
        "salaried": true,
        "exempt": false,
        "username": "aluzzana",
        "email": "garrett@tsheets.com",
        "payroll_id": "4",
        "hire_date": "2012-07-01",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:52:00+00:00",
        "last_active": "2018-07-01T22:51:28+00:00",
        "created": "2018-05-28T20:23:44+00:00",
        "mobile_number": ""
      }
    },
    "jobcodes": {
      "17285791": {
        "id": 17285791,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Sick",
        "last_modified": "2018-05-28T17:49:24+00:00",
        "created": "2018-05-28T17:49:24+00:00"
      },
      "17285793": {
        "id": 17285793,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Vacation",
        "last_modified": "2018-05-28T17:49:24+00:00",
        "created": "2018-05-28T17:49:24+00:00"
      },
      "17285795": {
        "id": 17285795,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Holiday",
        "last_modified": "2018-05-28T17:49:24+00:00",
        "created": "2018-05-28T17:49:24+00:00"
      },
      "17288283": {
        "id": 17288283,
        "parent_id": 0,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "dev",
        "name": "Development Team",
        "last_modified": "2018-05-28T20:19:33+00:00",
        "created": "2018-05-28T20:19:33+00:00"
      }
    }
  }
}
```

 > **Example**: Retrieve a list of all jobcode assignments modified since a particular date. Set pagination to 10 results/page. Currently logged in user's id will be used, since none is specified in the request.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/jobcode_assignments?modified_since=2018-03-01T00%3A00%3A00-0600&per_page=10"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcode_assignments?modified_since=2018-03-01T00%3A00%3A00-0600&per_page=10");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcode_assignments?modified_since=2018-03-01T00%3A00%3A00-0600&per_page=10")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/jobcode_assignments',
  qs: { modified_since: '2018-03-01T00:00:00-0600',
        per_page: '10'
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcode_assignments');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2018-03-01T00:00:00-0600',
  'per_page' => '10'
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

url = URI("https://rest.tsheets.com/api/v1/jobcode_assignments?modified_since=2018-03-01T00%3A00%3A00-0600&per_page=10")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcode_assignments"

querystring = {
  "modified_since":"2018-03-01T00:00:00-0600",
  "per_page":"10"
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

  url := "https://rest.tsheets.com/api/v1/jobcode_assignments?modified_since=2018-03-01T00%3A00%3A00-0600&per_page=10"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
      "27569720": {
        "id": 27569720,
        "user_id": 0,
        "jobcode_id": 18081060,
        "active": true,
        "last_modified": "2018-07-24T18:18:37+00:00",
        "created": "2018-07-24T18:18:37+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "jobcodes": {
      "18081060": {
        "id": 18081060,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "test",
        "name": "Test",
        "last_modified": "2018-07-24T18:18:36+00:00",
        "created": "2018-07-23T22:41:02+00:00",
        "locations": []
      }
    }
  }
}
```

Retrieves a list of all jobcode assignments associated with users, with optional filters to narrow down the results. Note that jobcodes with the property `assigned_to_all` set to _true_ will always be considered assigned to any given user. `assigned_to_all` jobcode assignments are indicated by a `user_id` value of _0_ in the results. Also note that only active jobcodes will be considered assigned, as once a jobcode is archived, it is no longer available for selection for time entry.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/jobcode_assignments</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **user_ids**<br/>optional | _Int_ | Comma separated string of one or more user ids for whom you'd like to retrieve jobcode assignments. If none are specified, all jobcode assignments (which you have rights to view) will be returned. Only jobcode assignments belonging to these `user_ids` or where the jobcode `assigned_to_all` property is _true_ will be returned. Results where `assigned_to_all` is _true_ for a jobcode are indicated by a `user_id` value of _0_ for the `jobcode_assignment` object. To view jobcode assignments for users other than yourself you must be an admin or a group manager or have the `manage_users` permission or the `manage_jobcodes` permission. |
| **type**<br/>optional | _String_ | Refers to the jobcode type - 'regular', 'pto', 'unpaid_break', 'paid_break', or 'all'. Defaults to 'regular'. |
| **jobcode_id**<br/>optional | _Int_ | If specified, only assignments for jobcodes with the given id are returned. |
| **jobcode_parent_id**<br/>optional | _Int_ | When omitted, all jobcode assignments are returned regardless of jobcode parent. If specified, only assignments for jobcodes with the given jobcode `parent_id` are returned. To get a list of only top-level jobcode assignments, pass in a `jobcode_parent_id` of _0_. |
| **active**<br/>optional | _String_ | 'yes', 'no, or 'both'. Default is 'both'. 'yes' means the assignment is active, 'no' means it is deleted/inactive. |
| **modified_before**<br/>optional | _String_ | Only jobcode assignments modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only jobcode assignments modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

