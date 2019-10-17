---
title: Goji API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - http
  - java
  - csharp
  - javascript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>
  - <span>&copy; 2019 Goji Administration Services Ltd.</span>

includes:
  - investors
  - payments
  - settlement
  - webhooks
  - bonds
  - isaadmin
  - errors

search: true
---

# Introduction

This document gives you an overview of the Goji Platform API and operational processes. This site contains both detailed API documentation as well as accompanying guides that detail how the API should be used and the operational processes behind them.

##Getting started
To make use of the Goji platform you will want to use one or more of the APIs described below.

###[Investors API](#investors)
The Investors API allows you to onboard, conduct KYC checks, open general/ISA accounts for your investors. You can also retrieve and update investor data.

###[Payments API](#payments)
The Payments API allows you to retrieve bank details and balance information for investors who have passed KYC. You can also transfer funds between accounts and execute withdrawals.

###[Bond management API](#bond-management)

<aside class="notice">
Most platforms do not require this module. Please speak to the Goji integrations team before using this API.
</aside>

The Goji Platform can be used to issue fixed term, fixed rate bonds (debt based securities). The Bond management API allows you to configure these products and determine who has invested in each bond and when repayments are due.

###[Settlement API](#settlement)
The Settlement API allows you to settle investments in securities that are not being managed by the Bond management module. These might be P2P loans, bonds etc. This API can be used where the securitiy itself is being controlled by your platform and the Goji platform is being used to control the movement of client money.

###[Webhooks API](#webhooks)
Many events in the Goji platform publish events which can be consumed as a webhook.

###[ISA administration API](#isa-administration)

<aside class="notice">
The ISA administration API is a standalone API and is not used in conjunction with any of the other APIs detailed above.
</aside>
The ISA administration API allows you to interact with the Goji platform for the purpose of administering an IF ISA.

### Error handling and retry policy

It is recommended that clients use circuit breakers and a retry policy to make connections to the Goji API resilient to failure.

Including a unique `X-CLIENT-REQUEST-ID` header with each request will ensure `POST` and `PUT` requests are idempotent. If a call is made with a `X-CLIENT-REQUEST-ID` that has been seen in the last 24 hours, no modifications will be made and a `200` response code returned. This will allow a client to retry a request in the event of a timeout or network failure with confidence that the action will only be carried out once.

### Request IDs

All responses will include a header `X-GOJI-REQUEST-ID`. Please include this in all correspondence to assist with our investigation.

### Test Environment

Goji supports a Sandbox environment which can be used for integration testing.

The url for the sandbox environment is `https://api-sandbox.goji.investment`.

### Dates

Dates and time are in ISO 8601 format eg 2015-02-18 or 2015-02-18T04:57:56Z

## Authentication

Authentication to the API is via an HMAC mechanism.

A basic HTTP API key and password will also be made available to make it easy to prototype against the sandbox environment.

### HMAC Authentication

HMAC authentication is a mechanism where each HTTP request made by the client of the API is cryptographically signed.

By signing the request with a secret key known only to the API client and the API itself it means that the authenticity of the request can be established.

### How to sign the request

The request is signed by including three headers:

`x-nonce` A unique string for every request. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`x-timestamp` Milliseconds since epoch. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`Authorization` In the format `<api-key>:<signature-string>` See below for how to build the `signature-string` .

### Building the signature string

The following details are concatenated together:

    nonce + \n
    timestamp

The string is then encrypted using `HMAC-SHA256` using the private key.

The result is then Base64 encoded to produce a string.

The encrypted string is then UTF-8 URL encoded.

#### Examples

```java
  public String hashSignature(String signatureToHash, String apiSecret) {
    try {
        Mac sha256HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secretKey = new SecretKeySpec(apiSecret.getBytes("UTF-8"), "HmacSHA256");
        sha256HMAC.init(secretKey);
        return Base64.encodeBase64String(sha256HMAC.doFinal(signatureToHash.getBytes()));
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
  }
```

```csharp
using System;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public class HmacExample
{
    public static void Main()
    {
        using (HMACSHA256 hmac = new HMACSHA256(Encoding.UTF8.GetBytes("abcd1234")))
        {
            string signature = "67681625-d7f9-43e3-859a-25e634c203c2\n1474982268271";
            byte[] hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(signature));
            string result = System.Convert.ToBase64String(hash);
            string urlEncoded = HttpUtility.UrlEncode(result);

            Console.Out.WriteLine(result);
            Console.Out.WriteLine(urlEncoded);
        }
    }
}
```

`GET https://api.gojip2p.com/user/session/valid`

With a nonce = 67681625-d7f9-43e3-859a-25e634c203c2

and timestamp = 1474982268271

The signature string would be as follows:

    67681625-d7f9-43e3-859a-25e634c203c2
    1474982268271

Assuming a secret key of `abcd1234`, this will produce a signature equal to: `q0AdIAm6SphhgN/VxjMiE9UEd3uZRca9gjJXQ5+dyNI=` which is then URL encoded to `q0AdIAm6SphhgN%2FVxjMiE9UEd3uZRca9gjJXQ5%2BdyNI%3D`

