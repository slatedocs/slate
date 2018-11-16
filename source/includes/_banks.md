# Bank Integrations Guide
## API access

TransferWise uses standard OAuth 2.0 protocol for authentication and authorization. 

Once our partnership begins, we’ll send you API access credentials for the sandbox environment consisting of a Client ID and a Client Secret.
The credentials are needed to complete the authorisation_code grant type of OAuth 2.0 through which the customer will allow your application to be able to act on their behalf.
We also need *redirect_url* from your technical team so that we can limit our callbacks to only that URL, this is URL that we will forward users to after sucessfully granting your application access to their TransferWise account. Specifying this explicityly makes the integration more secure.
[OAuth 2.0: The Complete Guide](https://auth0.com/blog/oauth2-the-complete-guide/) is a great way to refresh your knowledge about the protocol itself.

### TEST and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com

## Customized user interface

You will build your TransferWise user experience directly into your mobile and desktop applications.

There are different ways to build the frontend experience, especially when it comes to the sequence of steps in the payment flow. This guide is more like a list of building blocks and ideas for what you can do, rather than a strict step-by-step guide.

For example, you can put sign up/log in step as a first step, then show the currency calculator, and then collect recipient details.
Alternatively, you can build it so a user starts from the calculator, then you collect recipient details, and as a last step ask user to sign up/log in.

We have plenty of examples to show you how this has been done by our current parterns and can help you to build a great expereince for your customers.

## Building your backend

 You should expose an API interanlly for your web and mobile clients to call to provide the required TransferWise features. Your backend system will manage both communication to the TransferWise API and internal operations such as checking a user has sufficient balance to make the requested transfer and triggering the funds to be sent to TransferWise when they confirm a transfer.

 You should also store a copy of certain data relating to TransferWise to decrease latency and increase resiliency when users review previous transfers they made or recipients they sent funds to. The extent of what you store will depend on your integration.

 You should also build a polling mechansim to periodically update the status of a transfer and its delivery estimate, keeping your user up to date of where their transfer is in the process.
 
 We have a dedicated team focusing on bank partnerships who will help you along the way, sharing knowledge and experience from previous integrations to help you build a robust and highly available system.

## Your TransferWise  user experience
### User onboarding flow
The user onboarding flow consists of these building blocks.  
You need to go through this flow only once for each customer before they can set up their first transfer.

* [Get user authorization for existing accounts ](#bank-integrations-guide-get-user-authorization-for-existing-accounts) or  [sign up a new user via API](#bank-integrations-guide-sign-up-new-users-via-api)
* [Get user tokens](#bank-integrations-guide-get-user-tokens)
* [Create personal user profile](#bank-integrations-guide-create-personal-user-profile)
* [Create business user profile](#bank-integrations-guide-create-business-user-profile) - this is an optional step only to be used if your bank is providing business customers access to TransferWise. Currently business onboarding still involves some manual step, we are working to fuly automate this.

### Transfer flow 
To create transfers on behalf of users you need these building blocks:

* [Refresh user's access token](#bank-integrations-guide-refresh-user-access-token)
* [Create quote](#bank-integrations-guide-create-quote)
* [Create recipient account](#bank-integrations-guide-create-recipient-account)
* [Create transfer](#bank-integrations-guide-create-transfer)
* [Fund transfer](#bank-integrations-guide-fund-transfer)

### Transfer update polling
To keep your users informed of the stateus and edtimated time of arrival of their transfer:

* [Transfer status](#bank-integrations-guide-track-transfer-status)
* [Delivery estimate](#bank-integrations-guide-get-updated-transfer-delivery-time-estimate)

## Get user authorization for existing accounts

At a high level there are three steps to gaining access to an existing TransferWise account.
<ol>
  <li>Your app redirects the user to TransferWise authorization webpage, which prompts them to login if necessary.

  `
  https://api.sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourbank.com
  ```
  </li>
  <li>The user logs in to TransferWise</li>
  <li> The user agrees to provide access, the TransferWise authorization page then redirects user back to your preconfigured url, including a code you can use to geneate user tokens.

  `
  https://www.yourbank.com/?code=[CODE]
  ```
  </li>
</ol>

These steps are explained in more detail below.

###  1. Your banking app redirects user to TransferWise authorization webpage

Your webiste or app opens the folowing url in the user's browser.

`https://sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your-api-client-id>&redirect_uri=<redirect-uri>`

Replace *your-api-client-id* and *redirect-uri* with your specific values. 
The redirect URL should be the address you want the user to return to after the authorization flow, which will have been preconfigured when you requested your API access tokens. This can be different accross the sandbox and production environements and we can update it for you upon reuqest.

 You should not use `WebView` components to show the authorization page to the users because they are not secure and will not allow users to log in to TransferWise with Google, which is an option used by some of our users. Your app should instead open the device's full browser app.

*Please note that the URL for the authorization page in sandbox is different than URL for API calls.  
In the live environment the api.transferwise.com URL works for the authorization page as well as API calls.*

### 2. The user logs in to TransferWise

Our usual log in screens are presented to the user if they are not already logged in on the browser being used. If enabled for a user they will also be prompted to go through our two-factor authentication procedure.

### 3. The user agrees to grant access and we forward them to your *redirect_url*

Once a user gives your banking app authorization to connect to TransferWise and access their data, the user is redirected back to your *redirect_url* with a generated code query string value. For example

`https://www.yourbank.com/?code=[CODE]`

Your website or service can then use this code to obtain the access token to act on behalf of the user account.

If you are building your TransferWise integraion as a native mobile phone app then the redirect URL should be able to handle returning the user to the correct place in the app.

## Sign up new users via API

If the user doesn't already have a TransferWise account then you can create one for them. The [signup with registration code](#users-sign-up-with-registration-code) feature lets you create new users directly via an API call, without the need to redirect new users to the TransferWise authorization page. This way new users can complete everything without ever leaving your banking app, making a very streamlined flow.

We can provide this option to banks where we cann create a trusted reliance model on your KYC processes. Please discuss this option with the team supporting your integration.

Existing TransferWise users will always need to be redirected to authorization page flow, you can detect this at the point you attempt to create the user based ont he API response.

*Note that these new users have to accept TransferWise Terms and Conditions as part of their sign up process nevertheless. See endpoint [Terms and conditions](#terms-and-conditions-get-terms-and-conditions).*

## Get user tokens

If you are using the first option ([get user authorization for existing accounts ](#bank-integrations-guide-get-user-authorization-for-existing-accounts)) then the next step is to generate tokens so you can call API endpoints on behalf of the user who authorized your banking app. You do this using the access code that was returned to you as a query string parameter in the *redirect_uri* you provided us.

> Example Request:

```shell
curl \
-u '[your-api-client-id]:[your-api-client-secret]' \
-d 'grant_type=authorization_code' \
-d 'client_id=[your-api-client-id]' \
-d 'code=[code-from-redirect-uri]' \
-d 'redirect_uri=https://www.yourbank.com' \
'https://api.sandbox.transferwise.tech/oauth/token' 
```

You will be returned an access token and a refresh token.

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
For calling API endpoints you need to provide the user's `access_token` in the request's HTTP header in the format `Authorization: Bearer <access_token>`.
Access tokens are short lived for security reasons, they are only valid for 12 hours by default. When they expire you need to use the `refresh_token` to generate a new access_token.

This means you have to securely store the user's `refresh_token` in order to geneate a new `access_token` each time they use your TransferWise integration, or you poll for updated data,

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

In order to maintain an uninterrupted connection, you can request a new access token whenever it’s close to expiring.
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

## Token Expiry

It is possible that a user's refresh token will become invalid. This could happen for a number of reasons, for example:
* The user revokes access for your application to their account.
* The user enables enhanced security on their TransferWise account.
* TransferWise revoke tokens due to a security breach of your client secret.

Due to this possibility your application should handle a failing refresh token scenario - to do this depends on how you originally gained access to the user.

### 1. An existing user granted your application access to the account
If you were granted access by an existing user then you should send the user through the same flow as you initially did to generate tokens described in [get user authorization for existing accounts](#bank-integrations-guide-get-user-authorization-for-existing-accounts).

### 2. Your application created the user
In the case you created the user using the [sign up new users via API](#bank-integrations-guide-sign-up-new-users-via-api) flow then the mechanism for regenerating tokens is depenedent on whether the user you created has "reclaimed" their TransferWise account and used our website or apps directly.

If the user has not reclaimed their account then the original `registrationCode` you generated should still be able to generate new tokens for the user. Because of this you should store this code when alongside the created user ID in your database.

If the previosuly stored token fails with an error code 400 and error:

```
{
    "error": "invalid_grant",
    "error_description": "Invalid user credentials."
}
```
In this case you can assume the user has reclaimed the account. and pus them through the [get user authorization for existing accounts](#bank-integrations-guide-get-user-authorization-for-existing-accounts) flow.

## Create personal user profile

When you first get access to a user's TransferWise user account you will cannot predict if they already have submitted thier profile data or not.

[User Profiles.List](#user-profiles-list) endpoint will give you data for both personal and business profiles, if it exists. This makes it easy to
figure out if a user has already set up this data with TransferWise or not. If the user already has a personal profile set up, then you can skip this creation step.

If you are using the [sign up new users via API](#bank-integrations-guide-sign-up-new-users-via-api) feature then you absolutely need to create personal profile for the user, however it is possible you will also need to do it when getting access to an existing user account.

There are three steps to creating a new personal user profile:

1) [Create personal user profile – general data](#user-profiles-create-personal). This includes customer name, date of birth, and phone number. 

2) [Create personal user profile – address data](#addresses-create). Once the general profile information has been saved, you also need to add address information to the personal user profile.

3) [Create identification document](#user-profiles-create-identification-document). Adding identification document (Passport, Drivers License etc ) metadata to user profile.  This is an optional step depending on the KYC relationship we have with your bank, please contact the team at TransferWise to discuss further.

## Create business user profile

A personal profile has to be created first. You can’t create a business user profile without a personal profile.

Creating a business profile is similar to how you created personal profile. There are two steps:

1) [Create business user profile – general data](#user-profiles-create-business)

2) [Create business user profile – address data](#addresses-create) 

Currently we do not support a fully automated business onboarding flow over the API - this feature is coming soon, please contact the TransferWise team for more details.

## Create quote
Please look at [Create quote](#quotes-create) under Full API Reference.

You need to set quote type as "REGULAR".

## Create recipient account
Please look at [Create recipient account](#recipient-accounts-create) under Full API Reference.

## Create transfer
Please look at [Create transfer](#transfers-create) under Full API Reference.
 
## Fund transfer 
Once you have successfully created a transfer via the TransferWise API 
you should debit the exact source amount from your customer's bank account 
and send the funds to TransferWise’s local bank account via domestic payment. The details of this bank account will be shared with you by the TransferWise team helping your integration.

In order for us to link this incoming domestic payment with a corresponding transfer order, we need you to use specific text in the "payment reference" field.
Calling endpoint [Get pay-in methods](#quotes-get-pay-in-methods) with quoteId returns you the correct reference text. e.g. `quote-1456477 P5472304`. We currently drive this behaviour using the second part of this string, starting with _P_, you should use a regular expression to extract this string to send as the reference, e.g. `.*(P\d+)`, taking the second group.
 
## Track transfer status
Please look at [Track transfer status](#transferwise-payouts-guide-track-transfer-status) under TransferWise Payouts Guide.
 
## Get updated transfer delivery time estimate
Please look at [Get transfer delivery time](#transferwise-payouts-guide-get-transfer-delivery-time) under TransferWise Payouts Guide.

## Going live checklist
### 1. Make your integration bulletproof
  * Implement basic retry mechanism to handle potential failures or network interruptions 
  * Implement duplicate prevention mechanism to avoid duplicate payments. Verify that UUID is uniquely generated for each individual payment and its value is kept same in case of retrying.
  * Implement basic logging to help out in debugging and problem solving, if needed.
  * Check that you can handle all possible transfer states during polling of transfer info.
  * Required data fields for user profile addresses, recipients, and transfers vary for different currencies. Please explore [Recipient Accounts.Requirements](#recipient-accounts-requirements), [Transfers.Requirements](#transfer-requirements) and [Addresses.Requirements](##addresses-requirements).

### 2. Set up security for LIVE environment
  * Make sure you have received and successfully decrypted Live API credentials, storing them securely.
  * Ensure access tokens and refresh tokens are also stored securely and only exposed to authorized persons.
  * Make sure your server has TLS version 1.2 or higher.
  * Implement a mechanism to obtain new access token upon expiration.
  
### 3. Do some testing in LIVE
  * Launch LIVE integration to a limited set of your customers and test all currency routes you will offer end-to-end. 
  * We reccomend launching a limited set of currencies intially to limit the scope of potential issues, please seek guidance from the TransferWise team.
  * Test successful flow and bounce back flow (where funds cannot be delivered). 
  * All set. Switch it on.
