## Create Custom Field Items

> **Example**

> Create two new customfielditems. One succeeds and the other fails because of a duplicate `short_code` on an existing customfielditem

> Request Body

```json
{
 "data":
  [
    {
     "name":"Bavarian Villager",
     "customfield_id":"143369",
     "short_code":"bv"
    },
    {
     "name":"Racecar Driver",
     "customfield_id":"143369",
     "short_code":"bv"
    }
  ]
}
```

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/customfielditems \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfielditems");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddParameter("undefined", "<REQUEST BODY>",	ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfielditems")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/customfielditems',
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
$request->setUrl('https://rest.tsheets.com/api/v1/customfielditems');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <TOKEN>
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

url = URI("https://rest.tsheets.com/api/v1/customfielditems")

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

url = "https://rest.tsheets.com/api/v1/customfielditems"

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

	url := "https://rest.tsheets.com/api/v1/customfielditems"

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

> The above example returns JSON with the following structure:

```json
{
  "results": {
    "customfielditems": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 3890433,
        "customfield_id": 143369,
        "active": true,
        "short_code": "bv",
        "name": "Bavarian Villager",
        "last_modified": "2019-02-11T23:17:47+00:00",
        "required_customfields": []
      },
      "2": {
        "_status_code": 417,
        "_status_message": "Expectation Failed",
        "_status_extra": "The name or short code conflicts with another item named \"Bavarian Villager\". Try choosing another name/short code or deleting the other conflicting item first",
        "name": "Racecar Driver"
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

Add one or more customfielditems to a customfield.

### HTTP Request

<api>POST https://rest.tsheets.com/api/v1/customfielditems</api>

### HTTP Request Body

The batch of customfielditems is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`name` | _String_ | Name of the customfielditem.
`customfield_id` | _Int_ | The id of the customfield to which this item should be added.

### Optional Properties

For a full list of the properties that may be set on a customfielditem, see [The Custom Field Item Object](#the-custom-field-item-object).

<aside class="notice">
The maximum batch size is <i>50</i> items. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>

