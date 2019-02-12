## Update Custom Field Items

> **Examples**

> Change some information for each of these customfielditems

> Request Body

```json
{
 "data":
  [
    {
     "id":"3875653",
     "customfield_id":"143369",
     "short_code":"dsa"
    },
    {
     "id":"3890433",
     "customfield_id":"143369",
     "active":"false"
    }
  ]
}
```

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/customfielditems \
  -H 'Authorization: Bearer <INSERT TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<INSERT REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems");
var request = new RestRequest(Method.PUT);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
request.AddParameter("undefined", "<INSERT REQUEST BODY>",	ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<INSERT REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems")
  .put(body)
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
  headers: 
   { 'Content-Type': 'application/json',
     Authorization: 'Bearer <INSERT TOKEN>' },
  body: '<INSERT REQUEST BODY>',
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_PUT);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <INSERT TOKEN>
));

$request->setBody('<INSERT REQUEST BODY>');

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

url = URI("https://rest.tsheets.com/api/v1/customfielditems")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<INSERT REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfielditems"

payload = "<INSERT REQUEST BODY>"
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
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

	url := "https://rest.tsheets.com/api/v1/customfielditems"

	payload := strings.NewReader("<INSERT REQUEST BODY>")

	req, _ := http.NewRequest("PUT", url, payload)

	req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")
	req.Header.Add("Content-Type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
```

> The above example returns JSON with the following structure:

```json
{
  "results": {
    "customfielditems": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 3875653,
        "customfield_id": 143369,
        "active": true,
        "short_code": "dsa",
        "name": "DeepSea Adventure",
        "last_modified": "2019-02-12T00:28:14+00:00",
        "required_customfields": []
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 3890433,
        "customfield_id": 143369,
        "active": false,
        "short_code": "bv",
        "name": "Bavarian Villager",
        "last_modified": "2019-02-12T00:28:58+00:00",
        "required_customfields": []
      }
    }
  },
  "supplemental_data": {
    "customfields": {
      "143369": {
        "id": 143369,
        "active": true,
        "global": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "UNI",
        "regex_filter": "",
        "name": "Uniform",
        "last_modified": "2019-02-11T17:42:45+00:00",
        "created": "2019-02-11T17:42:45+00:00",
        "ui_preference": "drop_down",
        "required_customfields": []
      }
    }
  }
}
```

Update one or more customfielditems for a customfield.

### HTTP Request

`PUT https://rest.tsheets.com/api/v1/customfielditems`

### HTTP Request Body

The batch of customfielditems is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`id` | _Integer_ | Unique identifier of the customfielditem.

### Optional Properties

For a full list of the properties that may be set on a customfielditem, see [The Custom Field Item Object](#the-custom-field-item-object).  All other properties defined on a Custom Field Item object may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

<aside class="notice">
The maximum batch size is <i>50</i> items. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>
