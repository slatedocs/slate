## Update Reminders

 > **Example**: Edit a user's clock-in and clock-out reminder due times and days of week.

 > Request Body

```json
{
  "data": [{
    "id": 73033,
    "due_time": "07:50:00",
    "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
    "active": true,
    "enabled": true
  }, {
    "id": 73035,
    "due_time": "17:10:00",
    "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
    "active": true,
    "enabled": true
  }]
}
```

 > Request

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/reminders \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reminders");
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
  .url("https://rest.tsheets.com/api/v1/reminders")
  .put(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
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

url = URI("https://rest.tsheets.com/api/v1/reminders")

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

url = "https://rest.tsheets.com/api/v1/reminders"

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

  url := "https://rest.tsheets.com/api/v1/reminders"

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
    "reminders": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 73033,
        "reminder_type": "clock-in",
        "due_time": "07:50:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS,Email",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T22:00:51+00:00",
        "created": "2018-07-15T22:00:51+00:00",
        "user_id": 37
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 73035,
        "reminder_type": "clock-out",
        "due_time": "17:10:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS,Email",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T22:00:51+00:00",
        "created": "2018-07-15T22:00:51+00:00",
        "user_id": 37
      }
    }
  }
}
```

Edit one or more reminders for employees within your company.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/reminders</api>

### Properties
_Pass an array of reminder objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Id of the reminder. |

Other properties defined on a [reminder object](#the-reminder-object) may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will not be updated.

### Status Codes

Each reminder that is edited will come back with a `_status_code` and `_status_message` that will indicate whether the reminder was edited successfully. If there was a problem editing a reminder, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Reminder was edited successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this reminder. See the `_status_extra` value for more detail. |

 <aside class="notice">
The maximum batch size is <i>50</i> reminders. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>