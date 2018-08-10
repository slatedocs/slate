---
title: TransferWise API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://sandbox.transferwise.tech/register'>Sign Up for a Developer Key</a>

search: true
---


# Introduction
## Access to Sandbox

### How to get access

[Signup for developer account](https://sandbox.transferwise.tech/register) and you will get API key for sandbox immediately.  
Upon signup we will configure fully verified Transferwise multi-currency borderless account for you with some test money available so you can test creating and funding payments in same manner as in LIVE environment with real money.

TODO - mention that you can access your account, and not build stuff using other accounts...

### Basic Technical Information
* TransferWise API uses HTTP methods and **RESTful** endpoints
* API security framework is **OAuth 2.0.**
* Request and response messages are in **JSON** format


### Design and test your integration
* To setup security please look at TODO - is this relevant any more ? 
* To create transfers please look at TODO - is this relevant here ? 
* Test your integration in our sandbox.
* Check our [TODO - FAQ] section to find answers to common questions.
* Send us an email to [api@transferwise.com](mailto:api@transferwise.com) in case you got stuck with something.

### Going live
* Done with testing? Create yourself API token from live 
* Please review [TODO - go live checklist]()  to ensure smooth launch.
* Time to start saving on bank fees by using the TransferWise payment platform.



## Before you start integration
### Have you tried sending money with TransferWise?
Before starting with API integration, we recommend that you make a transfer using TransferWise website or mobile apps at least once. This will help you understand how the transfer creation flow works. It's easy to sign up and make your first transfer:
1) Register your personal or business profile at TransferWise.com
2) Make a transfer — check [our video guide](https://transferwise.com/help/article/1779442/creating-a-transfer/video-guide-make-a-transfer) for a step-by-step guide.

There is also the [TransferWise support centre](https://transferwise.com/help) to help you find answers for general questions about onboarding, pricing, speed and coverage.

### Is a borderless account a good fit for your business?
* TransferWise borderless account is a multi-currency account that comes with UK, Eurozone, US and Australian  bank details, and gives you the option to hold money in up to 28 currencies. 
* It comes with the benefit of allowing you to convert funds between different currencies using real mid-market exchange rate. 
* Your business can collect receivables from customers directly into a borderless account, and then immediately use the funds to create payments. 
* For depositing funds to TransferWise, all you need to do is to send a local bank transfer to your borderless account details.

### API integration or batch payments file upload?
There are two ways for your business to execute large amount of payouts:

* **Batch payments.** You can upload multiple payments using a single batch file. Log into your TransferWise account and use the upload tool to create up to 1,000 transfers with a single batch file. This use case is perfect if you’re interested in repeated payouts, for example paying out salaries.

* **API integration.** You can integrate TransferWise platform directly into your website or workflow. We have detailed documentation, sandbox environment and dedicated support team ready to get you started.


### Does Transferwise support all currencies?
We‘re continuously growing our coverage and features.
Please visit [supported currencies list](https://transferwise.com/help/article/1570071/basic-information/supported-countries) for latest info.

### Send payments to email recipients. 
TransferWise will email your recipient and collect their bank account details to complete your payment.
This way all you need to know is recipient name and email address to send funds.


## Going live checklist

### What to do before your account is live
* My business profile is created and fully verified. I can access a borderless account for my business on [www.transferwise.com](https://transferwise.com)
* I have signed TransferWise API terms of usage contract.
* I have received and successfully decrypted the Live API credentials.
* I have implemented #docTextSection:vj2LttYwGieNLFj7a properly and obtained my access/refresh tokens for LIVE.
* I have completed first LIVE payment as a smoke test of the integration.

### How to complete API integration
* **Security**
  * Ensure access tokens and refresh tokens are stored securely and only exposed to authorized persons. 
  * Implement a mechanism to obtain new access token upon expiration.
  * Make sure your server has TLS version 1.2 or higher.
* **Retry and duplicate detection**
  * Implement basic retry mechanism to handle potential network interruptions 
  * Implement duplicate prevention mechanism to avoid double payments. UUID is uniquely generated for each individual transfer and value is kept same in case of retrying.
* **Logging**
  * Implement basic logging to help out in debugging and problem solving, if needed.
* **Transfer lifecycle support**
  * Implement creating and funding transfers.
  * Implementation can handle all possible transfer states during polling of transfer information.
* **Pro-active balance check**
  * Automatically verify available balance before submitting requests to fund transfers, to avoid rejections due to insufficient balance.
* **Creating recipients for different currencies**
  * Required data fields for recipients vary for different currencies. Please look at #docTextSection:HnJc3YxGw4mWveZgg.
* **Account statement has all required information**
  * Verify that fetching account statement provides you all information you need to perform reconciliation for your accounting purposes.





# Common Topics
TODO - this is TransferWise API, which has xxx parts .  

## Authentication

## Errors
### HTTP Response Codes
> Validation Error

```json
{
    "errors": [
        {
            "code": "error.route.not.supported",
            "message": "This route is not supported",
            "arguments": [
                "CNY-EUR"
            ]
        }
    ]
}
```

> Authentication Error


```json
{
    "error": "unauthorized",
    "error_description": "Full authentication is required to access this resource"
}
```

> System Error

```json
{
  "timestamp": "2017-02-02T13:07:39.644+0000",
  "status": 500,
  "error": "Internal Server Error",
  "exception": "java.lang.NullPointerException",
  "message": "No message available",
  "path": "/v1/quotes/106031/account-requirements"
}
```


HTTP response codes indicate the success or failure of an API request. 
 ```2xx codes``` indicates success.  ```4xx codes``` indicate client side error, for example invalid data was submitted or some field is missing.
 ```5xx codes``` indicate server side error, meaning problem is in TransferWise side.

**Code** | **Description** 
------------ | ------------- 
**200** | OK. Successful request.
**400** | Bad request. Request message data did not pass validation.  
**401** | Unauthorised. Not authorised to access requested data.  
**403** | Forbidden. Access to requested data is forbidden. 
**404** | Not Found. Requested resource does not exist.
**408** | Timeout. Operation timed out. 
**422** | Unprocessable entity. Request message data did not pass validation.
**500** | TransferWise server error.


## Helpful
### FAQ
<br/><b>Which currency routes are supported?</b>
<br/>The list of currency routes supported by TransferWise is constantly growing. Check [Supported Currencies](https://transferwise.com/help/article/1569835/basic-information/supported-currencies) for up-to-date list.
<br/>
<br/><b>Which currency routes are supported for sending money to email recipients?</b>
<br/>Sending money to email recipients is available for almost all currency routes. Currencies which are excluded are listed [here](https://transferwise.com/help/article/1740912/creating-a-transfer/transfers-to-an-email-address-transferwise-users).
<br/>
<br/><b>Can I send any supported currency to any country? </b>
<br/>TransferWise currently supports sending national currencies to target countries. For example you can send JPY to Japan but we don't yet support sending JPY to United States. 
The exceptions for this are major currencies like USD, EUR and GBP -  see more about our [global USD transfers](https://transferwise.com/help/article/2049199/us-dollar-transfers/transfers-from-usd-swift).
<br/>
<br/><b>Can I change my phone number registered for two factor authentication?</b>
<br/>Yes you can. Changing the phone number does not invalidate your API tokens. 
<br/>
<br/><b>Why are transfer statuses in your website different than in API?</b>
<br/>We are exposing more details about transfer lifecycle via our API, so hopefully this will not be a big issue. We have transformed our API transfer statuses to more human readable texts in our website. For example "Completed" in our website corresponds to "outgoing_payment_sent" in API. See TODO !!! #docTextSection:vj2LttYwGieNLFj7a article about all possible statuses in payment lifecycle.
<br/>
<br/><b>Do you provide SDKs for Java, Ruby, Python, PHP, etc?</b>
<br/>Not at the moment. We hope to have that in the future!
<br/>
<br/><b>Did not find what you are looking for?</b>
<br/>There is  more info at [TransferWise Support Centre](https://transferwise.com/help). 
And you can ping us directly at  [api@transferwise.com](mailto:api@transferwise.com).


### Useful Articles

If you have questions on TransferWise product during API itegration, please check TransferWise [Support Center](https://transferwise.com/help/). Below we gathered most common product questions that arrise during integration.
<br/>[Signing up and making your first transfer](https://transferwise.com/help/article/1779442/basic-information/video-guide-make-a-transfer)
<br/>[How do I use TransferWise for business payments?](https://transferwise.com/help/article/1662889/business/how-do-i-use-transferwise-for-business-payments)
<br/>[Verify your business](https://transferwise.com/help/article/1662919/verification/verify-your-business)
<br/>[Business payment tips](https://transferwise.com/help/article/2348295/business/business-payment-tips)
<br/>[Will my transfer be instant?](https://transferwise.com/help/article/2140394/basic-information/will-my-transfer-be-instant)
<br/>[How safe is TransferWise?](https://transferwise.com/help/article/1570099/security/how-safe-is-transferwise)
<br/>[Currency converter](https://transferwise.com/currency-converter/)
<br/>[TransferWise bank details](https://transferwise.com/help/article/1870699/good-to-know/transferwise-bank-details)
<br/>[SEPA countries and IBANs](https://transferwise.com/help/article/1716080/euro-transfers/sepa-countries-and-ibans)
<br/>[EUR transfers](https://transferwise.com/help/article/1663573/euro-transfers/eur-transfers)
<br/>[GBP transfers](https://transferwise.com/help/article/1663571/british-pound-transfers/gbp-transfers)
<br/>[USD transfers](https://transferwise.com/help/article/1667423/us-dollar-transfers/usd-transfers)

## Sandbox
### TEST and LIVE environments
<br/>API TEST – Sandbox is located at https://api.sandbox.transferwise.tech
<br/>API LIVE – Production environment is located at https://api.transferwise.com
<br/>Please test your integration in API Sandbox environment before going LIVE.

### Testing in Sandbox
<br/><b>Is there a test website (portal)?</b>
<br/>Yes, there is [https://sandbox.transferwise.tech/](https://sandbox.transferwise.tech/) where you can view and manipulate your transfers.
<br/>To do API calls use [https://api.sandbox.transferwise.tech/](https://api.sandbox.transferwise.tech) as a hostname.
<br/>
<br/><b>How do I login to https://sandbox.transferwise.tech ?</b>
<br/>You can create yourself test account by clicking signup form. Two factor authentication code for sandbox environment is 111111.
<br/>
<br/><b>Are there any differences between TEST and LIVE environments?</b>
<br/>API interface is the same for LIVE and TEST environments of course. There are however few limitations in test environment:
<br/>We don't simulate payment processing in test environment which means that  created payments remain in their first state. You can trigger these changes via simulation endpoints.
<br/>We don't send payment status change related email notifications in test environment. 
<br/>
<br/><b>How can I top up my borderless account balance?</b>
<br/>We are usually generous with "test money", so you will have large starting balance after signup. But if you are running low on your initial setup balance then please contact api@transferwise.com and we can top it up for you once again.
<br/>
<br/><b>How can I add new currency to my borderless account?</b>
<br/>Login to our sandbox website and navigate to Balances menu. You can now add another currency and top it up by converting funds from your existing balances in other currencies.
<br/>
<br/><b>Why are there no transactions in my statement?</b>
<br/>As we don't simulate processing of your payments in sandbox then these payments don't appear in your statement. 
<br/>There is one nice exception to this - we do simulate processing currency conversion transactions between different currency balances. So as a workaround you can execute few currency conversion between your currency balances via test website and then check your statement via API. You should see these conversion transactions in your statement then.
<br/>
<br/><b>Why did not my transfer state change after funding?</b>
<br/>We don't process payments in sandbox environment. 
<br/>You can use simulation endpoints to trigger transfers status changes in sandbox. See TODO - link here.
<br/>
<br/><b>Why did I received "balance-account-not-found" when trying to fund my transfer?</b>
<br/>Received error from POST /v1/transfers/{transferId}/payments {"type":"BALANCE","status":"REJECTED","errorCode":"balance.account-not-found"}. 
<br/>Please double check that you you are funding from borderless account which belongs to the correct profile (business / personal). Each transfer belongs to one profile (either business or personal) and so do borderless accounts. You cannot fund business profile transfers from personal borderless account and vice versa. 
<br/>
<br/><b>Why did I get Internal Server Error (500) response when creating  a quote, recipient or transfer?</b>
<br/>Unfortunately we don't have full redundancy  available in our sandbox environment yet. 
There could be short downtimes during deployments of new releases of our platform.  
If you experience a failed response in calling any endpoint in sandbox then please retry in few minutes. Should the issue persist for more than 15 minutes then please [let us know](mailto:api@transferwise.com).


## Contact Us
### Report a Bug / Send Us Feedback
Once you run into an issue in LIVE environment please don't hesitate to escalate this immediately to [api@transferwise.com](mailto:api@transferwise.com). We will do our best to get back to you as soon as possible.
If the matter is top urgent and it happened during a weekend then please contact our awesome customer support via this [support page](https://transferwise.com/contact).

Once you run into an issue in TEST environment then please take a look at the FAQ section below. 
If this does not solve nor explain the issue you are having then please report this to [api@transferwise.com](mailto:api@transferwise.com).




# Simulation

## Simulate Transfer Status Changes

> Example Request:

```shell
curl "http://sandbox.transferwise.tech//v1/simulation/transfers/{transferId}/processing"
  -H "Authorization: <your api token>"
```

> Example Response:

```json
{
  "id": 15574445,
  "user": 294205,
  "targetAccount": 7993919,
  "sourceAccount": null,
  "quote": 113379,
  "status": "processing",
  "reference": "good times",
  "rate": 1.2151,
  "created": "2017-03-14 15:25:51",
  "business": null,
  "transferRequest": null,
  "details": {
    "reference": "good times"
  },
  "hasActiveIssues": false,
  "sourceValue": 1000,
  "sourceCurrency": "EUR",
  "targetValue": 895.32,
  "targetCurrency": "GPB"
}
```

Changes transfer status so you can simulate payment processing in sandbox environment.
All transfer status change simulations are limited to sandbox environment only.

### Request
Changes transfer status from incoming_payment_waiting to processing.<br/>
`GET http://sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/processing`

Changes transfer status from processing to funds_converted.<br/>
`GET http://sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/funds_converted`

Changes transfer status from funds_converted to outgoing_payment_sent.<br/>
`GET http://sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/outgoing_payment_sent`

Changes transfer status from outgoing_payment_sent to bounced_back.<br/>
`GET http://sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/bounced_back`

Changes transfer status from bounced_back to funds_refunded.<br/>
`GET http://sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/funds_refunded`


### Response
Transfer entity with new status. 

Field | Description | Format
--------- | ------- | -----------
id | Unique Transfer ID, assigned by TransferWise | Integer
user | User Id | Integer
targetAccount | Target recipient account ID. Person who is receiving the funds. | Integer
sourceAccount | Refund recipient account ID. Used only for refund purposes. | Integer
quote | Quote ID | Integer
status | Transfer current status. | `incoming_payment_waiting`</br>`incoming_payment_initiated`</br>`waiting_recipient_input_to_proceed`</br>`processing`</br>`funds_converted`</br>`outgoing_payment_sent`</br>`charged_back`</br>`cancelled`</br>`cancelled_refund_processing`</br>`funds_refunded`</br>`bounced_back`
reference | End to end reference text. Deprecated. Use details.reference field. | Text
rate | Exchange rate used for transfer. | Decimal
created | Timestamp when transfer was created. | yyyy-mm-dd hh:mm:ss
business | User porfile id - only in case of businesses. Deprecated. | Integer
transferRequest | Link to 'Request money' transfer ID. Deprecated. | Integer
details.reference | End to end reference text.  | 
hasActiveIssues | Are there any pending issues which stop executing the transfer. | Boolean
sourceValue | Transfer amount in source currency. | Decimal
sourceCurrency | Source currency code of the transfer. | Text
targetValue | Transfer amount in target currency. | Decimal
targetCurrency | Target currency code of the transfer. | Text
customerTransactionId | UUID format unique identifier assinged by customer. Used for idempotency check purposes. | UUID



# Other Stuff 

## Changelog

### Released Changes

**Date** | **Description** 
------------ | ------------- 
16/05/2018 | GET /v1/borderless-accounts/{borderlessAccountId}/statement.json <br/> New borderless account statement endpoint launched. This includes a lot of extra information useful for reconciliation purposes. 
16/04/2018 | Transfer status simulation endpoints in sandbox added. <br/><li>GET /v1/simulation/transfers/{transferId}/processing<li>GET /v1/simulation/transfers/{transferId}/funds_converted<li>GET /v1/simulation/transfers/{transferId}/outgoing_payment_sent<li>GET /v1/simulation/transfers/{transferId}/bounced_back<li>GET /v1/simulation/transfers/{transferId}/funds_refunded
25/10/2017 | POST /v1/accounts has now dateOfBirth field. This field is optional  but sending this will eliminate false positives during compliance checks.
11/10/2017 | GET /v1/transfers/{transferId} has now additional fields: sourceValue, sourceCurrency, targetValue, targetCurrency. 
10/10/2017 | GET /v1/transfers supports additional query parameters: profile, createdDateStart, createdDateEnd and status. 


## Webhooks

Deliverying you notifications about transfer status changes.
We dont have these yet.  Working on it ...


Request feature !!!
Give feedback on the API !

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

<aside class="warning">
Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.
</aside>





