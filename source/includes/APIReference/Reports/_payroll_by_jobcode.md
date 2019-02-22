## Retrieve Payroll by Jobcode Report

> **Response Layout**

```json
{
  "results": {
    "filters": {                       # The parameters (passed to the API).
      "start_date": "2019-03-12",      # Start date for the report.
      "end_date": "2019-03-18",        # End date for the report.
      "user_ids": [                    # Array of user IDs to include in the
        "15790",                       #   report. If not present, all users
        "76108",                       #   will be included.
        "76124"
      ]
    },
    "payroll_by_jobcode_report": {     # The report section of the output.
      "totals": {                      # Overall totals for each jobcode
                                       #   contained in the report.
        "82026": {                     # Jobcode ID.
          "jobcode_id": 82026,     
          "total_re_seconds": 0,       # Total regular seconds for this jobcode.
          "total_ot_seconds": 0,       # Total overtime seconds for this jobcode.
          "total_dt_seconds": 0,       # Total double time seconds for this jobcode.
          "total_pto_seconds": 28800,  # Total PTO seconds for this jobcode.
          "total_work_seconds": 28800  # Total number of seconds for this jobcode.
        },                     
        "733512": {
          "jobcode_id": 733512,
          "total_re_seconds": 57600,
          "total_ot_seconds": 18300,
          "total_dt_seconds": 0,
          "total_pto_seconds": 0,
          "total_work_seconds": 75900
        }
      },
      "by_user": {                     # Totals Section (by user).
        "15790": {                     # User ID.
          "user_id": 15790,             
          "totals": {                  # Totals for each jobcode, for this user.
            "82026": {                 # Jobcode ID.
              "jobcode_id": 82026,         
              "total_re_seconds": 0,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 28800,
              "total_work_seconds": 28800
            },
            "733512": {
              "jobcode_id": 733512,
              "total_re_seconds": 57600,
              "total_ot_seconds": 18300,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 75900
            }
          },
          "dates": {                   # Totals by Date (for this user).
            "2019-03-15": {            # Date.
              "82026": {               # Jobcode ID.
                "jobcode_id": 82026,        
                "total_re_seconds": 0,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 28800,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              },
              "733512": {
                "jobcode_id": 733512,
                "total_re_seconds": 28800,
                "total_ot_seconds": 8340,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 37140
              }
            }
          }
        } 
      }
    }
  }
}
```

> The format with advanced overtime is as follows:

```json
{
  "results": {
    "filters": {                        # The parameters (passed to the API).
      "start_date": "2017-03-12",       # Start date for the report.
      "end_date": "2017-03-18",         # End date for the report.
      "user_ids": [                     # Array of user IDs to include in the
        "15790",                        #   report. If not present, all users
        "76108",                        #   will be included.
        "76124"
      ]
    },
    "payroll_by_jobcode_report": {      # The report section of the output
      "totals": {                       # Overall totals for each jobcode
                                        #   contained in the report.
        "82026": {                      # Jobcode ID
          "jobcode_id": 82026,           
          "total_re_seconds": 0,        # Total regular seconds for this jobcode.
          "total_pto_seconds": 28800,   # Total PTO seconds for this jobcode.
          "total_work_seconds": 28800,  # Total number of seconds for this jobcode.
          "overtime_seconds": {         # This replaces "total_ot_seconds" 
            "1.6": 0,                   #   and "total_dt_seconds".
            "3" : 0
          },
          "fixed_rate_seconds": {
            "2": 3600,                  # Fixed rate time is listed here.
            "4": 7200                   # The overtime_seconds section above
          }                             #   is for multiplier rates.
        },                     
        "733512": {
          "jobcode_id": 733512,
          "total_re_seconds": 57600,
          "total_pto_seconds": 0,
          "total_work_seconds": 75900
          "overtime_seconds": {           
            "1.6": 18300,                
            "3" : 0
          },
          "fixed_rate_seconds": {}      
        }
      },
      "by_user": {                      # Totals Section (by user)
        "15790": {                      # User ID
          "user_id": 15790,             
          "totals": {                   # Totals for each jobcode, for this user.
            "82026": {                  # Jobcode ID
              "jobcode_id": 82026,         
              "total_re_seconds": 0,
              "total_pto_seconds": 28800,
              "total_work_seconds": 28800
              "overtime_seconds": {           
                "1.6": 0,                
                "3" : 0
              },
              "fixed_rate_seconds": {
                "2": 3600,
                "4": 7200
              }       
            },
            "733512": {
              "jobcode_id": 733512,
              "total_re_seconds": 57600,
              "total_pto_seconds": 0,
              "total_work_seconds": 75900
              "overtime_seconds": {           
                "1.6": 18300,                
                "3" : 0
              },
              "fixed_rate_seconds": {}      
            }
          },
          "dates": {                    # Totals by Date (for this user)
            "2017-03-15": {             # Date
              "82026": {                # Jobcode ID
                "jobcode_id": 82026,        
                "total_re_seconds": 0,
                "total_pto_seconds": 28800,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
                "overtime_seconds": {           
                  "1.6": 0,                
                  "3" : 0
                },
                "fixed_rate_seconds": {
                  "2": 3600,
                  "4": 7200
                }      
              },
              "733512": {
                "jobcode_id": 733512,
                "total_re_seconds": 28800,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 37140
                "overtime_seconds": {           
                  "1.6": 8340,                
                  "3" : 0
                },
                "fixed_rate_seconds": {}      
              }
            }
          }
        }
      }
    }
  }
}
```

 > **Example**: Retrieve a payroll report, broken down by jobcode, for the given time period within an account.

 > Request Body

