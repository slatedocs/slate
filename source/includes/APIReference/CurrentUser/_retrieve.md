## Retrieve the Current User

> **Example**

> Retrieve current user

```shell
curl "https://rest.tsheets.com/api/v1/current_user"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/current_user");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/current_user")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/current_user',
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
$request->setUrl('https://rest.tsheets.com/api/v1/current_user');
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

url = URI("https://rest.tsheets.com/api/v1/current_user")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/current_user"

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

  url := "https://rest.tsheets.com/api/v1/current_user"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> The above command returns JSON with the following structure:

```json
{
  "results": {
    "users": {
      "317046": {
        "id": 317046,
        "first_name": "Laura",
        "last_name": "McKenzie",
        "group_id": 6912,
        "active": true,
        "employee_number": 2,
        "salaried": false,
        "exempt": false,
        "username": "lmckenzie",
        "email": "laura_mckenzie@anymail.com",
        "email_verified": false,
        "payroll_id": "SC002",
        "mobile_number": "2085551235",
        "hire_date": "2018-07-02",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T18:33:58+00:00",
        "last_active": "2019-02-09T18:45:39+00:00",
        "created": "2018-10-04T02:25:38+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/ad30131c700cbb1ad59a19879ac66e7e",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2018-10-01",
        "approved_to": "2018-10-01",
        "manager_of_group_ids": [
          6912
        ],
        "require_password_change": false,
        "pay_rate": 12.25,
        "pay_interval": "hour",
        "permissions": {
          "admin": true,
          "mobile": true,
          "status_box": true,
          "reports": true,
          "manage_timesheets": true,
          "manage_authorization": true,
          "manage_users": true,
          "manage_my_timesheets": true,
          "manage_jobcodes": true,
          "pin_login": true,
          "approve_timesheets": true,
          "manage_schedules": false,
          "external_access": false,
          "manage_my_schedule": false,
          "manage_company_schedules": false,
          "view_company_schedules": false,
          "view_group_schedules": false,
          "manage_no_schedules": false,
          "view_my_schedules": false
        },
        "customfields": ""
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "groups": {
      "6912": {
        "id": 6912,
        "active": true,
        "name": "Game Attendants",
        "last_modified": "2019-02-09T18:33:58+00:00",
        "created": "2018-10-04T02:27:43+00:00",
        "manager_ids": [
          "300806",
          "317046"
        ]
      }
    },
    "jobcodes": {
      "2913946": {
        "id": 2913946,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Sick",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      },
      "2913948": {
        "id": 2913948,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Vacation",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      },
      "2913950": {
        "id": 2913950,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Holiday",
        "last_modified": "2018-10-02T20:27:21+00:00",
        "created": "2018-10-02T20:27:21+00:00",
        "filtered_customfielditems": "",
        "required_customfields": [],
        "locations": []
      }
    }
  }
}
```

Retrieves the user object for the currently authenticated user. This is the user that authenticated to TSheets during the OAuth2 authentication process.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/current_user</api>

### Parameters
_None_

