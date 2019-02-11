# Users

<div class="postman-run-button"
data-postman-action="collection/import"
data-postman-var-1="01861e468223de53ba7a"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>
<style>
  .postman-run-button {
    position: relative;
    left: 30px;
  }
</style>
<p/>

Within TSheets, the _User_ (aka "employee") refers to everyone on your account, including yourself, your employees, managers, administrators, and vendors.  The API provides methods to Create, Read, Update, and Archive (i.e. "soft delete") users, as well as set a variety of permissions.  Time can be tracked against all users.

## The User Object

> **Example**: User Object

```json
{
  "id": 317044,
  "first_name": "Bob",
  "last_name": "Jones",
  "group_id": 6908,
  "active": true,
  "employee_number": 10,
  "salaried": false,
  "exempt": false,
  "username": "bjones",
  "email": "bob_jones@anymail.com",
  "email_verified": false,
  "payroll_id": "SC010",
  "mobile_number": "2085551234",
  "hire_date": "2018-07-02",
  "term_date": "0000-00-00",
  "last_modified": "2019-02-09T17:59:06+00:00",
  "last_active": "2019-02-09T18:45:39+00:00",
  "created": "2018-10-04T02:25:38+00:00",
  "client_url": "spudsfunpark",
  "company_name": "Spuds Fun Park",
  "profile_image_url": "https://www.gravatar.com/avatar/6be49c2065c016dcdfcd26d1da111e9f",
  "pto_balances": {
    "2913946": 0,
    "2913948": 0,
    "2913950": 0
  },
  "submitted_to": "2000-01-01",
  "approved_to": "2000-01-01",
  "manager_of_group_ids": [],
  "require_password_change": false,
  "pay_rate": 8.26,
  "pay_interval": "hour",
  "permissions": {
    "admin": false,
    "mobile": true,
    "status_box": false,
    "reports": false,
    "manage_timesheets": false,
    "manage_authorization": false,
    "manage_users": false,
    "manage_my_timesheets": false,
    "manage_jobcodes": false,
    "pin_login": true,
    "approve_timesheets": false,
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
```

Following is a list of the properties that belong to a User object, and a description of each.

### Read-Only Properties
_The following properties are returned in the response to a User Retreive operation but are **not** allowed to be set in User Create and Update operations._

Name | Type | Format | Description
---- | ---- | ------ | -----------
`id` | _Integer_ | | Unique id of this user.
`last_modified` | _String_ | ISO8601 | Date/time when this user was last modified.
`last_active` | _String_ | ISO8601 | Date/time when this user last performed any action within TSheets.
`created` | _String_ | ISO8601 | Date/time when this user was created.
`client_url` | _String_ |  | Client account url identifier associated with this user.
`company_name` | _String_ | | Client account name identifier associated with the user.
`profile_image_url` | _String_ | URL | Url identifier associated with this user's profile image.
`pto_balances` | _Object_ | Map: String -> Integer |  List of jobcode identifiers and their respective PTO balances for this user (in seconds). Jobcode information for PTO Jobcodes will be supplied in `supplemental_data`.
`manager_of_group_ids` | _Integer Array_ | | The group ids that this user manages.
`pay_rate` | _Float_ | | The rate of pay associated with this user.
`pay_interval` | _Enum_ | One of: _'hour', 'year'_ | The timeframe to which this user's pay rate applies.

### Write-Only Properties
_The following properties are allowed to be set in User Create and Update operations but are **not** returned in the response to a User Retrieve operation._

Name |  Type | Format | Description
---- |  ---- | ------ | -----------
`password` | _String_ | | May only be set when editing the currently authenticated user (i.e. you may only edit your own password).
`login_pin` | _Integer_ | 4 digits | Used for logging into a Kiosk or similar.

### Read-Write Properties
_The following properties are allowed to be set in User Create and Update operations and are returned in the response to a User Retrieve operation._

