---
title: Expensify API Reference

language_tabs:
  - shell

includes:
  - errors

search: true
---

# Introduction

Welcome to the documentation for the Expensify Integration Server. This documentation is designed to give you all the information you need to integrate with Expensify. You will find information on how to programmatically download expense reports data for analysis or insertion into your accounting package, upload employee data to configure or provision accounts for new hires or insert report data into a user’s account from your external system.

For more information, please contact us at <help@expensify.com>. Enjoy!

# Authentication

To use the API, you will need to generate API credentials.

1. Create an Expensify account at <https://www.expensify.com/>
2. Go to <https://www.expensify.com/tools/integrations/>
3. A pair of credentials `partnerUserID` and `partnerUserSecret` will be generated and shown on the page.

<aside class="notice">
Make sure to store the <code>partnerUserID</code> and <code>partnerUserSecret</code> pair you're given in a secure location, as you won't be shown them again.
</aside>

# Request format

> API call format

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={...}'
```

Every request to the Expensify API follows the same pattern: a JSON payload that identifies the job to execute is passed, as a parameter called `requestJobDescription`. Additionally, other parameters may be needed based on the type of job.

Every request has to be made against the endpoint `https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations`.

## `requestJobDescription` format

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"...",
        "credentials":{
            "partnerUserID":"_REPLACE_",
            "partnerUserSecret":"_REPLACE_"
        },
        "inputSettings":{
            ...
        }
    }'
```

For every request, the `requestJobDescription` JSON parameter will need to contain the following data:

Parameter | Type | Description
--------- | ------- | -----------
type | String | The type of job to execute
credentials | JSON object | An object containing two key/values: `partnerUserID` and `partnerUserSecret`, used to authenticate you
`inputSettings` | JSON Object | Additional information about the job to execute


# Export

## Report Exporter

> The following examples assume the template is stored in the file 'expensify_template.ftl'

> - Export report by IDs, to a CSV file

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"file",
        "credentials":{
            "partnerUserID":"_REPLACE_",
            "partnerUserSecret":"_REPLACE_"
        },
        "onReceive":{
            "immediateResponse":["returnRandomFileName"]
        },
        "inputSettings":{
            "type":"combinedReportData",
            "filters":{
                "reportIDList":"1234567,2233445"
            }
        },
        "outputSettings":{
            "fileExtension":"csv"
        }
    }'
    --data-urlencode 'template@expensify_template.ftl'
```

> - Export at most 10 Approved and Reimbursed reports generated between 2016-01-01 and 2016-02-01 to an xls file. The exported reports are then marked as exported with the label "Expensify Report" (markAsExported action), and an email with a link to the output is sent. Reports that have already been marked with the label "Expensify Report" are ignored (markedAsExported filter)

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"file",
        "credentials":{
            "partnerUserID":"_REPLACE_",
            "partnerUserSecret":"_REPLACE_"
        },
        "onReceive":{
            "immediateResponse":["returnRandomFileName"]
        },
        "inputSettings":{
            "type":"combinedReportData",
            "reportState":"APPROVED,REIMBURSED",
            "limit":"10",
            "filters":{
                "startDate":"2016-01-01",
                "endDate":"2016-02-01",
                "markedAsExported":"Expensify Export"
            }
        },
        "outputSettings":{
            "fileExtension":"xls",
            "fileBasename":"myExport"
        },
        "onFinish":[
            {"actionName":"markAsExported","label":"Expensify Export"},
            {"actionName":"email","recipients":"manager@domain.com,finances@domain.com", "message":"Report is ready."}
        ]
    }'
    --data-urlencode 'template@expensify_template.ftl'
```

> - expensify_template.ftl sample


```shell
<#if addHeader == true>
    Merchant,Amount,Category,Report number,Expense number<#lt>
</#if>
<#assign reportNumber = 1>
<#assign expenseNumber = 1>
<#list reports as report>
    <#list report.transactionList as expense>
        ${expense.merchant},<#t>
        ${expense.amount},<#t>
        ${expense.category},<#t>
        ${reportNumber},<#t>
        ${expenseNumber}<#lt>
        <#assign expenseNumber = expenseNumber + 1>
    </#list>
    <#assign reportNumber = reportNumber + 1>
</#list>
```

Export expense or report data for analysis or insertion into your accounting package, in a configurable format.

### `requestJobDescription` format

