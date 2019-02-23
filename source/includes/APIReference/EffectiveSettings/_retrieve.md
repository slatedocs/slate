## Retrieve Effective Settings

 > **Example**: Retrieve a list of all effective settings for a specific user.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/effective_settings?user_id=1234"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/effective_settings?user_id=1234");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/effective_settings?user_id=1234")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/effective_settings',
  qs: { user_id: '1234'
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
$request->setUrl('https://rest.tsheets.com/api/v1/effective_settings');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'user_id' => '1234'
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

url = URI("https://rest.tsheets.com/api/v1/effective_settings?user_id=1234")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/effective_settings"

querystring = {
  "user_id":"1234"
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

  url := "https://rest.tsheets.com/api/v1/effective_settings?user_id=1234"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

 > **Example**: Retrieve a list of all effective settings modified since a specified date. Currently logged in user's id will be used since none is specified in the request.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/effective_settings?modified_since=2018-03-01T00%3A00%3A00-0600"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2018-03-01T00%3A00%3A00-0600");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2018-03-01T00%3A00%3A00-0600")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/effective_settings',
  qs: { modified_since: '2018-03-01T00:00:00-0600'
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
$request->setUrl('https://rest.tsheets.com/api/v1/effective_settings');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'modified_since' => '2018-03-01T00:00:00-0600'
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

url = URI("https://rest.tsheets.com/api/v1/effective_settings?modified_since=2018-03-01T00%3A00%3A00-0600")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/effective_settings"

querystring = {
  "modified_since":"2018-03-01T00:00:00-0600"
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

  url := "https://rest.tsheets.com/api/v1/effective_settings?modified_since=2018-03-01T00%3A00%3A00-0600"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(all examples will have the following layout)</i>

> <code class="level200">200 OK</code>

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
          "emp_panel_email": 1,
          "emp_panel_passwd": 1,
          "emp_panel_tz": 1,
          "employee_pto_entry": 0,
          "enable_timesheet_notes": "1",
          "hide_working_time": "0",
          "jc_label": "Job",
          "lunch_deduct": 0,
          "lunch_length": 1,
          "lunch_threshold": 9,
          "max_customfielditems": "-1",
          "max_jobcodes": "-1",
          "pto_entry": 1,
          "pto_overtime": 0,
          "simple_clockin": 0,
          "time_format": 12,
          "timecard_fields": "JOBCODE,195923,195921,195919",
          "timesheet_edit_notes_for_all_users": 0,
          "timesheet_notes_notify_admin": 0,
          "timesheet_notes_notify_mgrs": 0,
          "timesheet_notes_required": 0,
          "tz": "US\/Mountain",
          "week_start": 0,
          "weekly_regular_hours": "40"
        },
        "last_modified": "2018-04-05T19:19:45+00:00"
      },
      "alerts": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "approvals": {
        "settings": {
          "installed": "1"
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "breaks": {
        "settings": {
          "hide_pre_clockout_option": 0
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "dcaa": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "dialin": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "files": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "invoicing": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "mobile_app_integrations": {
        "settings": {
          "installed": 0,
          "apps": ""
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "mobile_app_settings": {
        "settings": {
          "installed": 1,
          "location_tracking": "optional",
          "mandatory_location_services": 0
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "reminders": {
        "settings": {
          "installed": 1
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "quickbooks": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "restapi": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "rounding": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "schedule": {
        "settings": {
          "installed": "1",
          "business_hours_end": "17:00:00",
          "business_hours_start": "08:00:00",
          "manage_schedule_permission": "company",
          "trial_expiration_date": "2018-04-11",
          "view_schedule_permission": "company",
          "employee_view": "company",
          "manager_view": "company"
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "sms": {
        "settings": {
          "installed": 0,
          "email_notify": "1",
          "mobile_number": "2087231456",
          "sms_notify": "1"
        },
        "last_modified": "2018-03-27T16:13:35+00:00"
      },
      "sounds": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "customfields": {
        "settings": {
          "maximum_allowed_timesheet_custom_fields": 6,
          "installed": "1"
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "time_entry": {
        "settings": {
          "installed": 1,
          "time_entry_method": "timecard",
          "mtc_format_time_display": "hhmm",
          "time_entry": 0,
          "timecard": 1,
          "weekly_timecard": 1,
          "timecard_daily": 0,
          "timesheet_edit": 0,
          "timesheet_map": 1,
          "pto_entry": 1,
          "timesheet_list_date_range_selection": "week",
          "timesheet_list_show_days_with_no_time": 1,
          "timesheet_list_wrap_text": 0,
          "timesheet_list_column_selection": "time,job,location,kiosk,attachments,notes",
          "timesheet_list_bottomless_scroll": 0
        },
        "last_modified": "2018-04-04T19:42:03+00:00"
      },
      "toodledo": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "twitter": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "xero": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "zenpayroll": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      }
    }
  }
}
```

Retrieves a list of all effective settings associated with a single user, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/effective_settings</api>

### Filter Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>optional | _Int_ | User id for whom you'd like to retrieve effective settings. If none is specified, the currently logged in user's id will be used. Only effective settings that apply to this `user_id` will be returned. An admin will see more settings than a regular user will. |
| **modified_before**<br/>optional | _String_ | Only sections with settings modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>optional | _String_ | Only sections with settings modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |

