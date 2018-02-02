## coverageBlock object

### Basic Attributes

####id

A unique identifier for this coverage block

####name

Coverage block name

####days

Number of days for this coverage block

####dur

String; duration of the coverage block in: hours, minutes, and seconds


####start_time

Starting time for the coverage block

####end_time

End time for the coverage block

####breaks

Number of breaks during the coverage block

####unpaid_mins

Number of minutes of unpaid time off during the coverage block

### coverageBlock.list

<span class="tryit" id="coverageblock-list-tryit"></span>

> Request example:

```JSON
{
    "select": {
        "time_block": 20175
    }
}
```

> Response example:

```JSON
{
  "count": 1,
  "page": {
    "this": {
      "batch": 10,
      "start": 1
    }
  },
  "shift/coverage blocks": [
    {
      "breaks": "",
      "days": "0",
      "dur": "8:00:00",
      "end_time": "17:00:00",
      "id": "20175",
      "name": "8hr coverage block",
      "start_time": "09:00:00",
      "unpaid_mins": 0
    }
  ]
}
```

Returns information about coverage blocks. Uses [pagination](#pagination).

Optional parameters:

`select` object with a `time_block` attribute identifying a single coverage block or array of coverage blocks to be returned. E.g. `{select:{time_block:12345}}.`

`select` object with a `workgroup` attribute identifying a single workgroup to be returned. E.g. `{select:{time_block:12345, workgroup: 54321}}.`

####show_only_workgroup_listables

Only return results for the workgroup specified (in `select`).

####exclude_site

Boolean; if a manager of the team, don't include coverage blocks associated with the site itself with those for the team.



