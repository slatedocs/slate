## Delete Notifications

 > **Example**: Delete two notifications

 > Request

```shell
curl -X DELETE \
  https://rest.tsheets.com/api/v1/notifications?ds=135694294%2C135694494
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/notifications?ds=135694294%2C135694494");
var request = new RestRequest(Method.DELETE);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/notifications?ds=135694294%2C135694494")
  .delete()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://rest.tsheets.com/api/v1/notifications',
  qs: { ds: '135694294,135694494'
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
$request->setUrl('https://rest.tsheets.com/api/v1/notifications');
$request->setMethod(HTTP_METH_DELETE);

$request->setQueryData(array(
  'ds' => '135694294,135694494'
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

url = URI("https://rest.tsheets.com/api/v1/notifications?ds=135694294%2C135694494")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/notifications"

querystring = {
  "ds":"135694294,135694494"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("DELETE", url, data=payload, headers=headers, params=querystring)

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

  url := "https://rest.tsheets.com/api/v1/notifications?ds=135694294%2C135694494"

  req, _ := http.NewRequest("DELETE", url, nil)

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
      "135694294": {
        "_status_code": 200,
        "_status_message": "OK, deleted",
        "id": "135694294"
      },
      "135694494": {
        "_status_code": 200,
        "_status_message": "OK, deleted",
        "id": "135694494"
      }
    }
  }
}
```

Delete one or more notifications in your company.

### HTTP Request

<img src="../../images/delete.png" alt="delete"/><api>https://rest.tsheets.com/api/v1/notifications</api>

### Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>required | _Int_ | Comma separated list of notification ids you'd like to delete. Note that notifications are actually deleted, not archived. |

### Status Codes
Each notification that is deleted will come back with a `_status_code` and `_status_message` that will indicate whether the notification was deleted successfully. If there was a problem deleting a notification, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Notification was deleted successfully. |
| <code class="level400">404</code> | Not Found. Notification either has never existed or has already been delivered or deleted. |
| <code class="level400">417</code> | Expectation Failed. Something went wrong for this notification. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> notifications. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>
 
