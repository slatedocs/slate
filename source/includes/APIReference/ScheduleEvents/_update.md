## Update Schedule Events

 > **Example**: Edit the title of an event.

 > Request Body

```json
{
  "data":
  [
    {
      "schedule_calendar_id":5,
      "id": 2816375,
      "title":"changed title"
    }
  ],
  "team_events": "base"
}
```

 > Request

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/schedule_events \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/schedule_events");
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
  .url("https://rest.tsheets.com/api/v1/schedule_events")
  .put(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
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

url = URI("https://rest.tsheets.com/api/v1/schedule_events")

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

url = "https://rest.tsheets.com/api/v1/schedule_events"

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

  url := "https://rest.tsheets.com/api/v1/schedule_events"

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
    "schedule_events": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
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
        "title": "changed title",
        "notes": "",
        "color": "#888888",
        "last_modified": "2018-12-07T18:12:29+00:00",
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

Edit one or more schedule events.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/schedule_events</api>

### Properties
_Pass an array of schedule event objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Id of the Schedule Calendar Event. |
| **team_events**<br/>optional | _String_ | 'base' or 'instance'. Default is 'instance'. If 'instance' is specified, supplemental events that are created for multiple users will be returned as individual single events for each assigned user. If 'base' is specified, supplemental events that are created for multiple users will be returned as one combined event for all assignees. |

All other properties defined on a [schedule event object](#the-schedule-event-object) may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

### Status Codes
Each event that is edited will come back with a `_status_code` and `_status_message` that will indicate whether the event was edited successfully. If there was a problem editing the event, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Event was edited successfully. |
| <code class="level200">201</code> | Fulfilled. Event was edited successfully and additional events that were edited as a result are included in the supplemental data section of the response. |
| <code class="level400">403</code> | Permission Denied. The requesting user did not have high enough manage schedule permissions to edit the event. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this event. See the `_status_extra` value for more detail. |

 <aside class="notice">
The maximum batch size is <i>50</i> schedule events. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

