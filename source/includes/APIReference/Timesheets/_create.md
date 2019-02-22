## Create Timesheets

 > **Example**: Create three new timesheets (one manual and two regular). Two succeed. The third fails because of an overlap with an existing timesheet.

 > Request Body

```json
{
 "data":
  [
    {
     "user_id":1242515,
     "type":"regular",
     "start":"2018-07-23T10:00:00-07:00",
     "end":"2018-07-23T13:10:23-07:00",
     "jobcode_id":"17288283",
     "notes":"This is a test of the emergency broadcast system",
     "customfields": {
      "19142":"Item 1",
      "19144":"Item 2"
     },
     "attached_files": [
      50692,
      44878       
     ],
    },
    {
     "user_id":1242515,
     "type":"regular",
     "start":"2018-07-25T09:30:00-07:00",
     "end":"2018-07-25T13:10:23-07:00",
     "jobcode_id":"17288283",
     "notes":"This is a test",
     "customfields": {
      "19142":"Item 1",
      "19144":"Item 2"
     }
     "attached_files": [
      50692,
      44878       
     ],
    },
    {
     "user_id":1242515,
     "type":"manual",
     "date":"2018-07-23",
     "duration":"15552",
     "jobcode_id":"17288283",
     "notes":"This is a test of a manual time entry",
     "customfields": {
      "19142":"Item 1",
      "19144":"Item 2"
     }
    }
  ]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/timesheets \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/timesheets");
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
  .url("https://rest.tsheets.com/api/v1/timesheets")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
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

url = URI("https://rest.tsheets.com/api/v1/timesheets")

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

url = "https://rest.tsheets.com/api/v1/timesheets"

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

  url := "https://rest.tsheets.com/api/v1/timesheets"

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

> Response<br/><i>(example will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "timesheets": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 135653104,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-23T11:00:00-06:00",
        "end": "2018-07-23T14:10:23-06:00",
        "duration": 11423,
        "date": "2018-07-23",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "This is a test of the emergency broadcast system",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 135653106,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-25T10:30:00-06:00",
        "end": "2018-07-25T14:10:23-06:00",
        "duration": 13223,
        "date": "2018-07-25",
        "tz": -7,
        "tz_str": "tsMT",
        "type": "regular",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "This is a test",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [
          50692,
          44878
        ],
        "last_modified": "1970-01-01T00:00:00+00:00"
      },
      "3": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 135653108,
        "user_id": 1242515,
        "jobcode_id": 17288283,
        "start": "2018-07-23T08:00:00-06:00",
        "end": "2018-07-23T12:19:12-06:00",
        "duration": 15552,
        "date": "2018-07-23",
        "tz": -6,
        "tz_str": "tsMT",
        "type": "manual",
        "location": "(Eagle, ID?)",
        "active": "0",
        "locked": 0,
        "notes": "This is a test of a manual time entry",
        "customfields": {
          "19142": "Item 1",
          "19144": "Item 2"
        },
        "attached_files": [],
        "last_modified": "1970-01-01T00:00:00+00:00"
      }
    }
  },
  "supplemental_data": {
    "jobcodes": {
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
        "last_active": "2018-08-01T22:17:47+00:00",
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
        "file_name": "selfie.jpg",
        "active": true,
        "size": 54839,
        "last_modified": "2017-08-23T19:12:18+00:00",
        "created": "2017-08-23T19:12:18+00:00",
        "linked_objects": {
          "timesheets": [
            "135653104",
            "135653106"
          ]
        },
        "meta_data": {
          "file_description": "image file"
        }
      },
      "44878": {
        "id": 44878,
        "uploaded_by_user_id": 1242515,
        "file_name": "selfie.jpg",
        "active": true,
        "size": 14336,
        "last_modified": "2017-08-24T00:09:32+00:00",
        "created": "2017-08-24T00:09:32+00:00",
        "linked_objects": {
          "timesheets": [
            "135653104",
            "135653106"
          ]
        },
        "meta_data": {
          "file_description": "image file"
        }
      }
    }
  }
}
```

Add one or more timesheets to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/timesheets</api>

### Properties
_Pass an array of timesheet objects as the value to a 'data' property (see example)._

<br/>
**All Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>required | _Int_ | User id that this timesheet will be recorded against. |
| **jobcode_id**<br/>required | _Int_ | Jobcode id that you'd like this timesheet to be recorded against. |
| **type**<br/>required | _String_ | Either 'regular' or 'manual'. |

<br/>
**Regular Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **start**<br/>required | _String_ | Start time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. |
| **end**<br/>required | _String_ | End time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. |

<br/>
**Manual Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **duration**<br/>required | _Int_ | Number of seconds that you'd like to record against this manual timesheet. Will get converted to hours, rounded to the nearest 2 decimal places when the timesheet is saved. |
| **date**<br/>required | _String_ | `YYYY-MM-DD` formatted date string. Date you'd like the manual timesheet recorded against. |

For a full list of the properties that may be set on a timesheet, see the [Timesheet object](#the-timesheet-object).

### Status Codes
Each timesheet that is created will come back with a `_status_code` and `_status_message` that will indicate whether the timesheet was created successfully. If there was a problem creating a timesheet, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Timesheet was created successfully. |
| <code class="level200">201</code> | Fulfilled. Timesheet was created successfully. Other timesheets may have been modified as a result (i.e. due to timesheet splits or an automatic Lunch Break). Be sure to process entries for `timesheets` or `timesheets_deleted` in the `supplemental_data` portion of the response. |
| <code class="level400">406</code> | Not Acceptable. Conflict exists with another timesheet. See the `_status_extra` value for more detail. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this timesheet. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> timesheets. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>