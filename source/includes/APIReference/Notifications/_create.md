## Create Notifications

 > **Example**: Create two new notifications.

 > Request Body

```json
{
  "data": [{
    "user_id": 1242515,
    "method": "push",
    "delivery_time": "2018-06-19T14:00:00+00:00",
    "precheck": "off_the_clock",
    "message": "Please clock in!"
  }, {
    "user_id": 1242515,
    "method": "push",
    "delivery_time": "2018-06-19T23:00:00+00:00",
    "precheck": "on_the_clock",
    "message": "Please clock out!"
  }]
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/notifications \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/notifications");
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
  .url("https://rest.tsheets.com/api/v1/notifications")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/notifications',
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
$request->setUrl('https://rest.tsheets.com/api/v1/notifications');
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

url = URI("https://rest.tsheets.com/api/v1/notifications")

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

url = "https://rest.tsheets.com/api/v1/notifications"

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

  url := "https://rest.tsheets.com/api/v1/notifications"

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
  {
    "results": {
      "notifications": {
        "1": {
          "_status_code": 200,
          "_status_message": "Created",
          "id": 94140223,
          "msg_tracking_id": "baabeb0ab03d62ce",
          "user_id": 1242515,
          "message": "Please clock in!",
          "method": "push",
          "delivery_time": "2018-06-24T15:00:00+00:00",
          "created": "2018-06-23T14:17:57+00:00",
          "precheck": "off_the_clock"
        },
        "2": {
          "_status_code": 200,
          "_status_message": "Created",
          "id": 94140225,
          "msg_tracking_id": "3ce75c1b7de6598a",
          "user_id": 1242515,
          "message": "Please clock out!",
          "method": "push",
          "delivery_time": "2018-06-24T23:00:00+00:00",
          "created": "2018-06-23T14:17:57+00:00",
          "precheck": "on_the_clock"
        }
      }
    }
  }
```

Add one or more notifications.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/notifications</api>

### Properties
_Pass an array of notification objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **message**<br/>required | _String_ | The message text of the notification. The maximum message length is 2000 characters. |
| **user_id**<br/>optional | _Int_ | Defaults to the requesting user (based on the Access Token). |

For a full list of the properties that may be set on a notification, see [the Notification object](#the-notification-object).

### Status Codes
Each notification that is created will come back with a `_status_code` and` _status_message` that will indicate whether the notification was created successfully. If there was a problem creating a notification, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Notification was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this notification. See the `_status_extra` value for more detail. |

### General Notes
<ul>
	<li>Frequent notifications to the same device may overwrite each other. Some notifications in quick succession may not be delivered.</li>
	<li>Notifications are not guaranteed to be delivered. They are dependent on the device's notification provider.</li>
	<li>The actual delivery time is also dependent on the device's notification provider.</li>
</ul>

<aside class="notice">
Only administrators may create notifications for users other than themselves. Furthermore, administrators may only create notifications for users that belong to their company.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> notifications. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

