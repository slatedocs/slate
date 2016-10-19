---
title: Expensify API Reference

language_tabs:
  - shell

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

## Downloader


```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"download",
        "credentials":{
            "partnerUserID":"_REPLACE_",
            "partnerUserSecret":"_REPLACE_"
        },
        "fileName":"myFile.csv"
    }'
```

This job lets you download reports that were generated with the [Report Exporter job](#report-exporter).


Name | Format | Description
-------- | ---------- | ---------
fileName | String | The name of a file generated from the exporter job.

# Create

## Report creator


```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type": "create",
        "credentials": {
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings": {
            "type": "report",
            "policyID": "0123456789ABCDEF",
            "report": {
                "title": "Name of the report",
                "fields":{
                    "reason_of_trip": "Business trip",
                    "employees": "3"
                }
            },
            "employeeEmail": "user@domain.com",
            "expenses": [
                {
                    "date": "yyyy-mm-dd",
                    "currency": "USD",
                    "merchant": "Name of merchant",
                    "amount": 1234
                },
                {
                    "date": "yyyy-mm-dd",
                    "currency": "CAD",
                    "merchant": "Name of merchant",
                    "amount": 2211
                }
            ]
        }
    }'
```

> Response

> - A success response message is comprised of a `responseCode` `200`, the name of the generated report and its ID on Expensify.

```
{
    "responseCode": 200,
    "reportName": "Name of the report",
    "reportID": "3397451"
}
```

> - Error

```
{
    "responseMessage": "Not authorized to authenticate as user user@domain.com",
    "responseCode": 500
}
```

Lets you create a report, with transactions, in a user’s account from your external system.

### `requestJobDescription` format

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "report" | Specifies to the job that it has to create a report.
employeeEmail | String | A valid email address | The report will be created in that account. |
report | JSON Object | See report. ||
expenses | JSON Array | See expenses. ||
policyID | String | Any valid Expensify policy ID, owned or shared by the user | The report will be created in that policy. |

- `inputSettings.report`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
title | String | | The title of the report that will be created.
**Optional elements** |
fields | JSON Object | A series of JSON objects whose key is the name of the report field to modify, and the value is the value to set. The key needs to have all non-alphanumerical characters replaced with underscores (`_`). | Values for custom fields on the specified `policyID`.

- `inputSettings.expenses`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
merchant | String |  | The title of the report that will be created.
currency | String | Three-letter currency code of the transaction. | The currency in which the transaction was made.
date | Date | yyyy-mm-dd formatted date | The date the expense was made.
amount | Integer |  | The amount of the transaction, in pennies.


## Expense creator


```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"create",
        "credentials":{
            "partnerUserID":"_REPLACE_",
            "partnerUserSecret":"_REPLACE_"
        },
        "inputSettings":{
            "type":"expenses",
            "employeeEmail":"user@domain.com",
            "transactionList": [
                {
                    "created": "2016-01-01",
                    "currency": "USD",
                    "merchant": "Name of merchant 1",
                    "amount": 1234
                },
                {
                    "created": "2016-01-21",
                    "currency": "EUR",
                    "merchant": "Name of merchant 2",
                    "amount": 2211,
                    "policyID": "E40D9B8DF456E233",
                    "tax": {
                       "rateID":"id_TAX_OPTION_16"
                    }
                },
                {
                    "created": "2016-01-31",
                    "currency": "CAD",
                    "merchant": "Name of merchant 3",
                    "amount": 2211,
                    "reportID": 4,
                    "tax": {
                        "rateID":"id_TAX_OPTION_16",
                        "amount":600
                    }
                }
            ]
        }
    }'
```

> Response

> -  A success response message is comprised of a `responseCode` `200`, and the list of transactions that were created. Each transaction also has a unique `transactionID`.

```
{
    "responseCode" : 200,
    "transactionList" : [
        {
            "amount" : 1234,
            "merchant" : "Name Of Merchant 1",
            "created" : "2016-01-01",
            "transactionID" : "6720309558248016",
            "currency" : "USD"
        },
        {
            "amount" : 2211,
            "merchant" : "Name Of Merchant 2",
            "created" : "2016-01-31",
            "transactionID" : "6720309558248017",
            "currency" : "CAD"
        }
    ]
}
```

> - Error

```
{
    "responseMessage" : "Malformed date '16-01-01'. Expected format is yyyy-MM-dd",
    "responseCode" : 410
}
```

Allows you to create expenses in a user’s account.

### `requestJobDescription` format

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "expenses" | Specifies to the job that it has to create expenses.
employeeEmail | String | A valid email address | The expenses will be created in that account. |
transactionList | JSON array | See below | List of expense objects. |

- `expense` objects

Name | Format | Description
-------- | --------- | ---------------- | ---------
merchant | String | The name of the merchant of the expense. |
created | String | The date of the expense (format yyyy-mm-dd). |
amount | Integer | The amount of the expense, in cents. |
currency | String | The three-letter currency code of the expense. |
**Optional elements** |
externalID | String | A unique, custom string that you specify - this will help identify the expense after being exported. |
comment | String | An expense comment. |
reportID | String | The ID of the report you want to attach the expense to.|
policyID | String | The ID of the policy the tax belongs to. |
tax | JSONObject | A tax object |

- `tax` objects

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
rateID | String | The tax rateID, as defined in the policy. To retrieve the tax information from the policy, refer to the Policy Getter job.
**Optional elements** |
amount | Integer | The tax amount paid on the expense. Specify it when only a sub-part of the expense was taxed.

## Policy creator

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type": "create",
        "credentials": {
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings": {
            "type": "policy",
            "policyName": "My New Policy"
        }
    }'