```json
{
  "data": {
    "user_ids": "15790,76108,76124",
    "start_date": "2018-03-12",
    "end_date": "2018-03-18",
    "advanced_overtime": "no"
  }
}
```

 > Request

```shell
curl -X POST \
  https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '<REQUEST BODY>'
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode");
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
  .url("https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode")
  .post(body)
  .addHeader("Authorization", "Bearer <TOKEN>")
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'POST',
  url: 'https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode',
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
$request->setUrl('https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode');
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

url = URI("https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode")

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

url = "https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode"

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

  url := "https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode"

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

> Response<br/><i>(example will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{
  "results": {
    "filters": {
      "start_date": "2017-03-12",
      "end_date": "2017-03-18",
      "user_ids": [
        "15790",
        "76108",
        "76124"
      ]
    },
    "payroll_by_jobcode_report": {
      "totals": {
        "82024": {
          "jobcode_id": 82024,
          "total_re_seconds": 0,
          "total_ot_seconds": 0,
          "total_dt_seconds": 0,
          "total_pto_seconds": 14400,
          "total_work_seconds": 14400
        },
        "82026": {
          "jobcode_id": 82026,
          "total_re_seconds": 0,
          "total_ot_seconds": 0,
          "total_dt_seconds": 0,
          "total_pto_seconds": 28800,
          "total_work_seconds": 28800
        },
        "762436": {
          "jobcode_id": 762436,
          "total_re_seconds": 0,
          "total_ot_seconds": 0,
          "total_dt_seconds": 0,
          "total_pto_seconds": 28800,
          "total_work_seconds": 28800
        }
      },
      "by_user": {
        "15790": {
          "user_id": 15790,
          "totals": {
            "82026": {
              "jobcode_id": 82026,
              "total_re_seconds": 0,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 28800,
              "total_work_seconds": 28800
            },
            "733512": {
              "jobcode_id": 733512,
              "total_re_seconds": 57600,
              "total_ot_seconds": 18300,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 75900
            },
            "733514": {
              "jobcode_id": 733514,
              "total_re_seconds": 28800,
              "total_ot_seconds": 12480,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 41280
            },
            "733516": {
              "jobcode_id": 733516,
              "total_re_seconds": 28800,
              "total_ot_seconds": 3360,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 32160
            },
            "733528": {
              "jobcode_id": 733528,
              "total_re_seconds": 28800,
              "total_ot_seconds": 14400,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 43200
            }
          },
          "dates": {
            "2017-03-13": {
              "733528": {
                "jobcode_id": 733528,
                "total_re_seconds": 28800,
                "total_ot_seconds": 14400,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 43200
              }
            },
            "2017-03-14": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 3360,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 32160
              }
            },
            "2017-03-15": {
              "82026": {
                "jobcode_id": 82026,
                "total_re_seconds": 0,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 28800,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              },
              "733512": {
                "jobcode_id": 733512,
                "total_re_seconds": 28800,
                "total_ot_seconds": 8340,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 37140
              }
            },
            "2017-03-16": {
              "733514": {
                "jobcode_id": 733514,
                "total_re_seconds": 28800,
                "total_ot_seconds": 12480,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 41280
              }
            },
            "2017-03-17": {
              "733512": {
                "jobcode_id": 733512,
                "total_re_seconds": 28800,
                "total_ot_seconds": 9960,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 38760
              }
            }
          }
        },
        "76108": {
          "user_id": 76108,
          "totals": {
            "733512": {
              "jobcode_id": 733512,
              "total_re_seconds": 18960,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 18960
            },
            "733516": {
              "jobcode_id": 733516,
              "total_re_seconds": 8700,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 0,
              "total_work_seconds": 8700
            },
            "762436": {
              "jobcode_id": 762436,
              "total_re_seconds": 0,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 28800,
              "total_work_seconds": 28800
            }
          },
          "dates": {
            "2017-03-13": {
              "733512": {
                "jobcode_id": 733512,
                "total_re_seconds": 18960,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 18960
              }
            },
            "2017-03-14": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 8700,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 8700
              }
            },
            "2017-03-15": {
              "762436": {
                "jobcode_id": 762436,
                "total_re_seconds": 0,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 28800,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              }
            }
          }
        },
        "76124": {
          "user_id": 76124,
          "totals": {
            "82024": {
              "jobcode_id": 82024,
              "total_re_seconds": 0,
              "total_ot_seconds": 0,
              "total_dt_seconds": 0,
              "total_pto_seconds": 14400,
              "total_work_seconds": 14400
            },
            "733516": {
              "jobcode_id": 733516,
              "total_re_seconds": 144000,
              "total_ot_seconds": 28800,
              "total_dt_seconds": 3600,
              "total_pto_seconds": 0,
              "total_work_seconds": 176400
            }
          },
          "dates": {
            "2017-03-13": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              }
            },
            "2017-03-14": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 14400,
                "total_dt_seconds": 3600,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 46800
              }
            },
            "2017-03-15": {
              "82024": {
                "jobcode_id": 82024,
                "total_re_seconds": 0,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 14400,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 14400
              },
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              }
            },
            "2017-03-16": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 14400,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 43200
              }
            },
            "2017-03-17": {
              "733516": {
                "jobcode_id": 733516,
                "total_re_seconds": 28800,
                "total_ot_seconds": 0,
                "total_dt_seconds": 0,
                "total_pto_seconds": 0,
                "total_unpaid_seconds": 0,
                "total_work_seconds": 28800
              }
            }
          }
        }
      }
    }
  },
  "supplemental_data": {
    "users": {
      "15790": {
        "id": 15790,
        "first_name": "Adam",
        "last_name": "Ashton",
        "group_id": 1648,
        "active": true,
        "employee_number": 3748,
        "salaried": true,
        "exempt": false,
        "username": "aashton",
        "email": "d@ds6.us",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2017-04-24T17:26:44+00:00",
        "last_active": "2017-04-18T12:35:26+00:00",
        "created": "2016-03-11T00:00:16+00:00",
        "client_url": "dstokes",
        "company_name": "dstokes",
        "mobile_number": "",
        "pto_balances": {
          "82024": 151920,
          "82026": 0,
          "762436": 3960
        },
        "submitted_to": "2017-03-12",
        "approved_to": "2017-03-12",
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
          "manage_my_timesheets": true,
          "manage_jobcodes": false,
          "pin_login": false,
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
      "76108": {
        "id": 76108,
        "first_name": "Alison",
        "last_name": "Canseco",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": true,
        "exempt": false,
        "username": "acanseco",
        "email": "",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2017-04-24T17:25:55+00:00",
        "last_active": "2017-04-05T16:33:55+00:00",
        "created": "2016-10-20T22:40:10+00:00",
        "client_url": "dstokes",
        "company_name": "dstokes",
        "mobile_number": "",
        "pto_balances": {
          "82024": 414000,
          "82026": 0,
          "762436": 115200
        },
        "submitted_to": "2017-03-12",
        "approved_to": "2017-03-12",
        "manager_of_group_ids": [
          1648
        ],
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
          "manage_my_timesheets": true,
          "manage_jobcodes": false,
          "pin_login": false,
          "approve_timesheets": false,
          "manage_schedules": false,
          "external_access": false,
          "manage_my_schedule": false,
          "manage_company_schedules": true,
          "view_company_schedules": false,
          "view_group_schedules": false,
          "manage_no_schedules": false,
          "view_my_schedules": false
        },
        "customfields": ""
      },
      "76124": {
        "id": 76124,
        "first_name": "Erica",
        "last_name": "West",
        "group_id": 0,
        "active": true,
        "employee_number": 0,
        "salaried": false,
        "exempt": false,
        "username": "ewest",
        "email": "",
        "payroll_id": "",
        "hire_date": "0000-00-00",
        "term_date": "0000-00-00",
        "last_modified": "2017-04-20T13:50:28+00:00",
        "last_active": "2017-04-20T13:50:29+00:00",
        "created": "2016-10-20T22:47:22+00:00",
        "client_url": "dstokes",
        "company_name": "dstokes",
        "mobile_number": "",
        "pto_balances": {
          "82024": 129600,
          "82026": 0,
          "762436": 144000
        },
        "submitted_to": "2015-03-12",
        "approved_to": "2015-01-08",
        "manager_of_group_ids": [],
        "require_password_change": false,
        "pay_rate": 0,
        "pay_interval": "hour",
        "permissions": {
          "admin": false,
          "mobile": false,
          "status_box": false,
          "reports": false,
          "manage_timesheets": false,
          "manage_authorization": false,
          "manage_users": false,
          "manage_my_timesheets": true,
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
    },
    "jobcodes": {
      "82024": {
        "id": 82024,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Vacation",
        "last_modified": "2015-11-18T21:34:19+00:00",
        "created": "2015-11-18T21:34:19+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "82026": {
        "id": 82026,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Holiday",
        "last_modified": "2015-11-18T21:34:19+00:00",
        "created": "2015-11-18T21:34:19+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "733512": {
        "id": 733512,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Amy's Bird Sanctuary",
        "last_modified": "2017-04-13T15:19:05+00:00",
        "created": "2016-10-20T22:31:42+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "733514": {
        "id": 733514,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Bill's Windsurf Shop",
        "last_modified": "2017-04-13T15:19:05+00:00",
        "created": "2016-10-20T22:31:42+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "733516": {
        "id": 733516,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Cool Cars",
        "last_modified": "2017-04-13T15:19:05+00:00",
        "created": "2016-10-20T22:31:42+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "733528": {
        "id": 733528,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "regular",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Gevelber Photography",
        "last_modified": "2017-04-13T15:19:05+00:00",
        "created": "2016-10-20T22:31:42+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      },
      "762436": {
        "id": 762436,
        "parent_id": 0,
        "assigned_to_all": true,
        "billable": false,
        "active": true,
        "type": "pto",
        "has_children": false,
        "billable_rate": 0,
        "short_code": "",
        "name": "Sick",
        "last_modified": "2016-10-31T15:31:47+00:00",
        "created": "2016-10-31T15:31:13+00:00",
        "filtered_customfielditems": "",
        "required_customfields": []
      }
    }
  }
}
```

