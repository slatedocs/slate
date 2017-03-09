# Runs

## GET all runs in your project

This endpoint retrieves all runs.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |

test-ids | filters runs that are related to a certain test_id/ids, separated by comma (NOT display-id!) |
set-ids | filter by TestSets ids, separated by comma (NOT display-id) |
instance-ids | filter by Instances ids, separated by comma (NOT display-id) |
run-type: 'AutomatedRun |ManualRun' | filters run by Run Type: Automated or Manual  |

* None of the parameters are required. You can also combine multiple parameters if needed.
You can see examples in the dark area to the right.


```shell
# Some request examples:

# Get all runs of project #4566:

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/runs.json

# Get all runs of project #4566, of Test-ids 80895

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/runs.json?test-ids=80895

```

> This command: https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{  
   "data":[  
      {  
         "id":"49676",
         "type":"runs",
         "attributes":{  
            "project-id":4566,
            "status":"NO RUN",
            "tester-id":5380,
            "instance-id":98016,
            "test-id":80893,
            "run-type":"ManualRun",
            "custom-fields":{  

            },
            "automated-execution-output":null,
            "run-duration":"00:53:20",
            "created-at":"2017-03-07T11:10:42+02:00",
            "updated-at":"2017-03-07T12:04:44+02:00"
         }
      },
      {  
         "id":"49663",
         "type":"runs",
         "attributes":{  
            "project-id":4566,
            "status":"NOT COMPLETED",
            "tester-id":5380,
            "instance-id":98016,
            "test-id":80893,
            "run-type":"ManualRun",
            "custom-fields":{  

            },
            "automated-execution-output":null,
            "run-duration":"00:00:00",
            "created-at":"2017-02-21T13:25:34+02:00",
            "updated-at":"2017-02-21T13:25:34+02:00"
         }
      }
   ],
   "links":{  
      "self":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=1&page%5Bsize%5D=2",
      "next":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=2&page%5Bsize%5D=2",
      "last":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=41&page%5Bsize%5D=2"
   },
   "meta":{  
      "current-page":1,
      "next-page":2,
      "prev-page":null,
      "total-pages":41,
      "total-count":81
   }
}
```

## Upload test results

This endpoint uploads test results to your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/instance-id | Instance id (not display-id) | true |
data/attributes/exit-code | 0 for passed, otherwise failed | false |
data/attributes/run-duration | with name and value (HH:MM:SS), to update the run duration of a specific instance | false |
data/attributes/automation-execution-output | text output string that will be shown in ‘Execution output’ field (up to 255 characters) | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/steps/data | an array of steps override the exit code | false |
data/files/data |  | false |



```shell
curl -H "Content-Type:application/json" \
