# Accepting Payments

## VA Aggregator

Businesses are struggling to manage hundreds or even thousands of physical bank accounts that are used for different purposes. It causes significant overhead cost in terms of the amount of account maintenance and man hours needed for reporting and reconciliation purposes, combining different information from different accounts.

Virtual Account (VA) is essentially a dummy account that is linked to a physical account and has all the physical account characteristics that enables a much easier reporting and reconciliation process by centralizing the money flow into the physical account. By issuing VAs, you can assign each VA for specific person and/or purposes.

![API VA Aggregator](images/va_diagram_1.png)

From the example above, it shows how payments made through the VAs are merely pass-throughs for the physical accounts to receive money. Without VAs, the above example might require up to 8 physical accounts from 2 different banks rather than 2 physical accounts from 2 different banks.

**OY! API VA Aggregator**

Our API VA Aggregator product provides you with the capabilities to create unique Virtual Account (VA) numbers as a bank transfer payment method for your customers while the fund movements take place through OY!'s physical account. It provides you with the capabilities to receive payments from your customers via bank transfer without having each respective bank account across multiple banks.

Our virtual accounts are adjustable according to your needs. We offer options of static or dynamic accounts, single or mutli use accounts, opened or closed amounts, and determinable expiration dates. You can also track all created virtual accounts, incoming payments, and their respective details either through our API callback or the OY! dashboard.

![API VA Aggregator](images/va_diagram_2.png)

### Key Features

