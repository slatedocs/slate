## Retrieve Files

 > **Example**: Retrieve a list of all files.

 > Request

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

 > **Example**: Retrieve a list of all files (active or deleted) linked to timesheet with given id

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=21718670"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=21718670");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=21718670")
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
        object_ids: '21718670'
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
  'object_ids' => '21718670'
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

url = URI("https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=21718670")

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
  "object_ids":"21718670"
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

  url := "https://rest.tsheets.com/api/v1/files?linked_object_type=timesheet&object_ids=21718670"

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
    "files": {
      "44878": {
        "id": 44878,
        "uploaded_by_user_id": 19128,
        "file_name": "tsheets.jpeg",
        "active": true,
        "size": 7890,
        "last_modified": "2018-07-03T17:46:58+00:00",
        "created": "2018-07-03T17:46:58+00:00",
        "linked_objects": {
          "timesheets": [
            "135288482",
            "135288514",
            "135288460"
          ]
        },
        "meta_data": {
          "file_description": "Excellent app to track time"
        }
      },
      "44174": {
        "id": 44174,
        "uploaded_by_user_id": 19128,
        "file_name": "relentless.jpeg",
        "active": true,
        "size": 34900,
        "last_modified": "2018-07-03T17:47:53+00:00",
        "created": "2018-07-03T17:47:53+00:00",
        "linked_objects": [],
        "meta_data": {
          "file_description": "Passionate about our clients success!"
        }
      },
      "50692": {
        "id": 50692,
        "uploaded_by_user_id": 19128,
        "file_name": "healthy.jpg",
        "active": true,
        "size": 4560,
        "last_modified": "2018-08-24T00:09:32+00:00",
        "created": "2018-08-24T00:09:32+00:00",
        "linked_objects": {
          "timesheets": [
            "135288482",
            "135288514",
            "135288460"
          ]
        },
        "meta_data": {
          "file_description": "Work hard period play hard period!"
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
        "approved_to": "2018-01-15",
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
    },
    "timesheets": {
      "135288482": {
        "id": 135288482,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-16T09:04:00-06:00",
        "end": "2018-07-16T15:57:00-06:00",
        "duration": 24780,
        "date": "2018-07-16",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock": false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00",
        "created": "1970-01-01T00:00:00+00:00"
      },
      "135288514": {
        "id": 135288514,
        "user_id": 1242509,
        "jobcode_id": 18080900,
        "start": "2018-07-16T13:07:00-06:00",
        "end": "2018-07-16T17:29:00-06:00",
        "duration": 15720,
        "date": "2018-07-16",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock": false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00",
        "created": "1970-01-01T00:00:00+00:00"
      },
      "135288460": {
        "id": 135288460,
        "user_id": 1242509,
        "jobcode_id": 18080900,
        "start": "2018-07-18T08:09:00-06:00",
        "end": "2018-07-18T14:58:00-06:00",
        "duration": 24540,
        "date": "2018-07-18",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "on_the_clock": false,
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00",
        "created": "1970-01-01T00:00:00+00:00"
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
