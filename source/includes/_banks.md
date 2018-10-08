# Bank Integrations Guide
## API access


TransferWise uses standard OAuth 2.0 protocol for authentication and authorization.


Once our partnership begins, we’ll send you API access credentials for the sandbox environment consisting of a Client ID and a Client Secret.
The credentials are needed to complete the authorisation_code grant type of OAuth 2.0 through which the customer will allow your application to be able to act on their behalf.
We also need *redirect_url* from your technical team so that we can limit our callbacks to only that URL. This makes the integration more secure.
[OAuth 2.0: The Complete Guide](https://auth0.com/blog/oauth2-the-complete-guide/) is a great way to refresh your knowledge about the protocol itself.




### TEST and LIVE environments


* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com




## Customized user experience


You can build the user experience directly into your mobile and desktop applications. The TransferWise API will only be used in the background.
There are different ways to build the frontend experience, especially when it comes to the sequence of steps in the payment flow.


This guide is more like a list of building blocks rather than a strict step-by-step guide.


For example, you can put sign up/log in step as a first step, then show the currency calculator, and then collect recipient details.
Or you can build it so a user starts from the calculator, then you collect recipient details, and as a last step ask user to log in / sign up.




We have a dedicated team focusing on bank partnerships who will help you along the way.




### User onboarding flow
The user onboarding flow consists of these building blocks.
You need to go through this flow only once for each customer before they can set up their first transfer.


* [Get user authorization](#bank-integrations-guide-get-user-authorization)
* [Sign up new users via API](#bank-integrations-guide-signup-new-users-via-api) – this is an optional alternative to getting user authorization for new users.
* [Get user tokens](#bank-integrations-guide-get-user-tokens)
* [Create personal user profile](#bank-integrations-guide-create-personal-user-profile)
* [Create business user profile](#bank-integrations-guide-create-business-user-profile)




### Transfer flow
To create transfers on behalf of users you need these building blocks:


* [Refresh user access token](#bank-integrations-guide-refresh-user-access-token)
* [Create quote](#bank-integrations-guide-create-quote)
* [Create recipient account](#bank-integrations-guide-create-recipient-account)
* [Create transfer](#bank-integrations-guide-create-transfer)
* [Fund transfer](#bank-integrations-guide-fund-transfer)






## Get user authorization


> Your app redirects user to TransferWise authorization webpage


```shell
https://api.sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourbank.com
```


> TransferWise authorization page redirects user back to your redirect page.


```shell
https://www.yourbank.com/?code=[CODE]
```


### Your banking app redirects user to TransferWise authorization webpage


**`https://sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your-api-client-id>&redirect_uri=https://www.yourbank.com`**


Replace *your-api-client-id* and *redirect_uri* with your specific values.
The redirect URL should be the address you want the user to return to after the authorization flow.


*Please note that the URL for the authorization page in sandbox is different than URL for API calls.
In the live environment the api.transferwise.com URL works for the authorization page as well as API calls.*




### User signs up or logs in and authorizes your banking app to access their TransferWise account


Existing and new customers have different options after they authorize your app to access TransferWise. Existing customers can log right in, and new customers can first sign up.


Initial sign up is is limited to creating a user entity – it does not include going through KYC. There are three ways new customers can sign up:


  <ul>
    <li>Provide email and password (email has to be unique)</li>
    <li>Connect with Facebook</li>
    <li>Connect with Google</li>
  </ul>




Users are then directed to an authorization page where they can authorize your banking app to have access to their TransferWise account.


### TransferWise redirects user back to your banking app


https://www.yourbank.com/?code=[CODE]


Once a user gives your banking app authorization to connect to TransferWise, the user is redirected back to your *redirect_url* with a generated code query string value.
Your website or service can then use this code to obtain access token to act on behalf of the user account.


## Sign up new users via API


We encourage bank integrations to use sign up functionality included in [Get user authorization](#bank-integrations-guide-get-user-authorization) flow.


But there is also an alternative way to sign up new users to the TransferWise platform. The [Signup with registration code](#users-sign-up-with-registration-code) feature lets you create new users directly via backend API call, without the need to redirect new users to the TransferWise authorization page. This way new users can complete everything without ever leaving your banking app.
Existing TransferWise users still need to be redirected to authorization page flow.


Note that these new users have to accept TransferWise Terms and Conditions as part of their sign up process nevertheless. See endpoint [Terms and conditions](#terms-and-conditions-get-terms-and-conditions).




## Get user tokens


> Example Request:


```shell
curl \
-u '[your-api-client-id]:[your-api-client-secret]' \
-d 'grant_type=authorization_code' \
-d 'client_id=[your-api-client-id]' \
-d 'code=[CODE]' \
-d 'redirect_uri=https://www.yourbank.com' \
'https://api.sandbox.transferwise.tech/oauth/token'
```


> Example Response:


```json
  {
    "access_token":"ba8k9935-62f2-475a-60d8-6g45377b4062",
    "token_type":"bearer",
    "refresh_token":"a235uu9c-9azu-4o28-a1kn-e15500o151cx",
    "expires_in": 43199,
    "scope":"transfers"
  }
```


As the next step you need to obtain user tokens so you can call API endpoints on behalf of the user who authorized your banking app.
You need the *code* provided to you during authorization flow to get the user's access_token and refresh_token.
For calling API endpoints you need to provide user access_token in the request header in the format "Authorization: Bearer access_token".
Access tokens are however only valid for 12 hours. When they expire you need to use refresh_token to generate a new access_token.
This means you have to securely store the user's refresh_token.


### Request


**`POST https://api.sandbox.transferwise.tech/v1/oauth/token`**


Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.


Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "authorization_code"                          | Text
client_id             | your api_client_id                            | Text
code                  | Code  provided to you upon redirect back from authorization flow. See step [Get user authorization](#bank-integrations-guide-get-user-authorization).  | Text
redirect_uri          | Redirect page associated with your api client credentials   | Text




### Response


Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling API endpoints on behalf of user. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
refresh_token         | Refresh token which you need to use in order to request new access_token. The lifetime of refresh tokens is 10 years. | uuid
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text




## Refresh user access token


> Example Request:


```shell
      curl \
      'https://api.sandbox.transferwise.tech/oauth/token' \
      -u '[your-api-client-id]:[your-api-client-secret]' \
      -d 'grant_type=refresh_token' \
      -d 'refresh_token=[user's refresh token]'
```


> Example Response:


```json
  {
    "access_token":"be69d566-971e-4e15-9648-85a486195863",
    "token_type":"bearer",
    "refresh_token":"1d0ec7b9-b569-426d-a18d-8dead5b6a3cc",
    "expires_in":43199,
    "scope":"transfers"
  }
```


Access tokens are valid for 12 hours, so upon expiry you need to use refresh_token to generate new access_token.


In order to maintain an uninterrupted connection, you can request a new access token whenever it is close to expiring.
There is no need to wait for the actual expiration to happen first.


### Request


**`POST https://api.sandbox.transferwise.tech/v1/oauth/token`**


Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.


Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "refresh_token"                               | Text
refresh_token         | User's refresh_token obtained in [Get user tokens](#bank-integrations-guide-get-user-tokens) step. | uuid




### Response


Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling API endpoints on behalf of user. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
refresh_token         | Refresh token which you need to use in order to request new access_token once the existing one expires | uuid
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text








## Create personal user profile


If you are using Transferwise authorization flow for new users then you don't know if user just signed up or it is an existing user with full data.


[User Profiles.List](#user-profiles-list) endpoint which gives you data of both personal and business profiles so
you can figure out if user already has profile created or not. If user already has personal profile data then you can skip this step.


If you are using Signup new users via API feature then you absolutely need to create personal profile for the user.




There are three steps to create new personal user profile:


1) [Create personal user profile - general data](#user-profiles-create-personal). This includes customer name, date of birth and phone number.


2) [Create personal user profile - address data](#addresses-create). Once general profile information has been saved, you also need to add address information to personal user profile.


3) [Create identification document](#user-profiles-create-identification-document). Adding identification document (Passport, Drivers License etc ) metadata to user profile.






## Create business user profile


Personal profile has to be created upfront, it is not allowed to create business user profile without personal profile being created first.


Creating business profile is similar to how you created personal profile. There are two steps:


1) [Create business user profile - general data](#user-profiles-create-business)


2) [Create business user profile - address data](#addresses-create)






## Create quote
Please look at [Create quote](#quotes-create) under Full API Reference.


You need to set quote type as "REGULAR".




## Create recipient account
Please look at [Create recipient account](#recipient-accounts-create) under Full API Reference.




## Create transfer
Please look at [Create transfer](#transfers-create) under Full API Reference.



## Fund transfer
Once you have successfully created transfer order via Transferwise API
you can now debit the exact source amount from your customer's bank account
and send funds to TransferWise local bank account via domestic payment.


In order for us to link this incoming domestic payment with corresponding transfer order, we need you to use specific text in the "payment reference" field.
Calling endpoint [Get pay-in methods](#quotes-get-pay-in-methods) with quoteId returns you the correct reference text.


## Get transfer delivery time
Please look at [Get transfer delivery time](#borderless-payouts-guide-get-transfer-delivery-time) under Borderless Payouts Guide.




## Track transfer status
Please look at [Track transfer status](#borderless-payouts-guide-track-transfer-status) under Borderless Payouts Guide.




## Going live checklist
### 1. Make your integration bulletproof
  * Implement basic retry mechanism to handle potential failures or network interruptions
  * Implement duplicate prevention mechanism to avoid duplicate payments. Verify that UUID is uniquely generated for each individual payment and its value is kept same in case of retrying.
  * Implement basic logging to help out in debugging and problem solving, if needed.
  * Check that you can handle all possible transfer states during polling of transfer info.
  * Required data fields for user profile addresses, recipients and transfers vary for different currencies. Please explore [Recipient Accounts.Requirements](#recipient-accounts-requirements), [Transfers.Requirements](#transfer-requirements) and [Addresses.Requirements](##addresses-requirements).


### 2. Setup security for LIVE environment
  * We have received and successfully decrypted Live API credentials.
  * Ensure access tokens and refresh tokens are stored securely and only exposed to authorized persons.
  * Make sure your server has TLS version 1.2 or higher.
  * Implement a mechanism to obtain new access token upon expiration.

### 3. Do penny testing in LIVE
  * Launch LIVE integration to limit set of your customers and test all currency routes end-to-end.
  * Test successful flow and bounce back flow.
  * All set. Switch it on.