Name |  Type | Format | Description
---- |  ---- | ------ | -----------
`first_name` | _String_ | | First name of the user.
`last_name` | _String_ | | Last name of the user.
`group_id` | _Integer_ | | Id of the group this user belongs to.
`active` | _Boolean_ | | If false, this user is considered archived.
`employee_number` | _Integer_ | | Unique number associated with this user, for external use.
`salaried` | _Boolean_ | | Indicates whether or not the user is salaried.
`exempt` | _Boolean_ | | Indicates whether or not the user is eligible for overtime pay.
`username` | _String_ | | Username associated with this user.
`email` | _String_ | | Email address associated with this user.
`email_verified` | _Boolean_ | | Indicates whether or not the email address has been confirmed by the user.
`payroll_id` | _String_ | | Unique company wide string associated with this user. Usually used for linking with external systems.
`hire_date` | _String_ | YYYY-MM-DD | Date on which this user was hired.
`term_date` |  _String_ | YYYY-MM-DD | Date on which this user was terminated.
`mobile_number` |  _String_ | | Mobile phone number associated with this user.
`submitted_to` | _String_ | YYYY-MM-DD | The latest date this user has submitted timesheets up to (if approvals addon is installed).
`approved_to` |  _String_ | YYYY-MM-DD | The latest date this user has had timesheets approved to (if approvals addon is installed). 
`require_password_change` | _Boolean_ | | If true, this user will be required to change their password on their next login.
`permissions` | _Object_ | Map: String -> Boolean | The [permission settings](#user-permissions) that apply to this user.
`custom_fields` | _Object_ | Map: String -> String | [Customfield](#the-custom-field-object) items that are associated with the user.

### User Permissions
The rights assignable to an individual user. All properties are of type _**Boolean**_.

Name | Default | Description
---- | ------- | -----------
`admin` | _false_ | Administrator, can perform any changes on the account.
`mobile` | _true_ | Allowed to use mobile devices to record time.
`status_box` | _false_ | Able to view the list of users currently working for the company.
`reports` | _false_ | Able to run/view all reports for the company.
`manage_timesheets` | _false_ | Able to create/edit/delete timesheets for anyone in the company.
`manage_authorization` | _false_ | Able to manage computer authorization for the company.
`manage_users` | _false_ | Able to create/edit/delete users, groups, and managers for the entire company.
`manage_my_timesheets` | _false_ | Able to completely manage own timesheets.
`manage_jobcodes` | _false_ | Able to create/edit/delete jobcodes and custom field items for the entire company.
`pin_login` | _false_ | Able to login to apps via PIN.
`approve_timesheets` | _false_ | Able to run approval reports and approve time for all employees.
`manage_schedules` | _false_ | Able to create/edit/delete events within the schedule for the groups that the user can manage.
`manage_my_schedule` | _false_ | Able to create/edit/delete events within the schedule for only themselves.
`manage_company_schedules` | _false_ | Able to create/edit/delete events within the schedule for any user in the company.
`manage_no_schedule` | _false_ | Not able to create/edit/delete events within the schedule for any user.
`view_company_schedules` | _false_ | Able to view published events within the schedule for any user in the company.
`view_group_schedules` | _false_ | Able to view published events within the schedule for the groups that the user is a member of.
`view_my_schedules` | _false_ | Able to view published events within the schedule for themselves.

 <aside class="notice">
The <code>submitted_to</code> property is <i><b>read only</b></i> unless the account setting <i>approvals->settings->employee_approval = 1</i>. See <a href="#effective-settings">Effective Settings</a> documentation for details.
</aside>

 <aside class="notice">
When updating the <code>approved_to</code> date, if the value is greater than the <code>submitted_to</code> date for this user, both properties will be updated. This is the equivalent of a manager/admin submitting time on a user's behalf.
</aside>

 <aside class="notice">
The following fields are considered <i>private</i> and are exposed only to managers and admins:
  <code>employee_number</code>, <code>salaried</code>, <code>exempt</code>, <code>username</code>, <code>payroll_id</code>, <code>hire_date</code>,
  <code>term_date</code>, <code>mobile_number</code>, <code>submitted_to</code>, <code>approved_to</code>, <code>permissions</code> & <code>customfields</code>
</aside>

 <aside class="warning">
 The following fields are <i><b>deprecated</b></i> for User Create and Update operations:
 <code>require_password_change</code> & <code>password</code>
 </aside>

## Retrieve Users

> **Examples**

> Retrieve a list of all active users.

```shell
curl "https://rest.tsheets.com/api/v1/users"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
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
$request->setUrl('https://rest.tsheets.com/api/v1/users');
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

url = URI("https://rest.tsheets.com/api/v1/users")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <Token<'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

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

  url := "https://rest.tsheets.com/api/v1/users"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <INSERT TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Retrieve a list of all users (active or deleted) whose last name starts with _J_. Set pagination to 10 results/page.

```shell
curl "https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10"
  -H "Authorization: Bearer <INSERT TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <INSERT TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10")
  .get()
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/users',
  qs: { last_name: 'J%2A', per_page: '10' },
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
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData(array(
  'last_name' => 'J%2A',
  'per_page' => '10'
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

url = URI("https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

querystring = {"last_name":"J%2A","per_page":"10"}

payload = ""
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
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

	url := "https://rest.tsheets.com/api/v1/users?last_name=J%2A&per_page=10"

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
    "users": {
      "317044": {
        "id": 317044,
        "first_name": "Bob",
        "last_name": "Jones",
        "group_id": 6908,
        "active": true,
        "employee_number": 10,
        "salaried": false,
        "exempt": false,
        "username": "bjones",
        "email": "bob_jones@anymail.com",
        "email_verified": false,
        "payroll_id": "SC010",
        "mobile_number": "2085551234",
        "hire_date": "2018-07-02",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T17:59:06+00:00",
        "last_active": "2019-02-09T18:45:39+00:00",
        "created": "2018-10-04T02:25:38+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/6be49c2065c016dcdfcd26d1da111e9f",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 8.26,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": true,
          "approve_timesheets": false,
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
      },
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
      },
      "317072": {
        "id": 317072,
        "first_name": "Duwayne",
        "last_name": "Jackson",
        "group_id": 6910,
        "active": true,
        "employee_number": 14,
        "salaried": false,
        "exempt": false,
        "username": "djackson",
        "email": "duwayne_jackson@anymail.com",
        "email_verified": false,
        "payroll_id": "SC014",
        "mobile_number": "2085551243",
        "hire_date": "2018-07-09",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T18:33:31+00:00",
        "last_active": "2019-02-09T18:45:38+00:00",
        "created": "2018-10-04T02:32:34+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/d136015ad7d20d180e6903eaffa7624b",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2018-10-01",
        "approved_to": "2018-10-01",
        "manager_of_group_ids": [
          6910
        ],
        "require_password_change": false,
        "pay_rate": 8.25,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": true,
          "approve_timesheets": false,
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
      "6908": {
        "id": 6908,
        "active": true,
        "name": "Ride Operators",
        "last_modified": "2019-02-09T18:34:22+00:00",
        "created": "2018-10-04T02:27:15+00:00",
        "manager_ids": [
          "300806",
          "317076"
        ]
      },
      "6910": {
        "id": 6910,
        "active": true,
        "name": "Food Workers",
        "last_modified": "2019-02-09T18:33:31+00:00",
        "created": "2018-10-04T02:27:26+00:00",
        "manager_ids": [
          "300806",
          "317072"
        ]
      },
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

Retrieves a list of all users associated with your company, with optional filters to narrow down the results.

### HTTP Request

`GET https://rest.tsheets.com/api/v1/users`

### Query Parameters
All parameters are **_optional_**.

Parameter | Type | Format | Default | Description
--------- | ---- | ------- | ------ | -----------
`ids` | _String_ | comma-separated | _unfiltered_ | List of user ids to include.
`not_ids` | _String_ | comma-separated | _unfiltered_ | List of user ids to exclude.
`employee_numbers` | _String_ | comma-separated | _unfiltered_ | List of employee numbers to include.
`usernames` | _String_ | comma-separated | _unfiltered_ | List of usernames to include.
`group_ids` | _String_ | comma-separated | _unfiltered_ | List of group ids to include.
`not_group_ids` | _String_ | comma-separated | _unfiltered_ | List of group ids to exclude.
`payroll_ids` |  _String_ | comma-separated | _unfiltered_ | List of payroll ids to filter the included users.
`active` | _Enum_ | One of: _'yes'_, _'no'_, _'both'_ | _'yes'_ | Include only users with given status.
`first_name` | _String_ | wildcard search | _'*'_ | The search pattern for filtering users by first name.
`last_name` | _String_ | wildcard search | _'*'_ | The search pattern for filtering users by last name.
`modified_before` | _DateTime_ | ISO8601 | _unfiltered_ | Include only users modified before this date/time.
`modified_since` | _DateTime_ | ISO8601 | _unfiltered_ | Include only users modified since this date/time.
`supplemental_data` |  _Enum_ | One of: _'yes', 'no'_| _'yes'_ | Indicates whether supplemental data should be returned.
`per_page` | _Integer_ | Range: _1 - 50_ | _50_ | The number of results to retrieve per request.
`page` | _Integer_ | Value: _>= 1_ | _1_ | The page of results to retrieve.

<aside class="notice">
Wildcard searches start matching from the beginning of the string.
</aside>

## Create Users

> **Example**: Create two new users.

> Request Body

```json
{
  "data":
  [ 
    {
      "username": "wwallace",
      "first_name": "William",
      "last_name": "Wallace",
      "email": "wwallace@example.com"
    },
    {
      "username": "mcurie",
      "first_name": "Marie",
      "last_name": "Curie"
    }    
  ]
}
```

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/users \
  -H 'Authorization: Bearer <INSERT TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<INSERT REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
var request = new RestRequest(Method.POST);
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
  .url("https://rest.tsheets.com/api/v1/users")
  .post(body)
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/users',
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
$request->setUrl('https://rest.tsheets.com/api/v1/users');
$request->setMethod(HTTP_METH_POST);

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

url = URI("https://rest.tsheets.com/api/v1/users")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Bearer <INSERT TOKEN>'
request["Content-Type"] = 'application/json'
request.body = "<INSERT REQUEST BODY>"

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/users"

payload = "<INSERT REQUEST BODY>"
headers = {
    'Authorization': "Bearer <INSERT TOKEN>",
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

	url := "https://rest.tsheets.com/api/v1/users"

	payload := strings.NewReader("<INSERT REQUEST BODY>")

	req, _ := http.NewRequest("POST", url, payload)

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
    "users": {
      "1": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2385283,
        "first_name": "William",
        "last_name": "Wallace",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "wwallace",
        "email": "wwallace@example.com",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T21:24:10+00:00",
        "last_active": "",
        "created": "2019-02-09T21:24:10+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/b88b293d792c7dd7ad953a5fd83da9b3",
        "mobile_number": "",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": true,
          "approve_timesheets": false,
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
      },
      "2": {
        "_status_code": 200,
        "_status_message": "Created",
        "id": 2385285,
        "first_name": "Marie",
        "last_name": "Curie",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "mcurie",
        "email": "",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-09T21:24:10+00:00",
        "last_active": "",
        "created": "2019-02-09T21:24:10+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "",
        "mobile_number": "",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": true,
          "approve_timesheets": false,
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
  "supplemental_data": {
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

Add one or more users to your company.

### HTTP Request

`POST https://rest.tsheets.com/api/v1/users`

### HTTP Request Body

The batch of users is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`username` | _String_ | Username that will be used by the employee to log on to TSheets.
`first_name` | _String_ | First name of the employee.
`last_name` | _String_ | Last name of the employee.

### Optional Properties

For a full list of the properties that may be set on an employee, see [the User object](#the-user-object).

<aside class="notice">
The maximum batch size is <i>50</i> users. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>

## Update Users

> **Example**

> Change the email address for the first employee, and set the pay rate and approve timesheets permission for the second one.

> Request Body

```json
{
  "data": [
    {
      "id": 2385283,
      "email": "william_wallace@anymail.com"
    },
    {
      "username": "mcurie",
      "pay_rate": 50.0,
      "permissions":
      {
        "approve_timesheets": true    	
      }
    }
  ]
}
```

```shell
curl -X PUT \
  https://rest.tsheets.com/api/v1/users \
  -H 'Authorization: Bearer <INSERT TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<INSERT REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/users");
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
  .url("https://rest.tsheets.com/api/v1/users")
  .put(body)
  .addHeader("Authorization", "Bearer <INSERT TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'PUT',
  url: 'https://rest.tsheets.com/api/v1/users',
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
$request->setUrl('https://rest.tsheets.com/api/v1/users');
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

url = URI("https://rest.tsheets.com/api/v1/users")

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

url = "https://rest.tsheets.com/api/v1/users"

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

	url := "https://rest.tsheets.com/api/v1/users"

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
    "users": {
      "1": {
        "_status_code": 200,
        "_status_message": "Updated",
        "id": 2385283,
        "first_name": "William",
        "last_name": "Wallace",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "wwallace",
        "email": "william_wallace@anymail.com",
        "email_verified": false,
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2019-02-10T00:24:17+00:00",
        "last_active": "",
        "created": "2019-02-09T21:24:10+00:00",
        "client_url": "spudsfunpark",
        "company_name": "Spuds Fun Park",
        "profile_image_url": "https://www.gravatar.com/avatar/e85046cc80e6d39eaee9c3bf0da582e0",
        "mobile_number": "",
        "pto_balances": {
          "2913946": 0,
          "2913948": 0,
          "2913950": 0
        },
        "submitted_to": "2000-01-01",
        "approved_to": "2000-01-01",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": true,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": false,
          "manage_jobcodes": false,
          "pin_login": true,
          "approve_timesheets": false,
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
      },
      "2": {
        "_status_code": 417,
        "_status_message": "Invalid param(s): pay_rate",
        "username": "mcurie"
      }
    }
  },
  "supplemental_data": {
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

Update one or more users in your company.

### HTTP Request

`PUT https://rest.tsheets.com/api/v1/users`

### HTTP Request Body

The batch of user updates is passed as a JSON string in the body of the HTTP request.

### Required Properties

Name | Type | Description
---- | ---- | -----------
`id` | _Integer_ | Id of the user to update.

**OR**

Name | Type | Description
---- | ---- | -----------
`username` | _String_ | Username of the user to update.

### Optional Properties

For a full list of the properties that may be set on an employee, see [the User object](#the-user-object).  If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

<aside class="notice">
The maximum batch size is <i>50</i> users. If exceeded, a <code>413: Request entity too large</code> HTTP response will be returned.
</aside>

<aside class="notice">
In the event of partial failure of the batch operation, a successful HTTP response code will nevertheless be returned.  See important note in <a href="#batch-item-status-codes">Batch Item Status Codes</a>.
</aside>
