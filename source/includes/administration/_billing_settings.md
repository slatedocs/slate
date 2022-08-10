### Billing Settings

<!-------------------- FIND BILLING SETTINGS -------------------->

#### Find billing settings associated to an organization

`GET /reseller/settings/billing/find?organizationId=:id`

Retrieve the billing settings associated to an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the billing settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/billing/find?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "f7ad28a8-1227-44de-9785-6dbd556f3bda",
    "version": 1,
    "daysBeforeAutoDraft": 3,
    "daysBeforeAutoApproval": 3,
    "daysBeforeAutoPayment": 5,
    "invoiceTag": {
      "id": "f3003247-b147-4f8f-b625-bc963a6cb6e3",
      "name": "non-invoiceable"
    },
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

Retrieve the billing settings associated to an organization.

| Attributes                                    | &nbsp;                                                                                                                                                     |
|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*                               | The configured billing settings' id.                                                                                                                       |
| `organization.id`<br/>*UUID*                  | The organization id that the billing settings are linked to. It cannot be changed.                                                                         |
| `version`<br/>*integer*                       | The billing settings version.                                                                                                                              |
| `daysBeforeAutoDraft`<br/>*integer*           | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days. |
| `daysBeforeAutoApproval`<br/>*integer*        | The number of days to review an in review invoice before it is automatically issued to the customer.                                                       |
| `daysBeforeAutoPayment`<br/>*integer*         | The number of days after the invoice has been issued before the customer's credit card is automatically charged.                                           |
| `invoiceTag`<br/>*object*                     | Specify a tag that can be used to mark organizations as not invoiceable.                                                                                   |
| `bccEmails`<br/>*Array[string]*               | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.                                                        |
| `daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.                         |
| `customerInformation`<br/>*Array[string]*     | The list of client custom fields to display in the invoice.                                                                                                |
| `address`<br/>*Array[string]*                 | The address to display in the invoice. Each address field will be a row in the address block.                                                              |
| `termsAndConditions`<br/>*string*             | The terms and conditions to display in the invoice.                                                                                                        |

<!-------------------- GET BILLING SETTINGS -------------------->
#### Retrieve billing settings

`GET /reseller/settings/billing/:id`

```shell
# Retrieve billing settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/billing/f7ad28a8-1227-44de-9785-6dbd556f3bda" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
   "data":{
      "daysBeforeAutoDraft":5,
      "minimumDaysInvoicePeriod":15,
      "bccEmails":[
         "email@cloudops.com"
      ],
      "address":{
         "country":"USA",
         "province":"Georgia",
         "city":"Atlanta",
         "postalCode":"30328",
         "businessName":"Org",
         "lineOne":"123 Example Street"
      },
      "daysBeforeAutoApproval":3,
      "version":93,
      "defaultPricingPackage":{
         "id":"8358f8d6-1f2d-4bb9-bb0a-f8ce51dfa19c"
      },
      "daysBeforeCardWarnings":[
         24
      ],
      "invoiceTag": {
        "id": "f3003247-b147-4f8f-b625-bc963a6cb6e3",
        "name": "non-invoiceable"
      },
      "termsAndConditions":"Terms",
      "defaultCurrency":"USD",
      "organization":{
         "name":"Org",
         "customFieldDefinitions":[
            {
               "field":"account_number",
               "id":"31b7350a-3c41-4d64-b58b-c7bfbc45abbb",
               "nameTranslations":{
                  "en":"Account Number"
               },
               "descriptionTranslations":{
                  "en":"Account number"
               }
            }
          ],
         "id":"5ff3a3d8-41a8-4ca2-813f-7d5af4cfc872"
      },
      "billingDay":1,
      "customerInformation":[
         "account_number"
      ],
      "id":"0ada48d2-2c3b-4930-8427-d0087ec32551",
      "daysBeforeAutoPayment":1
   }
}
```

Retrieve the billing settings associated to the billing settings id.

| Attributes                                                | &nbsp;                                                                                                                                                                                                        |
|-----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*                                           | The configured billing settings' id.                                                                                                                                                                          |
| `organization.id`<br/>*UUID*                              | The organization id that the billing settings are linked to. It cannot be changed.                                                                                                                            |
| `organization.name`<br/>*string*                          | The name of the organization that the billing settings are linked to. It cannot be changed.                                                                                                                   |
| `organization.customFieldDefinitions`<br/>*Array[object]* | The defined custom field of a customer, contains the field name, id, and translation data. Only returned if the org has custom fields enabled and present.                                                    |
| `version`<br/>*integer*                                   | The billing settings version.                                                                                                                                                                                 |
| `defaultCurrency`<br/>*string*                            | The currency that will be used by default on an invoice.                                                                                                                                                      |
| `defaultPricingPackage.id`<br/>*UUID*                     | The pricing package id that is used to derive the usage data costs for non-billable organizations, usage reports will be available to view but invoices will not be generated for non-billable organizations. |
| `billingDay`<br/>*integer*                                | The day of the month in which new billing cycles are started.                                                                                                                                                 |
| `daysBeforeAutoDraft`<br/>*integer*                       | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days.                                                    |
| `daysBeforeAutoApproval`<br/>*integer*                    | The number of days to review an in review invoice before it is automatically issued to the customer.                                                                                                          |
| `daysBeforeAutoPayment`<br/>*integer*                     | The number of days after the invoice has been issued before the customer's credit card is automatically charged.                                                                                              |
| `minimumDaysInvoicePeriod`<br/>*integer*                  | The minimum amount of days an organization has been onboarded for before an invoice is generated.                                                                                                             |
| `invoiceTag`<br/>*object*                                 | Specify a tag that can be used to mark organizations as not invoiceable.                                                                                                                                      |
| `bccEmails`<br/>*Array[string]*                           | List of email addresses to include as Blind Carbon Copy (BCC) when sending emails to customers upon billing exceptions.                                                                                       |
| `daysBeforeCardWarnings`<br/>*Array[integer]*             | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.                                                                            |
| `customerInformation`<br/>*Array[string]*                 | The list of client custom fields to display in the invoice.                                                                                                                                                   |
| `address`<br/>*Array[string]*                             | The address to display in the invoice. Each address field will be a row in the address block.                                                                                                                 |
| `termsAndConditions`<br/>*string*                         | The terms and conditions to display in the invoice.                                                                                                                                                           |

<!-------------------- CREATE BILLING SETTINGS -------------------->
#### Create billing settings

`POST /reseller/settings/billing`

Create new billing settings.

```shell
# Creates a new billing settings
curl -X POST "https://cloudmc_endpoint/api/v2/reseller/settings/billing" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "daysBeforeAutoApproval": 3,
  "daysBeforeAutoPayment": 5,
  "daysBeforeAutoDraft": 3,
  "invoiceTag": {
    "name": "non-invoiceable"
  },
  "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
  "daysBeforeCardWarnings": [30],
  "customerInformation": ["accountId"],
  "address": ["Address line 1", "Address line 2", "etc."],
  "termsAndConditions": "My terms and conditions..."
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "daysBeforeAutoDraft": 3,
    "daysBeforeAutoApproval": 3,
    "daysBeforeAutoPayment": 5,
    "invoiceTag": {
      "id": "f3003247-b147-4f8f-b625-bc963a6cb6e3",
      "name": "non-invoiceable"
    },
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

