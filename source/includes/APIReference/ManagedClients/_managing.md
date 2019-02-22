## Managing Clients

 > **Example**: Retrieve the users on a managed client's account.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/users"
  -H "vnd.tsheets.ManagedClientId: <Managed-Client-Id>"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddHeader("vnd.tsheets.ManagedClientId", "<Managed-Client-Id>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("vnd.tsheets.ManagedClientId", "<Managed-Client-Id>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  headers: 
   { Authorization: 'Bearer <TOKEN>',
     'vnd.tsheets.ManagedClientId': '<Managed-Client-Id>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_GET);

$request->setHeaders(array(
  'Authorization' => 'Bearer <TOKEN>',
  'vnd.tsheets.ManagedClientId' => '<Managed-Client-Id>'
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

url = URI("https://rest.tsheets.com/api/v1/users")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'
request["vnd.tsheets.ManagedClientId"] = '<Managed-Client-Id>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>",
    'vnd.tsheets.ManagedClientId': "<Managed-Client-Id>"
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

  url := "https://rest.tsheets.com/api/v1/users"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")
  req.Header.Add("vnd.tsheets.ManagedClientId", "<Managed-Client-Id>")

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
    "users": {
      "1283037": {
        "id": 1283037,
        "first_name": "Joni",
        "last_name": "Smith",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "joni",
        "email": "",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "job_title": "",
        "gender": "",
        "last_modified": "2018-07-12T17:24:33+00:00",
        "last_active": "",
        "created": "2018-07-12T17:24:33+00:00",
        "mobile_number": "",
        "pto_balances": {
          "8234": 0,
          "424242": 144000,
          "123": 3600
        },
        "require_password_change": false,
        "pay_rate": 20,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": false,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "approve_timesheets": false,
          "manage_no_schedules": false,
          "manage_my_schedule": false,
          "manage_schedules": true,
          "manage_company_schedules": false,
          "view_my_schedules": false,
          "view_group_schedules": false,
          "view_company_schedules": false
        }
      },
      "1283039": {
        "id": 1283039,
        "first_name": "Frank",
        "last_name": "Church",
        ...
      }
    }
  },
  "more": false,
  "supplemental_data": {
    "groups": {
      "144959": {
        "id": 144959,
        "name": "test3",
        "last_modified": "2018-07-12T15:32:25+00:00",
        "created": "2018-07-12T15:32:25+00:00"
      }
    }
  }
}
```

If you have the External Access add-on installed, you can make API requests using your auth token against clients that you manage. When you want to make an API request against one of the clients that you manage, you must include an additional header in each request, **`vnd.tsheets.ManagedClientId`**. 

The value of the header is the client ID of the account you are managing. You can obtain the client IDs of the clients you manage by issuing a [GET on the /managed_clients](#retrieve-managed-clients) endpoint.
 