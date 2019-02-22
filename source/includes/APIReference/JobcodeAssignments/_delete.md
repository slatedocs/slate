## Delete Jobcode Assignments

 > **Example**: Request to delete four jobcode assignments. Two resulting in success and two resulting in an error.

 > Request

```shell
curl -X DELETE \
  https://rest.tsheets.com/api/v1/jobcode_assignments?ids=56788052%2C58078296%2C%2C1234
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/jobcode_assignments?ids=56788052%2C58078296%2C%2C1234");
var request = new RestRequest(Method.DELETE);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/jobcode_assignments?ids=56788052%2C58078296%2C%2C1234")
  .delete()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://rest.tsheets.com/api/v1/jobcode_assignments',
  qs: { ids: '56788052,58078296,,1234'
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
$request->setUrl('https://rest.tsheets.com/api/v1/jobcode_assignments');
$request->setMethod(HTTP_METH_DELETE);

$request->setQueryData(array(
  'ids' => '56788052,58078296,,1234'
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

url = URI("https://rest.tsheets.com/api/v1/jobcode_assignments?ids=56788052%2C58078296%2C%2C1234")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/jobcode_assignments"

querystring = {
  "ids":"56788052,58078296,,1234"
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

  url := "https://rest.tsheets.com/api/v1/jobcode_assignments?ids=56788052%2C58078296%2C%2C1234"

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
    "jobcode_assignments": {
      "56788052": {
        "_status_code": 200,
        "_status_message": "OK, deleted",
        "id": 56788052,
      },
      "58078296": {
        "_status_code": 200,
        "_status_message": "OK, deleted",
        "id": 58078296,
      },
      "": {
        "_status_code": 417,
        "_status_message": "Expectation Failed!",
        "_status_extra": "That id is not found in the database",
        "id": "",
      },
      "1234": {
        "_status_code": 417,
        "_status_message": "Expectation Failed!",
        "_status_extra": "Oops! You don't have permission to remove jobcodes for that user.",
        "id": "1234",
      }
    }
  }
}
```

Delete one or more jobcode assignments for a user.

### HTTP Request

<img src="../../images/delete.png" alt="delete"/><api>https://rest.tsheets.com/api/v1/jobcode_assignments</api>

### Parameters
_If no filters are specified at all, no jobcode assignments are deleted._

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | String | Comma separated list of jobcode assignment ids you'd like to delete. |

### Status Codes
Each jobcode assignment that is deleted will come back with a `_status_code` and `_status_message` that will indicate whether the jobcode assignment was deleted successfully. If there was a problem deleting a jobcode assignment, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Jobcode assignment was deleted successfully. |
| <code class="level400">417</code> | Expectation Failed. Something went wrong for this jobcode assignment. See the `_status_extra` value for more detail. |

<aside class="warning">
To use this method, you must be a group manager of the user you're making assignments for, be an admin, or have the <code>manage_users</code> permission.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> jobcode assignments. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>
 
