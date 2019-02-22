## Retrieve Reminders

 > **Example**: Retrieve company-wide and user-specific clock-in and clock-out reminders for a user.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in%2Cclock-out"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in%2Cclock-out");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in%2Cclock-out")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/reminders',
  qs: { user_ids: '0,37',
        reminder_types: 'clock-in,clock-out'
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
$request->setUrl('https://rest.tsheets.com/api/v1/reminders');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'user_ids' => '0,37',
  'reminder_types' => 'clock-in,clock-out'
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

url = URI("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in%2Cclock-out")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/reminders"

querystring = {
  "user_ids":"0,37",
  "reminder_types":"clock-in,clock-out"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers, params=querystring)

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

  url := "https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in%2Cclock-out"

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
    "reminders": {
      "72595": {
        "id": 72595,
        "reminder_type": "clock-in",
        "due_time": "23:00:00",
        "due_days_of_week": "Mon,Tue,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:33:57+00:00",
        "created": "2018-07-15T19:08:33+00:00",
        "user_id": 0
      },
      "72597": {
        "id": 72597,
        "reminder_type": "clock-out",
        "due_time": "04:00:00",
        "due_days_of_week": "Mon,Tue,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": false,
        "last_modified": "2018-07-15T19:33:57+00:00",
        "created": "2018-07-15T19:08:33+00:00",
        "user_id": 0
      },
      "72599": {
        "id": 72599,
        "reminder_type": "clock-in",
        "due_time": "13:40:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:31:43+00:00",
        "created": "2018-07-15T19:16:19+00:00",
        "user_id": 37
      },
      "72601": {
        "id": 72601,
        "reminder_type": "clock-out",
        "due_time": "17:00:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:31:43+00:00",
        "created": "2018-07-15T19:16:19+00:00",
        "user_id": 37
      }
    }
  }
}{
  "results": {
    "reminders": {
      "72595": {
        "id": 72595,
        "reminder_type": "clock-in",
        "due_time": "23:00:00",
        "due_days_of_week": "Mon,Tue,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:33:57+00:00",
        "created": "2018-07-15T19:08:33+00:00",
        "user_id": 0
      },
      "72597": {
        "id": 72597,
        "reminder_type": "clock-out",
        "due_time": "04:00:00",
        "due_days_of_week": "Mon,Tue,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": false,
        "last_modified": "2018-07-15T19:33:57+00:00",
        "created": "2018-07-15T19:08:33+00:00",
        "user_id": 0
      },
      "72599": {
        "id": 72599,
        "reminder_type": "clock-in",
        "due_time": "13:40:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:31:43+00:00",
        "created": "2018-07-15T19:16:19+00:00",
        "user_id": 37
      },
      "72601": {
        "id": 72601,
        "reminder_type": "clock-out",
        "due_time": "17:00:00",
        "due_days_of_week": "Mon,Tue,Wed,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:31:43+00:00",
        "created": "2018-07-15T19:16:19+00:00",
        "user_id": 37
      }
    }
  }
}
```

 > **Example**: Retrieve user-specific clock-in and clock-out reminders that have been modified since a specific date and time.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in&modified_since=2018-07-15T19%3A32%3A00%252B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in&modified_since=2018-07-15T19%3A32%3A00%252B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in&modified_since=2018-07-15T19%3A32%3A00%252B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/reminders',
  qs: { user_ids: '0,37',
        reminder_types: 'clock-in',
        modified_since: '2018-07-15T19:32:00%2B00:00'
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
$request->setUrl('https://rest.tsheets.com/api/v1/reminders');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'user_ids' => '0,37',
  'reminder_types' => 'clock-in',
  'modified_since' => '2018-07-15T19:32:00%2B00:00'
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

url = URI("https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in&modified_since=2018-07-15T19%3A32%3A00%252B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/reminders"

querystring = {
  "user_ids":"0,37",
  "reminder_types":"clock-in",
  "modified_since":"2018-07-15T19:32:00%2B00:00"
}

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers, params=querystring)

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

  url := "https://rest.tsheets.com/api/v1/reminders?user_ids=0%2C37&reminder_types=clock-in&modified_since=2018-07-15T19%3A32%3A00%252B00%3A00"

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
    "reminders": {
      "72595": {
        "id": 72595,
        "reminder_type": "clock-in",
        "due_time": "23:00:00",
        "due_days_of_week": "Mon,Tue,Thu,Fri",
        "distribution_methods": "Push,SMS",
        "active": true,
        "enabled": true,
        "last_modified": "2018-07-15T19:33:57+00:00",
        "created": "2018-07-15T19:08:33+00:00",
        "user_id": 0
      }
    }
  }
}
```

Retrieves a list of reminders associated with your employees or company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/reminders</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_ids**<br/>required | _Int_ | Comma-separated list of one or more user ids to retrieve reminders for. Include a `user_id` of _0_ to retrieve company-wide reminders. |
| **reminder_types**<br/>optional | _String_ | Comma-separated list of one or more reminder types to retrieve reminders for. Current legal values are 'clock-in' and 'clock-out'. For example, specify 'clock-in,clock-out' to retrieve both clock-in and clock-out reminders. |
| **modified_since**<br/>optional | _String_ | Only reminders modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
