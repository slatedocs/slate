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

Retrieves a project report, with filters to narrow down the results.

**HTTP Request**

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/project</api>
 
**Filter Properties**

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

**Understanding the Output**

See explanation of response layout to the right.