Retrieves a payroll report, broken down by jobcode, with filters to narrow down the results.

Overtime (and double time) are allocated based on the jobcode they are working on at the time the thresholds are crossed. In other words, by order of occurrence. 

As an example, assume that an employee works 60 hours against 3 different job codes, following this schedule: 25 hours against jobcode A, then 25 hours against jobcode B, then 10 hours against jobcode C. The report would allocate the time as follows:

| Jobcode | Hours | Regular | Overtime |
| :-----: | :---: | :-----: | :------: |
| A | 25 | 25 | 0 |
| B | 25 | 15 | 10 |
| C | 10 | 0 | 10 |

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode</api>

### Filter Properties

_Pass an an object of filters as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **start_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or after this date will be included.  |
| **end_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or before this date will be included. |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only time for these users will be included. |
| **group_ids**<br/>optional | _Int_ | A comma-separated list of group ids. Only time for users from these groups will be included. |
| **advanced_overtime**<br/>(see notes below) | _String_ | 'yes' or 'no'. If 'yes', overtime will be formatted such that it includes the time for individual multipliers and can support more than just 1.5x (ot) and 2x (dt) overtime. |

<aside class="notice">
The date range defined by <code>start_date</code> and <code>end_date</code> must not exceed 31 days.
</aside>

<aside class="notice">
For <code>advanced_overtime</code> the default for api keys created before Oct 25th 2017 is 'no', however, the default for api keys created after this date is 'yes' and attempting to pass this parameter with a value of 'no' will result in an exception.
</aside>

<aside class="notice">
The <code>advanced_overtime</code> setting is required to be passed as 'yes' if the Overtime add-on is installed and rates other than the standard 1.5x and 2x rates are defined. This is enforced so that incorrect overtime values that do not comply with the standard "total_ot_seconds" (1.5x) and "total_dt_seconds" (2x) rates are not missed.
</aside>

### Understanding the Output

See explanation of response layouts to the right.

Notice in the advanced overtime layout that the `total_ot_seconds` and `total_dt_seconds` values have been replaced by the `overtime_seconds` and `fixed_rate_seconds` objects in each instance. In the `overtime_seconds` object the key is the multiplier rate and the value is the number of seconds of overtime at that rate (i.e 8340 seconds at 1.5x). In the `fixed_rate_seconds` object, the key is the additional rate amount to add to the employee's hourly rate and the value is the time in seconds.