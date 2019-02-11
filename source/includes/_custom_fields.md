# Custom Fields

## The Custom Field Object
Custom Fields (aka "Advanced Tracking") provides a means to extend the data that is tracked on employee time cards to capture custom activities beyond time tracking, e.g. mileage, equipment, expenses, etc.  The API provides a Read method.  Use the web UI to Create or Update custom fields.

> **Example**: Custom Field Object

```json
{
  "id": 134913,
  "active": true,
  "required": true,
  "applies_to": "timesheet",
  "type": "managed-list",
  "short_code": "Exp",
  "regex_filter": "",
  "name": "Experience",
  "last_modified": "2019-02-10T20:40:41+00:00",
  "created": "2019-02-03T18:36:16+00:00",
  "ui_preference": "drop_down",
  "required_customfields": []
}
```
Following is a list of the properties that belong to a customfield object, and a description of each.

Name | Type | Format | Description
---- | ---- | ------ | -----------
`id` | _Int_ | | Id of customfield
`active` | _Boolean_ | | If false, the field is archived
`name` | _String_ | | Name of the customfield
`short_code` | _String_ | | This is a shortened code or alias that is associated with the customfield. It may only consist of letters and numbers.
`required` | _Boolean_ | | Indicates whether a value for this customfield is required on a timesheet
`applies_to` | _String Enum_ | 'timesheet', 'user' or 'jobcode' |  Indicates what type of object this customfield applies to.
`type` | _Enum_ | 'managed-list' or 'free-form' | If free-form, then it should be displayed in a UI as a text box, where users can enter values for this customfield and they'll get added automatically to the customfield if they don't already exist. If managed-list, then it should be displayed as a select-box and users can only choose an existing value.
`ui_preference` | _String Enum_ | 'drop_down' or 'text_box_with_suggest' | Indicates the suggested user interface depending on the specified type.
`regex_filter` | _String_ | regex | Regular expression that will be applied to any new items as they're added to the customfield. Values which do not match the filter cannot be added.
`last_modified` | _DateTime_ | ISO8601 | Date/time when this customfield was last modified
`created` | _DateTime_ | ISO8601 | Date/time when this customfield was created 
`required_customfields` | _Int Array_ | | Ids of customfields that should be displayed when this customfield is visible on a timecard

## Retrieve Custom Fields

> **Examples**

> Retrieve a list of all customfields.

```shell
curl "https://rest.tsheets.com/api/v1/customfields"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
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

url = URI("https://rest.tsheets.com/api/v1/customfields")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
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

  url := "https://rest.tsheets.com/api/v1/customfields"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of customfields with specific id

```shell
curl "https://rest.tsheets.com/api/v1/customfields?id=134913"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields?id=134913");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields?id=134913")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
  qs: { id: '134913' },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'id' => '134913'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
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

url = URI("https://rest.tsheets.com/api/v1/customfields?id=134913")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

querystring = {"id":"134913"}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
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

  url := "https://rest.tsheets.com/api/v1/customfields?id=134913"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of customfields that have been modified since a given date

```shell
curl "https://rest.tsheets.com/api/v1/customfields?modified_since=2019-02-11T12%3A00%3A00%2B00%3A00"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/customfields?modified_since=2019-02-11T12%3A00%3A00%2B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/customfields?modified_since=2019-02-11T12%3A00%3A00%2B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/customfields',
  qs: { modified_since: '2019-02-11T12%3A00%3A00%2B00%3A00' },
  headers: 
   { Authorization: 'Bearer <INSERT TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/customfields');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2019-02-11T12%3A00%3A00%2B00%3A00'
));

$request->setHeaders(array(
  'Authorization' => 'Bearer <INSERT TOKEN>'
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

url = URI("https://rest.tsheets.com/api/v1/customfields?modified_since=2019-02-11T12%3A00%3A00%2B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/customfields"

querystring = {"modified_since":"2019-02-11T12%3A00%3A00%2B00%3A00"}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>"
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

  url := "https://rest.tsheets.com/api/v1/customfields?modified_since=2019-02-11T12%3A00%3A00%2B00%3A00"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```



> The above examples return JSON with the following structure:

```json
{
  "results": {
    "customfields": {
      "134913": {
        "id": 134913,
        "active": true,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "Exp",
        "regex_filter": "",
        "name": "Experience",
        "last_modified": "2019-02-10T20:40:41+00:00",
        "created": "2019-02-03T18:36:16+00:00",
        "ui_preference": "drop_down",
        "required_customfields": []
      },
      "143369": {
        "id": 143369,
        "active": true,
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
      },
      "143377": {
        "id": 143377,
        "active": true,
        "required": false,
        "applies_to": "timesheet",
        "type": "free-form",
        "short_code": "WQ",
        "regex_filter": "/^\\d+$/",
        "name": "Wait Queue (Patron Count)",
        "last_modified": "2019-02-11T17:45:18+00:00",
        "created": "2019-02-11T17:45:18+00:00",
        "ui_preference": "text_box_with_suggest",
        "required_customfields": []
      }
    }
  },
  "more": false
}
```

Retrieves a list of all customfields associated with your company, with optional filters to narrow down the results.

### HTTP Request

`GET https://rest.tsheets.com/api/v1/users`

### Query Parameters
All parameters are **_optional_** and results are unfiltered with respect to any not provided.

Parameter | Type | Format | Default | Description
--------- | ---- | ------- | ------ | -----------
`ids` | _String_ | comma-separated | null | List of customfield ids to include.
`active` | _String Enum_ | 'yes', 'no' or 'both' | 'yes' | Include only customfields with given status.
`applies_to` | _String Enum_ | 'timesheet', 'user', 'jobcode' or 'all' | 'timesheet' | Include only customfields that apply to the given type.
`value_type` | _String Enum_ | 'managed-list', 'free-form' or 'both' | 'both' | Include only customfields that have the given value type.
`modified_before` | _DateTime_ | ISO8601 | null | Include only customfields modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | null | Include only customfields modified since this date/time.
`supplemental_data` |  _String Enum_ | 'yes' or 'no'| 'yes' | Indicates whether supplemental data should be returned.
`per_page` | _Int_ | 1 - 50 | 50 | The number of results to retrieve per request.
`page` | _Int_ | >= 1 | 1 | The page of results to retrieve.

