## Retrieve Effective Settings

> **Examples**

> Retrieve a list of all effective settings for a specific user

```shell
curl "https://rest.tsheets.com/api/v1/effective_settings?user_id=317046"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/effective_settings?user_id=317046");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/effective_settings?user_id=317046")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/effective_settings',
  qs: { user_id: '317046' },
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
$request->setUrl('https://rest.tsheets.com/api/v1/effective_settings');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'user_id' => '317046'
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

url = URI("https://rest.tsheets.com/api/v1/effective_settings?user_id=317046")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/effective_settings"

querystring = {"user_id":"317046"}

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

  url := "https://rest.tsheets.com/api/v1/effective_settings?user_id=317046"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of all effective settings modified since the given date. Currently logged in user's id will be used since none is explicity specified in the request.

```shell
curl "https://rest.tsheets.com/api/v1/effective_settings?modified_since=2019-02-01T00%3A00%3A00%2B00%3A00"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2019-02-01T00%3A00%3A00%2B00%3A00");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2019-02-01T00%3A00%3A00%2B00%3A00")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/effective_settings',
  qs: { modified_since: '2019-02-01T00:00:00+00:00' },
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
$request->setUrl('https://rest.tsheets.com/api/v1/effective_settings');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2019-02-01T00:00:00+00:00'
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

url = URI("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2019-02-01T00%3A00%3A00%2B00%3A00")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/effective_settings"

querystring = {"modified_since":"2019-02-01T00:00:00+00:00"}

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

  url := "https://rest.tsheets.com/api/v1/effective_settings?modified_since=2019-02-01T00%3A00%3A00%2B00%3A00"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

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
    "effective_settings": {
      "general": {
        "settings": {
          "calculate_overtime": "1",
          "clockout_override": 1,
          "clockout_override_hours": 10,
          "clockout_override_notify_admin": 1,
          "clockout_override_notify_mgrs": 0,
          "daily_doubletime": "0",
          "daily_overtime": "0",
          "daily_regular_hours": 8,
          "date_locale": "us",
          "emp_panel": 1,
          "emp_panel_email": "0",
          "emp_panel_passwd": "0",
          "emp_panel_tz": "0",
          "employee_pto_entry": 0,
          "enable_timesheet_notes": "1",
          "hide_working_time": "0",
          "jc_label": "Job",
          "lunch_deduct": 0,
          "lunch_length": 1,
          "lunch_threshold": 9,
          "max_customfielditems": "-1",
          "max_jobcodes": "-1",
          "parent_clockin_display": 0,
          "payroll_end_date": "2018-09-28",
          "payroll_first_end_day": "1",
          "payroll_last_end_day": "16",
          "payroll_month_end_day": "1",
          "payroll_type": "biweekly",
          "pto_entry": 1,
          "pto_overtime": 0,
          "simple_clockin": 0,
          "time_format": 12,
          "timecard_fields": "JOBCODE,134913,143369,143377",
          "timeclock_label": "Time Clock",
          "timesheet_edit_notes_for_all_users": 0,
          "timesheet_notes_notify_admin": 0,
          "timesheet_notes_notify_mgrs": 0,
          "timesheet_notes_required": 0,
          "tz": "America/Denver",
          "week_start": 0,
          "weekly_regular_hours": "40"
        },
        "last_modified": "2019-02-11T17:45:18+00:00"
      },
      "mobile_app_settings": {
        "settings": {
          "installed": "1",
          "location_tracking": "off",
          "mandatory_location_services": "0"
        },
        "last_modified": "2019-02-09T18:39:20+00:00"
      },
      "schedule": {
        "settings": {
          "installed": "1",
          "business_hours_end": "17:00:00",
          "business_hours_start": "08:00:00",
          "drafted_first_schedule_event_occurred": "1",
          "manage_schedule_permission": "company",
          "published_first_schedule_event_occurred": "1",
          "trial_expiration_date": "2018-10-17",
          "view_schedule_permission": "company",
          "learning_step": "7",
          "employee_view": "company",
          "manager_view": "company"
        },
        "last_modified": "2019-02-09T18:03:55+00:00"
      },
      "customfields": {
        "settings": {
          "maximum_allowed_timesheet_custom_fields": 6,
          "installed": "1"
        },
        "last_modified": "2019-02-10T20:34:10+00:00"
      }
    }
  }
}
```

Retrieves a list of all effective settings associated with a single user, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/effective_settings</api>

### Query Parameters
All parameters are **_optional_** and results are unfiltered with respect to any not provided.

Parameter | Type | Format | Description
--------- | ---- | ------ | -----------
`user_id` | _Int_ | | User id for whom you'd like to retrieve effective settings. If none is specified, the currently logged in user's id will be used. Only effective settings that apply to this `user_id` will be returned. An admin will see more settings than will a regular user.
`modified_before` | _DateTime_ | ISO8601 | Include only sections with settings modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | Include only sections with settings modified since this date/time.