Name | Format | Valid values | Description
--------- | --------- | --------- | ---------
type | String | file | |
onReceive | JSON object | `{"immediateResponse":["returnRandomFileName"]}` | Returns the name of the generated report.
inputSettings | JSON object | See inputSettings | Settings used to filter the reports that are exported.
outputSettings | JSON object | See outputSettings | Settings for the generated file.
**Optional elements** |
test | String | true, false | If set to true, actions defined in `onFinish` will not be executed. | |
onFinish | JSON array | See onFinish | Actions performed at the end of the export.

- `inputSettings`

Name | Format | Valid values | Description
--------- | --------- | --------- | ---------
type | String | combinedReportData | Specifies all Expensify reports will be combined into a single file.
filters | JSON object | See inputSettings filters |
**Optional elements** |
reportState | String | One or more of `"OPEN"`, `"SUBMITTED"`, `"APPROVED"`, `"REIMBURSED"`, `"ARCHIVED"`.<br>When using multiple statuses, separate them by a comma, *e.g.* `"APPROVED,REIMBURSED"`<br>**Note:** These values respectively match the statuses "Open", "Processing", "Approved", "Reimbursed" and "Closed" on the website | Only the reports matching the specified status(es) will be exported.
limit | String | Any integer, as a string | Maximum number of reports to export. |
employeeEmail | String | A valid email address<br>**Note:**<br> * The usage of this parameter is restricted to certain domains<br>* If this parameter is used, reports in the OPEN status cannot be exported  | The reports will be exported from that account.

- `inputSettings.filters`

Name | Format | Valid values | Description
--------- | --------- | --------- | ---------
reportIDList | String, <br>*Optional* |  | Comma-separated list of report IDs to be exported.
policyIDList | String, <br>*Optional* |  | Comma-separated list of policy IDs the exported reports must be under.
startDate | Date, <br>*Required if `reportIDList` is not specified* | yyyy-mm-dd formatted date | Filters all reports submitted or created before the given date, whichever occurred last (inclusive).
endDate | Date, <br> *Optional* | yyyy-mm-dd formatted date | Filters all reports submitted or created after the given date, whichever occurred last (inclusive). |
approvedAfter | Date, <br> *Optional* | yyyy-mm-dd formatted date | Filters all reports approved before, or on that date. This filter is only used against reports that have been approved. |
markedAsExported | String,<br>*Optional* | Any string | Filters reports that have already been exported with that label out.


- `outputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
fileExtension | String | One or multiple of "csv", "xls", "xlsx", "txt",  "pdf", "json", "xml" | Specifies the format of the generated report. <br />*Note*: if the "pdf" option is chosen, one PDF file will be generated for each report exported.
**Optional elements** |
fileBasename | String | Any valid file base name | The name of the generated file(s) will start with this value, and a random part will be added to make each filename globally unique. If not specified, the default value `export` is used. |
includeFullPageReceiptsPdf | Boolean | `true`, `false` | Specifies whether generated PDFs should include full page receipts. This parameter is used only if `fileExtension` contains `pdf`. |
spreadsheetFilename | String | Name of a workbook template stored for you on Expensify. (e.g. "testWorkbook.xlsx")| Specifies workbook template that report data will be written to. <br />*Note*: if this is provided, then the only file made available to export will be an xlsx file. All other file extensions provided in `fileExtension` will be ignored.

- `onFinish` (Optional)

This section can be used to describe actions that need to be performed at the end of the export.

Action Name  | Description
-------- | ---------
email | Send an email with a link to the generated report to a list of recipients.
markAsExported | Mark the exported reports as “Exported” in Expensify.
sftpUpload | upload the generated file(s) to an SFTP server.

Name | Format | Valid values | Description
-------- | ---------- | ---------------- | ---------
**`email`** action |
recipients | String | Comma-separated list of valid email addresses | People to email at the end of the export. |
message | String | Plain text or Freemarker message | Content of the message. If using Freemarker, the `filenames` list can be used to get the names of all files that have been generated. |
**`markAsExported`** action  |
label | String | Any string value | The exported reports will be marked as exported with this label. |
**`sftpUpload`** action |
sftpData | JSON object | | See below |
**`sftpUpload.sftpData`** action |
host | String | | The SFTP host to connect to. |
login | String | | The username to use for SFTP authentication. |
password | String | | The password to use during authentication. |
port | Integer | | The port to connect to on the SFTP server. |

### Template parameter

The `template` parameter is used to format the Expensify data as you wish. It is based on the Freemarker language's syntax.

See <https://integrations.expensify.com/Integration-Server/doc/export_report_template.html> for more information about export templates.

<aside class="notice">
We recommend storing your template in separate files, which can be passed to the request more easily with cURL's `@` operator.
</aside>

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

