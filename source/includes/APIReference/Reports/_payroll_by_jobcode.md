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

Retrieves a payroll report, broken down by jobcode, with filters to narrow down the results.

Overtime (and double time) are allocated based on the jobcode they are working on at the time the thresholds are crossed. In other words, by order of occurrence. 

As an example, assume that an employee works 60 hours against 3 different job codes, following this schedule: 25 hours against jobcode A, then 25 hours against jobcode B, then 10 hours against jobcode C. The report would allocate the time as follows:

| Jobcode | Hours | Regular | Overtime |
| :-----: | :---: | :-----: | :------: |
| A | 25 | 25 | 0 |
| B | 25 | 15 | 10 |
| C | 10 | 0 | 10 |

**HTTP Request**

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/payroll_by_jobcode</api>

**Filter Properties**

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

**Understanding the Output**

See explanation of response layouts to the right.

Notice in the advanced overtime layout that the `total_ot_seconds` and `total_dt_seconds` values have been replaced by the `overtime_seconds` and `fixed_rate_seconds` objects in each instance. In the `overtime_seconds` object the key is the multiplier rate and the value is the number of seconds of overtime at that rate (i.e 8340 seconds at 1.5x). In the `fixed_rate_seconds` object, the key is the additional rate amount to add to the employee's hourly rate and the value is the time in seconds.