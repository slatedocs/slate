## Retrieve Timesheets Deleted

 > **Example**: Retrieve a list of timesheets that have been deleted since a given date.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets_deleted?modified_since=2018-08-04T00%3A00%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets_deleted?modified_since=2018-08-04T00%3A00%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets_deleted?modified_since=2018-08-04T00%3A00%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets_deleted',
  qs: { modified_since: '2018-08-04T00:00:00%2B00:00'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets_deleted');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2018-08-04T00:00:00%2B00:00'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets_deleted?modified_since=2018-08-04T00%3A00%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets_deleted"

querystring = {
  "modified_since":"2018-08-04T00:00:00%2B00:00"
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

  url := "https://rest.tsheets.com/api/v1/timesheets_deleted?modified_since=2018-08-04T00%3A00%3A00%252B00%3A00"

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
    "timesheets_deleted": {
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
        "active": "0",
        "locked": 0,
        "notes": "",
        "last_modified": "2018-08-05T21:21:55+00:00"
      },
      "135288102": {
        "id": 135288102,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-22T13:05:00-06:00",
        "end": "2018-07-22T18:07:00-06:00",
        "duration": 18120,
        "date": "2018-07-22",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "",
        "last_modified": "2018-08-05T21:20:11+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "jobcodes": {
      "18080900": {
        "id": 18080900,
        "parent_id": 17288279,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Customer10",
        "last_modified": "2018-07-23T22:31:28+00:00",
        "created": "2018-07-23T22:31:28+00:00"
      },
      "17288279": {
        "id": 17288279,
        "parent_id": 0,
        "assigned_to_all": false,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": true,
        "billable_rate": 0,
        "short_code": "asm",
        "name": "Assembly Line",
        "last_modified": "2018-07-24T19:05:46+00:00",
        "created": "2018-05-28T20:18:17+00:00"
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
        "last_modified": "2018-07-24T19:05:53+00:00",
        "created": "2018-05-28T20:19:33+00:00"
      }
    },
    "users": {
      "1242509": {
        "id": 1242509,
        "first_name": "Courtney",
        "last_name": "Ballenger",
        "group_id": 144961,
        "active": true,
        "employee_number": 1,
        "salaried": false,
        "exempt": false,
        "username": "cballenger",
        "email": "garrett@tsheets.com",
        "payroll_id": "1",
        "hire_date": "2018-05-28",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:52:36+00:00",
        "last_active": "2018-08-05T19:38:54+00:00",
        "created": "2018-05-28T20:14:53+00:00",
        "mobile_number": ""
      },
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
        "last_active": "2018-08-05T19:38:42+00:00",
        "created": "2018-05-28T20:23:44+00:00",
        "mobile_number": ""
      }
    }
  }
}
```

 > **Example**: Retrieve a list of deleted timesheets that were created within a range of dates.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets_deleted?start_date=2018-08-01&end_date=2018-08-08"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets_deleted?start_date=2018-08-01&end_date=2018-08-08");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets_deleted?start_date=2018-08-01&end_date=2018-08-08")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets_deleted',
  qs: { start_date: '2018-08-01',
        end_date: '2018-08-08'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets_deleted');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'start_date' => '2018-08-01',
  'end_date' => '2018-08-08'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets_deleted?start_date=2018-08-01&end_date=2018-08-08")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets_deleted"

querystring = {
  "start_date":"2018-08-01",
  "end_date":"2018-08-08"
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

  url := "https://rest.tsheets.com/api/v1/timesheets_deleted?start_date=2018-08-01&end_date=2018-08-08"

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
    "timesheets_deleted": {
      "136022048": {
        "id": 136022048,
        "user_id": 1242325,
        "jobcode_id": 0,
        "start": "2018-08-08T08:00:00-06:00",
        "end": "2018-08-08T14:00:00-06:00",
        "duration": 21600,
        "date": "2018-08-08",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "",
        "last_modified": "2018-08-09T17:30:54+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "users": {
      "1242325": {
        "id": 1242325,
        "first_name": "Garrett",
        "last_name": "Mick",
        "group_id": 144959,
        "active": true,
        "employee_number": 0,
        "salaried": true,
        "exempt": false,
        "username": "gmick",
        "email": "garrett@tsheets.com",
        "payroll_id": "0",
        "hire_date": "2018-05-28",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:51:49+00:00",
        "last_active": "2018-08-09T21:20:34+00:00",
        "created": "2018-05-28T17:49:24+00:00",
        "mobile_number": "2085550352"
      }
    }
  }
}
```

 > **Example**: Retrieve a list of deleted timesheets with the specified ids.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/timesheets_deleted?ids=136022048"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets_deleted?ids=136022048");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/timesheets_deleted?ids=136022048")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/timesheets_deleted',
  qs: { ids: '136022048'
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets_deleted');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'ids' => '136022048'
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

url = URI("https://rest.tsheets.com/api/v1/timesheets_deleted?ids=136022048")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets_deleted"

querystring = {
  "ids":"136022048"
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

  url := "https://rest.tsheets.com/api/v1/timesheets_deleted?ids=136022048"

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
    "timesheets_deleted": {
      "136022048": {
        "id": 136022048,
        "user_id": 1242325,
        "jobcode_id": 0,
        "start": "2018-08-08T08:00:00-06:00",
        "end": "2018-08-08T14:00:00-06:00",
        "duration": 21600,
        "date": "2018-08-08",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "",
        "last_modified": "2018-08-09T17:30:54+00:00"
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "users": {
      "1242325": {
        "id": 1242325,
        "first_name": "Garrett",
        "last_name": "Mick",
        "group_id": 144959,
        "active": true,
        "employee_number": 0,
        "salaried": true,
        "exempt": false,
        "username": "gmick",
        "email": "garrett@tsheets.com",
        "payroll_id": "0",
        "hire_date": "2018-05-28",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T15:51:49+00:00",
        "last_active": "2018-08-09T21:20:34+00:00",
        "created": "2018-05-28T17:49:24+00:00",
        "mobile_number": "2085550352"
      }
    }
  }
}
```

Gets deleted timesheets records.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/timesheets_deleted</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **start_date**<br/>required (unless `modified_before`, `modified_since`, or `ids` is set) | _String_ | `YYYY-MM-DD` formatted date. Beginning date for the report data (based off the date the timesheets were created for). |
| **end_date**<br/>required (unless `modified_before`, `modified_since`, or `ids` is set) | _String_ | `YYYY-MM-DD` formatted date. Ending date for the report data (based off the date the timesheets were created for). |
| **ids**<br/>required (unless `modified_before`, `modified_since`, or `start_date` and `end_date` are set) | _String_ | Timesheet ids. This can be a single id, an array of ids, or a comma-separated string of ids. '' by default. |
| **modified_since**<br/>required (unless `modified_before`, `ids`, or `start_date` and `end_date`  are set) | _String_ | Only timesheets deleted since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_before**<br/>required (unless `modified_since`, `ids`, or `start_date` and `end_date`  are set) | _String_ | Only timesheets deleted before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **group_ids**<br/>optional | _String_ | This can be a single id, an array of ids, or a comma-separated string of ids. If present, only timesheets associated with the specified group(s) will be returned. '' by default. |
| **user_ids**<br/>optional | _String_ | This can be a single id, an array of ids, or a comma-separated string of ids. If present, only timesheets associated with the specified user(s) will be returned. '' by default. |
| **username**<br/>optional | _String_ | If present, only timesheets associated with the specified username will be returned. Overrides `user_ids` and `group_ids`. '' by default. |
| **jobcode_ids**<br/>optional | _String_ | This can be a single id, an array of ids, or a comma-separated string of ids. If present, only timesheets recorded against the specified jobcode(s) and any children will be returned. '' by default. |
| **jobcode_type**<br/>optional | _String_ | 'regular', 'pto', 'paid_break', 'unpaid_break', or 'all'. Default is 'all'. Only timesheets linked to a jobcode of the given type are returned. |
| **type**<br/>optional | _String_ | 'manual', 'regular', or 'both'. 'both' is the default. |
| **order_results_by**<br/>optional | _String_ | 'fname', 'lname', 'username', or 'date'. 'date' is the default. All are secondarily sorted by 'date', unless 'date' is the choice, in which case 'date' is the only field the timesheets are sorted by. |
| **order_results_reverse**<br/>optional | _Boolean_ | 1 or 0. If set to 1, then results are returned in reverse order by whatever they're sorted on. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |

