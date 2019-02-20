## Retrieve Files

> **Examples**

> Retrieve a list of all files.

```shell
curl "https://rest.tsheets.com/api/v1/files"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/files")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/files',
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
$request->setUrl('https://rest.tsheets.com/api/v1/files');
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

url = URI("https://rest.tsheets.com/api/v1/files")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/files"

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

  url := "https://rest.tsheets.com/api/v1/files"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of all files (active or deleted) linked to timesheet with specific id.

```shell
curl "https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=1757985"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=1757985");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=1757985")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/files',
  qs: { linked_object_type: 'timesheet',
        object_ids: '1757985'
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
$request->setUrl('https://rest.tsheets.com/api/v1/files');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'linked_object_type' => 'timesheet',
  'object_ids' => '1757985'
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

url = URI("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=1757985")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/files"

querystring = {
  "linked_object_type":"timesheet",
  "object_ids":"1757985"
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

  url := "https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=1757985"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> The above command returns JSON with the following structure:

```json
{
  "results": {
    "files": {
      "1757985": {
        "id": 1757985,
        "uploaded_by_user_id": 317046,
        "file_name": "IMG3567.png",
        "active": true,
        "size": 3581,
        "last_modified": "2019-02-13T00:50:51+00:00",
        "created": "2019-02-13T00:50:51+00:00",
        "linked_objects": {
          "timesheets": [
            "19931296"
          ]
        },
        "meta_data": {
          "file_description": "Woodland Theater Audience",
          "image_rotation": "90"
        }
      }      
    }
  },
  "supplemental_data": {
    "users": {
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
        "last_active": "2019-02-13T00:17:29+00:00",
        "created": "2018-10-04T02:25:38+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/ad30131c700cbb1ad59a19879ac66e7e",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2018-02-08",
        "approved_to": "2019-02-08",
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
      }
    },
    "timesheets": {
      "19931296": {
        "id": 19931296,
        "user_id": 317046,
        "jobcode_id": 20608085,
        "start": "2019-02-08T07:33:00-07:00",
        "end": "2019-02-08T19:26:08-07:00",
        "duration": 42788,
        "date": "2019-02-08",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Boise, ID?)",
        "on_the_clock": false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "134913": "Proficient",
          "143369": "Jungle Safari",
          "143377": "30"
        },
        "last_modified": "2019-02-13T00:17:29+00:00",
        "attached_files": [
          1757985
        ]
      }
    }
  }
}
```

Retrieves a list of all uploaded files, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/files</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more file ids you'd like to filter on. |
| **uploaded_by_user_ids**<br/>optional | _Int_ | Comma separated list of one or more user ids you'd like to filter on. Only files uploaded by these users will be returned. If `uploaded_by_user_ids` is not set, it will default to return files uploaded by the current user making the api request. |
| **linked_object_type**<br/>optional | _String_ | Only files linked to this object type are returned. Allowed values: 'timesheet'. |
| **object_ids**<br/>optional | _Int_ | Comma separated list of one or more linked object ids you'd like to filter on. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **modified_before**<br/>optional | _String_ | Only files modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only files modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

 <aside class="notice">
Parameters `linked_object_type` and `object_ids` are mutually inclusive.  Both or neither must be provided.
</aside>

 <aside class="notice">
If <code>uploaded_by_user_ids</code> is not set, the list of files uploaded by the current user making the api request will be returned.
</aside>
