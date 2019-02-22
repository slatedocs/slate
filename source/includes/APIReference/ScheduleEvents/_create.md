## Create Schedule Events

 > **Example**: Create two new events: one unassigned, and the second assigned to two users.

 > Request Body

```json
{
  "data": [{
    "schedule_calendar_id": 5,
    "start": "2018-12-05T16:00:00+00:00",
    "end": "2018-12-05T18:00:00+00:00",
    "assigned_user_ids": "",
    "title": "unassigned event",
    "draft": true,
    "active": true
  }, {
    "schedule_calendar_id": 5,
    "start": "2018-12-05T16:00:00+00:00",
    "end": "2018-12-05T18:00:00+00:00",
    "assigned_user_ids": [11, 1365],
    "title": "assigned to multiple",
    "draft": true,
    "active": true
  }],
  "team_events": "base"
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/schedule_events \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/schedule_events");
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
  .url("https://rest.tsheets.com/api/v1/schedule_events")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/schedule_events',
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
$request->setUrl('https://rest.tsheets.com/api/v1/schedule_events');
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

url = URI("https://rest.tsheets.com/api/v1/schedule_events")

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

url = "https://rest.tsheets.com/api/v1/schedule_events"

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

  url := "https://rest.tsheets.com/api/v1/schedule_events"

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
    "schedule_events": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2816373,
        "user_id": 11,
        "unassigned": true,
        "schedule_calendar_id": 5,
        "jobcode_id": 0,
        "all_day": false,
        "start": "2018-12-05T16:00:00+00:00",
        "end": "2018-12-05T18:00:00+00:00",
        "active": true,
        "draft": true,
        "timezone": "UTC",
        "title": "unassigned event",
        "notes": "",
        "color": "#888888",
        "last_modified": "2018-12-07T17:47:37+00:00",
        "created": "2018-12-07T17:47:37+00:00",
        "customfields": "",
        "location": ""
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2816375,
        "user_id": 11,
        "unassigned": false,
        "schedule_calendar_id": 5,
        "jobcode_id": 0,
        "all_day": false,
        "start": "2018-12-05T16:00:00+00:00",
        "end": "2018-12-05T18:00:00+00:00",
        "active": true,
        "draft": true,
        "timezone": "UTC",
        "title": "assigned to multiple",
        "notes": "",
        "color": "#888888",
        "last_modified": "2018-12-07T17:47:37+00:00",
        "created": "2018-12-07T17:47:37+00:00",
        "customfields": "",
        "assigned_user_ids": "11,1365",
        "location": ""
      }
    }
  },
  "supplemental_data": {
    "users": {
      "11": {
        "id": 11,
        "first_name": "Joni",
        "last_name": "Smith",
        ...
      }
    }
  },
  "calendars": {
    "5": {
      "id": "5",
      ...
    }
  }
}

```

Add one or more schedule events.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/schedule_events</api>

### Properties
_Pass an array of schedule event objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **schedule_calendar_id**<br/>required | _Int_ | Id of the Schedule Calendar that contains this event. |
| **start**<br/>required | _Int_ | Date/time that represents the start time of this event, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **end**<br/>required | _Int_ | Date/time that represents the end time of this event, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **all_day**<br/>required | _Boolean_ | If _true_, the event duration is all day on the day specified in start. If _false_, the event duration is determined by date/time specified in end. |
| **team_events**<br/>optional | _String_ | 'base' or 'instance'. Default is 'instance'. If 'instance' is specified, supplemental events that are created for multiple users will be returned as individual single events for each assigned user. If 'base' is specified, supplemental events that are created for multiple users will be returned as one combined event for all assignees. |

For a full list of the properties that may be set on an event, see the [Schedule Event object](#the-schedule-event-object).

### Status Codes
Each event that is created will come back with a `_status_code` and `_status_message` that will indicate whether the event was created successfully. If there was a problem creating an event, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Event was created successfully. |
| <code class="level200">201</code> | Fulfilled. Event was created successfully and additional events that were created as a result are included in the supplemental data section of the response. |
| <code class="level400">403</code> | Permission Denied. The requesting user did not have high enough manage schedule permissions to create the event. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this event. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> schedule events. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>