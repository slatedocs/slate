## Retrieve Notifications

 > **Example**: Retrieve a list of all notifications scheduled for a specific user.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/notifications"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/notifications");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/notifications")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/notifications',
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
$request->setUrl('https://rest.tsheets.com/api/v1/notifications');
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

url = URI("https://rest.tsheets.com/api/v1/notifications")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/notifications"

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

  url := "https://rest.tsheets.com/api/v1/notifications"

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
    "notifications": {
      "94140225": {
        "id": 94140223,
        "msg_tracking_id": "baabeb0ab03d62ce",
        "user_id": 1242515,
        "message": "Please clock in!",
        "method": "push",
        "delivery_time": "2018-06-24T15:00:00+00:00",
        "created": "2018-06-23T14:17:57+00:00",
        "precheck": "off_the_clock"
      },
      "94140225": {
        "id": 94140225,
        "msg_tracking_id": "3ce75c1b7de6598a",
        "user_id": 1242515,
        "message": "Please clock out!",
        "method": "push",
        "delivery_time": "2018-06-24T23:00:00+00:00",
        "created": "2018-06-23T14:17:57+00:00",
        "precheck": "on_the_clock"
      }
    },
    "more": false
  }
}
```

Retrieves a list of notifications associated with your company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/notifications</api>

### Filter Parameters
_If no filters are set, all notifications for the requesting user (based on the Access-Token) will be returned._

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more notification ids you'd like to filter on. Only notifications with an id set to one of these values will be returned. |
| **delivery_before**<br/>optional | _String_ | Only notifications with a delivery date/time before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **delivery_after**<br/>optional | _String_ | Only notifications with a delivery date/time after this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **user_id**<br/>optional | _Int_ | Only notifications linked to this user ID will be returned. |
| **msg_tracking_id**<br/>optional | _String_ | Tracking ID string of a notification. Only the notification with this `msg_tracking_id` will be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

<aside class="notice">
Only administrators may retrieve notifications for users other than themselves. Furthermore, administrators may only retrieve notifications for users that belong to their company.
</aside>