| Required                                      | &nbsp;                                                                                                                                                      |
|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `daysBeforeAutoDraft`<br/>*integer*           | The number of days after the billing date to continue gathering missing customer usage before the invoices is marked in review. Cannot be less than 2 days. |
| `daysBeforeAutoApproval`<br/>*integer*        | The number of days to review an in review invoice before it is automatically issued to the customer.                                                        |
| `daysBeforeAutoPayment`<br/>*integer*         | The number of days after the invoice has been issued before the customer's credit card is automatically charged.                                            |
| `daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.                          |

| Optional                                  | &nbsp;                                                                                                                                               |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| `organization.id`<br/>*UUID*              | The organization id that the billing settings are linked to. If the `organizationId` is omitted, the authenticated user's organization will be used. |
| `defaultPricingPackage.id`<br/>*UUID*     | The id of the default pricing package, if there is none specified then usage from non-billable organizations will not be derived a cost.             |
| `customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.                                                                                          |
| `address`<br/>*Array[string]*             | The address to display in the invoice. Each address field will be a row in the address block.                                                        |
| `termsAndConditions`<br/>*string*         | The terms and conditions to display in the invoice.                                                                                                  |
| `invoiceTag`<br/>*object*                 | Specify a tag that can be used to mark organizations as not invoiceable.                                                                             |
| `bccEmails`<br/>*Array[string]*           | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.                                                  |

<!-------------------- UPDATE BILLING SETTINGS -------------------->
#### Update billing settings

`PUT /reseller/settings/billing/:id`

Updates the billing settings of an organization.

```shell
# Updates an existing billing settings for an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/reseller/settings/billing/d785ffcb-9b03-478d-a49b-52a2ccedf1b8 \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
  "version": 1,
   "daysBeforeAutoDraft": 3,
  "daysBeforeAutoApproval": 3,
  "daysBeforeAutoPayment": 5,
  "invoiceTag": {
    "id": "f3003247-b147-4f8f-b625-bc963a6cb6e3",
    "name": "non-invoiceable"
  },
  "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
  "daysBeforeCardWarnings": [30],
  "customerInformation": ["accountId"],
  "address": ["Address line 1", "Address line 2", "etc."],
  "termsAndConditions": "My terms and conditions..."
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 2,
    "daysBeforeAutoDraft": 3,
    "daysBeforeAutoApproval": 3,
    "daysBeforeAutoPayment": 5,
    "invoiceTag": {
      "id": "f3003247-b147-4f8f-b625-bc963a6cb6e3",
      "name": "non-invoiceable"
    },
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

| Required                                      | &nbsp;                                                                                                                                                     |
|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*                               | The configured billing settings' id.                                                                                                                       |
| `organization.id`<br/>*UUID*                  | The organization id that the billing settings are linked to. It cannot be changed.                                                                         |
| `daysBeforeAutoDraft`<br/>*integer*           | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days. |
| `daysBeforeAutoApproval`<br/>*integer*        | The number of days to review an in review invoice before it is automatically issued to the customer.                                                       |
| `daysBeforeAutoPayment`<br/>*integer*         | The number of days after the invoice has been issued before the customer's credit card is automatically charged.                                           |
| `daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.                         |

| Optional                                  | &nbsp;                                                                                                                                   |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| `defaultPricingPackage.id`<br/>*UUID*     | The id of the default pricing package, if there is none specified then usage from non-billable organizations will not be derived a cost. |
| `customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.                                                                              |
| `address`<br/>*Array[string]*             | The address to display in the invoice. Each address field will be a row in the address block.                                            |
| `termsAndConditions`<br/>*string*         | The terms and conditions to display in the invoice.                                                                                      |
| `invoiceTag`<br/>*object*                 | Specify a tag that can be used to mark organizations as not invoiceable.                                                                 |
| `bccEmails`<br/>*Array[string]*           | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.                                      |

<!-------------------- DELETE BILLING SETTINGS -------------------->
#### Delete billing settings

`DELETE /reseller/settings/billing/:id`

Delete an existing billing settings.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v2/reseller/settings/billing/d785ffcb-9b03-478d-a49b-52a2ccedf1b8" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
