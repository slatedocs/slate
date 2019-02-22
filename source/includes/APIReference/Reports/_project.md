## Retrieve Project Report

> **Response Layout**

```json
{
  "results": {
    "project_report": {
      "start_date": "2019-03-02",
      "end_date": "2019-03-15",
      "totals": {
        "users": {                 # This contains all users, indexed by user_id and
          "29604": "0.08"          #   the number of hours for each.
        },
        "groups": {                # This contains the number of hours for each group.
          "0": 0.08                # Time for which there is no group
        },                         #   is represented by an index of '0'.
        "jobcodes": {              # This contains the number of hours for each jobcode.
          "4647114": "0.08"        # Time for which there is no jobcode
        },                         #   is represented by an index of '0'.
        "customfields": {          # This contains the number of hours for each customfield.
          "28840": {               # Indexes are each customfield id.
            "0": "0.08"            # Each of these sub-containers is a breakdown of the
                                   #   amount of hours for each item (indexed by id) in
                                   #   the customfield. Time for which there is no item
                                   #   assigned from this customfield is represented by
                                   #   a customfielditem id of '0'.
          },
          "2054": {
            "0": "0.08"
          },
          "64": {
            "664014": "0.08"
          },
          "34": {
            "0": "0.08"
          },
          "54": {
            "0": "0.08"
          },
          "44": {
            "3711483": "0.08"
          },
          "3184": {
            "0": "0.08"
          }
        }
      }
    }
  }
}
```

 > **Example**: Retrieve a project report for time recorded within an account.

 > Request Body

```json
{
 "data":
  {
    "start_date": "2018-03-02",
    "end_date": "2018-03-15",
    "customfielditems": {
      "44": [
        "jeidh",
        "Customer2"
      ]
    },
    "jobcode_ids": [
      "4647114",
      "128934",
      "120981"
    ]
  }
}

```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/reports/project \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reports/project");
var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Authorization", "Bearer <TOKEN>");
request.AddParameter("undefined", "<REQUEST BODY>", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "<REQUEST BODY>");
Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/reports/project")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/reports/project',
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
$request->setUrl('https://rest.tsheets.com/api/v1/reports/project');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer <TOKEN>'
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

url = URI("https://rest.tsheets.com/api/v1/reports/project")

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

url = "https://rest.tsheets.com/api/v1/reports/project"

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

  url := "https://rest.tsheets.com/api/v1/reports/project"

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

> Response<br/><i>(shortened for readability)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "filters": {
      "user_ids": [

      ],
      "group_ids": [

      ],
      "jobcode_type": "both",
      "customfielditems": {
        "44": [
          "jeidh",
          "Customer2"
        ]
      },
      "jobcode_ids": [
        "4647114",
        "128934",
        "120981"
      ]
    },
    "project_report": {
      "start_date": "2018-03-02",
      "end_date": "2018-03-15",
      "totals": {
        "users": {
          "29604": "0.08"
        },
        "groups": {
          "0": 0.08
        },
        "jobcodes": {
          "4647114": "0.08"
        },
        "customfields": {
          "28840": {
            "0": "0.08"
          },
          "2054": {
            "0": "0.08"
          },
          "64": {
            "664014": "0.08"
          },
          "34": {
            "0": "0.08"
          },
          "54": {
            "0": "0.08"
          },
          "44": {
            "3711483": "0.08"
          },
          "3184": {
            "0": "0.08"
          }
        }
      }
    }
  },
  "supplemental_data": {
    "users": {
      "29604": {
        "id": 29604,
        "first_name": "Rand",
        "last_name": "test15",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "test15",
        "email": "jared.cheney@gmail.com",
        "payroll_id": "",
        ...
      }
    },
    "jobcodes": {
      "4647114": {
        "id": 4647114,
        "parent_id": 235494,
        "assigned_to_all": true,
        "billable": false,
        "active": false,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "f",
        "name": "Finches",
        "last_modified": "2018-03-24T18:41:24+00:00",
        "created": "2011-10-14T04:20:16+00:00",
        ...
      }
    },
    "customfields": {
      "28840": {
        "id": 28840,
        "required": true,
        "applies_to": "timesheet",
        "type": "managed-list",
        "short_code": "",
        "regex_filter": "",
        "name": "Class",
        ...
      }
    },
    "customfielditems": {
      "664014": {
        "id": 664014,
        "customfield_id": 64,
        "active": true,
        "short_code": "m",
        "name": "Mercede's",
        "last_modified": "2017-09-12T09:34:43+00:00",
        "required_customfields": []
      },
      "3711483": {
        "id": 3711483,
        "customfield_id": 44,
        "active": true,
        "short_code": "",
        "name": "jeidh",
        "last_modified": "2018-03-04T15:05:33+00:00",
        "required_customfields": []
      }
    }
  }
}
```

Retrieves a project report, with filters to narrow down the results.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/project</api>
 
### Filter Properties

_Pass an an object of filters as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **start_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or after this date will be included. |
| **end_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or before this date will be included. |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only time for these users will be included. |
| **group_ids**<br/>optional | _Int_ | A comma-seperated list of group ids. Only time for users from these groups will be included. |
| **jobcode_ids**<br/>optional | _Int_ | A comma-seperated list of jobcode ids. Only time for these jobcodes will be included. |
| **jobcode_type**<br/>optional | _String_ | The type of jobcodes to include. 'regular', 'pto', 'unpaid_break', 'paid_break', or 'all'. Default is 'all' |
| **customfielditems**<br/>optional | _JSON Object_ | An object with customfield_id as the properties, and each value being an array of customfielditem values. i.e.<br/><br/>`"customfielditems": {`<br/>&nbsp;&nbsp;`"12437": [`<br/>&nbsp;&nbsp;&nbsp;&nbsp;`"ProjectX",`<br/>&nbsp;&nbsp;&nbsp;&nbsp;`"Wolverine"`<br/>&nbsp;&nbsp;`]`<br/>`}` |

### Understanding the Output

See explanation of response layout to the right.