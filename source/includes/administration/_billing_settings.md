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
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions...",
  }
}
```

Retrieve the billing settings associated to an organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured billing settings' id.
`organization.id`<br/>*UUID* | The organization id that the billing settings are linked to. It cannot be changed.
`version`<br/>*integer* | The billing settings version.
`daysBeforeAutoDraft`<br/>*integer* | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days.
`daysBeforeAutoApproval`<br/>*integer* | The number of days to review an in review invoice before it is automatically issued to the customer.
`daysBeforeAutoPayment`<br/>*integer* | The number of days after the invoice has been issued before the customer's credit card is automatically charged.
`bccEmails`<br/>*Array[string]* | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.
`daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.
`customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.
`address`<br/>*Array[string]* | The address to display in the invoice. Each address field will be a row in the address block.
`termsAndConditions`<br/>*string* | The terms and conditions to display in the invoice.


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
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "f7ad28a8-1227-44de-9785-6dbd556f3bda",
    "version": 1,
    "daysBeforeAutoDraft": 3,
    "daysBeforeAutoApproval": 3,
    "daysBeforeAutoPayment": 5,
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

Retrieve the billing settings associated to the billing settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured billing settings' id.
`organization.id`<br/>*UUID* | The organization id that the billing settings are linked to. It cannot be changed.
`version`<br/>*integer* | The billing settings version.
`daysBeforeAutoDraft`<br/>*integer* | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days.
`daysBeforeAutoApproval`<br/>*integer* | The number of days to review an in review invoice before it is automatically issued to the customer.
`daysBeforeAutoPayment`<br/>*integer* | The number of days after the invoice has been issued before the customer's credit card is automatically charged.
`bccEmails`<br/>*Array[string]* | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.
`daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.
`customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.
`address`<br/>*Array[string]* | The address to display in the invoice. Each address field will be a row in the address block.
`termsAndConditions`<br/>*string* | The terms and conditions to display in the invoice.

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
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

Required | &nbsp;
---------- | -----------
`daysBeforeAutoDraft`<br/>*integer* | The number of days after the billing date to continue gathering missing customer usage before the invoices is marked in review. Cannot be less than 2 days.
`daysBeforeAutoApproval`<br/>*integer* | The number of days to review an in review invoice before it is automatically issued to the customer.
`daysBeforeAutoPayment`<br/>*integer* | The number of days after the invoice has been issued before the customer's credit card is automatically charged.
`daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.

Optional | &nbsp;
---------- | -----------
`organization.id`<br/>*UUID* | The organization id that the billing settings are linked to. If the `organizationId` is omitted, the authenticated user's organization will be used.
`customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.
`address`<br/>*Array[string]* | The address to display in the invoice. Each address field will be a row in the address block.
`termsAndConditions`<br/>*string* | The terms and conditions to display in the invoice.
`bccEmails`<br/>*Array[string]* | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.

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
    "bccEmails": ["finance.support@company.com", "monitoring@company.com"],
    "daysBeforeCardWarnings": [30],
    "customerInformation": ["accountId"],
    "address": ["Address line 1", "Address line 2", "etc."],
    "termsAndConditions": "My terms and conditions..."
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured billing settings' id.
`organization.id`<br/>*UUID* | The organization id that the billing settings are linked to. It cannot be changed.
`daysBeforeAutoDraft`<br/>*integer* | The number of days after the billing date to continue gathering missing customer usage before the invoice is marked in review. Cannot be less than 2 days.
`daysBeforeAutoApproval`<br/>*integer* | The number of days to review an in review invoice before it is automatically issued to the customer.
`daysBeforeAutoPayment`<br/>*integer* | The number of days after the invoice has been issued before the customer's credit card is automatically charged.
`daysBeforeCardWarnings`<br/>*Array[integer]* | Specify the number of days before notifying a customer of an expiring credit card. You can specify 1 to 5 values between 1 and 60.

Optional | &nbsp;
---------- | -----------
`customerInformation`<br/>*Array[string]* | The list of client custom fields to display in the invoice.
`address`<br/>*Array[string]* | The address to display in the invoice. Each address field will be a row in the address block.
`termsAndConditions`<br/>*string* | The terms and conditions to display in the invoice.
`bccEmails`<br/>*Array[string]* | List of email addresses to include as BCC when sending emails to customers upon billing exceptions.

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
