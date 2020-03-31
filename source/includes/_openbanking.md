#Open Banking

> Base Open Banking URL in Sandbox

```shell
https://openbanking.sandbox.transferwise.tech
```

> Base Open Banking URL in Production

```shell
https://openbanking.transferwise.com
```

**The TransferWise Open Banking API is aimed for Financially Regulated Third Party Providers who can prove their regulatory status either by being a member of the [Open Banking Directory](https://www.openbanking.org.uk/providers/directory/) or possessing an [eIDAS Certificate](#open-banking-sandbox-access). Third Parties or individuals who do not meet these requirements are welcome to check out our [Public API](#transferwise-api).** 

The TransferWise Open Banking API is a collection of RESTful APIs that enable Third Party Providers (TPPs) to access account information, initiate payments and confirm availability of funds on behalf of TransferWise customers. The API implementation follows the [Open Banking UK standard](https://standards.openbanking.org.uk/api-specifications/), and TransferWise is a registered member of the [Open Banking Directory](https://www.openbanking.org.uk/providers/directory/).

Through this API you can either query account information, if you're an Account Information Service Provider (**AISP**), initiate payments, if you're a Payment Initiation Service Provider (**PISP**), or confirm the availability of funds, if you're a Card Based Payment Instrument Issuer (**CBPII**). We are currently supporting version [3.1.1](https://standards.openbanking.org.uk/api-specifications/read-write-specs/v3-1-1/) of the Open Banking API.

## Prerequisites

> Well-Known Open Banking URL in Sandbox

```shell
https://sandbox.transferwise.tech/openbanking/.well-known/openid-configuration
```

> Well-Known Open Banking URL in Production

```shell
https://transferwise.com/openbanking/.well-known/openid-configuration
```

There's a couple of things you should be aware of in order to connect to the TransferWise Open Banking API:

* Being a registered TPP under the Open Banking Directory will ease the integration process.
* We are using [mutualTLS](https://tools.ietf.org/html/draft-ietf-oauth-mtls-17) as the means for authentication. Moreover, the `CN` of your client certificate is expected to match the `clientId` under which you are registered. 
* You need to register your client, before you'll be able to call any of the APIs. Check out the [Sandbox Access](#open-banking-sandbox-access) first.

For a detailed description of requirements and supported algorithms please check out the Well-Known Open Banking URL.

## Sandbox Access

We highly recommend that you get started with connecting to our sandbox first, before moving on to production. To get started with the registration process drop us an email to [openbanking@transferwise.com](mailto:openbanking@transferwise.com).

### Open Banking Directory

If you're a registered TPP in the Open Banking Directory you will probably be using a Signing and a Transport certificates issued by
Open Banking. At the moment we accept the old style OB Transport and OB Signing certificates.

**You can easily onboard by providing a Software Statement Assertion (SSA) generated in the Open Banking Directory.**

Please make sure to have your list of **Redirect Uri**-s correctly configured in your Software Statement, otherwise you'll not be able to go through the whole flow.

### eIDAS Certificates

In case you're using an eIDAS certificates instead of the ones issued by the Open Banking Directory just contact us at [openbanking@transferwise.com](mailto:openbanking@transferwise.com) to 
see how we can move forward. 

## Sandbox Test User

You can sign up for a test user account here [https://sandbox.transferwise.tech/register](https://sandbox.transferwise.tech/register). The 2FA code used for any subsequent logins to the sandbox will alway be `111111`.

You'll be asked to set up a developer account by filling in your profile information. Once this is done, you'll see that your newly created profile comes with a couple of test accounts opened and some test funds in them.

You do **NOT** need to create an API Token via the web interface in case you're intention is to use this test user for the Open Banking flow.

## Sandbox Test Flow

After you've successfully applied for the [Sandbox Access](#open-banking-sandbox-access) and you've set up a [Sandbox Test User](#open-banking-sandbox-test-user) you are ready to test the Open Banking flow.
For the purpose of this test flow let's assume that your TPP is an AISP and it's registered with the following details

Client ID    | Redirect URI                   | Authorized Scopes
---------    | ---------                      | ----------
ob-dummy-tpp | https://ob-dummy-tpp/redirect  | accounts

## 1. Create an Access Token

> Example Token Request

```shell 
curl -X POST \
  https://openbanking.sandbox.transferwise.tech/open-banking/auth/token \
  --cacert CA.pem --cert client.pem --key client.key \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'grant_type=client_credentials&scope=accounts'
```

> Example Response

```json
{
    "access_token": "abcd1234-abcd-1234-abcd-abcdef123456",
    "token_type": "bearer",
    "expires_in": 6000,
    "scope": "accounts openbanking"
}
```

As a first step you'll need to request an access token from the Token Endpoint.  

### Request

**`POST https://openbanking.sandbox.transferwise.tech/open-banking/auth/token`**

Field          | Description            | Format
---------      | -------                | -----------
grant_type     | OAuth Grant Type       | `client_credentials`
scope          | The requested scopes   | Space separated list 

You must include the requested scope in your token request. As an AISP your requested scope will be `accounts`.

### Response

Field          | Description                                | Format
---------      | -------                                    | ---------
access_token   | The access token                           | Text
expires_in     | Expiration time in seconds                 | Long
scope          | The scopes you have been given access to   | Text   

## 2. Create a Consent

> Example Create Consent Request

```shell 
curl -X POST \
  https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/account-access-consents \
  --cacert CA.pem --cert client.pem --key client.key \
  -H 'Authorization: Bearer abcd1234-abcd-1234-abcd-abcdef123456' \
  -H 'Content-Type: application/json' \
  -d '{
  "Data": {
    "Permissions": [
      "ReadAccountsBasic", "ReadTransactionsBasic", "ReadTransactionsDebits"
    ]}}'
```

> Example Response 

```json
{
    "Data": {
        "Status": "AwaitingAuthorisation",
        "ConsentId": "123"
    }
}
```
### Request

**`POST https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/account-access-consents`**

Using the `access-token` returned from [Creating an Access Token](#open-banking-1-create-an-access-token) you can create a new consent object. Use the authorization header:

`Authorization: Bearer xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx` 

The payload of this request will look different depending on whether you're an AISP, PISP or CBPII. For an AISP you'll need to specify a set of permissions describing the access that you wish to gain on behalf of the end user.

### Permissions

For AISPs the list of supported permissions is:

* ReadAccountsBasic
* ReadAccountsDetail
* ReadBalances
* ReadTransactionsBasic
* ReadTransactionsCredits
* ReadTransactionsDebits
* ReadTransactionsDetail

### Response

The response will be JSON data reflecting the newly created consent object. There are two important return values to highlight here.

* `Data.Status` will contain `AwaitingAuthorisation` because this consent has not been authorized by the user yet.   
* `Data.ConsentId` will contain the unique identifier assigned to your consent object. Save this, as you'll need it later.
  
## 3. User Flow

> Example Authorization Request

```shell
https://sandbox.transferwise.tech/openbanking/authorize?
  response_type=code%20id_token&
  redirect_uri=https://ob-dummy-tpp/redirect&
  scope=openid%20accounts&
  client_id=ob-dummy-tpp&
  state=state123&
  nonce=nonce123&
  request=eyJ0...sYjmjJg
```

> Example Authorization JWT Request

> HEADER

```json
{
   "kid" : "er84c2cYa6dAe57BV3278Pf",
   "alg" : "PS256",
   "typ" : "JWT"
}
```

> PAYLOAD

```json
{
   "scope" : "openid accounts",
   "response_type" : "code id_token",
   "sub" : "user_id",
   "claims" : {
      "id_token" : {
         "openbanking_intent_id" : {
            "essential" : true,
            "value" : "123"
         },
         "acr" : {
            "values" : [
               "urn:openbanking:psd2:sca",
               "urn:openbanking:psd2:ca"
            ],
            "essential" : true
         }
      },
      "userinfo" : {
         "openbanking_intent_id" : {
            "value" : "123",
            "essential" : true
         }
      }
   },
   "iss" : "ob-dummy-tpp",
   "client_id" : "ob-dummy-tpp",
   "aud" : "https://openbanking.sandbox.transferwise.tech",
   "exp" : 2499287201,
   "iat" : 2499283601,
   "max_age" : 86400,
   "redirect_uri" : "https://ob-dummy-tpp/redirect"
}
```

At the moment we are only supporting the browser redirect flow ([Hybrid Flow](https://openbanking.atlassian.net/wiki/spaces/DZ/pages/83919096/Open+Banking+Security+Profile+-+Implementer+s+Draft+v1.1.2#OpenBankingSecurityProfile-Implementer'sDraftv1.1.2-HybridFlowRequestwithIntentId)) for authorizing the created consent.

The customer journey will start from the TPPs website from where a user action will trigger a redirect to the TransferWise Open Banking Authorization Endpoint

**`GET https://sandbox.transferwise.tech/openbanking/authorize`**

Parameter      | Required    | Description
---------      | -------     | -----------
response_type  | Mandatory   | code id_token
redirect_uri   | Mandatory   | One of the pre-registered redirect URIs
scope          | Mandatory   | Must include `openid` plus any requested scope
client_id      | Mandatory   | Pre-registered clientId of the TPP 
request        | Mandatory   | JWT Request Object
state          | Optional    | If present, it must also be present in the JWT
nonce          | Optional    | If present, it must also be present in the JWT

You can take a look at the example JWT request object on the right. Please note that:

* Every request parameter sent in the URL **must** also be present in the signed JWT.
* The `aud` claim should be correctly filled as `https://openbanking.sandbox.transferwise.tech`
* The `openbanking_intent_id` **must** be filled with a valid `ConsentId` issued to the TPP.
* The JWT **must** be signed with a valid signing certificate.

Once the TPP redirects the user browser to the Authorization Endpoint the following things will happen in order:

1. User Login (use the username and password from the [Test User Registration](#open-banking-sandbox-test-user))
2. Pass 2FA challenge (User the code `111111` in sandbox)
3. Select profile you wish to give access to (Business or Personal)
4. Review and Authorize Consent 
5. Redirect back to TPP

As part of the last step, the user browser is redirected to the TPP with the following parameters

Parameter     | Required    | Description
---------     | -------     | -----------
code          | Mandatory   | The `authorization_code` issued as the request of the request
id_token      | Mandatory   | Signed JWT containing details about the authorization
state         | Optional    | In case it was provided with the request

Note that in case the authorization request fails either because of a validation error on the request, or because the enduser drops off, we still redirect the user browser to the TPP with an error response of the following format:

Field             | Description                                | Format
---------         | -------                                    | ---------
error             | Error code according to [RFC6749](https://tools.ietf.org/html/rfc6749#section-4.1.2.1)                           | Text
error_description | Detailed explanation of error                 | Text

## 4. Exchange Authorization Code for Access Token

> Example Token Request

```shell
curl -X POST \
  https://openbanking.sandbox.transferwise.tech/open-banking/auth/token \
  --cacert CA.pem --cert client.pem --key client.key \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'grant_type=authorization_code&redirect_uri=https%3A%2F%2Fob-dummy-tpp%2Fredirect&code=abcdauthcode'
```

> Example Response

```json 
{
    "access_token": "zzzzzzzz-1111-2222-3333-zzzzzzzzzzzz",
    "token_type": "bearer",
    "refresh_token": "refreshr-efre-shre-fres-hrefreshrefr",
    "expires_in": 6000,
    "scope": "accounts consent-id:123 openbanking openid"
}
```

Once you get the authorization `code` after the browser redirect, you'll have to call the Token Endpoint to exchange this for a valid access token.

### Request

**`POST https://openbanking.sandbox.transferwise.tech/open-banking/auth/token`**

Field          | Description                    | Format
---------      | -------                        | -----------
grant_type     | OAuth Grant Type               | `authorization_code`
redirect_uri   | Pre-registered redirect Uri    | URI
code           | Authorization Code             | Text

### Response

Field          | Description                                | Format
---------      | -------                                    | ---------
access_token   | The access token                           | Text
expires_in     | Expiration time in seconds                 | Long
scope          | The scopes you have been given access to   | Text  
refresh_token  | Refresh Token for refreshing access token  | Text

## 5. Query the API

> Example Request

```shell
curl -X GET \
  https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/accounts \
  --cacert CA.pem --cert client.pem --key client.key \
  -H 'Authorization: Bearer zzzzzzzz-1111-2222-3333-zzzzzzzzzzzz' \
```

> Example Response

```json
{
    "Data": {
        "Account": [
            {
                "AccountId": "504",
                "Currency": "GBP",
                "AccountType": "Personal",
                "AccountSubType": "EMoney",
                "Account": [
                    {
                        "SchemeName": "UK.OBIE.SortCodeAccountNumber",
                        "Identification": "230xxx1000xxxx",
                        "Name": "John Smith (GBP)"
                    }
                ],
                "Servicer": {
                    "SchemeName": "UK.OBIE.BICFI",
                    "Identification": "TRWIGB22"
                }
            }
        ]
    }
}
```

With the `access-token` from [Authorization Code Flow](#open-banking-4-exchange-authorization-code-for-access-token) used in the Authorization header, you'll be able to query the data endpoints.

`Authorization: Bearer xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx`

As an AISP you'll be able to call the following endpoints

### Accounts

**`GET https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/accounts`**

**`GET https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/accounts/{id}`**

### Balances

**`GET https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/accounts/{id}/balances`**

### Transactions

**`GET https://openbanking.sandbox.transferwise.tech/open-banking/v3.1/aisp/accounts/{id}/transactions`**

<br /><br /><br /><br /><br /><br />