```

> Response

> -  A success response message is comprised of a `responseCode` `200`, and the ID of the policy that got created.

```
{
    "responseCode": 200,
    "policyID": "0123456789ABCDEF",
    "policyName": "My New Policy"
}
```

> - Error

```
{
    "responseMessage": "Required parameter 'policyName' is missing",
    "responseCode": 500
}
```

Lets you create a policy.

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "policy" | Specifies to the job that it has to create a policy.
policyName | String | | The name of the policy to create. |
**Optional elements** |
plan | String | "team", "corporate" | Specifies the [plan](https://www.expensify.com/pricing) of the policy. If not specified, the new policy will be created under the team plan.

# Read/Get

## Policy getter

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"get",
        "credentials":{
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings":{
            "type":"policy",
            "fields": ["tax"],
            "policyIDList": ["0123456789ABCDEF","DEADBEEF01234567","BA5EBA11BA5EBA11"],
            "userEmail":"employee@youraccessibledomain.com"
        }
    }'
```

> Response

> -  A success response message is comprised of a `responseCode` `200`, and a `policyInfo` object containing information that was requested for the provided policies.

```
{
    "responseCode": 200,
    "policyInfo": {
        "4C6722D4BD2BD941": {
            "reportFields": [{
                "values": [],
                "name": "title",
                "type": "formula"
            }, {
                "values": ["Class 1", "Class 2", "Class 2:Sub class 2"],
                "name": "Classes",
                "type": "dropdown"
            }, {
                "values": ["Donatello", "Leonardo", "Michelangelo", "Rafael"],
                "name": "Customers/Jobs",
                "type": "dropdown"
            }],
            "categories": [{
                "name": "Entertainment",
                "enabled": true
            }, {
                "name": "Transportation",
                "enabled": true
            }, {
                "name": "Phone",
                "enabled": true
            }, {
                "name": "Fuel/Mileage",
                "enabled": true
            }, {
                "name": "Lodging",
                "enabled": true
            }, {
                "name": "Meals",
                "enabled": true
            }, {
                "name": "Other",
                "enabled": false
            }],
            "tags": [{
                "glCode": "",
                "name": "Enterprise",
                "enabled": true
            }, {
                "glCode": "",
                "name": "Enterprise:Jean-Luc Picard",
                "enabled": true
            }, {
                "glCode": "",
                "name": "Enterprise:Lt. Commander Data",
                "enabled": true
            }, {
                "glCode": "",
                "name": "Enterprise:William Riker",
                "enabled": true
            }],
            "tax": {
                "default": "4",
                "rates": [{
                    "rate": 0,
                    "name": "EC Goods Zero-rated",
                    "rateID": "5"
                }, {
                    "rate": 0,
                    "name": "EC Services Standard",
                    "rateID": "4"
                }, {
                    "rate": 20,
                    "name": "Standard",
                    "rateID": "2"
                }, {
                    "rate": 5,
                    "name": "Reduced",
                    "rateID": "9"
                }],
                "name": "Tax"
            }
        },
        "3F329EA1C3809E6C": {
            "categories": [{
                "name": "Phone Costs",
                "areCommentsRequired": false,
                "enabled": false
            }, {
                "name": "Legal",
                "areCommentsRequired": false,
                "enabled": false
            }, {
                "name": "Agency Expense",
                "areCommentsRequired": false,
                "enabled": false
            }],
            "reportFields": [{
                "values": [],
                "name": "title",
                "type": "formula"
            }],
            "tags": [{
                "name": "Tags",
                "tags": []
            }],
            "tax": {}
        }
    }
}
```

> - Error

```
{
    "responseMessage": "Required parameter 'policyIDList' is missing",
    "responseCode": 410
}
```

