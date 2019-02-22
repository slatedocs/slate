## Create Reminders

 > **Example**: Create user-specific clock-in and clock-out reminders for a user.

 > Request Body

```json
{
  "data": [{
    "user_id": 37,
    "reminder_type": "clock-in",
    "due_time": "08:10:00",
    "due_days_of_week": "Mon,Tue,Sat,Sun",
    "distribution_methods": "Push,SMS,Email",
    "active": true,
    "enabled": true
  }, {
    "user_id": 37,
    "reminder_type": "clock-out",
    "due_time": "18:20:00",
    "due_days_of_week": "Mon,Tue,Sat,Sun",
    "distribution_methods": "Push,SMS,Email",
    "active": true,
    "enabled": false
  }]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/reminders \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reminders");
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
  .url("https://rest.tsheets.com/api/v1/reminders")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/reminders',
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
$request->setUrl('https://rest.tsheets.com/api/v1/reminders');
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

url = URI("https://rest.tsheets.com/api/v1/reminders")

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

url = "https://rest.tsheets.com/api/v1/reminders"

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

  url := "https://rest.tsheets.com/api/v1/reminders"

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
    "reminders": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "user_id": 37,
        "reminder_type": "clock-in",
        "due_time": "08:10:00",
        "due_days_of_week": "Mon,Tue,Sat,Sun",
        "distribution_methods": "Push,SMS,Email",
        "active": true,
        "enabled": true,
        "id": "73033"
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "user_id": 37,
        "reminder_type": "clock-out",
        "due_time": "18:20:00",
        "due_days_of_week": "Mon,Tue,Sat,Sun",
        "distribution_methods": "Push,SMS,Email",
        "active": true,
        "enabled": false,
        "id": "73035"
      }
    }
  }
}
```

Add one or more user-specific or company-wide reminders.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reminders</api>

### Properties
_Pass an array of reminder objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>required | _Int_ | Id of the user that this reminder pertains to. A `user_id` of _0_ indicates that this is a company-wide reminder. |
| **reminder_type**<br/>required | _String_ | The type of this reminder object. Supported reminder_types are 'clock-in' and 'clock-out'. |
| **due_time**<br/>required | _String_ | The 24-hour time that the reminder should be sent, expressed as "hh:mm:ss". The time should be in the user's local time and must be in even 5 minute increments. For example: '13:45:00' or '08:00:00'. |
| **due_days_of_week**<br/>required | _String_ | A comma-separated list of the days of the week when the reminder should be sent. The value can be any combination of 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri' and 'Sat'. For example: 'Mon,Tue,Wed,Thu,Fri' or 'Tue,Sat'. |
| **distribution_methods**<br/>required | _String_ | A comma-separated list of the transport method(s) indicating how the reminder message should be sent. The value can be any combination of 'Push', 'SMS' and 'Email'. For example: "Push,SMS". The 'Push' method utilizes the TSheets mobile app to deliver the notification to a mobile device. The 'SMS' method requires that the 'Text Messaging' Add-On be installed and that a 'Cell Number' is registered for each employee. |
| **active**<br/>required | _Boolean_ | true or false. If _true_, this reminder is active and will be evaluated at the 'due_time' and 'due_days_of_week'. If false, this reminder is inactive and will not be evaluated. If `active` = _false_ for user-specific reminders, then the company-wide reminder (of the same reminder type) will apply. |
| **enabled**<br/>required | _Boolean_ | true or false. If _true_, the reminder is enabled and will be sent at the 'due_time' and 'due_days_of_week'. If false, the reminder is disabled and will not be sent. A user with an active (`active` = _true_) but disabled (`enabled` = _false_) reminder will not receive that reminder type regardless of how company-wide reminders are configured. |

For a full list of the properties that may be set on a reminder, see [the Reminder object](#the-reminder-object).

### Status Codes
Each reminder that is created will come back with a `_status_code` and `_status_message` that will indicate whether the reminder was created successfully. If there was a problem creating a reminder, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Reminder was created successfully. |
| <code class="level200">202</code> | OK. Reminder accepted but not created because this reminder_type exists for the specified user. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this reminder. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> reminders. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>