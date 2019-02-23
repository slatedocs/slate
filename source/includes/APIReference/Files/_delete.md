## Delete Files

 > **Example**: Request to delete four files. Two succeed and two fail.

 > Request

```shell
curl -X DELETE \
  https://rest.tsheets.com/api/v1/files?ids=129526%2C129524%2C13455%2C89999
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/files?ids=129526%2C129524%2C13455%2C89999");
var request = new RestRequest(Method.DELETE);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/files?ids=129526%2C129524%2C13455%2C89999")
  .delete()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'DELETE',
  url: 'https://rest.tsheets.com/api/v1/files',
  qs: { ids: '129526,129524,13455,89999'
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
$request->setUrl('https://rest.tsheets.com/api/v1/files');
$request->setMethod(HTTP_METH_DELETE);

$request->setQueryData(array(
  'ids' => '129526,129524,13455,89999'
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

url = URI("https://rest.tsheets.com/api/v1/files?ids=129526%2C129524%2C13455%2C89999")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/files"

querystring = {
  "ids":"129526,129524,13455,89999"
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

  url := "https://rest.tsheets.com/api/v1/files?ids=129526%2C129524%2C13455%2C89999"

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
  "files": {
   "129526": {
    "_status_code": 200,
    "_status_message": "OK, deleted",
    "id": "129526"
   },
   "129524": {
    "_status_code": 200,
    "_status_message": "OK, deleted",
    "id": "129524"
   },
   "13455": {
    "_status_code": 404,
    "_status_message": "File not found!",
    "id": "13455"
   },
   "89999": {
    "_status_code": 404,
    "_status_message": "File not found!",
    "id": "89999"
   }
  }
 }
}
```

Delete one or more files.

### HTTP Request

<img src="../../images/delete.png" alt="delete"/><api>https://rest.tsheets.com/api/v1/files</api>

### Parameters
If no filters are specified at all, no files are deleted.

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of file ids you'd like to delete. |

### Status Codes
Each file that is deleted will come back with a `_status_code` and `_status_message` that will indicate whether the file was deleted successfully. If there was a problem deleting a file, there may also be an additional field, `_status_extra` which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. File was deleted successfully. |
| <code class="level400">417</code> | Expectation Failed. Something went wrong for this file. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> files. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

