## Retrieve Payroll Report

> **Response Layout**

```json
{
  "results": {
    "payroll_report": {
      "191544": {                    # Indexed by user_id
        "user_id": 191544,
        "client_id": "183",
        "start_date": "2019-03-02",  # Start of reporting timeframe.
        "end_date": "2019-03-15",    # End of the payroll reporting timeframe.
        "total_re_seconds": 1816,    # Regular time, in seconds.
        "total_ot_seconds": 0,       # Overtime, in seconds.
        "total_dt_seconds": 0,       # Doubletime, in seconds.
        "total_pto_seconds": 7200,   # Total PTO time, in seconds.
        "total_work_seconds": 1816,  # Total overall time, in seconds.
        "pto_seconds": {             # Break-down of PTO time by PTO code.
          "123876": 7200             # Indexed by PTO code id, then value is 
        }                            #   the time, in seconds.
      }
    }
  }
}
```

> The format with advanced overtime is as follows:

```json
{
  "results": {
    "payroll_report": {
      "191549": {                    # Indexed by user_id.
        "user_id": 191549,
        "client_id": "188",
        "start_date": "2019-03-02",  # Start of the reporting timeframe.
        "end_date": "2019-03-15",    # End of the reporting timeframe.
        "total_re_seconds": 1816,    # Regular time, in seconds.
        "total_pto_seconds": 7200,   # Total PTO time, in seconds.
        "total_work_seconds": 5416,  # Total overall time, in seconds.
        "pto_seconds": {             # Break-down of PTO time by PTO code.
          "123876": 7200             # Indexed by PTO code id, then value is 
        },                           #   the time, in seconds.
        "overtime_seconds": {        # This replaces total_ot_seconds
          "1.6": 3600,               #   and total_dt_seconds.
          "3" : 0
        },
        "fixed_rate_seconds": {
          "2": 3600,                 # Fixed rate time is listed here.
          "5": 7200                  # The overtime_seconds section above is
        }                            #   for multiplier rates.
      },
      "31174": {
        "user_id": 31174,
        "client_id": "188",
        "start_date": "2019-03-02",
        "end_date": "2019-03-15",
        "total_re_seconds": 28800,
        "total_pto_seconds": 0,
        "total_work_seconds": 606845,
        "pto_seconds": {}
        "overtime_seconds": {          # With the Overtime add-on, different
          "1.5": 14400,                # rates can apply to different people 
          "2" : 563645                 # So 1.5x & 2x instead of 1.6x & 3x. 
         },
        "fixed_rate_seconds" : {}    
      }
    }
  }
}  
```

Retrieves a payroll report associated with a timeframe, with filters to narrow down the results.

**HTTP Request**

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/payroll</api>

**Filter Properties**

_Pass an an object of filters as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **start_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or after this date will be included. |
| **end_date**<br/>required | _String_ | `YYYY-MM-DD` formatted date. Any time with a date falling on or before this date will be included. |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only time for these users will be included. |
| **group_ids**<br/>optional | _Int_ | A comma-seperated list of group ids. Only time for users from these groups will be included. |
| **include_zero_time**<br/>optional | _String_ | 'yes' or 'no'. Default is 'no'. If 'yes', all users will be included in the output, even if they had zero hours for the time period. |
| **advanced_overtime**<br/>(see notes below) | _String_ | 'yes' or 'no'. If 'yes', overtime will be formatted such that it includes the time for individual multipliers and can support more than just 1.5x (ot) and 2x (dt) overtime. |

<aside class="notice">
For <code>advanced_overtime</code> the default for api keys created before Oct 25th 2017 is 'no', however, the default for api keys created after this date is 'yes' and attempting to pass this parameter with a value of 'no' will result in an exception.
</aside>

<aside class="notice">
The <code>advanced_overtime</code> setting is required to be passed as 'yes' if the Overtime add-on is installed and rates other than the standard 1.5x and 2x rates are defined. This is enforced so that incorrect overtime values that do not comply with the standard "total_ot_seconds" (1.5x) and "total_dt_seconds" (2x) rates are not missed.
</aside>

**Understanding the Output**

See explanation of response layouts to the right.

Notice in the advanced overtime layout that the `total_ot_seconds` and `total_dt_seconds` values have been replaced by the `overtime_seconds` and `fixed_rate_seconds` objects in each instance. In the `overtime_seconds` object the key is the multiplier rate and the value is the number of seconds of overtime at that rate (i.e 14400 seconds at 1.5x). In the `fixed_rate_seconds` object, the key is the additional rate amount to add to the employee's hourly rate and the value is the time in seconds.