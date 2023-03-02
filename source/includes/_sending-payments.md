# Sending Payments

## API Disbursement

API disbursement product provides the capability for you to disburse to 100+ banks in Indonesia via OY! at any time. The integration process to use the API disbursement product is straight forward and the details can be checked [here](https://api-docs.oyindonesia.com/#fund-disbursement).  

### Key Features

**Overbooking**
OY! can use the funds directly from your Mandiri or CIMB bank accounts for your disbursement needs. You will only need to top up the admin fee needed to execute the disbursements instead of the full amount of your disbursement. Please contact our [business representative](partner@oyindonesia.com) for further details about this feature.
**Check Transaction Status and Callback**

For all disbursements executed, you will receive notifications regarding your transaction whether it is successful, failed or pending. We also provide an API for you to check the transaction status manually. IP proxy is also available upon request to enhance the security and integrity of the callback you will receive. 

**Check Balance**

You can check your available balance at anytime to ensure that you have sufficient balance to execute a disbursement.

### Registration and Set Up
**Prerequisites** 

* Register an account on the [OY! dashboard](https://business.oyindonesia.com/register?)

* Activate your account through the activation link sent via email

* Upgrade your account 

* Upgrade request is approved

* Provide IP to be whitelisted and callback link to our business team

* Receive an API Key from us

* Integrate with our [API](https://api-docs.oyindonesia.com/#fund-disbursement)

### Testing

Once you successfully create an OY! account, you can immediately simulate disbursement via API.
Follow the below steps to test the flow:

1. Create an account
2. Login into the dashboard 
3. Change the environment to “staging” 
4. Once the environment changed to staging, there will be API key staging available on the bottom left corner of the page
5. Before creating a disbursement transaction, check your available balance through API GET https://api-stg.oyindonesia.com/api/balance
6. Create a disbursement by sending a ‘POST’ request to _https://api-stg.oyindonesia.com/api/remit_ (https://api-stg.oyindonesia.com/api/remit) using your staging API key. Enter the required and optional fields, as referenced in the API reference docs (https://api-docs.oyindonesia.com/#disbursement-fund-disbursement)
7. Fill in the amount, recipient bank, recipient account, and the partner transaction-id
8. To get the status of a disbursement request, you can call the API https://api-stg.oyindonesia.com/api/remit-status,  This API also offers the option for callback status under field  send_callback
9. If payment is successful or failed, we will send a callback to the registered staging callback URL destination. Callback URL can be registered via our business representative.
10. The API disbursement transactions can be monitored through OY! dashboard from the “Send money - API disbursement” menu.


### How to Use 

In order to create disbursements, a sufficient available OY! balance is required in the account. More details and instructions about topping up to your OY! account coming soon.

Before you execute a disbursement, you can verify the beneficiary account information from our [inquiry endpoint](https://api-docs.oyindonesia.com/#bank-account-inquiry). 

> Below is an example of the request body for inquiry:

```shell 
curl -X POST https://partner.oyindonesia.com/api/inquiry 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:987654' 
-d '{
    "recipient_bank": "022", 
    "recipient_account": "7823023345"
    }'
```

> It will return an [error message](https://api-docs.oyindonesia.com/#fund-disbursement-response-codes) if the request is not valid. Otherwise, below is the sample response parameters that will be returned:

```json
{
    "status":{
        "code":"000",
        "message":"Success"
    },
    "recipient_bank":"022",
    "recipient_account":"7823023345",
    "recipient_name":"Budi Budianto Budiman",
    "timestamp":"16-10-2021 09:55:31"
}
```

> 

Next, send a request body to execute a disbursement request to be sent to our [disbursement endpoint](https://api-docs.oyindonesia.com/#disbursement). 

> Below is an example of the request body for the remit: 

```shell
curl -X POST https://partner.oyindonesia.com/api/remit 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:7654321' 
-d '{
    "recipient_bank": "022", 
    "recipient_account": "7823023345", 
    "amount":100000, "note":"Pembayaran Nov IV", 
    "partner_trx_id":"Tx15048563JKFJ", 
    "email" :"budi.s@gmail.com"
    }'
```

> Below is the sample response parameters that will be returned:

```json 
{
    "status":{
        "code":"101",
        "message":"Request is Processed"
    },
    "amount":100000,
    "recipient_bank":"022",
    "recipient_account":"7823023345",
    "trx_id":"89718ca8-4db6-40a0-a138-a9e30d82c67d",
    "partner_trx_id":"Tx15048563JKFJ",
    "timestamp":"16-10-2019 10:23:42"
}
```

> 

An enpoint to [check the transaction](https://api-docs.oyindonesia.com/#get-disbursement-status) is also available and can be accessed at anytime. 

> Below is an example of the request body: 

```shell
curl -X POST https://partner.oyindonesia.com/api/remit-status 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:7654321' 
-d '{
    "partner_trx_id": "1234-asde", 
    "send_callback": "true"
    }'
```

> The above command returns a JSON structured similar like this:

```json
{
  "status":{
    "code":"000",
    "message":"Success"
  },
  "amount":125000,
  "recipient_name":"John Doe",
  "recipient_bank":"008",
  "recipient_account":"1234567890",
  "trx_id":"ABC-456",
  "partner_trx_id":"1234-asde",
  "timestamp":"16-10-2020 10:34:23",
  "created_date": "24-01-2020 06:48:08",
  "last_updated_date": "24-01-2020 06:48:39"
}
```

>

A callback with the following information will be sent to the callback endpoint that you can register with us. 

> Below is an example of the request body: 

```shell 
curl -X POST https://partner.oyindonesia.com/api/remit-status 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:7654321' 
-d '{
    "partner_trx_id": "Tx15048563JKFJ"
    }'
```

> Below is the sample response parameters that will be returned:

```json
{
    "status":{
        "code":"000",
        "message":"Success"
    },
    "amount":100000,
    "recipient_name":"Budi Soemitra Nasution",
    "recipient_bank":"022",
    "recipient_account":"7823023345",
    "trx_id":"89718ca8-4db6-40a0-a138-a9e30d82c67d",
    "partner_trx_id":"Tx15048563JKFJ",
    "timestamp":"16-10-2019 10:40:23",
    "created_date": "16-10-2019 10:23:42",
    "last_updated_date": "16-10-2019 10:34:23"
}
```

>

You can also [check your balance](https://api-docs.oyindonesia.com/#get-balance) anytime to ensure you have sufficient balance from our endpoint.

> Below is an example of a request body to check the balance:

```shell
curl -X GET 'https://partner.oyindonesia.com/api/balance' 
-H 'Content-Type: application/json' 
-H 'Accept: application/json' 
-H 'X-OY-Username: janedoe' 
-H 'X-Api-Key: 7654321'
```

> Below is the sample response parameters that will be returned:

```json 
{
    "status":{
        "code":"000",
        "message":"Success"
    },
    "balance":100000000.0000,
    "pendingBalance":2000000.0000,
    "availableBalance":98500000.0000,
    "overbookingBalance":98500000.0000,
    "timestamp":"10-12-2019 12:15:37"
}
```

>

Lastly, all transactions can be monitored from the OY! dashboard which includes all the transaction details.

![API Disbursement](images/api_disburse_error_reason.png)

![API Disbursement](images/api_disburse_success.png)


For further details on the parameters definition and proper usage, please refer to our [API Documentation](https://api-docs.oyindonesia.com/#fund-disbursement).


## Bulk Disbursement

Our Bulk disbursement product provides the capability to execute disbursements to multiple beneficiaries with a single xlsx or csv file upload ("Campaign") up to 25,000 transactions. Bulk disbursement is made through the OY! dashboard, where details regarding the disbursement campaign can be found. No technical integration is required to use this product.

### Key Features 

**Overbooking**
OY! can use the funds directly from your Mandiri or CIMB bank accounts for your disbursement needs. You will only need to top up the admin fee needed to execute the disbursements instead of the full amount of your disbursement. Please contact our [business representative](partner@oyindonesia.com) for further details about this feature.

**Account Management** 

When you first create an account, your account will be assigned as a Super Admin role. As a Super Admin, you have the ability to create new sub-accounts and assign different roles to your team such as Admin, Maker and Approver that are applicable for bulk disbursement. The Super Admin and Admin can also edit or delete created sub-accounts. 

*Note: it is not necessary to create new sub-accounts in order to use bulk disbursement. The Super Admin and Admin roles allows you to directly create and approve bulk disbursements.*

Detailed step-by-step instructions on setting up user management and the different role types coming soon. 

**Multi-Layer Approval** 

Multi-layer Approval will improve your control over your bulk disburse transaction especially for big amount of money. You can setup up to 3 layers of approver before the transaction instruction is executed. By assigning proper approver and amount limitation, you can avoid a huge trouble on your business operational caused by incorrect transfer amount.

**Overall Campaign Summary**

Keep track of all the details of the entire campaign such as the total amount of disbursement, total number of transactions, and the maker and approver related information of a campaign.

**Transaction Details**

Itemized details of each individual transaction, including their respective statuses: success, pending, or failed.

### Registration and Set Up 
**Prerequisites**

* Register an account on the [OY! dashboard](https://business.oyindonesia.com/register?)

* Activate your account through the activation link sent via email

* Upgrade your account 

* Upgrade request is approved 

### Testing

1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Send Money" menu, and choose "Bulk disbursement"
4. Click "Create Disbursement"
5. Fill in the necessary details by following the steps explained in the “How to Use” section

### How to Use

In order to create disbursement campaigns, a sufficient available OY! balance is required in the account. If there is an insufficient available balance in the account, campaigns can still be created but not approved.

*1. Create Disbursement*: On the OY! dashboard, navigate to Send Payments > Bulk Disburse on your left menu bar. Click “Create Disbursement” on the far righthand side of that page to create a new bulk disbursement campaign.

*2. Create Campaign Details*: Fill in the campaign details with 2 options:

![Create Bulk - 1  Initial](https://user-images.githubusercontent.com/79620482/128454459-16770aa6-486a-40b8-a73b-f2c4bb1910e3.png)


a. upload an xlsx or csv file 

Please upload an xlsx or csv file with each individual transaction’s details of your bulk disbursement campaign. An example template for both file types are available for download on the OY! dashboard. The following list of items are required in your CSV file.

Column | Description | Example
------ | ----------- | -----------
Name | Recipient Name | Budy
Email | Recipient Email (can contain up to 5 emails with a total maximum of 255 characters, incoming transaction notifications will be sent to these emails) | Budi@email.com
Amount | Amount in IDR (only numbers) | 100000
Bank Code | [Destination Bank](https://docs.oyindonesia.com/#disbursement-bank-codes) | 014
Bank Account Number | Recipient Bank Account Number | 12341234
Phone Number | Recipient Phone Number | 62812341234
Notes (Optional) | Transaction Notes | 

 b. add disbursement detail manually. : 
choose ‘add disbursement detail manually’ and fill out a campaign name and campaign description in the provided spaces. These details are strictly used as your tracking information only and will not be shared to the transaction recipients.

c. [Staging only] You can replicate failed status on individual transaction within the campaign by fill in _Bank Account Number_ value with `3000000`. Another value will be processed normally.

*3. Re-verify all the Information and Submit*: Once your xlsx or csv file is uploaded or filled out manually, you can verify all of the information uploaded from the file from the table displayed. If there is any incorrect submission such as invalid entry due to special characters, a red box will appear to highlight the entry that should be corrected. Issues must be resolved before a campaign can be submitted

![Create Bulk - 2  File Uploaded](https://user-images.githubusercontent.com/79620482/128454606-2838f6ca-aad1-446a-becb-75d780460708.png)


*4. Validate Name Matching*
After all the issue has been resolved, user able to click submit and there will be popup shown to validate each recipient *name *with their *Bank Account Name* as shown below:

![Create Bulk - 3  Ask Name Validation](https://user-images.githubusercontent.com/79620482/128454745-c5a42979-30ba-44c2-a405-bbe9b0325677.png)

if you choose YES: if there is a name difference, a popup name validation with details of mismatched transactions will be displayed. if the information inputted is invalid, you could edit the information and choose the ‘ validate’ button to revalidate the data, or you could click the ‘ignore mismatch’ button to ignore the name matching validation and to process the disbursement.

![Create Bulk - 5e  Mismatch Names](https://user-images.githubusercontent.com/79620482/128454900-3a007579-2701-4305-9f9d-15cc8a09ab2f.png)


If there is no issue with the details uploaded, a validate and submit button will be available at the bottom of the list of transactions, indicating that all information is valid. Click “Submit” to complete creating the bulk disbursement campaign.

![Create Bulk - 6a  All data inquired without Name Matching](https://user-images.githubusercontent.com/79620482/128454982-b1ab6dfc-c279-4baf-a0e6-a2983a069488.png)


*5. Approve/Cancel Campaign**: Once the bulk disbursement campaign is created, a new status of `waiting approval` will appear. Approve the campaign by clicking the “Approve” button. If you want to cancel a campaign, click the “...” button and select “Cancel”.

![Bulk Disburse](../images/bulk_disburse_4.png)

Once the bulk disbursement campaign is approved, details regarding the campaign can no long er be changed. This includes changes made to individual transactions and their respective recipient information. 

The balances will also immediately reflect changes. For more information about the different types of balances, click here. You will also receive an email with the campaign information summary (“Outgoing Transfer Alert”) when transactions are executed.

*Note:* 
- *Depend on the approval layer that you configured, this transaction should be approved by all layer before it can be executed by the system.*
![Bulk Disburse](../images/multi-layer-approval.png)

- *Multiple campaigns can be approved at a time as long as there is sufficient available balance to complete campaigns that have already been approved but are still in queue to be processed.*

*6. Keep Track of Campaign Details**: To check the details of the bulk disbursement campaign, click on the campaign name to find the campaign summary and its recipient list. Keep track of the both the overall campaign status and the status of individual transactions through the page. 

![Bulk Disburse](../images/bulk_disburse_5.png)

*7. Status: In-Progress, Finish, and Cancel**: Congratulations! You just made your first bulk disbursement with OY! Below are a list of statuses you will find on the OY! dashboard. 

_In-Progress_

As your individual disbursements are executed, the status of your bulk disbursement campaign will indicate an in-progress status. 

![Bulk Disburse](../images/bulk_disburse_error_reason.png)

_Incomplete_

The status of your bulk disbursement will change to incomplete once all of the listed transactions have been executed and the relevant final statuses of Failed or partially Failed have been assigned. The failed transactions will be shown the failed reason and can be retried.
![Notif Pending - 1  Initial](../images/bulk_disburse_list_incomplete.png)


_Finish_

Once all of the listed transactions have been completed and the final status of success for all transactions has been achieved, the status of your bulk disbursement campaign will change to Finish.  The recipients should have all received an email detailing an “Incoming Transfer Alert.” You can also download a report of the campaign details directly through the OY! dashboard.
![Bulk Disburse](../images/bulk_disburse_finish.png)

_Cancel_ 

If you choose not to approve your disbursement campaign, the status of your bulk disbursement campaign will indicate a cancelled status. 

![Bulk Disburse](../images/bulk_disburse_cancel.png)

You can also double check each of your transactions by navigating to the account statement page on the OY! dashboard. 


## Claim Fund
Claim Fund product enable you to do disbursement without knowing your recipient bank account at first. You will simply create a link for them to fill-out bank account information and the payment will be processed by our system.
This feature will remove you from the hassle of collecting your customer information manually then doing multiple bank transfer.
Best use of this feature is : refunds, reimbursement claim, any disburse transaction in which the destination is not your regular partner.

At the moment, Claim Fund product is available only on OY! Business Dashboard.

### Transaction Flow

![Transacation Flow](../images/claim-fund-flow.png)

### Use Case
1. Refund for purchase transaction 
2. Any money transfer transaction where you don't have recipient bank information

### Registration and Set Up

**Prerequisites** 

* Register an account on the OY! dashboard (https://business.oyindonesia.com/register?)
* Activate your account through the activation link sent via email
* Upgrade your account
* Upgrade request is approved


### Testing
1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Send Money" menu, and choose "Claim Fund"
4. Click "Create Claim Fund"
5. Fill in the necessary details by following the steps explained in the “How to Use” section

### How to Use
In order to execute claim fund transaction successfully, a sufficient available OY! balance is required in the account. However, if there is an insufficient available balance, claim fund transaction can still be created but the approval will failed.

**1. Business Dashboard - Create Claim Fund**

* Create Claim Fund: On the OY! dashboard, navigate to Send Money > Claim Fund on your left menu bar. Click `Create Claim Fund` button on the far righthand side of that page to create a new claim fund transaction.
![Claim Fund Landing Page](../images/claim-fund-landing.png)
![Create Claim Fund - input data](../images/claim-fund-create.png)

* Please fill-out the information accordingly. Below table is the description of each fields:

| Column                                 | Description                                                                                                                                                           | Example                |
|------------------------------------    |-------------------------------------------------------------------------------------------------------------------------------------------------------------------    |--------------------    |
| Amount to Claim                        | Amount of money to be sent                                                                                                                                            | 1000000                |
| Expiration Duration                    | How long does this claim link be active. After expiration time, customer will not be able to submit their information then new claim fund link has to be created.     | 12 Hours               |
| Set as default expiration duration     | Select this option to make it default expiration time for the next claim fund transaction.                                                                            | -                      |
| Partner Transaction ID                 | Unique identifier for the recipient.                                                                                                                                  | CF00001                |
| Note                                   | additional remarks for recipient                                                                                                                                      | Refund transaction     |
| Recipient Name                         | Recipient Name                                                                                                                                                        | Dwiki Dermawan         |
| Email                                  | Recipient Email                                                                                                                                                       | dwiki@gmail.com        |

* Click `Create Claim Fund` button to submit the transaction. Your recipient will get notified of this claim fund transaction through email. Transaction link will be attached on this email.

* Successful claim fund transaction will be listed on the claim fund transaction listing with INITIATED status.
![Create Claim Fund - Success](../images/claim-fund-create-success.png)

* Please be noted that this transaction still need account detail to be filled-out by the recipient.

**2. Fund Recipient - Input Account Information**

* On the notification email, user click the `Ajukan Klaim Dana` link to get into claim fund input page. 
![Create Claim Fund - Email](../images/claim-fund-user-email.png)

* User should fill-out the detail information so that OY! system can continue with the approval process. 
![Create Claim Fund - input detail](../images/claim-fund-input-detail.png)
![Create Claim Fund - input submitted](../images/claim-fund-input-submitted.png)

**3. Business Dashboard - Approve Transaction**

Transaction need to go through approval process to ensure that the money will be delivered to correct recipient and sufficient amount is available.

* Approve claim fund transaction: On the OY! dashboard, navigate to Send Money > Claim Fund on your left menu bar. Transactions that already have user detail will be marked with `WAITING APPROVAL` status. 
![Create Claim Fund - partner approval](../images/claim-fund-partner-approval1.png)

* You can approve the transaction directly from this screen by clicking Approve button, or go to detail transaction to see more information before approve.
![Create Claim Fund - partner approval](../images/claim-fund-partner-approval2.png)

* Click approve button to release the transaction to user.

* The transaction is now marked as `IN PROGRESS`

* Your recipient should get the money delivered to their account immediately.

* In parallel, your customer will also get email notification about successful claim fund transaction.
![Create Claim Fund - user success](../images/claim-fund-user-success.png)

## API Biller

API biller product provides the capability for you to pay the bill products. With 130+ types of billing products, you can provide numerous bill payment options with ease and in real-time.
The integration process to use the API biller product is straight forward and the details can be checked [here](https://api-docs.oyindonesia.com/#biller-api).  

### Transaction Flow

![Transacation Flow](../images/Flow_API_Biller.png)

### Key Features

**Overbooking**
OY! can use the funds directly from your Mandiri or CIMB bank accounts for your bill payment needs. Please contact our [business representative](partner@oyindonesia.com) for further details about this feature.

**Check Transaction Status and Callback**

For all bill inquiry & bill payment executed, you will receive notifications regarding your transaction whether it is successful, failed or pending. We also provide an API for you to check the transaction status manually. IP proxy is also available upon request to enhance the security and integrity of the callback you will receive. 

**Check Balance**

You can check your available balance at anytime to ensure that you have sufficient balance to execute a bill payment.

### Registration and Set Up
**Prerequisites** 

* Register an account on the [OY! dashboard](https://business.oyindonesia.com/register?)

* Activate your account through the activation link sent via email

* Upgrade your account 

* Upgrade request is approved

* Provide IP to be whitelisted and callback link to our business team

* Receive an API Key from us

* Integrate with our [API](https://api-docs.oyindonesia.com/#biller-api)

### Testing

Once you successfully create an OY! account, you can immediately simulate bill payment via API.
Follow the below steps to test the flow:

1. Create an account
2. Login into the dashboard 
3. Change the environment to “demo” 
4. Once the environment changed to demo, there will be API key demo available on the bottom left corner of the page
5. Before creating a bill payment transaction, check your available balance through API GET _https://api-stg.oyindonesia.com/api/balance_
6. Request inquiry for the bill you want to pay by sending a ‘POST’ request to _https://api-stg.oyindonesia.com/api/v2/bill_ using your staging API key. Enter the required and optional fields, as referenced in the API reference docs (https://api-docs.oyindonesia.com/#bill-inquiry-biller-api)
7. Fill in the customer-id, product-id, and the partner transaction-id. You will get the detail information about the bill that you want to pay. 
8. After successful inquiry, you should do the payment process by sending a ‘POST’ request to _https://api-stg.oyindonesia.com/api/v2/bill/payment_. Enter the required and optional fields, as referenced in the API reference docs (https://api-docs.oyindonesia.com/#pay-bill-biller-api)
8. To get the status of a bill payment request, you can call the API https://api-stg.oyindonesia.com/api/v2/bill/status
9. If payment is successful or failed, we will send a callback to the registered staging callback URL destination. Callback URL can be registered via our business representative.
10. The API biller transactions can be monitored through OY! dashboard from the “Send money - API biller" menu.


### How to Use 

In order to create API biller transaction, a sufficient available OY! balance is required in the account. More details and instructions about topping up to your OY! account can you see here https://docs.oyindonesia.com/#top-up-oy-dashboard-tutorial.

Before you execute the bill payment, you have to verify the bill information from our [bill inquiry endpoint](https://api-docs.oyindonesia.com/#bill-inquiry-biller-api). 

> Below is an example of the request body for inquiry:

```shell 
curl -X POST https://partner.oyindonesia.com/api/v2/bill 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:987654' 
-d '{
    "customer_id": "512233308943",
    "product_id": "plnpost",
    "partner_tx_id": "Tx15048563JKFJ"
    }'
```

> It will return an [error message](https://api-docs.oyindonesia.com/#api-biller-response-codes-biller-api) if the request is not valid. Otherwise, below is the sample response parameters that will be returned:

```json
{
    "status":{
        "code":"000",
        "message":"Success"
    },
    "data": {
        "tx_id": "a3d87877-e579-4378-844b-c06294fc9564",
        "partner_tx_id": "Tx15048563JKFJ",
        "product_id": "plnpost",
        "customer_id": "512233308943",
        "customer_name": "Plg.,De'mo 512233308943",
        "amount": 282380,
        "additional_data": "{\"customer_id\":\"512233308943\",\"customer_name\":\"Plg.,De'mo 512233308943\",\"admin_fee\":\"2.500\"}"
    }
}
```

> 

Next, send a request body to execute a bill payment request to be sent to our [bill payment endpoint](https://api-docs.oyindonesia.com/#pay-bill-biller-api). 

> Below is an example of the request body for the bill payment: 

```shell
curl -X POST https://partner.oyindonesia.com/api/v2/bill/payment 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:7654321' 
-d '{
    "partner_trx_id":"Tx15048563JKFJ", 
    "note" :"biller transaction test"
    }'
```

> Below is the sample response parameters that will be returned:

```json 
{
    "status":{
        "code": "102",
        "message": "Request is In progress"
    },
    "data": {
        "tx_id": "a3d87877-e579-4378-844b-c06294fc9564",
        "partner_tx_id": "Tx15048563JKFJ",
        "product_id": "plnpost",
        "customer_id": "512233308943",
        "customer_name": "Plg.,De'mo 512233308943",
        "amount": 282380,
        "note": "biller transaction test"
    },
}
```

> 

An endpoint to [check the transaction](https://api-docs.oyindonesia.com/#get-bill-payment-status-biller-api) is also available and can be accessed at anytime. 

> Below is an example of the request body: 

```shell
curl -X POST https://partner.oyindonesia.com/api/b2/bill/status 
-H 'content-type: application/json, accept: application/json, x-oy-username:myuser, x-api-key:7654321' 
-d '{
    "partner_trx_id": "Tx15048563JKFJ"
    }'
```

> The above command returns a JSON structured similar like this:

```json
{
    "status":{
        "code": "000",
        "message": "Success"
    },
    "data": {
        "tx_id": "a3d87877-e579-4378-844b-c06294fc9564",
        "partner_tx_id": "Tx15048563JKFJ",
        "product_id": "plnpost",
        "customer_id": "512233308943",
        "customer_name": "Plg.,De'mo 512233308943",
        "amount": 282380,
        "additional_data": "\"{\\\"bill_period\\\":\\\"FEB2022\\\",\\\"total_amount\\\":\\\"282.380\\\",\\\"customer_id\\\":\\\"512233308943\\\",\\\"customer_name\\\":\\\"Plg.,De'mo 512233308943\\\",\\\"admin_fee\\\":\\\"2.500\\\",\\\"settlement_date\\\":\\\"09/03/2022 16:49\\\"}\"",
        "status": "SUCCESS"
    },
}
```

>

A callback with the following information will be sent to the callback endpoint that you can register with us. 

You can also [check your balance](https://api-docs.oyindonesia.com/#get-balance) anytime to ensure you have sufficient balance from our endpoint.

> Below is an example of a request body to check the balance:

```shell
curl -X GET 'https://partner.oyindonesia.com/api/balance' 
-H 'Content-Type: application/json' 
-H 'Accept: application/json' 
-H 'X-OY-Username: janedoe' 
-H 'X-Api-Key: 7654321'
```

> Below is the sample response parameters that will be returned:

```json 
{
    "status":{
        "code":"000",
        "message":"Success"
    },
    "balance":100000000.0000,
    "pendingBalance":2000000.0000,
    "availableBalance":98500000.0000,
    "overbookingBalance":98500000.0000,
    "timestamp":"10-12-2019 12:15:37"
}
```

>

Lastly, all transactions can be monitored from the OY! dashboard which includes all the transaction details.

![API Biller](../images/API_Biller.png)


For further details on the parameters definition and proper usage, please refer to our [API Documentation](https://api-docs.oyindonesia.com/#biller-api).

## Feature: Resend Callback

### Key Features

Retry Callback allows you to resend a callback of your transaction to your system. Initially, OY! will send a callback to your system after your transaction status has been updated. If your system failed to receive the callback, this feature can help you to retry the callback process. The process can be done in two ways


1. Automated retry callback
If the callback is not successfully received on the first try, the system will automatically retry the callback delivery. If that callback is still not received by the client's system, the system will automatically retry until 5 occurrences. The interval of the sending process will be detailed in the Callback Interval section. If all automated Retry Callbacks have been sent but still returned failed, the system will send an email notification to the email address set in the configuration.

2. Manual retry callback
Besides the automated process, you can manually request a callback via the dashboard.

### Registration and Set Up

Follow the instruction below to activate retry callback

1. Login to your account in OY! Dashboard
2. Open “Settings” and choose “Developer Option”. Choose “Callback Configuration”
3. Fill your callback URL in the related product that you want to activate. Make sure the format is right. You can click URL String Validation button to validate the URL format.
4. If you want to activate automated retry callback, check the Enable Automatic Retry Callback and fill in the email. The email will be used to receive a notification if all the automatic callback attempts have been made but still fail
5. Click "Save Changes". The configuration will not able to be saved if the callback URL or/and email format are not valid.


![Resend Callback](images/api_disburse_retry_callback_developer_option.png)

Don't forget to whitelist these IPs in order to be able to receive callback from OY: 54.151.191.85 and 54.179.86.72

If you want to manually resend a callback, you can follow the instruction below

1. Login to your account in OY! Dashboard
2. Open the API Disbursement menu
3. Click the "Resend Callback" button in the related transaction


![Resend Callback](images/api_disburse_resend_callback.png)



### Callback Interval
1st retry: realtime (after the first failed log received)
2nd retry: 1 min (after callback failed log for the 1st retry is received)
3rd retry: 2 mins (after callback failed log for the 2nd retry is received)
4th retry: 13 mins (after callback failed log for the 3rd retry is received)
5th retry: 47 mins (after callback failed log for the 4th retry is received)

If all automated Retry Callback (all the 5 attempts) has been sent but we still get a Failed response from your end, our system will send an automated email notification to the  email address that has been set in the configuration earlier


### Idempotency Key
To implement automated retry callback, you need to handle the idempotency logic in your system using the below key:

API Disburse: trx_id

## Account Payable

OY! Account Payable product provides the capability to record, create approval levels, and scheduled payment for invoice payables without hassle. Account Payable is made through the OY! dashboard, so no technical integration is required to use this product. 

### How to Use Account Payable via Dashboard

You can create new invoice to be paid and set up payment by following this step:

1. Log on to your OY! dashboard
2. Choose "Production" environment
3. Click "Pay Invoice" under Account Payable menu
4. Click "Invoice List"
5. Choose "Create New Invoice"
6. Upload your invoice document to help you easier record the invoice by click "Browse to Upload" or Drag & drop to the invoice area
7. Fill in the necessary details

    Parameter | Description
    ------ | -----------
    Purchase Type | You can choose between purchase order, service fee, bill, subscription fee, and reimbursement
    Invoice Number | The number of the invoice that you get from your vendor/supplier
    Invoice Date | The date of the invoice
    Due Date | Due date of a transaction as mentioned in the invoice. Your approver will be reminded to approve on D-7, D-3, and D-1 from the invoice due date
    PO/PR Number (optional)	| The reference PO/PR number from your company to track this invoice
    Note | The note for this invoice
    Vendor | The name of the vendor that this invoice belongs to. You can choose the name of the vendor from the dropdown menu. To create a new vendor, follow the instruction here
    Product Description | The name and/or description of the product
    Quantity | The quantity of the product
    Price | Unit price of the product
    Total | Total price of the product (Total = Quantity x Price)
    Subtotal | The total price of all the products
    PPn | PPn that should be paid to the vendor. PPn is calculated from subtotal amount. You can set up the tax during vendor addition or edit in 'Vendor Management' menu under Account Payable
    PPh | PPh that should be deducted from the vendor. PPh is calculated from subtotal amount.You can set up the tax during vendor addition or edit in 'Vendor Management' menu under Account Payable
    Total Pay to Vendor | Total amount that will be paid to vendor on scheduled date, post approval
    Reference Documents (Upload document) | The supporting documents that you want to record related to this invoice. Accept PDF files only. Maximum 7 documents (maximum 2.5MB each)
    Note: Maximum 20 rows for line item detail

    **Image Account Payable**
    ![AP Invoice Creation One](images/accountPayable/invoice_creation_1.png)

8. Continue to set up 'Invoice Payment Details'. You can set up the payment to one time payment by choosing 'Full Payment' or multiple times payment by choosing 'Partial Payment'.

    Parameter | Description
    ------ | -----------
    Payment Amount | Amount that will be automatically paid to vendor on scheduled date
    Due Date | The due date of the payment. The due date cannot do back date or more than due date that set in the first page (record invoice). Notification will be send to approval D-7, D-3, and D-1 if the status is waiting aproval
    Status | Status of the invoice payment. You can choose 'Paid' for record intention and this amount will not be paid by system. Choose 'Unpaid' for incoming transaction that needs to be paid
    Scheduled Payment | Time of the payment. You can prepare the balance prior to scheduled payment time and make sure the payment date is based on your preference and will only be executed post approval
    Remaining Amount | Total pay to vendor - subtotal. This amount should be 0 to continue the process

    **Image Payment Page**
    ![AP Invoice Creation Two](images/accountPayable/AP_scheduled_payment.png)

    ![AP Invoice Scheduled Payment Detai](images/accountPayable/AP_Scheduled_Payment_Details.png)

    ![AP Detail Transaction](images/accountPayable/AP_Trx_detail.png)

9. Status: Waiting Payment, Partially Paid, Complete and Cancelled
Congratulations! You have finished your first invoice payable set up. Below are the list of statuses you will find on 'Invoice List'

    Parameter | Description
    ------ | -----------
    Partially Paid | Multi times payment or partially paid that not finish yet. You can click invoice number to find the partial payment details in 'payment transaction' tab
    Waiting Payment	| Waiting for approval or balance not enough
    Cancelled | Invoice has been cancelled
    Complete | All payment of the invoice is complete

    **List of the Invoice Payable**
![AP Invoice List](images/accountPayable/AP_Trx_detail.png)



### How to Create, Edit and Inactivate Vendor Data ###

**Add New Vendor for Account Payable**

1. Click 'Add' in the 'Vendor' field in the 'Create Payable Invoice' page.
2. Fill in the necessary details
3. Click 'Add Vendor' after complete registration of new vendor

Parameter | Description
------ | -----------
Vendor ID (Optional) | Unique ID of the vendor from your company. This is not mandatory
Vendor Name | The company/vendor name. Make sure the vendor name matches the vendor NPWP (if any) to help your company tax record
Vendor Address (Optional) | Vendor address to be recorded. This is not mandatory
Bank Name | Recipient bank name. You can choose using drop down
Account Number | Recipient bank account number. You can check the inquiry by clicking 'Get Account Name' after filling the account number
PIC Name | The PIC name of this vendor
PIC Email | The PIC or recipient email. Payment/transfer receipt will be send automatically to this email after complete payment
PIC WhatsApp (optional) | The PIC WhatsApp number for your record
PPh (optional) | PPh type from this vendor. Default of the setting is Not Subject to PPh.
Vendor NPWP (optional) | The vendor NPWP number record that can be use for company reference to generate 'Faktur Pajak'
NPWP Document (optional) | Vendor NPWP document to be record. Accept PDF and JPG format. Maximum 10 MB
PPn (optional) | PPn type of this vendor. Default of the setting is Not Subject to PPn.
SKB Document (optional) | Vendor SKB Document to be record. Accept PDF and JPG format. Maximum 10 MB
Not subject of PPh | Tax will not be added upon the subtotal |
Not subject of PPn | Tax will not be added upon the subtotal |
PPN Exclusive | PPN of the subtotal will be added upon the subtotal of the invoice. For example is subtotal is 10,000, then the PPN is 11% of the 10,000 = 1,100 |
PPN Inclusive | Tax will not be added upon the subtotal because the subtotal is assumed to be tax inclusive |

**Each vendor only have 1 type of PPh setting and 1 type of PPn setting**

There will be an PPh email sent on the 1st day of each month that contains all the PPh from your vendors in the previous month. This report can help company with tax payment & reporting, and 'Faktur Pajak' generation to your vendor.

**Create New Vendor**
![VM Vendor Creation](images/vendorManagement/creation.png)

**List Of Vendor**
![VM Vendor List](images/vendorManagement/list.png)

**Vendor Detail**
![VM Vendor Detail](images/vendorManagement/detail.png)

**How to Set Up Invoice Payable Approval**

You can set up multi level approval from OY's users. There will be 4 type of users: Super Admin, Admin, Approver, and Maker

**Approval Layer Set Up**

Approval Layer can be set up using 'User Management' under 'General' menu. When you first create an account, your account will be assigned as a Super Admin role. As a Super Admin, you have the ability to create new sub-accounts and assign different roles to your team such as Admin, Maker and Approver that are applicable for bulk disbursement. The Super Admin and Admin can also edit or delete created sub-accounts.
Note: it is not necessary to create new sub-accounts in order to use Account Payable. The Super Admin and Admin roles allows you to directly create and approve Account Payable and also Bulk Disbursement.
Detailed step-by-step instructions on setting up user management and the different role types coming soon.

**Multi-Layer Approval**

Multi-layer Approval will improve your control over your bulk disburse transaction especially for big amount of money. You can setup up to 3 layers of approver before the transaction instruction is executed. By assigning proper approver and amount limitation, you can avoid a huge trouble on your business operational caused by incorrect transfer amount.

Default approval: Super Admin, Admin, and Approval.



## Virtual Card
OY! Virtual Card product provides the capability to create customized virtual cards and manage subscriptions without hassle. Virtual Card can be generated through the OY! dashboard, so no technical integration is required to use this product.


**Key Features** 

Condition | Description
------ | -----------
**Card creation** | OY! can use the funds directly from your OY! balance for virtual card needs. It is essential to top-up your OY! balance based on your card limit. Please contact our business representative (https://docs.oyindonesia.com/partner@oyindonesia.com) for further details about this feature.
**Card control** | Create and control the card based on your requirements. You can set amount, validity period, renewal frequency and even transaction limitations directly through dashboard. Moreover, you can block and deactivate virtual card real-time! Everything on your fingertips.
**Real-time transaction** | Transactions can be tracked easily through dashboard real-time. There is no need to wait until the end of month for full statement.


### How to Use Virtual Card Feature via Dashboard
You can create new virtual card by following these steps:

1. Log on to your OY! dashboard
2. Choose “Production” environment
3. Click “Virtual Card” under *Send Money* menu
4. Click “Add New Card”
5. Choose “Card Type” either single use or multiple use and click “Next”
6. Fill in Cardholder details and Card details
7. Once submitted, Virtual Card will be in “waiting for approval” state
8. After approval step, the card is ready to be used for transactions
9. Once card is used for transaction, it will appears in “Virtual Card” page and sent through email to Cardholder

**Notes:** OY! balance would be put on pending once card is created.

* Virtual Card Dashboard

![VCC Dashboard](images/virtualCard/vcc_emptystate.png)

* Virtual Card Type

![VCC Card Type](images/virtualCard/vcc_cardtype.png)

* Virtual Card Form

![VCC Form](images/virtualCard/vcc_form1.png)

![VCC Form](images/virtualCard/vcc_form2.png)

* Virtual Card Information

![VCC Detail](images/virtualCard/vcc_info.png)

* Virtual Card

![VCC Transaction Detail](images/virtualCard/vcc_txndetail.png)

![VCC Transaction Email](images/virtualCard/vcc_txnemail.png)

**Card Status**

Status| Description
------ | -----------
Pending Approval | Card has been requested but approval is not yet given. Request can only stay valid for 14 days.
Active | Card is ready to be used for transaction.
Active with Warning | Card is active with balance, but only <15% balance remaining.
Inactive | Card has been deactivated, but still contain limit.
Need top-up | New card has been created, but with 0 limit OR card limit is back to 0 and pass renewal time due to insufficient balance.
Expired | Card is expired or intentionally archived permanently.
Rejected | Card is rejected by Approver.

**Transaction Status** 

Transaction Status | Description
------ | -----------
Successful | Card has been used for transaction successfully
Failed | Transction was decline



### How to Set Approver

1. During first time product activation, prompt to fill in Approver data will be triggered
2. Fill in the approver details
3. Tick T&C and confirm your Approver details
4. Approver will receive confirmation email 

* Add New Approver

![VCC Add Approver](images/virtualCard/vcc_addapprover.png)

* Approver Form

![VCC Approver Form](images/virtualCard/vcc_approverform.png)

**Notes**: Approver data cannot be added or edited through dashboard for security purposes. Please contact our business representative for helps

Parameter | Description
------ | -----------
Name | Unique ID of the vendor from your company. This is not mandatory
Position | The company/vendor name. Make sure the vendor name matches the vendor NPWP (if any) to help your company tax record
Phone Number | Vendor address to be record. This is not mandatory
Email | Recipient bank name. You can choose using drop down


### How to Manage Card
1. Click “See All Virtual Cards”
2. Click the card that needs to be managed

![VCC Card List](images/virtualCard/vcc_cardlist.png)

**Card actions** 

Card Actions | Description
------ | -----------
Resend Card Info | Card has been used for transaction successfully
Edit Information | Transction was declined
Block | To temporarily lock the card, limit remains in the card
Archive |To permanently lock the card, limit will be 0
Renew Limit | To renew card limit with amount that has been approved during request. Applicable for new card with 0 limit, or existing card with less than 100% limit
Resend Approval Notification | To remind Approver to approve the card request
Delete | Only applicable for "Waiting for Approval" card



### How to Set Up Card Config
1. Click “Virtual Card Settings”
2. Select Department / Category / Approver
3. You can choose to whether add new, edit existing or delete
4. Click save changes

* Department page prior to “Edit Department” button

![VCC Department](images/virtualCard/vcc_dept.png)

* Edit Department page

![VCC Edit Department](images/virtualCard/vcc_editdept.png)

* Category page

![VCC Category](images/virtualCard/vcc_cat.png)

* Approver Page

![VCC Approver](images/virtualCard/vcc_approver.png)



### How to Transact with Card

Steps to use card for online transaction:

1. Access your card information via email and enter OTP
2. Once accessed, input all of you card information into merchant side under “Credit / Debit Card” Option
    1. Input 16 digit number, expiry date (MM/YY) and CVV
3. Submit the information and proceed with the transaction and transaction is successful

**Failed Transaction Possible Reasons**

1. Card utilized more than 
    1. requested frequency (multiple use vs single use)
    2. available limit
2. Card is inactive
3. Card is expired
4. Invalid card number
5. Invalid expiry date
6. Invalid CVV
7. Issuer network not supported


**Notes**

* Transaction will be settled following bank’s instruction

* Usage of card will directly reduce card limit and hold OY! balance

* For refund, please kindly contact the merchant where you make the purchase at. OY! is not responsible to perform refund prior receiving the fund back from the merchant

    * Refund duration will dependent on the merchant and the bank

    * Once refund has been issued, the balance will be returned back to your OY! balance

* It is user’s responsibility to block card usage whenever fraudulent transactions found. OY! is not responsible for the transaction.

## International Transfer
International Transfer product provides the capability for users to transfer across countries from Indonesia at any time. You may create a transaction within OY! dashboard without the need for any technical integration. 

### Key Features

**Account Management**
When you first create an account, your account will be assigned as a Super Admin role. As a Super Admin, you have the ability to create new sub-accounts and assign different roles to your team such as Admin that is applicable for international transfers. Both Super Admin and Admin may edit or delete created sub-accounts.

Note: it is not necessary to create new sub-accounts in order to use international transfer. The Super Admin and Admin roles allows you to directly create and approve transactions.

Detailed step-by-step instructions on setting up user management and the different role types coming soon.

**Roles & Accessibility**
Only Super Admin and Admin roles are available to create transactions. All other roles are only allowed to view transaction list, transaction details, filter, export and edit custom column in dashboard.

**Available destinations**
Current list of countries supported: Singapore
Current list of currencies supported: Singapore Dollars (SGD), US Dollars (USD)

More countries such as Australia, China, Hongkong, Malaysia, South Korea and United States will be available soon.

**Sender / Recipient Contacts**
Suppose that you want to create an international transfer on behalf of another entity, you may create an individual / business sender or recipient and input all required information about the sender or recipient. All sender and recipient information will be saved in contacts and may be reused in the future.

**Additional Documents**
We provide a placeholder for you to upload invoice and other supporting documents for the purpose of transfer and source of funds.

**Transaction Details**
Once a transaction is successfully created, all transaction details and updates will be recorded in OY! dashboard

### Registration and Set Up
**Prerequisites** 
* Register an account on the OY! dashboard
* Activate your account through the activation link sent via email
* Upgrade your account
* Upgrade request is approved

### Testing
1. Log in to your OY! dashboard
1. Choose "Staging" environment
1. Click "Send Money" menu, and choose "International Transfer"
1. Click "Create New Transaction"
1. Fill in the necessary details by following the steps explained in the “How to Use” section
1. Note: To reproduce a failed transaction in staging environment, you may fill the recipient account number as **1234567891**. All other account numbers will result in a successful transaction.

### How to Use
In order to create international transfers, you need to have sufficient available OY! balance is required in the account. If there is an insufficient available balance in the account, international transfers cannot be created
 1. *Create new transaction*: On the OY! dashboard, navigate to Send Payments > International Transfer on your left menu bar. Click “Create New Transaction” on the far righthand side of that page to create a new transfer.

![Create New Transaction](images/internationalTransfer/create_inter_remit.jpg)

 2. *Input transfer amount details*: You may fill out the amount of transfer in two ways:
  1. Fill in the send amount (in Rupiah) you would like to transfer, along with the destination currency and country. Our system will automatically convert according to the foreign exchange rate at that time.
  1. Fill in the recipient amount (in SGD/USD) you would like to transfer, along with the destination currency and country. Our system will automatically convert according to the foreign exchange rate at that time.

![Input Send Amount](images/internationalTransfer/input_amount.jpg)

*Note: If the nominal amount greater than the available balance, then our system will restrict users from proceeding*
![Balance Less Than Send Amount](images/internationalTransfer/balance_less_than_send_amount.jpg)

 3. *Input sender details*: Decide whether sender is an individual or business entity, and you will see the corresponding details to fill out for each. Previously saved sender contacts will be displayed at the bottom of this page.
![List Of Existing Senders](images/internationalTransfer/list_of_existing_senders.jpg)

Create a new individual sender by filling out this form

![Input Individual Sender](images/internationalTransfer/input_individual_sender.jpg)

Create a new business sender by filling out this form

![Input Business Sender](images/internationalTransfer/input_business_sender.jpg)

 4. *Input recipient details*: Decide whether recipient is an individual or business entity, and you will see the corresponding details to fill out for each. Previously saved recipient contacts will be displayed at the bottom of this page.

![List Of Existing Recipients](images/internationalTransfer/list_of_existing_recipients.jpg)

This will be the form you will need to fill out for individual recipient

Create a new individual recipient by filling out this form

![Input Individual Recipient](images/internationalTransfer/input_individual_recipient.jpg)

Create a new business contact by filling out this form

![Input Business Recipient](images/internationalTransfer/input_business_recipient.jpg)

 5. *Add supporting information*: In this step, we need to record source of funds, purpose of transfer for the transaction. You may also attach supporting documents to aid the compliance requirements for your transaction.

[!Transfer Reason And Supporting Docs](images/internationalTransfer/transfer_reason_docs.jpg)

 6. *Summary*: The summary of your transaction will be shown. If all the information is correct, you may click the **Submit** button at the bottom right hand corner of the screen.

[!Summary](images/internationalTransfer/summary.png)

*Note: A fixed quotation rate is created since Input sender details and will be refreshed every 30 minutes. In the case when the quotation expires, a pop up will show to fetch the latest exchange rate and a new quotation is created.*

[!Update Exchange Rate](images/internationalTransfer/update_exchange_rate.png)

If the available balance is insufficient for the new quotation amount, then you will be prompted to change the transfer amount or top up balance.

[!Balance Not Enough](images/internationalTransfer/balance_not_enough.png)

 7. *Input Password*: For security reasons, OY! will prompt clients to input their password prior to every transaction.

[!Password Filled](images/internationalTransfer/password_filled.png)

Each client has 5 chances to input the correct password. If you failed to input the correct password 5 times, then the transaction will automatically be cancelled.

[!Incorrect Password](images/internationalTransfer/incorrect_password.png)

 8. *Transaction Status: In Progress, Success, Failed.*

*In Progress*

Once a transaction is successfully created, it will appear in your dashboard the status column will be set as *In Progress*.

[!In Progress Status](images/internationalTransfer/in_progress_transaction.png)

*Success*

Once your transaction is processed successfully, the status column will be updated as Success. Both sender and recipient should have received an email detailing a “Successful Transfer.”

[!Success Email](images/internationalTransfer/success_email.png)

*Failed*

If your transaction has failed to process, the status column will be updated as Failed. Both sender and recipient should have received an email detailing a “Failed Transfer.”

[!Failed Email](images/internationalTransfer/failed_email.png)

 9. *Check transaction details*: You may check transaction details by clicking on the transaction id on the list of transaction details on dashboard

[!List Of Transactions](images/internationalTransfer/list_of_transactions.png)
[!Transaction Detail](images/internationalTransfer/transaction_detail.png)