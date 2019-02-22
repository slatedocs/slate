## Retrieve Schedule Events

 > **Example**: Retrieve schedule events from a calendar.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/schedule_events?schedule_calendar_ids=72595&modified_since=2018-01-01T13%3A00%3A00%2B06%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/schedule_events?schedule_calendar_ids=72595&modified_since=2018-01-01T13%3A00%3A00%2B06%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/schedule_events?schedule_calendar_ids=72595&modified_since=2018-01-01T13%3A00%3A00%2B06%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/schedule_events',
  qs: { schedule_calendar_ids: '72595',
        modified_since: '2018-01-01T13:00:00+06:00'
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
$request->setUrl('https://rest.tsheets.com/api/v1/schedule_events');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'schedule_calendar_ids' => '72595',
  'modified_since' => '2018-01-01T13:00:00+06:00'
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

url = URI("https://rest.tsheets.com/api/v1/schedule_events?schedule_calendar_ids=72595&modified_since=2018-01-01T13%3A00%3A00%2B06%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/schedule_events"

querystring = {
  "schedule_calendar_ids":"72595",
  "modified_since":"2018-01-01T13:00:00+06:00"
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

  url := "https://rest.tsheets.com/api/v1/schedule_events?schedule_calendar_ids=72595&modified_since=2018-01-01T13%3A00%3A00%2B06%3A00"

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
    "schedule_events": {
      "894562": {
        "id": 894562,
        "user_id": 1283037,
        "unassigned": false,
        "schedule_calendar_id": 72595,
        "jobcode_id": 17285791,
        "start": "2018-08-08T08:00:00-06:00",
        "end": "2018-08-08T14:00:00-06:00",
        "timezone": "tsMT",
        "notes": "Some Custom Notes",
        "last_modified": "2018-08-09T17:30:54-06:00",
        "created": "2018-07-15T19:08:33-06:00",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        }
      },
      "894588": {
        "id": 894588,
        "user_id": 1283037,
        "unassigned": true,
        "schedule_calendar_id": 72595,
        "jobcode_id": 17285791,
        "start": "2018-08-09T08:00:00-06:00",
        "end": "2018-08-09T14:00:00-06:00",
        "timezone": "tsMT",
        "notes": "Some More Custom Notes",
        "last_modified": "2018-08-09T17:31:23-06:00",
        "created": "2018-07-15T19:08:34-06:00"
      }
    },
    "more": false,
    "supplemental_data": {
      "jobcodes": {
        "17285791": {
          "id": 17285791,
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
        "1283037": {
          "id": 1283037,
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
          "last_active": "2018-07-30T20:06:13+00:00",
          "created": "2018-05-28T20:23:44+00:00",
          "mobile_number": ""
        },
        "customfields": {
          "19142": {
            "id": 19142,
            "required": false,
            "type": "timesheet",
            "ui_preference": "managed-list",
            "short_code": "cf1",
            "regex_filter": "",
            "name": "Custom Field 1",
            "last_modified": "2018-07-26T18:58:23+00:00",
            "created": "2018-07-23T23:09:14+00:00"
          },
          "19144": {
            "id": 19144,
            "required": false,
            "type": "timesheet",
            "ui_preference": "managed-list",
            "short_code": "cf2",
            "regex_filter": "",
            "name": "Custom Field 2",
            "last_modified": "2018-07-26T18:58:32+00:00",
            "created": "2018-07-23T23:09:32+00:00"
          }
        }
      }
    }
  }
```

Retrieves a list of schedule events associated with your employees, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/schedule_events</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>required (unless `modified_before`, `modified_since`, or `start` are set) | _Int_ | Comma separated list of one or more schedule event ids you'd like to filter on. Only schedule events with an id set to one of these values will be returned. |
| **users_ids**<br/>optional | _Int_ | Comma-separated list of one or more user ids to retrieve schedule events for. |
| **schedule_calendar_ids**<br/>required | _Int_ | Comma separated list of one or more schedule calendar ids you'd like to filter on. Only schedule events with a schedule calendar id set to one of these values will be returned. |
| **jobcode_ids**<br/>optional | _Int_ | A comma-separated string of jobcode ids. Only schedule events with these jobcodes will be returned. |
| **start**<br/>required (unless `ids`, `modified_before`, or `modified_since` are set) | _String_ | Only schedule events starting on or after this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **end**<br/>optional | _String_ | Only schedule events ending on or before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **active**<br/>optional | _String_ | 'yes', 'no' or 'both'. Default is 'both'. Only schedule events whose active state match the requested filter will be returned. |
| **draft**<br/>optional | _String_ | 'yes', 'no' or 'both'. Default is 'no'. Only schedule events whose draft state match the requested filter will be returned. |
| **team_events**<br/>optional | _String_ | 'base' or 'instance'. Default is 'instance'. If 'instance' is specified, events that are assigned to multiple users will be returned as individual single events for each assigned user. If 'base' is specified, events that are assigned to multiple users will be returned as one combined event for all assignees. |
| **modified_before**<br/>required (unless `ids`, `modified_since`, or `start` are set) | _String_ | Only schedule events modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>required (unless `ids`, `modified_before`, or `start` are set) | _String_ | Only schedule events modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

