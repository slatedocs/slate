## Retrieve Groups

 > **Example**: Retrieve a list of all active groups.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/groups"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/groups");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/groups")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/groups',
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
$request->setUrl('https://rest.tsheets.com/api/v1/groups');
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

url = URI("https://rest.tsheets.com/api/v1/groups")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/groups"

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

  url := "https://rest.tsheets.com/api/v1/groups"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of groups with a given id. Set pagination to 30 results/page.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/groups?id=6%2C16&per_page=30"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/groups?id=6%2C16&per_page=30");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/groups?id=6%2C16&per_page=30")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/groups',
  qs: { id: '6,16',
        per_page: '30'
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
$request->setUrl('https://rest.tsheets.com/api/v1/groups');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'id' => '6,16',
  'per_page' => '30'
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

url = URI("https://rest.tsheets.com/api/v1/groups?id=6%2C16&per_page=30")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/groups"

querystring = {
  "id":"6,16",
  "per_page":"30"
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

  url := "https://rest.tsheets.com/api/v1/groups?id=6%2C16&per_page=30"

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
    "groups": {
      "6": {
        "id": 6,
        "active": true,
        "name": "Group 1",
        "last_modified": "2018-08-19T16:29:28+00:00",
        "created": "2018-08-19T16:29:28+00:00",
        "manager_ids": [
          "300",
          "316"
        ]
      },
      "8": {
        "id": 8,
        "active": true,
        "name": "Group 2",
        "last_modified": "2018-08-19T16:29:35+00:00",
        "created": "2018-08-19T16:29:35+00:00",
        "manager_ids": [
          "316"
        ]
      },
      "16": {
        "id": 16,
        "active": true,
        "name": "Group 3",
        "last_modified": "2018-08-20T23:22:13+00:00",
        "created": "2018-08-20T23:22:13+00:00",
        "manager_ids": []
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
          "manage_schedules": true,
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
          "manage_schedules": true,
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

Retrieves a list of all groups associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/groups</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more group ids you'd like to filter on. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **manager_ids**<br/>optional | _Int_ | Comma separated list of one or more manager ids you'd like to filter on. |
| **name**<br/>optional | _String_ | Comma separated list of one or more group names you'd like to filter on. |
| **modified_before**<br/>optional | _String_ | Only groups modified before this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **modified_since**<br/>optional | _String_ | Only groups modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. |