1. **Create VA number via API** - Create VA automatically by integrating your applications with our API VA. For more information, visit our [API Docs](https://api-docs.oyindonesia.com/).

2. **Create VA number via Dashboard** - Do not have enough resources to integrate with API VA? Do not worry, you can create a VA number easily via OY! Dashboard. No need to write some codes!

3. **Support multiple banks** - Currently, we support virtual accounts (VA) at 7 banks: BCA, BNI, Mandiri, BRI, Permata, CIMB Niaga, and BTPN

4. **Real-time settlement for majority of the banks** - Payment into a VA will settle in your OY! dashboard on a real-time basis for the majority of the banks (note: for BCA, the settlement will take place H+2 after payment is made into the VA)

5. **Transaction tracking and monitoring capability** - You can track all created VA, incoming payments, and their respective details through our API callback or the OY! dashboard. You will receive a callback all incoming transactions.

6. **Customizable VA types** - You can customize the VA numbers you want to create. Each VA would consist of three categories you can define in the creation process. Refer to the table below for more information on various types of VA:

| Category        | Type/Feature                  | Description                                                                                                  |
| --------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Validity Period | Static Virtual Account        | VA that has a lifetime validity. It will always be active until it is manually deactivated                   |
| Validity Period | Dynamic Virtual Account       | VA that has a specific validity period. It will always be active until it is expired or manually deactivated |
| Amount Type     | Closed Amount Virtual Account | VA that only accepts payment of a specific amount/declared amount                                            |
| Amount Type     | Opened Amount Virtual Account | VA that accepts payment of any amount                                                                        |
| Usage Frequency | Single Use Virtual Account    | VA that expires after a single payment. A single use configuration can only be set up for a dynamic VA       |
| Usage Frequency | Multiple Use Virtual Account  | VA that only expires when expiration date is reached or when it is manually deactivated                      |

7. **Capability to update VA** Attribute that can be updated:
   * amount
   * is_single_use
   * email
   * trx_counter
   * expired_time
   * trx_expired_time
   * username_display

Example:

* A static VA with a closed amount can be updated with a new closed amount hence it can work as a bill to be paid for a particular customer
* A static VA can be updated to a single use so it will be the last payment received from a particular customer
* A dynamic VA with a closed amount is updated to an opened amount so that it can accept payments for any amount

All of the VA information, even after they are updated, is available on the OY! dashboard or via API. Once a VA is updated, the new set of configuration will apply for that VA and the previous configure is overridden and no longer applicable

### Use Cases

![API VA Aggregator](images/va_use_case_new.png)

### Registration and Set Up

Follow the below check-list to ensure you're all set up to use our VA Aggregator API service:

1. Create an account
2. Upgrade your account by submitting the required documentations
3. Have your upgrade request approved
4. Set up your receiving bank account information (note: ensure that the receiving bank account information is accurate as it cannot be changed via OY! dashboard for security reasons)
5. Submit your IPs and callback URLs to your business representative or to partner@oyindonesia.com
6. Receive an API Key from us (note: it is required for API authorization purpose)
7. Integrate with our Virtual Account Aggregator API

### Testing

#### Create VA number via API

Once you successfully create an OY! account, you can immediately simulate VA payments via API.

Follow the below steps to test the VA flow:

1. Create an account

2. Send a request to activate API VA Aggregator product and obtain staging API Key to your business representative

3. Create a VA number by sending a ‘POST’ request to https://api-stg.oyindonesia.com/api/generate-static-va using your staging API key. Enter the required and optional fields, as referenced in the [API reference docs](https://api-docs.oyindonesia.com/#create-va)

4. After VA number is generated, partner can simulate VA payment through your dashboard (in Staging environment) by going to Settings, and choose "VA Callback"

5. Fill in the bank name associated with the generated VA number, the generated VA number, amount, and payment date & time

6. If payment is successful, we will send a callback to the registered staging callback URL destination

7. The payment made to the VA can be monitored through OY! dashboard. Go to "Virtual Account" menu, and choose "Incoming Payment"

#### Create VA via Dashboard

Once you successfully create an OY! account, you can immediately create VA number and simulate VA payments via Dashboard.

Follow the instruction below:

1. Create an Account.

2. Select ‘Staging’ environment.

3. Click menu Virtual Account, then click ‘Create VA’.

4. In the top right, click ‘Create Virtual Account’ button.

5. You can choose between creating VA by uploading a CSV file (template available) or creating manually one by one.

6. Fill out the requirements: Partner User ID, Partner Transaction ID, Bank Name, VA Name, VA Type, Amount, usage, Usage Limit, VA Expiration Type, VA Expiration Date & Time, Transaction Expiration Date & Time, and Email.

7. Validate and Submit your request.

8. VA number(s) that you created will appear in the Create VA menu.

9. To simulate VA payment and see status changing, tap ‘Send Callback’ button in the right section of the table

### How to Use

Send us instructions to generate a new VA number, or create a VA number via dashboard.

> Below is an example of a request body to execute your request:

```shell
curl --location --request POST https://partner.oyindonesia.com/api/generate-static-va
--header 'content-type: application/json' \
--header 'accept: application/json' \
--header 'x-oy-username: username' \
--header 'x-api-key: apikey' \
-d '{
    "partner_user_id":"51200021",
    "bank_code": "014",
    "amount": 150000,
    "is_open" : false,
    "is_single_use" : false,
    "is_lifetime": false,
    "expiration_time": 5,
    "username_display" : "va name",
    "email": "email@mail.com"
    }'
```

> It will return an [error message](https://api-docs.oyindonesia.com/#va-aggregator-response-codes) if the request is not valid. Otherwise, below is the sample response parameters that will be returned:

```json
{
  "id": "12345b1-23be-45670-a123-5ca678f12b3e",
  "status": {
    "code": "000",
    "message": "Success"
  },
  "amount": 15000,
  "va_number": "700707760000000003",
  "bank_code": "014",
  "is_open": false,
  "is_single_use": false,
  "expiration_time": 1582783668175,
  "va_status": "WAITING_PAYMENT",
  "username_display": "va name",
  "trx_expiration_time": 1582783668175,
  "partner_trx_id": "TRX0001"
}
```

>

Once a VA is created, its details can be seen and monitored through the OY! dashboard.

- For Create VA via API, an endpoint to [check your VA information](https://api-docs.oyindonesia.com/#get-va-info) is also available and can be accessed at any time.
- If you wish to change the details of your VA, you can do so by [updating your VA](https://api-docs.oyindonesia.com/#update-va) at any time.

![API VA Aggregator](images/va_waiting_payment.png)

> Below is an example of the request body:

```shell
curl --location --request GET https://partner.oyindonesia.com/api/static-virtual-account/12345b1-23be-45670-a123-5ca678f12b3e
--header 'content-type: application/json' \
--header 'accept: application/json' \
--header 'x-oy-username: username' \
--header 'x-api-key: apikey'
```

> Below is the sample response parameters that will be returned:

```json
{
  "id": "12345b1-23be-45670-a123-5ca678f12b3e",
  "status": {
    "code": "000",
    "message": "Success"
  },
  "amount": 150000.0000,
  "va_number": "700707760000000003",
  "bank_code": "014",
  "is_open": false,
  "is_single_use": false,
  "expiration_time": 1582783668175,
  "va_status": "WAITING_PAYMENT",
  "username_display": "va name",
  "amount_detected": 0,
  "partner_user_id": "123456",
  "trx_expiration_time": 1582783668175,
  "partner_trx_id": "TRX0001"
}
```

>

> Below is an example of the request body:

```shell
curl --location --request PUT https://partner.oyindonesia.com/api/static-virtual-account/12345b1-23be-45670-a123-5ca678f12b3e
--header 'content-type: application/json' \
--header 'accept: application/json' \
--header 'x-oy-username: username' \
--header 'x-api-key: apikey' \
-d '{"is_open" : true,"amount": 50000,"is_single_use" : false,"expiration_time": 30,"username_display" : "va name","bank_code": "014","trx_expiration_time":5,"partner_trx_id":"TRX0001"}'
```

> Below is the sample of response parameters that will be returned:

```json
{
  "id": "12345b1-23be-45670-a123-5ca678f12b3e",
  "status": {
    "code": "000",
    "message": "Success"
  },
  "amount": 50000,
  "va_number": "700707760000000003",
  "bank_code": "014",
  "is_open": true,
  "is_single_use": false,
  "expiration_time": 1582802205412,
  "va_status": "WAITING_PAYMENT",
  "username_display": "va name",
  "partner_user_id": "123456",
  "trx_expiration_time": 1582802205412,
  "partner_trx_id": "TRX0001"
}
```

>

All details regarding your [created VA](https://api-docs.oyindonesia.com/#get-list-of-created-va) and its payments can be monitored directly from the OY! dashboard.

- Additionally, Create VA via API can be retrieved via our API endpoint.

![API VA Aggregator](images/va_created_va.png)

Similarly, all the details regarding [incoming transactions](https://api-docs.oyindonesia.com/#get-list-of-transaction-for-va) can be monitored directly from the OY! dashboard.

- Additionally, Create VA via API can be retrieved via our API endpoint.

![API VA Aggregator](images/va_incoming.png)

For further details regarding OY!'s extensive API VA Aggregator capabilities and endpoints, please refer to the [OY! API Documentation](https://api-docs.oyindonesia.com/#va-aggregator).

### VA Bank Details

| Bank (Virtual Account) | SKN Supported | RTGS Supported | Payment from ATM | Payment from m-banking / i-banking (intra bank) | Payment from business account (m-banking/i-banking) | Payment from m-banking/i-banking (inter bank) |
| ---------------------- | ------------- | -------------- | ---------------- | ----------------------------------------------- | --------------------------------------------------- | --------------------------------------------- |
| Bank Mandiri           | Yes           | Yes            | Yes              | Yes                                             | Yes                                                 | Yes                                           |
| BRI                    | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| BNI                    | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| BCA                    | No            | No             | Yes              | Yes                                             | No                                                  | Yes                                           |
| Bank Permata           | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| CIMB Niaga             | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |

| Bank (Virtual Account) | Payment from Teller (Inter and Intra Banks)    | SWIFT Payment | Intra bank transfer fees |
| ---------------------- | ---------------------------------------------- | ------------- | ------------------------ |
| Bank Mandiri           | Yes                                            | No            | Rp 0                     |
| BRI                    | Yes                                            | No            | Rp 1000                  |
| BNI                    | Yes                                            | No            | Rp 0                     |
| BCA                    | Yes (Teller BCA); No (Teller from other banks) | No            | Rp 0                     |
| Bank Permata           | Yes                                            | No            | Rp 5000                  |
| CIMB Niaga             | Yes                                            | Yes           | Rp 0                     |

## Payment Links/Invoice

**Overview**
Payment Link
OY! Payment Link/Invoice is a pre-built payment page that allows your business to easily and securely accept payments online. Currently, our payment link/invoice page supports Credit Card, Debit Card, Bank Transfer, E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QR Code (QRIS) payment methods. You can create payment link/invoice pages through various methods: OY! Dashboard and API.

Creating a payment link/invoice page is free! You will only be charged when you successfully receive a payment made through that checkout/invoice page.

**Payment Flow**

1. You create payment link/invoice page for your customers
2. Your customers make a payment through the payment link/invoice page
3. OY! detects the payments and notifies you about the payments through sending a callback and/or updating the payment status on your dashboard
4. The payments received will settle in your OY! dashboard

**Payment Link Preview**

![Payment Link](images/3p1p_preview.png)

### Key Features

#### Various options of creating payment link/invoice page

**1. Creating payment link/invoice page through dashboard**

**No integration needed**

Offer your customers a seamless way to pay and complete payment channels without the need of an integration

**Choose between one-time link and reusable link**

One-time link is a link that can only be paid once.
Reusable link is a link that can receive multiple payments.

**Parameter customization**

| Parameter Type             | Parameter Name                                                                                                                                                                                           | Definition                                                                                                                                                                                                                                                                                                                                    |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Transaction-related        | Amount                                                                                                                                                                                                   | The payment amount that will be displayed in the payment link page                                                                                                                                                                                                                                                                            |
| Transaction-related        | Description                                                                                                                                                                                              | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                    |
| Transaction-related        | Partner Transaction ID                                                                                                                                                                                   | A unique transaction ID that you can assign to a transaction                                                                                                                                                                                                                                                                                  |
| Customer Detail            | Customer details that can be specified (optional): Customer Name, Phone Number, Email, and Notes. We will send the payment link page link to the specified email address (if email address is filled in) | Customer Name, Phone Number, Email, and Notes                                                                                                                                                                                                                                                                                                 |
| Payment Link Configuration | Amount Type                                                                                                                                                                                              | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                   |
| Payment Link Configuration | Payment Method                                                                                                                                                                                           | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QRIS                                                                                                        |
| Payment Link Configuration | Admin Fee Method                                                                                                                                                                                         | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee) |
| Payment Link Configuration | Payment Link Expiration Date                                                                                                                                                                             | You can choose (specify the day(s) and/or hour(s)) of when the payment link will expire after it is created. For example, if you want the link to expire 1 day after it is created, fill 1 day 0 hour in the Payment Link Expiration Date field.                                                                                              |

**UI customization**

In order to maintain a consistent brand experience for your users, you can customize the look and feel of your payment link in the Dashboard, where you can do the following things;

* Upload a logo
* Choose the button and the theme color of the payment link

**1. Creating payment link/invoice page through pre-generated URL**

- **No integration needed**
  Access and declare all parameters needed from the URL with easy and simple declaration.

- **Reusable link**
  One link can be used many times without repeating declaration.

- **Amount and payment method customization**
  You can choose whether your users will pay a fixed amount (closed amount) or any amount (open amount).

      You can also choose which payment methods that you will enable for your customers. The payment methods to choose from are Bank Transfers, Credit Card, Debit Card, and QR code.

      Please refer to our [FAQ page](https://docs.oyindonesia.com/#faqs) below for more information regarding closed and open amounts.


**2. Creating payment link/invoice page through API**

- **Seamless integration with your customer's purchase journey**
  You can easily call our API - we will take care of the payment link/invoice link creation and feed it back to you so that you can embed the link in your customer journey.

- **Added level of customization**

Below are the things that you can customize:

1. Amount (specify the amount and choose between open amount vs closed amount)

2. Admin fee (choose whether the admin fee will be borne by your customers or borne by you)

3. Payment method (choose the payment methods displayed to your customers among Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QR Code options. Additionally, you can choose which banks are enabled for Bank Transfer method.)

4. Payment link expiration date

- **Static VA for Invoice Payment**
  You can enable a static VA option when using the API specifically assigned to your customer.

- **Upload or Create a PDF for your Invoice Billing**
  You can upload an invoice attachment or create an attachment using the OY! PDF templates via our API so you do not need to send a separate email to your customer.

- **Payment Link Delivery by Email**
  If you want to share the payment link to your customer's email, you can define the email parameter in our API. No need for you to send a separate email!

**3. Creating payment link/invoice page through dashboard**

If you want to use our payment link/invoice page without undergoing technical integration process/without API and with higher level of customization, you can choose to create it through your dashboard.

This capability enables you to enjoy most of the features and benefits of creating payment link/invoice page through API - without any integration needed!

#### Capability to monitor payment link/invoice details on dashboard

Whether you send your user a pre-generated link, dashboard-generated link, or an API-generated encapsulated link, each of your distributed payment link can be monitored through the OY! Dashboard. We will also send a callback for all incoming payments.

You will be able to see the details of the payment link including, but not limited to, the payment status, creation and expiration dates and times, amount, description, payment details, and payer details. For further convenience, you can also find and filter through your payment link list by creation date, partner transaction ID, or status.

We also provide an API for you to check the transaction status manually.

![Payment Link](images/payment_checkout_list.png)

### Registration and Set Up

**For dashboard-generated links**

Follow the below check-list to ensure you're all set up to use the above service:

1. Create an account
2. Upgrade your account by submitting the required documentations
3. Have your upgrade request approved
4. Set up your receiving bank account information (note: ensure that the receiving bank account information is accurate as it cannot be changed via OY! dashboard for security reasons)
5. Once your account is approved, you can start creating Payment Link transactions

**For API-generated links**

1. Create an account
2. Upgrade your account by submitting the required documentations
3. Have your upgrade request approved
4. Set up your receiving bank account information (note: ensure that the receiving bank account information is accurate as it cannot be changed via OY! dashboard for security reasons)
5. Submit your IPs and callback URLs to your business representative or to partner@oyindonesia.com
6. Receive an API Key from us (note: it is required for API authorization purpose)
7. Integrate with our Payment Link API (https://api-docs.oyindonesia.com/#api-create-payment-checkout)

### Testing

**Creating dashboard-generated test links**

One-time Link

1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Request Money" menu, and choose "Payment Link"
4. Choose "One Time"
5. Click "Create One-Time Payment Link"
6. Fill in the necessary details

One-time Payment Link consists of 3 parameter types: Transaction-related, Customer Detail, and General Payment Link Configuration.

| Parameter Type             | Parameter Name                                                                                                                                                                                 | Definition                                                                                                                                                                                                                                                                                                                                    |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Transaction-related        | Amount                                                                                                                                                                                         | The payment amount that will be displayed in the payment link page                                                                                                                                                                                                                                                                            |
| Transaction-related        | Description                                                                                                                                                                                    | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                    |
| Transaction-related        | Partner Transaction ID                                                                                                                                                                         | A unique transaction ID that you can assign to a transaction                                                                                                                                                                                                                                                                                  |
| Customer Detail            | Customer details that can be specified (optional): Customer Name, Phone Number, Email, and Notes. We will send the payment link to the specified email address (if email address is filled in) | Customer Name, Phone Number, Email, and Notes                                                                                                                                                                                                                                                                                                 |
| Payment Link Configuration | Amount Type                                                                                                                                                                                    | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                   |
| Payment Link Configuration | Payment Method                                                                                                                                                                                 | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QRIS                                                                                                        |
| Payment Link Configuration | Admin Fee Method                                                                                                                                                                               | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee) |
| Payment Link Configuration | Payment Link Expiration Date                                                                                                                                                                   | You can choose (specify the day(s) and/or hour(s)) of when the payment link will expire after it is created. For example, if you want the link to expire 1 day after it is created, fill 1 day 0 hour in the Payment Link Expiration Date field.                                                                                              |

Note: For Payment Link Configuration-related fields (Amount Type, Payment Method, Admin Fee Method, Payment Link Expiration Date), you can choose to save your selected configuration for the future transactions by ticking the "Use this configuration for future transaction(s) option. By saving it, you will no longer need to fill in the fields again the next time you create a payment link.

![Payment Link](images/create_payment_link_1.png)

![Payment Link](images/create_payment_link_2.png)

![Payment Link](images/create_payment_link_3.png)

Reusable Link

1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Request Money" menu, and choose "Payment Link"
4. Choose "Reusable"
5. Click "Create Reusable Link"
6. Fill in the necessary details

Reusable Payment Link consists of 2 parameter types: Transaction-related and General Payment Link Configuration.

| Parameter Type             | Parameter Name               | Definition                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Transaction-related        | Amount                       | The payment amount that will be displayed in the payment link page                                                                                                                                                                                                                                                                                                                                              |
| Transaction-related        | Description                  | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                                                                                      |
| Transaction-related        | Partner Transaction ID       | A unique transaction ID that you can assign to a transaction                                                                                                                                                                                                                                                                                                                                                    |
| Payment Link Configuration | Amount Type                  | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                                                                                     |
| Payment Link Configuration | Payment Method               | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QRIS                                                                                                                                                                          |
| Payment Link Configuration | Admin Fee Method             | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee)                                                                   |
| Payment Link Configuration | Payment Link Expiration Date | You can choose (specify the day(s) and/or hour(s)) of when the payment link will expire after it is created. You can choose between "Custom" (where you can specify the expiration time as you wish) and "Lifetime" (where a link will last for a lifetime and have no expiration time). If you want the link to expire 1 day after it is created, fill 1 day 0 hour in the Payment Link Expiration Date field. |

Note: For Payment Link Configuration-related fields (Amount Type, Payment Method, Admin Fee Method, Payment Link Expiration Date), you can choose to save your selected configuration for the future transactions by ticking the "Use this configuration for future transaction(s) option. By saving it, you will no longer need to fill in the fields again the next time you create a payment link.

**Creating API-generated test links**

1. Create an account
2. Send a request to activate API Payment Link product and obtain staging API Key to your business representative
3. Create a payment link by sending a ‘POST’ request to https://api-stg.oyindonesia.com/api/payment-checkout/create-v2. Enter the required and optional fields, as referenced in the [API reference docs](https://api-docs.oyindonesia.com/#api-create-payment-checkout)

Note: The link generated via API will always be a one-time link.

**Accessing and monitoring the created test payment links**

Whether you create the link through dashboard or API, you can see the details of your link on the OY! Dashboard. The details that can be checked are the created date of the link, amount billed, amount received, expiration date, and status.

**Mock Amount Values for Testing**

During testing, you can set the transaction amount to a certain mock value to simulate a specific scenario.

| Payment Method       | Scenario                                                                                                                                                                 | Criteria                                          | Expected Result   |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- | ----------------- |
| E-Wallet - ShopeePay | Payment already successful on E-Wallet issuer side but failed on OY side (can be due to callback timeout reasons). The transaction is refunded to the end-user's balance | Amount is between 55,000 and 66,000               | Refund Successful |
| QRIS                 | Payment already successful on E-Wallet issuer side but failed on OY side (can be due to callback timeout reasons). The transaction is refunded to the end-user's balance | Amount is between 55,000 and 66,000               | Refund Successful |
| E-Wallet - LinkAja   | Payment already successful on E-Wallet issuer side but failed on OY side (can be due to callback timeout reasons). The transaction is refunded to the end-user's balance | Amount is between 55,000 and 66,000               | Refund Successful |
| E-Wallet - ShopeePay | Failure during refund process                                                                                                                                            | Amount is less than 55,000 or greater than 66,000 | Refund Failed     |
| QRIS                 | Failure during refund process                                                                                                                                            | Amount is less than 55,000 or greater than 66,000 | Refund Failed     |
| E-Wallet - LinkAja   | Failure during refund process                                                                                                                                            | Amount is less than 55,000 or greater than 66,000 | Refund Failed     |

### How to Use Payment Link via Dashboard

One-time Link

1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Request Money" menu, and choose "Payment Link"
4. Choose "One Time"
5. Click "Create One-Time Link"
6. Fill in the necessary details

One-time Payment Link consists of 3 parameter types: Transaction-related, Customer Detail, and General Payment Link Configuration.

| Parameter Type             | Parameter Name                                                                                                                                                                                 | Definition                                                                                                                                                                                                                                                                                                                                                                                                        |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Transaction-related        | Amount                                                                                                                                                                                         | The payment amount that will be displayed in the payment link page                                                                                                                                                                                                                                                                                                                                                |
| Transaction-related        | Description                                                                                                                                                                                    | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                                                                                        |
| Transaction-related        | Partner Transaction ID                                                                                                                                                                         | A unique transaction ID that you can assign to a transaction                                                                                                                                                                                                                                                                                                                                                      |
| Customer Detail            | Customer details that can be specified (optional): Customer Name, Phone Number, Email, and Notes. We will send the payment link to the specified email address (if email address is filled in) | Customer Name, Phone Number, Email, and Notes                                                                                                                                                                                                                                                                                                                                                                     |
| Payment Link Configuration | Amount Type                                                                                                                                                                                    | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                                                                                       |
| Payment Link Configuration | Payment Method                                                                                                                                                                                 | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QRIS                                                                                                                                                                            |
| Payment Link Configuration | Admin Fee Method                                                                                                                                                                               | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee)                                                                     |
| Payment Link Configuration | Payment Link Expiration Date                                                                                                                                                                   | You can choose (specify the day(s) and/or hour(s)) of when the payment link will expire after it is created. You can choose between "Custom" (where you can specify the expiration time as you wish) and "Lifetime" (where a link will last for a lifetime and have no expiration time). If you want the link to expire 1 day after it is created, fill 1 day 0 hour in the Payment Link Expiration Date field. . |

Note: For Payment Link Configuration-related fields (Amount Type, Payment Method, Admin Fee Method, Payment Link Expiration Date), you can choose to save your selected configuration for the future transactions by ticking the "Use this configuration for future transaction(s) option. By saving it, you will no longer need to fill in the fields again the next time you create a payment link.

![Payment Link](images/create_payment_link_4.png)

![Payment Link](images/create_payment_link_5.png)

![Payment Link](images/create_payment_link_6.png)

Reusable Link

1. Log on your OY! dashboard
2. Choose "Staging" environment
3. Click "Request Money" menu, and choose "Payment Link"
4. Choose "Reusable"
5. Click "Create Reusable Link"
6. Fill in the necessary details

Reusable Payment Link consists of 2 parameter types: Transaction-related and General Payment Link Configuration.

| Parameter Type             | Parameter Name               | Definition                                                                                                                                                                                                                                                                                                                                    |
| -------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Transaction-related        | Amount                       | The payment amount that will be displayed in the payment link page                                                                                                                                                                                                                                                                            |
| Transaction-related        | Description                  | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                    |
| Transaction-related        | Partner Transaction ID       | A unique transaction ID that you can assign to a transaction                                                                                                                                                                                                                                                                                  |
| Payment Link Configuration | Amount Type                  | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                   |
| Payment Link Configuration | Payment Method               | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QRIS                                                                                                        |
| Payment Linkfiguration     | Admin Fee Method             | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee) |
| Payment Link Configuration | Payment Link Expiration Date | You can choose (specify the day(s) and/or hour(s)) of when the payment link will expire after it is created. For example, if you want the link to expire 1 day after it is created, fill 1 day 0 hour in the Payment Link Expiration Date field.                                                                                              |

Note: For Payment Link Configuration-related fields (Amount Type, Payment Method, Admin Fee Method, Payment Link Expiration Date), you can choose to save your selected configuration for the future transactions by ticking the "Use this configuration for future transaction(s) option. By saving it, you will no longer need to fill in the fields again the next time you create a payment link.

![Payment Link](images/create_reusable_1.png)

![Payment Link](images/create_reusable_2.png)

![Payment Link](images/create_reusable_3.png)

### Monitoring the payment link transactions

One-time Link

All of the created links can be monitored through your dashboard (Payment Link List).

The transaction details that you can see are;

| Column Name           | Definition                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Date & Time Created   | The creation timestamp of a child transaction. The timestamp of a user selecting a payment method                                                                  |
| Last Update           | The last update timestamp of a child reusable link. This usually denotes the timestamp of a status change for a child link.                                        |
| Partner Tx ID         | The partner tx ID of a reusable link you just created                                                                                                              |
| Amount Billed         | The amount billed for that particular transaction                                                                                                                  |
| Admin Fee             | The admin fee charged for that particular transaction                                                                                                              |
| Amount Received       | The amount received / the amount of payment made by the user. This will only be filled in if the user has completed the payment.                                   |
| Payment method used   | The payment method that your user uses to pay the transaction. This will only be filled in if the user has completed the payment                                   |
| Transaction Due Date  | The due date of a transaction.                                                                                                                                     |
| Days Past Due         | How many days a link has gone past the transaction due date. For example, if today’s date is 1 Dec and transaction due date is 30 Nov, the days past due will be 1 |
| Customer Name         | The name of your user/customer                                                                                                                                     |
| Customer Phone Number | The phone number of your user/customer                                                                                                                             |
| Customer Notes        | The transaction notes written by your user/customer                                                                                                                |
| Status                | The transaction status. Possible values are WAITING PAYMENT, FAILED, CHARGE IN PROGRESS, EXPIRED, AND COMPLETE                                                     |

![Payment Link](images/one_time_link_list.png)

Reusable Link

After you successfully create a reusable link, it will become a "Parent" link. The Parent link will appear in the "Created Reusable Link" tab. There, you will see the details of a reusable link you just created.

| Column Name                  | Definition                                                                                                                                                                                                                                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Last Update                  | The last update timestamp of a parent reusable link. This usually denotes the timestamp of a status change for a parent link.                                                                                                                                                                                   |
| Partner Tx ID                | The partner tx ID of a reusable link you just created                                                                                                                                                                                                                                                           |
| Amount Billed                | The billed amount per individual transaction (not a cumulative amount). For example, if the amount is set at Rp 10,000 for a reusable parent link, the amount billed will be filled in with Rp 10,000                                                                                                           |
| Admin Fee                    | The cumulative admin fee received for a particular parent reusable link. If a parent reusable link has peen paid twice, with admin fee Rp 500 each, the admin fee will be filled in with Rp 500 x 2 = Rp 1,000                                                                                                  |
| Amount Received              | The cumulative admin fee received for a particular parent reusable link. If a parent reusable link has peen paid twice, with admin fee Rp 500 each, the admin fee will be filled in with Rp 500 x 2 = Rp 1,000                                                                                                  |
| Count of Complete Tx         | The count of completed transactions under a parent reusable link                                                                                                                                                                                                                                                |
| Payment link expiration date | The date after which a parent reusable link can no longer receive a transaction.                                                                                                                                                                                                                                |
| Status                       | The status of a parent reusable link. Possible status: OPEN FOR PAYMENT (means the link can still receive payments) and EXPIRED (status will be changed to EXPIRED when the payment link has exceeded the expiration date). When status is set as EXPIRED, the payment link can no longer receive a transaction |
| Action                       | The possible actions that you can take on a link: Copy URL, Visit URL, Delete, and Resend Callback                                                                                                                                                                                                              |

![Payment Link](images/reusable_link_parent.png)

When you click the hyperlink in the Partner Tx ID, you will be redirected to a page where you can see the transaction details corresponding to that Parent Reusable Link.

![Payment Link](images/reusable_link_parent_details.png)

The transaction list displayed is the transaction that is linked to a Parent Reusable Link

The transaction details that you can see are;

| Column Name           | Definition                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Date & Time Created   | The creation timestamp of a child transaction. The timestamp of a user selecting a payment method                                                                  |
| Last Update           | The last update timestamp of a child reusable link. This usually denotes the timestamp of a status change for a child link.                                        |
| Partner Tx ID         | The partner tx ID of a reusable link you just created                                                                                                              |
| Amount Billed         | The amount billed for that particular transaction                                                                                                                  |
| Admin Fee             | The admin fee charged for that particular transaction                                                                                                              |
| Amount Received       | The amount received / the amount of payment made by the user. This will only be filled in if the user has completed the payment.                                   |
| Payment method used   | The payment method that your user uses to pay the transaction. This will only be filled in if the user has completed the payment                                   |
| Transaction Due Date  | The due date of a transaction.                                                                                                                                     |
| Days Past Due         | How many days a link has gone past the transaction due date. For example, if today’s date is 1 Dec and transaction due date is 30 Nov, the days past due will be 1 |
| Customer Name         | The name of your user/customer                                                                                                                                     |
| Customer Phone Number | The phone number of your user/customer                                                                                                                             |
| Customer Notes        | The transaction notes written by your user/customer                                                                                                                |
| Status                | The transaction status. Possible values are WAITING PAYMENT, FAILED, CHARGE IN PROGRESS, EXPIRED, AND COMPLETE                                                     |
| Action                | The possible actions that you can take on a link: Copy URL, Visit URL, Delete, and Resend Callback                                                                 |

When your user has opened the parent reusable link and selected a payment method, it will become a "child reusable link" and generate a child transaction ID. The child transaction ID will appear in the "List of All Transactions" tab

The details that you can see are;

| Column Name           | Definition                                                                                                                       |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Date & Time Created   | The creation timestamp of a child transaction. The timestamp of a user selecting a payment method                                |
| Last Update           | The last update timestamp of a child reusable link. This usually denotes the timestamp of a status change for a child link.      |
| Partner Tx ID         | The partner tx ID of a reusable link you just created                                                                            |
| Amount Billed         | The amount billed for that particular transaction                                                                                |
| Admin Fee             | The admin fee charged for that particular transaction                                                                            |
| Amount Received       | The amount received / the amount of payment made by the user. This will only be filled in if the user has completed the payment. |
| Payment method used   | The payment method that your user uses to pay the transaction. This will only be filled in if the user has completed the payment |
| Customer Name         | The name of your user/customer                                                                                                   |
| Customer Phone Number | The phone number of your user/customer                                                                                           |
| Customer Notes        | The transaction notes written by your user/customer                                                                              |
| Status                | The transaction status. Possible values are WAITING PAYMENT, FAILED, CHARGE IN PROGRESS, EXPIRED, AND COMPLETE                   |
| Action                | The possible actions that you can take on a link: Copy URL, Visit URL, Delete, and Resend Callback                               |

![Payment Link](images/reusable_link_child.png)

### How to Use Invoice via Dashboard

1. Log on your OY! dashboard
2. Choose "Production" environment
3. Click "Request Money" menu, and choose "Invoice"
4. Click "Create Invoice"
5. Fill in the necessary details

| Parameter                    | Description                                                                                                                                                                                                                                                                                                                                                          |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amount Type                  | You can choose between Open Amount and Closed Amount. Open Amount = can accept payments of any amount, OR up to the specified amount (if amount is filled in). Closed Amount = only accept payments of the specified amount                                                                                                                                          |
| Partner Transaction ID       | A unique transaction ID that you can assign for a transaction                                                                                                                                                                                                                                                                                                        |
| Payment Method               | The payment method that you can choose to enable/disable for your customers. The payment methods available are Bank Transfer (via Virtual Account), Cards (Credit Card/Debit Card), E-Wallet (ShopeePay, DANA, LinkAja, OVO), and QR Code                                                                                                                            |
| Admin Fee Method             | You can choose between "Included in total amount" or "Excluded from total amount". "Included in total amount" means the admin fee will be deducted from the payment amount made by the customer. "Excluded from total amount" means the admin fee will be added to the customer's total payment (Total Amount = Specified Amount + Admin Fee)                        |
| Payment Link Expiration Date | You can choose between "Default" and "Custom". "Default" means the payment link will expire 24 hours after it is created. "Custom" means you can specify the expired date. The payment link will expire when this specified expired date is reached                                                                                                                  |
| Transaction Due Date         | Due date of a transaction. You can choose between "Same with Payment Link Expiration Date" and "Custom". Your customer will get reminders to pay on D-1, D-Day, and D+7 from the transaction due date. A transaction can exceed the due date, but the link can still be opened (because transaction due date and link expiration time are 2 separate things).        |
| Partner User ID              | ID assigned for a specific user/customer                                                                                                                                                                                                                                                                                                                             |
| VA Static                    | You can choose between "Disable" and "Enable". 'Disable" means a new VA number will be assigned for the respective Partner User ID (if the user chooses to pay via VA). "Enable" means we will assign a static VA for the respective Partner User ID (if the user chooses to pay via VA). The VA number assigned will be the same for the respective partner user ID |
| Customer Full Name           | Full name of your customer that will be displayed in the invoice link.                                                                                                                                                                                                                                                                                               |
| Invoice Detail               | You can choose between attaching the PDF file of your invoice and input the item list (such as Item Name, Price, and Quantity). Note that the subtotal of price and quantity inputted here must be the same with the total amount inputted in he field above.                                                                                                        |
| Description                  | The description of the payment link. Usually this is used to describe the purpose of the payment link page                                                                                                                                                                                                                                                           |
| Customer Detail              | Details that can be specified: Customer Phone Number, Email, and Notes. We will send the payment link as well as the payment success receipt to the specified email address (if email address is filled in).                                                                                                                                                         |

Whether you create the link through URL, dashboard, or API, you can see the details of your link on the OY! Dashboard. The details that can be checked are the created date of the link, amount billed, amount received, expiration date, and status.

### How to Use Payment Link/Invoice via API

We provide 3 different payment link endpoints depending on your requirements and needs. We provide payment link, invoicing, and recurring invoice.

Send us instructions to generate a [payment link](https://api-docs.oyindonesia.com/#api-create-payment-checkout).

> Below is an example of a request body to execute your request:

```shell
curl -X POST \
  https://partner.oyindonesia.com/api/payment-checkout/create-v2 \-H 'cache-control: no-cache' -H 'content-type: application/json' \-H 'X-Api-Key: apikeymu' -H 'X-Oy-Username: yourusername' \-d '{
        "partner_tx_id":"partnerTxId",
        "description":"description",
        "notes":"notes",
        "sender_name":"Sender name",
        "amount":50000,
        "email":"",
        "phone_number":"",
        "is_open":false,
        "step":"input-amount",
        "include_admin_fee":false,
        "list_disabled_payment_methods":"",
        "list_enabled_banks":"",
        "expiration":"2020-08-08 08:09:12"
    }'
```

> Below is the sample response parameters that will be returned:

```json
{
  "success": true,
  "url": "https://pay.oyindonesia.com/id",
  "message": "success",
  "email_status": "PROCESSED",
  "payment_link_id": "id"
}
```

>

Send us instructions to generate a [payment link invoice link](https://api-docs.oyindonesia.com/#api-create-invoicing).

> Below is an example of a request body to execute your request:

```shell
url -X POST \
  https://partner.oyindonesia.com/api/payment-checkout/create-invoice\-H 'cache-control: no-cache' -H 'content-type: application/json' \-H 'X-Api-key: apikeymu' -H 'X-Oy-Username: yourusername' \-d '{
        "partner_tx_id":"partner tx id",
        "description":"desc invoice",
        "notes":"notes satu",
        "sender_name":"Sender Name API",
        "amount":"30000",
        "email":"",
        "phone_number":"",
        "is_open":"true",
        "step":"input-amount",
        "include_admin_fee":false,
        "list_disabled_payment_methods":"",
        "list_enabled_banks":"013",
        "expiration":"2020-07-28 19:15:13",
        "partner_user_id":"partner user id",
          "full_name" : "Raymond",
          "is_va_lifetime": false,
        "attachment": "JVBERi0xLjQKJeLjz9MKMyAwIG9iago8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDQ5Nj4+c3RyZWFtCnicrZVdb9MwFIbv/SsOd51EwrHjz0tKhxQk2IciJMS4CG46lbVNyYcE/HqcbNloh5xO8U3OUXJ8Hr/2aweBQkQBQRjhnnZLfpJ5RhIJQhjIluQ8I1eEwYfubVeHMFRnW/LmPQWKkK3I7Cz70dU+lfTN/hnE3ChJY9SPA0U3EPvP1S2ZXXx5Bemnzxfpu/OuGcLtfxp+/ebisp+QH8VkrNjhHJ9QaV23xRKyciKIGuCGjYPmv6cq0idKWuRNEYDlV7VoixAgwcdEXeZVsysqyH5BughA88t6uy3bXQNO3XRbCEq9pKr8sw5gPuXT8zGv7/JNCOeh9mAYMoxQRcyEMJ5KRlEmokkI63lVrSgqi8JEWlsV8ZURkRFMR1pILkVuZcJYCEd69V7vY3eZxYj4GvEkGsaMK5SAMTcauYsKje6aObskUsGWaKr7bPOYHUd7/8XIocZlx9H2DfuSh+Qw2AG4GZLDYMlqmLfHEQIS/XyBaOf++5uoqG213jfrcjfVfAYdi/tY0288noxBrpqpvwoh1AjjslrbqUo6j/kpWdnkG7iZpYvrm7MQmyOe045vBhkhDbFFI6gTz6Jvj9zqCd+frz/5MRMvOvyeBUxGRM3bvIHvRZXvmryGu7Jq901ZhTDJqEweC+xlvkTqX6+ILeYKZW5kc3RyZWFtCmVuZG9iagoxIDAgb2JqCjw8L1RhYnMvUy9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L1R5cGUvR3JvdXAvQ1MvRGV2aWNlUkdCPj4vQ29udGVudHMgMyAwIFIvVHlwZS9QYWdlL1Jlc291cmNlczw8L0NvbG9yU3BhY2U8PC9DUy9EZXZpY2VSR0I+Pi9Qcm9jU2V0IFsvUERGIC9UZXh0IC9JbWFnZUIgL0ltYWdlQyAvSW1hZ2VJXS9Gb250PDwvRjEgMiAwIFI+Pj4+L1BhcmVudCA0IDAgUi9Sb3RhdGUgOTAvTWVkaWFCb3hbMCAwIDU5NSA4NDJdPj4KZW5kb2JqCjUgMCBvYmoKWzEgMCBSL1hZWiAwIDYwNSAwXQplbmRvYmoKMiAwIG9iago8PC9TdWJ0eXBlL1R5cGUxL1R5cGUvRm9udC9CYXNlRm9udC9IZWx2ZXRpY2EvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nPj4KZW5kb2JqCjQgMCBvYmoKPDwvS2lkc1sxIDAgUl0vVHlwZS9QYWdlcy9Db3VudCAxL0lUWFQoMi4xLjcpPj4KZW5kb2JqCjYgMCBvYmoKPDwvTmFtZXNbKEpSX1BBR0VfQU5DSE9SXzBfMSkgNSAwIFJdPj4KZW5kb2JqCjcgMCBvYmoKPDwvRGVzdHMgNiAwIFI+PgplbmRvYmoKOCAwIG9iago8PC9OYW1lcyA3IDAgUi9UeXBlL0NhdGFsb2cvUGFnZXMgNCAwIFIvVmlld2VyUHJlZmVyZW5jZXM8PC9QcmludFNjYWxpbmcvQXBwRGVmYXVsdD4+Pj4KZW5kb2JqCjkgMCBvYmoKPDwvTW9kRGF0ZShEOjIwMjAwNzI5MTE1MzE1WikvQ3JlYXRvcihKYXNwZXJSZXBvcnRzIExpYnJhcnkgdmVyc2lvbiBudWxsKS9DcmVhdGlvbkRhdGUoRDoyMDIwMDcyOTExNTMxNVopL1Byb2R1Y2VyKGlUZXh0IDIuMS43IGJ5IDFUM1hUKT4+CmVuZG9iagp4cmVmCjAgMTAKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDAwNTc4IDAwMDAwIG4gCjAwMDAwMDA4NjQgMDAwMDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDAwOTUyIDAwMDAwIG4gCjAwMDAwMDA4MjkgMDAwMDAgbiAKMDAwMDAwMTAxNSAwMDAwMCBuIAowMDAwMDAxMDY5IDAwMDAwIG4gCjAwMDAwMDExMDEgMDAwMDAgbiAKMDAwMDAwMTIwNCAwMDAwMCBuIAp0cmFpbGVyCjw8L0luZm8gOSAwIFIvSUQgWzwzZWMyMWUyNjkwNjcxYzViYTliNjUxODNhY2IxOTM3ND48NzZhNzM1MWE1YmY4ZmMxNDNmY2NlZmUwYjRjMzA4MWI+XS9Sb290IDggMCBSL1NpemUgMTA+PgpzdGFydHhyZWYKMTM1OAolJUVPRgo=",
          "invoice_items": [
          {
            "item":"item name",
            "description":"description",
            "quantity": 10,
            "date_of_purchase":"2020-09-20",
            "price_per_item": 33000
          }
        ],
          "attachment": "string base 64 pdf"
    }'
```

> Below is the sample of response parameters that will be returned:

```json
{
  "success": true,
  "url": "https://pay.oyindonesia.com/invoice/id",
  "message": "success",
  "email_status": "PROCESSED",
  "payment_link_id": "id"
}
```

>

Send us instructions to generate a [recurring payment link invoice link](https://api-docs.oyindonesia.com/#api-create-recurring-invoice-coming-soon).

> Below is an example of a request body to execute your request: coming soon

An endpoint to retrieve and/or re-send the latest [callback status](https://api-docs.oyindonesia.com/#api-payment-status) of a transaction is also available and can be accessed at anytime.

> Below is an example of a request body to execute your request:

```shell
curl -X GET 'https://partner.oyindonesia.com/api/payment-checkout/status?partner_tx_id=OY123456&send_callback=false' -H 'x-oy-username:yourusername' -H ' x-api-key:yourapikey'
```

> Below is the sample response parameters that will be returned:

```json
{
  "partner_tx_id": "partner000001",
  "tx_ref_number": "1234567",
  "amount": 15000,
  "sender_name": "Joko Widodo",
  "sender_phone": "+6281111111",
  "sender_note": "Mohon dikirim segera",
  "status": "success",
  "settlement_type": "realtime",
  "sender_bank": "008",
  "payment_method": "DC",
  "va_number": ""
}
```

>

An endpoint to check your [payment or invoice data](https://api-docs.oyindonesia.com/#api-get) is also available and can be accessed at anytime.

> Below is an example of a request body to execute your request:

```shell
curl -X GET \
  https://partner.oyindonesia.com/api/payment-checkout/{payment_link_id_or_partner_tx_id}\
  -H 'cache-control: no-cache' -H 'content-type: application/json' \
  -H 'X-Api-key: apikeymu' -H 'X-Oy-Username: yourusername'
```

> Below is the sample response parameters that will be returned:

```json
{
  "data": {
    "partnerTxId": "abc10",
    "paymentLinkId": "703e05c0-48e3-47bd-9c22-670941d4d5fe",
    "amount": 15000,
    "username": "justkhals",
    "senderName": "John Doe",
    "senderPhoneNumber": null,
    "senderNotes": null,
    "status": "CREATED",
    "txRefNumber": null,
    "description": "testdesc",
    "isOpen": true,
    "step": "input-amount",
    "notes": "testnote",
    "phoneNumber": "085248395555",
    "email": "maskalgrr@gmail.com",
    "includeAdminFee": false,
    "listDisabledPaymentMethods": "",
    "listEnabledBanks": "008",
    "expirationTime": "2020-08-12 00:00:00",
    "invoiceData": {
      "fullName": "John Dooe",
      "isVaLifetime": false,
      "isScheduled": false,
      "recurringStartDate": null,
      "recurringEndDate": null,
      "recurringFrequency": null,
      "invoiceItems": "[{\"item\": \"AK 47\", \"quantity\": 2000, \"description\": \"Untuk Kemanan Negara\", \"price_per_item\": 2250000, \"date_of_purchase\": 1590969600000}]"
    }
  },
  "message": "return payment checkout data",
  "status": true
}
```

>

Lastly, we provide an endpoint to [delete your payment or invoice link](https://api-docs.oyindonesia.com/#api-delete) based on `payment_link_id` or `partner_tx_id`. The payment or invoice link must still be active and a payment method must not have been selected.

> Below is an example of a request body to execute your request:

```shell
curl -X DELETE \
  https://partner.oyindonesia.com/api/payment-checkout/{payment_link_id_or_partner_tx_id}\
  -H 'cache-control: no-cache' -H 'content-type: application/json' \
  -H 'X-Api-key: apikeymu' -H 'X-Oy-Username: yourusername'
```

> Below is the sample of response parameters that will be returned:

```json
{
  "status": true,
  "message": "success delete payment checkout data"
}
```

>

Just like the Payment Link via Link, you can access all your payment links and its details from the OY! dashboard. This report will include all payment links generated both via Link and API.

![Payment Link](images/payment_checkout_list.png)

### Pop!: Seamless Payment Experience

With Pop!, displaying our payment link page on your front-end web environment is now made easier than ever. Our payment link offers a seamless user experience in a way that can be catered to your UI needs.

Click the button below to see a demonstration and a snippet code on how to display a payment link page in 4 styles/locations: Center, Right, Left, and Slide Right.

<a class="lottie" id="learn-more" href="https://api-docs.oyindonesia.com/#pop-seamless-payment-experience-fund-acceptance"></a>

### Customizing the UI of Payment Link

In order to maintain a consistent brand experience for your users, you can customize the look and feel of your payment link in the Dashboard, where you can do the following things;

- Upload a logo
- Choose the button and the theme color of the payment link

How to customize the UI:

- Log onto business.oyindonesia.com
- Go to Payment Link section in the dashboard
- Click the 'Settings" icon

![Payment Link](images/ui_customization_settings_icon.png)

- You will be redirected to the Settings page

![Payment Link](images/ui_customization_settings_page.png)

- Input the URL for your logo (If you’re using [snipboard.io](https://snipboard.io/), the correct URL should be in “https://i.snipboard.io/image.jpg” format. If you’re using [imgbb.com](https://imgbb.com/), the correct URL should be in “https://i.ibb.co/abcdef/image.jpg” format)

- Select your primary color (you can select from our available color picker tools or you can input the 6 digit #HEX code). This primary color will be the main theme color in your payment link and the color of the text in the header

- Select your secondary color (you can select from our available color picker tools or you can input the 6 digit #HEX code). This secondary color will be the color of CTA button in your payment link and the color of the text outside the header

![Payment Link](images/ui_customization_color_logo.png)

- Click "Save Changes"

Note:

- By saving the change, the colours will be applied to the payment links previously created (before saving) as well as the payment links created after saving.
- Please create new payment link after you successfully save changes to check the difference

Illustration;

If we pick green (#HEX code #067610) as the primary color and black (#HEX code #000000) as the secondary color, the look and feel will be as follows;

![Payment Link](images/3p1p_preview.png)


### VA Bank Details

| Bank (Virtual Account) | SKN Supported | RTGS Supported | Payment from ATM | Payment from m-banking / i-banking (intra bank) | Payment from business account (m-banking/i-banking) | Payment from m-banking/i-banking (inter bank) |
| ---------------------- | ------------- | -------------- | ---------------- | ----------------------------------------------- | --------------------------------------------------- | --------------------------------------------- |
| Bank Mandiri           | Yes           | Yes            | Yes              | Yes                                             | Yes                                                 | Yes                                           |
| BRI                    | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| BNI                    | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| BCA                    | No            | No             | Yes              | Yes                                             | No                                                  | Yes                                           |
| Bank Permata           | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |
| CIMB Niaga             | Yes           | Yes            | Yes              | Yes                                             | No                                                  | Yes                                           |

| Bank (Virtual Account) | Payment from Teller (Inter and Intra Banks)    | SWIFT Payment | Intra bank transfer fees |
| ---------------------- | ---------------------------------------------- | ------------- | ------------------------ |
| Bank Mandiri           | Yes                                            | No            | Rp 0                     |
| BRI                    | Yes                                            | No            | Rp 1000                  |
| BNI                    | Yes                                            | No            | Rp 0                     |
| BCA                    | Yes (Teller BCA); No (Teller from other banks) | No            | Rp 0                     |
| Bank Permata           | Yes                                            | No            | Rp 5000                  |
| CIMB Niaga             | Yes                                            | Yes           | Rp 0                     |

## API E-Wallet Aggregator

E-Wallet API allows partners to charge and receive payments directly from top e-wallet issuers. With one integration, they are able to get access to all of OY’s available e-wallets and the upcoming e-wallet integrations.

### E-Wallet Product Flow

![E-Wallet API](images/ewallet_product_flow.png)

### Key Features

1.  **Support multiple e-wallets** - Currently, we support ShopeePay and LinkAja e-wallets. OVO and DANA are coming soon
2.  **Transaction tracking and monitoring capability** - You can track all created e-wallet transactions, incoming payments, and their respective details through our API callback or OY! dashboard. You will receive a callback for all incoming transactions.
3.  **Check Status capability** - We have a Check Status endpoint available for you to regularly check the status of an e-wallet transaction

### Registration and Setup

Follow the below check-list to ensure you're all set up to use our E-Wallet API service:

1.  Create an account
2.  Upgrade your account by submitting the required documentations
3.  Have your upgrade request approved
4.  Set up your receiving bank account information (note: ensure that the receiving bank account information is accurate as it cannot be changed via OY! dashboard for security reasons)
5.  Submit your IPs and callback URLs to your business representative or to partner@oyindonesia.com
6.  Receive an API Key from us (note: it is required for API authorization purpose)
7.  Integrate with our E-Wallet API

### Testing

Once you successfully create an OY! account, you can immediately simulate E-Wallet payments via API.

Follow the below steps to test the E-Wallet flow:

1.  Create an account
2.  Send a request to activate API E-Wallet product and obtain staging API Key to your business representative
3.  Create a transaction by sending a ‘POST’ request to https://api-stg.oyindonesia.com/api/e-wallet-aggregator/create-transaction using your staging API key. Enter the required and optional fields, as referenced in the API reference docs (https://api-docs.oyindonesia.com/#create-e-wallet-transaction-api-e-wallet-aggregator-coming-soon)
4.  After an E-Wallet transaction is generated, partner can simulate an E-Wallet payment through their dashboard (in Staging environment) by going to the "E-Wallet" sidebar, look for the newly created transaction row on the table (should be at the top), then click on the "Pay" button on the very right of that row. ![E-Wallet Table](images/ewallet_testing_2.png)
5.  Fill in the e-wallet name, the ref number and amount should be prefilled from the transaction in the previous step, then click on "Send Callback" ![E-Wallet API](images/ewallet_testing.png)
6.  If a payment is successful, we will send a callback to the registered staging callback URL destination
7.  The payment made to the e-wallet transaction can be monitored through OY! dashboard, in the "E-Wallet" sidebar

### How to Use

We provide 2 endpoints for you to use:

- [Create E-Wallet Transaction](https://api-docs.oyindonesia.com/#create-e-wallet-transaction-api-e-wallet-aggregator-coming-soon): Use this API to create an e-wallet transaction for your user
- [Check E-Wallet Transaction Status](https://api-docs.oyindonesia.com/#check-e-wallet-transaction-status-api-e-wallet-aggregator-coming-soon): Use this API to check the status of an e-wallet transaction. We highly recommend that you implement this endpoint.

All details regarding your created e-wallet and its payments can be retrieved via our API endpoint (Check E-Wallet Transaction Status) or can be monitored directly from the OY! dashboard (through the E-Wallet sidebar)

![E-Wallet API](images/ewallet_dashboard.png)

### E-Wallet Details

| E-Wallet Issuer    | E-Wallet Code     | Minimum Expiration Time                        | Maximum Expiration Time                        | Redirection Feature |
| ------------------ | ----------------- | ---------------------------------------------- | ---------------------------------------------- | ------------------- |
| OVO (coming soon)  | ovo_ewallet       | Parameter is ignored, always set to 55 seconds | Parameter is ignored, always set to 55 seconds | Not supported       |
| ShopeePay          | shopeepay_ewallet | 1 minute                                       | 60 minutes                                     | Support             |
| Linkaja            | linkaja_ewallet   | Parameter is ignored, always set to 5 minutes  | Parameter is ignored, always set to 5 minutes  | Support             |
| DANA (coming soon) | dana_ewallet      | 1 minute                                       | 60 minutes                                     | Support             |

## API Payment Routing

Some business have some use cases that require them to receive and disburse the fund. Often times, the operation team is struggling to manage this use case. Limited resource makes it harder to disburse the fund received. Therefore, API Payment Routing is the best solutions to cater this needs.

### Description about Payment Routing

Payment Routing is an API that combines receive money and disburse money features. It allows you to immediately disburse the money once you receive from your customers. By integrating to this API, you will get the end-to-end solutions for your business needs.

For now, you can use API Payment Link or API Virtual Account for the receive money part.

### Flow

![Payment Routing Flow](/images/Payment_Routing_Flow.png)

### Key Features

1. **Accept and disburse money in a real time manner** - By integrating to this API, you will get end-to-end solutions from receive to disburse money. All in real time manner. Note : Some payment methods have H+1 or H+2 settlement period. You have to keep some balance to cater the settlement from the payment methods.
1. **You can select API Payment Link or API VA to receive money** - See Payment Link or Virtual Account for more information. More channels are coming soon. Note : Payment Routing only allows closed amount type.
1. **Transaction tracking and monitoring capability** - You can track all payment routing transactions details through our callback or the OY! dashboard. You will receive callbacks two times, for the receive money part and for the disburse money part.

### Use Cases

Below are few examples of Payment Routing usage.

1. Mutual Fund Investment - Accept investment money from users and directly disburse to each custodian banks.
1. Borrower and Lender - Accept money from Lender/Borrower and disburse them directly to Rekening Penampungan Lender/Rekening Penampungan Borrower.
1. Put money directly to Your Business Account- Receive money from your customers/buyers and directly put them to your business bank account in order to secure the money and prevent fraud.

### Registration and Setup

Follow the below check-list to ensure you're all set up to use our Payment Routing API service:

1. Create an account
1. Upgrade your account by submitting the required documentations
1. Have your upgrade request approved
1. Set up your receiving bank account information (note: ensure that the receiving bank account information is accurate as it cannot be changed via OY! dashboard for security reasons)
1. Submit your IPs and callback URLs to your business representative or to partner@oyindonesia.com
1. Receive an API Key from us (note: it is required for API authorization purpose)
1. Integrate with our Payment Routing API

### Testing

Once you successfully create an OY! account, you can immediately simulate VA payments via API.
Follow the below steps to test the Payment Routing flow:

1. Create an account
1. Send a request to activate API Payment Routing product and obtain staging API Key to your business representative
1. Send a ‘POST’ request _https://partner.oyindonesia.com/api/payment-routing/create-transaction_ (https://partner.oyindonesia.com/api/payment-routing/create-transaction) using your staging API key. Enter the required and optional fields, as referenced in the API reference docs (https://api-docs.oyindonesia.com/#create-payment-routing).
1. If you use VA as the payment method, after VA number is generated, you can simulate the payment through your dashboard (in Staging environment) by going to Settings, and choose "VA Callback".
1. If you use Payment Link as the payment method, you can open the link and simulate payment from there.
1. If payment is successful, we will send a callback to the registered staging callback URL destination.
1. You can monitor Payment Routing transaction through OY! Dashboard or call the endpoint API. Go to “Payment Routing” menu to monitor your transactions.