Lets you get specific information about listed policies. At this time, only category, report field, tag, and tax information is supported.

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "policy" | Specifies to the job that it has to get information specific to policies.
policyIDList | JSON Array | | The IDs of the policies to get information for. |
fields | JSON Array | "categories", "reportFields", "tags", "tax" | Specifies the fields of the policy to gather information for. |
**Optional elements** |
userEmail | String |   | Specifies the user to gather the policy data for. You must have been granted third-party access by that user/company domain beforehand. |

## Policy list getter

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type":"get",
        "credentials":{
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings":{
            "type":"policyList",
            "adminOnly":true,
            "userEmail":"employee@youraccessibledomain.com"
        }
    }'
```

> Response

> -  A success response message is comprised of a `responseCode` `200`, and a `policyList` array containing information that was requested.

```
{
    "policyList": [{
        "outputCurrency": "USD",
        "owner": "admin@acmecorp.com",
        "role": "user",
        "name": "Acme Corp USA Policy",
        "id": "DEADBEEF12345678",
        "type": "corporate"
    }, {
        "outputCurrency": "EUR",
        "owner": "admin@acmecorp.com",
        "role": "auditor",
        "name": "Acme Corp France Policy",
        "id": "BA5EBA1187654321",
        "type": "corporate"
    }, {
        "outputCurrency": "USD",
        "owner": "hr@acmecorp.com",
        "role": "admin",
        "name": "ACME Corp Candidate Policy",
        "id": "F005BA11000099999",
        "type": "corporate"
    }],
    "responseCode": 200
}
```

> - Error

```
{
    "responseMessage":"Argument 'type' is missing or malformed",
    "responseCode":410
}
```

Lets you get a list of policies with some relevant information about them. Optionally, you may retrieve policies for another user on a domain you have been granted access to.

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "policyList" | Specifies to the job that it has to get a policy summary list.
**Optional elements** |
adminOnly | Boolean | true, false| Whether or not to get only policies for which the user is an admin for |
userEmail | String | | Specifies the user to gather the policy list for. You must have been granted third-party access by that user/company domain beforehand|


# Update

## Policy updater

> - Categories, tags and report fields

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type": "update",
        "credentials": {
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings": {
            "type": "policy",
            "policyID": "0123456789ABCDEF"
        },
        "categories": {
            "action": "merge",
            "data": [
                {
                    "name": "Category 1",
                    "enabled": true,
                    "payrollCode": "Payroll Code 1",
                    "glCode": "GL Code 1",
                    "commentHint": "Comment hint 1",
                    "areCommentsRequired": true,
                    "maxExpenseAmount": 2500
                },
                {
                    "name": "Category 2",
                    "enabled": false
                }
            ]
        },
        "tags": {
            "data": [
                {
                    "name": "Tag",
                    "tags": [
                        {
                            "name": "Tag 1",
                            "glCode": "Tag 1 GL Code"
                        },
                        {
                            "name": "Tag 2",
                            "enabled": false
                        }
                    ]
                }
            ]
        },
        "reportFields": {
            "action": "merge",
            "data": [
                {
                    "name": "Report field 1",
                    "type": "dropdown",
                    "values": [
                        "value 1",
                        "value 2",
                        "value 3"
                    ]
                }
            ]
        }
    }'
```

> - Independent multi-level tags, in JSON

```shell
curl -X POST 'https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations' \
    -d 'requestJobDescription={
        "type": "update",
        "credentials": {
            "partnerUserID": "_REPLACE_",
            "partnerUserSecret": "_REPLACE_"
        },
        "inputSettings": {
            "type": "policy",
            "policyID": "0123456789ABCDEF"
        },
        "tags": {
            "data": [
                {
                    "name": "Tag Level 1",
                    "tags": [
                        {
                            "name": "Tag 1",
                            "glCode": "Tag 1 GL Code"
                        },
                        {
                            "name": "Tag 2",
                            "glCode": "Tag 2 GL Code"
                        }
                    ]
                },
                {
                    "name": "Tag Level 2",
                    "tags": [
                        {
                            "name": "Tag 3",
                            "glCode": "Tag 3 GL Code"
                        },
                        {
                            "name": "Tag 4",
                            "glCode": "Tag 4 GL Code"
                        }
                    ]
                }
            ]
        }
    }'
```

> - Dependent multi-level tags, with GL Codes and tag level names, passed in CSV.

> Tag file - save the following data in a file called `tags.csv`, for example.

```
State,State GL,Region,Region GL,City,City GL
California,100,North,20,San Francisco,1California,100,North,20,Oakland,2California,100,South,30,Los Angeles,3California,100,South,30,San Diego,4Texas,200,East,40,Dallas,5
Texas,200,East,40,Houston,6
Texas,200,South,50,San Antonio,7
```

