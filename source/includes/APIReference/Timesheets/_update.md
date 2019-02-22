## Update Timesheets

 > **Example**: Change some information for each of these timesheets. 

 > Request Body

```json
{
  "data": [{
    "id": 136022168,
    "end": "2018-08-08T14:00:00-07:00",
    "jobcode_id": "18081060"
  }, {
    "id": 136022240,
    "date": "2018-08-08",
    "duration": 15552
  }]
}
```

 > Request

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/timesheets \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets");
var request = new RestRequest(Method.PUT);
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
  .url("https://rest.tsheets.com/api/v1/timesheets")
  .put(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
  url: 'https://rest.tsheets.com/api/v1/timesheets',
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
$request->setUrl('https://rest.tsheets.com/api/v1/timesheets');
$request->setMethod(HTTP_METH_PUT);

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

url = URI("https://rest.tsheets.com/api/v1/timesheets")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Bearer <TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/timesheets"

payload = "<REQUEST BODY>"
headers = {
    'Authorization': "Bearer <TOKEN>",
    'Content-Type': "application/json"
    }

response = requests.request("PUT", url, data=payload, headers=headers)

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

  url := "https://rest.tsheets.com/api/v1/timesheets"

  payload := strings.NewReader("<REQUEST BODY>")

  req, _ := http.NewRequest("PUT", url, payload)

  req.Header.Add("Authorization", "Bearer <TOKEN>")
  req.Header.Add("Content-Type", "application/json")

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
    "timesheets": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 136022168,
        "user_id": 1242509,
        "jobcode_id": 18081060,
        "start": "2018-08-08T09:00:00-06:00",
        "end": "2018-08-08T15:00:00-06:00",
        "duration": 21600,
        "date": "2018-08-08",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "",
          "19144": ""
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "2018-08-09T21:30:10+00:00"
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 136022240,
        "user_id": 1242515,
        "jobcode_id": 0,
        "start": "2018-08-08T08:00:00-06:00",
        "end": "2018-08-08T12:19:12-06:00",
        "duration": 15552,
        "date": "2018-08-08",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "",
        "customfields": {
          "19142": "",
          "19144": ""
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "2018-08-09T21:30:12+00:00"
      }
    }
  },
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
        "created": "2018-07-23T22:41:02+00:00"
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
        "last_active": "2018-08-09T21:30:10+00:00",
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
        "last_active": "2018-08-09T17:30:41+00:00",
        "created": "2018-05-28T20:23:44+00:00",
        "mobile_number": ""
      }
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
    },
    "files": {
      "50692": {
        "id": 50692,
        "uploaded_by_user_id": 1242515,
        "file_name": "minion.jpg",
        "active": true,
        "size": 54839,
        "last_modified": "2017-08-23T19:12:18+00:00",
        "created": "2017-08-23T19:12:18+00:00",
        "linked_objects": {
          "timesheets": [
            "136022168",
            "136022240"
          ]
        },
        "meta_data": {
          "file_description": "Ba-ba-ba-ba-ba-nana"
        }
      },
      "44878": {
        "id": 44878,
        "uploaded_by_user_id": 1242515,
        "file_name": "minion.jpg",
        "active": true,
        "size": 14336,
        "last_modified": "2017-08-24T00:09:32+00:00",
        "created": "2017-08-24T00:09:32+00:00",
        "linked_objects": {
          "timesheets": [
            "136022168",
            "136022240"
          ]
        },
        "meta_data": {
          "file_description": "Ba-ba-ba-ba-ba-nana"
        }
      }
    }
  }
}
```

Edit one or more timesheets in your company.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/timesheets</api>

### Properties
_Pass an array of timesheet objects as the value to a 'data' property (see example)._

When editing a [timesheet](#the-timesheet-object), you must uniquely identify the timesheet by passing in its id. All other properties defined below may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

<br/>
**All Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Timesheet id of the timesheet that you are going to edit. |
| **jobcode_id**<br/>optional | _Int_ | Jobcode id that you'd like this timesheet to be recorded against. |
| **notes**<br/>optional | _String_ | Notes you'd like associated with this timesheet. |
| **customfields**<br/>optional | _JSON Object_ | A key/value map of customfield ids to the customfield items that are associated with the timesheet. _(See note below)_ |
| **attached_files**<br/>optional | _Array_ | Ids of files attached to this timesheet. |

<br/>
**Regular Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **start**<br/>optional | _String_ | Start time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. |
| **end**<br/>optional | _String_ | End time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. Enter an empty string to make the timesheet active. |
| **origin_hint_start**<br/>optional | _String_ | This is a string that will be logged as part of the timesheet history when someone is put on the clock, or a timesheet is created with both start and end. |
| **origin_hint_end**<br/>optional | _String_ | This is a string that will be logged as part of the timesheet history when someone is taken off the clock, or a timesheet is created with both start and end. |

<br/>
**Manual Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **duration**<br/>optional | _Int_ | Number of seconds that you'd like to record against this manual timesheet. Will get converted to hours, rounded to the nearest 2 decimal places when the timesheet is saved. |
| **date**<br/>optional | _String_ | `YYYY-MM-DD` formatted date string. Date you'd like the manual timesheet recorded against. |

### Status Codes
Each timesheet that is edited will come back with a `_status_code` and `_status_message` that will indicate whether the timesheet was edited successfully. If there was a problem editing a timesheet, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Timesheet was edited successfully. |
| <code class="level200">201</code> | Fulfilled. Timesheet was created successfully. Other timesheets may have been modified as a result (i.e. due to timesheet splits or an automatic Lunch Break). Be sure to process entries for `timesheets` or `timesheets_deleted` in the `supplemental_data` portion of the response. |
| <code class="level400">404</code> | Not Found. Timesheet either has never existed or has been deleted. |
| <code class="level400">409</code> | Conflict. Because a conflict would have resulted in the change requested, the timesheet was not modified. The unmodified timesheet's properties will be included in the response, to make it easy to revert to the unmodified version of the timesheet. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this timesheet. See the `_status_extra` value for more detail. |

<aside class="notice">
The customfields property is only applicable if the <i>Advanced Tracking Add-on</i> is installed.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> timesheets. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