##Versioning
```java
>If Jackson is being used, the following class level annotation can be added:
@JsonIgnoreProperties(ignoreUnknown = true)
```
Whenever a breaking change needs to be made to any of the following, a new version of the URL will be made available:

* URL format
* Mandatory query parameters
* Breaking change in structure of request body
* Breaking change in structure of response body

The version of the endpoint to use is specified in a header named version e.g. version : 2
If no version header is specified, version one of the endpoint will be used.
If an invalid version header is specified, a 404 response code will be returned.

A breaking change to the request or response body is defined as the following:

* renaming a field
* changing the type of a field e.g. from string to decimal
* changing the format of a field e.g. changing a date format representation
* removing a field
* restructuring the request/response object

The following changes are not considered breaking changes:

* Adding a new field to a response object
* Adding a new, optional field to a request object
* Adding a new, optional query parameter to a url

It is therefore important that clients of the API are liberal in the way they parse response objects such that new fields do not cause the process to fail.

##Email integration

Goji can send a emails on behalf of the Platform at various points in the ISA lifecycle. When you completed the onboarding questionnaire, you will have specified which emails you want Goji to send.

In order to complete the email integration you will need to:

    Specify the email address emails should be sent from eg isa@platform.com
    Create a forwarding rule so that emails sent to the address specified above are forwarded to platformsupport@gojip2p.com
    Specify the email address Goji should send notifications of inound transfer in funds to eg isa-transfer-notifications@platform.com

In order to permission our email provider (Mandrill) to send emails using your domain you will be required to make the following DNS changes:

###DKIM