> Request

```shell
curl -X POST "https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations" \
    -d 'requestJobDescription={
        "type": "update",
        "credentials": {
            "partnerUserID":"...",
            "partnerUserSecret":"..."
        },
        "inputSettings": {
            "type": "policy",
            "policyID": "0123456789ABCDEF"
        },
        "tags": {
            "action": "replace",
            "source":"file",
            "config": {
                    "dependency":true,
                    "glCodes":true,
                    "header":true,
                    "setRequired":true,
                    "fileType":"csv"
            }
        }
    }' \
    --data-urlencode file@tags.csv
```

Lets you independently manage categories, tags and report fields on a policy.

- `requestJobDescription`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
**Optional elements** |
categories | JSON object | See `categories` below | Replace or update the existing tags of the policy with the ones provided.
tags | JSON object | See the dedicated [Update tags](#update-tags) section below | Replace the existing tags of the policy with the ones provided.
reportFields | JSON object | See `reportFields` below | Replace or update the existing report fields of the policy with the ones provided.

- `inputSettings`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
type | String | "policy" | Specifies to the job that it has to update a policy.
policyID | String | Any valid Expensify policy ID, owned or shared with the user with admin permissions. | The ID of the policy to update. |

- `categories`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
action | String | "merge", "replace" | Specifies how the categories will be updated. <br>- "replace" removes all existing categories and replaces them with the specified list<br>- "merge" keeps existing categories and updates/adds the ones specified.
data | JSON array | See below | |

- `categories.data` objects

Name | Format | Description
-------- | --------- | ---------
name | String | The name of the category. |
enabled | Boolean | Whether the category is enabled on Expensify. |
**Optional elements** |
glCode | String | The GL Code associated to the category. |
payrollCode | String | The Payroll Code associated to the category. |
areCommentsRequired | Boolean | Whether comments are required for expenses under that category. |
commentHint | String | The hint value for the comment for expenses under that category. |
maxExpenseAmount | Integer | The maximum amount (in cents) for expenses under that category. |

- `reportFields`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
action | String | "merge", "replace" | Specifies how the report fields will be updated. <br>- "replace" removes all existing report fields and replaces them with the specified list<br>- "merge" keeps existing report fields and updates/adds the ones specified.
data | JSON array | See below |

- `reportFields.data` objects

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
name | String | | The name of the report field. |
type | String | "text", "dropdown", "date" | The type of the report field. |
values | JSON array | Strings | *Only if type is "dropdown"*<br>The values of the dropdown. |
**Optional elements**  |
defaultValue | String | | The default value of the report field.<br>*Only used for types "text" and "dropdown"* |

### Update tags<a name="update-tags">&nbsp;</a>

Tags can be specified in two ways:

- Directly in the JSON job description
- As extra parameters of the request

#### Tag levels dependency
For multi-level tagging, Expensify has the notion of tag level dependency. This means each tag level is dependent on the parent tag level above it.
For more information and examples about multi-tagging, please refer to our [help site](https://docs.expensify.com/setup-for-admins-and-accountants/advanced-configuration-for-managers-and-accountants/tags).

#### Passing tag data in JSON (independent levels only)

- `tags`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
data | JSON array | See below |
source | String | "inline" | Specifies that the tags are directly passed in the JSON payload.

- `tags.data` objects

Multiple objects can be specified. Each one corresponds to a level in multi-level tagging.

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
name | String | | The name of the tag level. Only use with multi-level tagging.
tags | JSON array | See below | The tags for that level.

- `tags.data.tags` objects

Name | Format | Description
-------- | --------- | ---------
name | String | | The name of the tag.
**Optional elements** |
enabled | Boolean | Whether the tag is enabled or not. Default value is `true`.<br>*Note:* When multi-level tagging is used, this value is ignored and is consider `true`.
glCode | String | The GL Code associated to the tag.


#### Passing tag data from plain text as additional request parameters (dependent or independent tag levels)

The tag data must be passed in a parameter called `file` in the request.

The `tags` object must contain the following information:

Name | Format | Valid values
-------- | --------- | ---------
source | String | "file" |
config | JSON Object | See below |


- `tags.config`

Name | Format | Valid values | Description
-------- | --------- | ---------------- | ---------
dependency | Boolean | true, false | Whether tag level are dependent. |
glCodes | Boolean | true, false | Whether adjacent columns in the tag file(s) contain GL Codes.
header | Boolean | true, false | Whether the first line of the file contains the names of the tag levels.
setRequired | Boolean | true, false | If set to `true`, users will be required to tag each expenses under that category.
fileType | String | "cvs" or "tsv" | Format of the tag data.

## Employee updater

## Expense rules updater

## Report status updater
