# Bank Integrations Guide
## API access

TransferWise uses standard OAuth 2.0 protocol for authentication and authorization. 

Once we start our partnership  we will send you API access credentials for sandbox environment: api_client_id & api_client_secret.
You need these in order to request user authorizations so you can make payments on behalf of them.
We also need *redirect_url* from your technical team so that we can make the integration more secure. 

[OAuth 2.0: The Complete Guide](https://auth0.com/blog/oauth2-the-complete-guide/) is great guide to refresh your knowledge about the protocol itself.


### TEST and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com


## User experience

You will be building user experience directly into your mobile and desktop applications and will be using TransferWise API only in the background. 
There are different ways to build the frontend experience, especially when it comes to the sequence of steps in the payment flow.

For example you can put sign up/login step as a first step and then show currency calculator and then collect recipient details.
Or you can start from calculator, then collect recipient details and as a last step ask user to login / signup.  

So this guide is more like a list of building blocks rather than a strict step-by-step guide.

We have a dedicated team focusing on bank partnerships who will be helping you to figure it out. 



## Get user authorization

> Your app redirects user to Transferwise authorization webpage
```shell
https://api.sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourbank.com
  ```

> Transferwise authorization page redirects user back to your redirect page.
```shell
https://www.yourbank.com/?code=[CODE]
```

### Your app redirects user to Transferwise authorization webpage

Transferwise authorization page allows customers to login (existing user) or sign-up (new users) for TransferWise. 



https://api.sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourbank.com



  OAuth flow - Sign up new user and obtain their authorization to access their account

   Existing users - oauth flow
   New users - signup via oauth

   Registration code flow (shadow customers) >> 

   2 ways: OAuth Flow: linking existing users !! creating new users !!!




3. OAUTH FLOW Existing users - signup & login (TW users)
  3.1. REDIRECT 
  re-direct from your app to this browser address bar, either manually or by forwarding your user to the address.
  https://api.transferwise.com/oauth/authorize?response_type=code&client_id=sampleid&
  redirect_uri=https://example.com

  Replace sampleid with your client ID and example.com with your designated redirect URI. 
  The redirect URI should be the address you want the user to be retuened to after the authorization flow. 
  If you are using the test environment, please replace the api.transferwise.com with sandbox.transferwise.tech, but only in this step, 
  for calling sandbox endpoints please use api.sandbox.transferwise.tech.

  The starting point for Authorization Code grant type flow.
  This is a web page shown to the customer where they approve the authorization request for you to access their TransferWise account on their behalf. 
  Upon approval the browser will be redirected to the supplied redirect_uri with a generated code query string value. 
  Your website or service can then use this code and exchange it customer specific API access tokens using  endpoint. 
  An access token and a refresh token can be generated using this code and should be stored securely for future access.


  3.2. Customer logs in / signs up
  A new page will open where the user can log in with their TransferWise credentials or sign up if they don't yet have a TransferWise account. 
  Please note that in the test environment, you will have to create a new test account.
  Customer authorizes your application to have access to his/her TW account 
  
  3.3. Get authorization code from redirected URL parameter
  After a login/sign up, an authorization code is generated and appended to the redirected URI, e.g.
  https://www.yourbank.com/?code=[CODE]


## Get user token

  3.4. Get user token so you can act on behalf of users
  
  so you can act on behalf of the user.
  Now you can exchange the authorization code for access and refresh tokens. To do that, you can use this curl request:
  Request
      curl \
      -u '[your client_id]:[your client secret]' \
      -d 'grant_type=authorization_code' \
      -d 'client_id=[your client id]' \
      -d 'code=[CODE]' \
      -d 'redirect_uri=https://example.com' \
      'https://api.transferwise.com/oauth/token' 

  Changes you need to make to that request are:
  
  replace [your client id] with your client_id
  replace [your client secret] with your client_secret
  replace [CODE] with authorization code you have received in Step 3
  replace https://example.com with the URI you specified in Step 1
  
  Response
  {
    "access_token":"ba8k9935-62f2-475a-60d8-6g45377b4062",
    "token_type":"bearer",
    "refresh_token":"a235uu9c-9azu-4o28-a1kn-e15500o151cx",
    "expires_in": 43199,
    "scope":"transfers"
  }

  All set!
  Your token is now ready to use.
   Add your token in the request header for the endpoints that require it. 
   It should be in the format "Authorization": "Bearer <token>".
  It is valid for 12 hours. You should store refresh token. 


## Refresh user token 


 3.5. Swapping a token because it is 12 hours only !!
  In order to maintain an uninterrupted connection, you can request a new access token whenever it is close to expiring. 
  You can do this by providing the refresh token:

    Obtains new access token based on refresh token.
    
  
  request 
      curl \
      'https://api.transferwise.com/oauth/token' \
      -u 'client_id:client_secret' \
      -d 'grant_type=refresh_token' \
      -d 'refresh_token=[your refresh token]'
  
  
  ...and get the access token in response:
  
    
  response
  {
    "access_token":"be69d566-971e-4e15-9648-85a486195863",
    "token_type":"bearer",
    "refresh_token":"1d0ec7b9-b569-426d-a18d-8dead5b6a3cc",
    "expires_in":43199,
    "scope":"transfers"
  }
  
  Keep in mind that access token will expire in 12 hours after issuing. The lifetime of refresh token is limited to 20 years.
  
  
  
## Create shadow? users --> Move this to reference ???


Add this logic to #users-sign-up-with-registration-code



  Step 1: Get client credentials OAuth token

      Request POST /oauth/token
      HTTP Basic using client ID for username and client secret as a password.
      Body - Form
      grant_type=client_credentials

      response
      {
        "access_token": "01234567-89ab-cdef-0123-456789abcdef",
        "token_type": "bearer",
        "expires_in": 43199,
        "scope": "transfers"
      }
      
  Step 2: Create user
  
      Request POST /v1/user/signup/registration_code
      Bearer ${clientCredentialsToken} header
      {
      "email": "${email}",
      "registrationCode": "${registration code}"
      }

      ${email} — new user's email address
      ${registration code} — random value that is unique to this user, at least 32 characters long
  
      NB: Please apply the same security standards to handling registration code as if it was a password.
      

      Response — Success (201)
      {
        "id": 12345,
        "name": null,
        "email": "new.user@domain.com",
        "active": true,
        "details": null
      }
      
        

      Response — Failure (409): User already exists
      {
        "errors": [
          {
            "code": "NOT_UNIQUE",
            "message": "You’re already a member. Please login",
            "path": "email",
            "arguments": [
              "email",
              "class com.transferwise.fx.api.ApiRegisterCommand",
              "existing.user@domain.com"
            ]
          }
        ]
      }
      
      If user already exists then authorization_code  should be used instead.
      

  Step 3: Get user token
  POST /oauth/token
  
  Authentication
  HTTP Basic using client ID for username and client secret as a password.
  Body — Form
  
   grant_type=registration_code
    client_id=${client id}
    email=${email}
    registration_code=${registration code from step 2}

    Step 3 can be repeated as long as user does reclaim their TransferWise account.
    
    Response — Success (200)
    {
      "access_token": "01234567-89ab-cdef-0123-456789abcdef",
      "token_type": "bearer",
      "refresh_token": "01234567-89ab-cdef-0123-456789abcdef",
      "expires_in": 43199,
      "scope": "transfers"
    }

    Response — Failure (401): User reclaimed the account or invalid registration code used
    {
      "error": "invalid_grant",
      "error_description": "Invalid user credentials."
    }


  If user has reclaimed the account, then authorization_code  should be used instead.
  

## Get user profiles
    



## Create personal user profile

For existing users - > get profiles first !?
The guide assumes you have already created user — see .

Using obtained user token.

Personal user profile should be created before creating a transfer.

If you will make business transfers, then personal profile is required to be filled in first as well, and business profile should be created afterwards.

There are two steps to create a personal profile:
- Create personal user profile - basic info.
- Add address to personal user profile.


Step 1. Create private customer  — basic info

POST /v1/profiles


{
    "type": "personal",
    "details" : {
        "firstName": "John",
        "lastName": "Snow",
        "dateOfBirth": "1980-07-20",
        "phoneNumber": "+380964441122"
    }
}



Response
You should receive back a successful (200) response with a personal profile id along with other profile keys that have been successfully saved.


Step 2. Add address to personal user profile

Once basic profile information has been saved, you also need to add address information to personal user profile.
When saving address, you need to specify which profile you want to save address to. 
In profile key, provide a profile id of a personal profile that was returned in previous step response.

Request
POST /v1/addresses


{
    "profile" : 12345
    "details": {
        "country": "US",
        "state" : "NY",
        "city": "New York",
        "postCode": "10112",
        "firstLine": "Park Ave 4021"
    }
}

There is a guide #docTextSection:MEDFDFDMQrmJjtnHS that explains which data fields and validations are in place for addresses in different countries.

You should get back a successful (200) response with a personal profile address id along with other address keys that have been successfully saved.


## Create identification document

Only for personal profiles.  which you created 



## Create business user profile

Prerequisite is that personal user profile has been created. To onboard businesses, also business user profile has to be created.

Similar two steps apply:

Create business user profile — basic info
Add address to business user profile


Step 3.1. Create business user profile — basic info

Request

POST /v1/profiles

{
    "type": "business",
    "details" : {
        "name": "The Business",
        "registrationNumber" : "12345",
        "descriptionOfBusiness" : "education_and_learning",
        "type" : "limited",
        "webpage": "http://business.com",
        "acn": "australian-specific. only include if australian business",
        "abn": "australian-specific. only include if australian business",
        "arbn": "australian-specific. only include if australian business"
    }
}



Response

You should receive back a successful (200) response with a business profile id along with other profile keys that have been successfully saved.

Step 3.2. Add address to business user profile

Once basic business profile information has been saved, you also need to add address information to business user profile. 
This can be done exactly the same way as we did for personal profile. Please see description under Step 2.2 above.




## Create quote

STEP 1-2-3 , use  3rd level heading ?!



blaah !!!


Difference REGULAR !!!!
	- Create quote   (type REGULAR, should be included in create quote endpoint !!)



## Create recipient account

blaah !!!

Please look at [Create recipient account](#recipient-accounts-create) under Full API Reference.


## Create transfer

blaah !!!

Please look at [Create transfer](#transfers-create) under Full API Reference.



## Get pay-in methods


 
## Fund customer transfer 
 external process, not API
 
 GBP - FPS
 EUR - Sepa 
 
 
## Get transfer delivery time

Please look at [Get transfer delivery time](#borderless-payouts-guide-get-transfer-delivery-time) under Borderless Payouts Guide.


## Track transfer status

Please look at [Track transfer status](#borderless-payouts-guide-track-transfer-status) under Borderless Payouts Guide.




## Going live checklist