`v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;

`v=DKIM1\; k=rsa\; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB\;`

DKIM is a DNS-based email authentication mechanism that helps Mandrill more effectively send mail on your behalf by allowing receivers to verify that we have permission to send your email. To enable DKIM, create a TXT record for mandrill._domainkey.yourdomain.com (just replace yourdomain.com with the domain you're setting up) with the following value.

Some DNS providers require that semicolons be escaped. If your provider requires escaping, use this value instead.


###SPF

`v=spf1 include:spf.mandrillapp.com ?all`

SPF is another DNS-based email authentication mechanism. If you don't yet have an SPF record, you'll want to add one for your domain. At a minimum, the value should be the following if you're only sending mail through Mandrill for that domain.

If you already have a TXT record with SPF information, you'll need to add Mandrill's servers to that record by adding include:spf.mandrillapp.com in the record (before the last operator, which is usually ?all, ~all, or -all).

###Domain ownership verification
Additionally, we need to send a verification email to verify your ownership of the domain. Please let us know which email address to send this to and when you receive the email from Mandrill, please forward it to [techsupport@goji.investments](mailto:techsupport@goji.investments)

# Quickstart (Settlement)
This guide gives a brief overview to how to onboard an investor, deposit funds, settle an investment and repay using the settlement API.

Please ensure you also read the complete documentation for each API.

* [Investors](/#investors) API
* [Payments](/#payments) API
* [Settlement](/#settlement) API

## Authentication
API calls in production need to be cryptograpjically signed. You can find more information [here](/#authentication). In Sandbox, `Basic Auth` can be used to help you prototype integrations.

## Registering a webhook

> Create webhook

```
{
    "url": "https://webhook.site/44e66f2d-eaac-4225-86aa-7549f628c5d0"
}
```
Webhooks are fired to inform you whenever specific events are fired in the Goji Platform.

You can register a URL to receive webhooks by calling [POST https://api-sandbox.goji.investments/platformApi/webhooks](/#post-webhooks) with example `POST` body:

## Creating an investor
To create an investor, the investor must first agree to the terms and conditions and optionally the ISA declaration if the investor is opening an ISA.

The terms and conditions can be hosted by Goji, in which case they can be retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/terms](/#get-terms).

The ISA Declaration can be retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/isaDeclaration](/#get-isadeclaration)

> Create investor

```
{
    "title": "MS",
    "firstName": "Jane",
    "lastName": "Doe",
    "accountTypes": [
        "GOJI_INVESTMENT", "ISA"
    ],
    "address": {
        "country": "GBR",
        "lineOne": "1 The High Street",
        "lineTwo": "",
        "lineThree": "",
        "postcode": "AA1 1AA",
        "region": "County",
        "townCity": "Town"
    },
    "contactDetails": {
        "emailAddress": "me@email.com",
        "telephoneNumber": "01234567890"
    },
    "dateOfBirth": "1970-01-01",
    "entityType": "INDIVIDUAL",
    "investorDeclarationType": "RESTRICTED",
    "nationalInsuranceNumber": "JT123456D"
}
```

An investor is created by posting to [https://api-sandbox.goji.investments/platformApi/investors](/#post-investors) with example `POST` body:

The Goji Platform will generate a `clientId` which should be saved as this is used for subsequent calls.

## Checking the KYC details
Once the investor has been created, a KYC check is done in the background and the status can be checked by calling [GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/kyc](/#get-investors-clientid-kyc)

In the sandbox environment, all investors are considered verified unless the `lastName` contains `referred`.

## Depositing test funds
Once an investor is KYC approved, funds can be deposited.

The investor's unique bank details for depositing funds can be retrieved by calling

[GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankTransferDetails](/#get-investors-clientid-banktransferdetails)

For an ISA account, use

[GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankTransferDetails/isa](/#get-investors-clientid-banktransferdetails-isa)

> Bank transfer details

```
{
    "amount": {
        "amount": 10000.00,
        "currency": "GBP"
    },
    "clientId": "<client-id>",
    "paymentReference": "ISA<client-id>",
    "paymentType": "DEPOSIT"
}
```

You can simulate depositing funds by calling [POST https://api-sandbox.goji.investments/platformApi/test/payment](/#post-test-payment) with a example `POST` body:

The payment reference must start with `ISA` if the funds are to be deposited to the ISA account.

Once funds are deposited, a webhook will be fired with type `INVESTOR_FUNDS_RECEIVED`.

An investor's balance can be queried by calling:

[GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/accounts/balances](/#get-investors-clientid-accounts-balances)

## Settling an investment
Once an investor has a cash balance, the funds can be invested by calling the settlement API. This will move the funds from one or more investors to a predetermined account. This account may be with the investment manager, a solicitors or the borrower directly.

## Register the investment product
> Investment product

```
{
    "id": "PRODUCT-1",
    "investmentDocument": "https://document.url",
    "isaEligible": "true"
}
```

First register the investment product. This can be reused multiple times:

[POST https://api-sandbox.goji.investments/platformApi/settlement/product](/#post-settlement-product)

## Register a payment destination
> Payment destination

```
{
    "accountName": "Account name",
    "accountNumber": "123456",
    "reference": "Bank ref",
    "sortCode": "112233"
}
```

Then register a payment destination - this is where the funds will be sent to.

[POST https://api-sandbox.goji.investments/platformApi/settlement/payment-destination](/#post-settlement-payment-destination)

This returns a payment destination ID which must be saved and used for the subsequent call.

To ensure the payment is processed correctly, please the following test account number/sort code:

`00004588/203002`

Then settle the investment. The following example includes a single investment from a single investor:

> Settle investment

```
{
    "id": "investment1",
    "investments": [
        {
            "accountType": "ISA",
            "amount": {
                "amount": 10000.00,
                "currency": "GBP"
            },
            "clientId": "<client-id>",
            "id": "client-investment-1"
        }
    ],
    "paymentDestinationId": "<payment-destination-id>",
    "productId": "PRODUCT-1"
}
```

[POST https://api-sandbox.goji.investments/platformApi/settlement/tranche](/#post-settlement-tranche)

The investor's investment can be queried by calling:

[https://api-sandbox.goji.investments/platformApi/settlement/investors/{clientId}/accounts/{accountType}/investments](/#get-settlement-investors-clientid-accounts-accounttype-investments)

## Repaying the investment
To record a repayment against an investment, firstly generate a unique reference that will be used when sending the funds to the Goji Platform.

[GET https://api-sandbox.goji.investments/platformApi/settlement/repayment/reference](/#get-settlement-repayment-reference)

> Repaying investment
```
{
    "accountNumber": "123456",
    "reference": "some-ref",
    "sortCode": "112233"
}
```

This will return the account details to use when sending the funds to repay:

Once the funds have been sent to this destination and the funds have cleared, call the Settlement API to distribute the funds.

> Record repayment
```
{
    "investorRepayments": [
        {
            "amount": {
                "amount": 123.45,
                "currency": "GBP"
            },
            "investmentId": "client-investment-1",
            "tax": {
                "amount": 0.00,
                "currency": "GBP"
            },
            "type": "INTEREST"
        }
    ],
    "reference": "some-ref"
}
```

[POST https://api-sandbox.goji.investments/platformApi/settlement/repayment](/#post-settlement-repayment)

This will ensure that £123.45 has been deposited with reference `some-ref` which was generated by the previous call. If this check passes, the funds will be credited to the investor and recorded as an interest repayment against `client-investment-1`.  

## Withdrawing funds
An investor can withdraw funds by firstly registering bank account details:

## Register withdrawal bank details
> Register bank details

```
{
    "accountName": "Jane Doe",
    "accountNumber": "12345678",
    "sortCode": "112344"
}
``` 

[POST https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankDetails](/#post-investors-clientid-bankdetails)

## Process withdrawal
Then the funds can be withdrawn:

> Withdraw funds

```
{
    "amount": {
        "amount": "101234.56",
        "currency": "GBP"
    },
    "reference": "my withdrawal ref"
}
```

[https://api-sandbox.goji.investments/platformApi/investors/{clientId}/accounts/{accountType}/withdrawal](/#post-investors-clientid-accounts-accounttype-withdrawal)


