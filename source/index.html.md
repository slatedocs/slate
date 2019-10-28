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
  - quickstart-settlement
  - quickstart-equities
  - investors
  - payments
  - settlement
  - webhooks
  - bonds
  - isaadmin
  - instruments
  - trade-settlement
  - corporate-actions
  - errors

search: true
---

# Introduction

This document gives you an overview of the Goji Platform API and operational processes. This site contains both detailed API documentation as well as accompanying guides that detail how the API should be used and the operational processes behind them.

##Getting started
To make use of the Goji platform you will want to use one or more of the APIs described below.

###[Investors API](#investors)
The Investors API can:

* Onboard Investors
* Conduct KYC checks (normally automatically)
* Open general/ISA accounts for your Investors
* Retrieve and update Investor data

###[Payments API](#payments)
For Investors who have passed KYC checks, the Payments API can:

* Retrieve Investors bank details
* Retrieve Investors balance information
* Transfer funds between accounts
* Execute withdrawals

###[Bond management API](#bond-management)

<aside class="notice">
Most platforms do not require this module. Please speak to the Goji integrations team before using this API.
</aside>

The Goji Platform supports issuing:

* Fixed term bonds
* Fixed rate bonds (debt based securities)
The Bond management API allows you to configure these products, determine who has invested in each bond and when repayments are due.

###[Settlement API](#settlement)
The Settlement API supports settling investments in securities that are not being managed by the Bond management module. Examples include:

* P2P loans
* Bonds
* etc.

This API can be used where the securitiy itself is being controlled by your platform and the Goji platform is being used to control the movement of client money.

###[Webhooks API](#webhooks)
Many events in the Goji platform publish events which can be consumed as a webhook.

###[ISA administration API](#isa-administration)

<aside class="notice">
The ISA administration API is a standalone API and is not used in conjunction with any of the other APIs detailed above.
</aside>
The ISA administration API allows you to interact with the Goji platform for the purpose of administering an IF ISA.

### Error Handling and Retry Policy

Improving resilience: We recommend Clients use circuit breakers and a retry policy to make connections to the Goji API.

Retries: Including a unique `X-CLIENT-REQUEST-ID` header with each request will ensure `POST` and `PUT` requests are idempotent. If a call is made with a `X-CLIENT-REQUEST-ID` that has been seen in the last 24 hours, no modifications will be made and a `200` response code returned. This will allow a client to retry a request in the event of a timeout or network failure with confidence that the action will only be carried out once.

### Request IDs

All responses include a header `X-GOJI-REQUEST-ID`. When requesting support, please include the request ID to assist with our investigation.

### Test Environment

Goji supports a Sandbox environment which can be used for integration testing.

The URL for the sandbox environment is `https://api-sandbox.goji.investments`.

### Dates

Dates and time are in ISO 8601 format eg `2015-02-18` or `2015-02-18T04:57:56Z`

## Authentication

Authentication to the API is via an HMAC mechanism.

A basic HTTP API key and password is also available for easier prototyping against Goji's sandbox environment.

### HMAC Authentication

HMAC authentication is a mechanism where each HTTP request made by the client of the API is cryptographically signed.

By signing the request with a secret key, known only to the API client and the API itself, the authenticity of the request can be established.

### How to Sign the Request

The request is signed by including three headers:

`x-nonce` A unique string for every request. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`x-timestamp` Milliseconds since epoch. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`Authorization` In the format `<api-key>:<signature-string>` See below for how to build the `signature-string`.

### Building the Signature String

The following details are concatenated together:

    nonce+\ntimestamp

The string is then encrypted using `HMAC-SHA256` using the private key.

The result is then Base64 encoded to produce a string.

The encrypted string is then UTF-8 URL encoded.

#### Examples

> Java and C# examples provided - click on the tabs above


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

With a nonce = `67681625-d7f9-43e3-859a-25e634c203c2`

and timestamp = `1474982268271`

The signature string would be as follows:

    `67681625-d7f9-43e3-859a-25e634c203c2`
    `1474982268271`

Assuming a secret key of `abcd1234`, this will produce a signature equal to:
`q0AdIAm6SphhgN/VxjMiE9UEd3uZRca9gjJXQ5+dyNI=`
which is then URL encoded to `q0AdIAm6SphhgN%2FVxjMiE9UEd3uZRca9gjJXQ5%2BdyNI%3D`

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

The version of the endpoint to use is specified in a header named version e.g. `version : 2`
If no version header is specified, version one of the endpoint will be used.
If an invalid version header is specified, a `404` response code will be returned.

A breaking change to the request or response body is defined as the following:

* Renaming a field
* Changing the type of a field e.g. from string to decimal
* Changing the format of a field e.g. changing a date format representation
* Removing a field
* Restructuring the request/response object

The following changes are not considered breaking changes:

* Adding a new field to a response object
* Adding a new, optional field to a request object
* Adding a new, optional query parameter to a URL

It is therefore important that clients of the API are liberal in the way they parse response objects such that new fields do not cause the process to fail.

##Email integration

Goji can send a emails on behalf of the Platform at various points in the ISA lifecycle. When you completed the onboarding questionnaire, you will have specified which emails you want Goji to send.

In order to complete the email integration you will need to:

1. Specify the email address emails should be sent from e.g. `isa@platform.com`
2. Create a forwarding rule, so that emails sent to the address specified above are forwarded to `platformsupport@gojip2p.com`
3. Specify the email address Goji should send notifications of inound transfer in funds to e.g. `isa-transfer-notifications@platform.com`

In order to permission our email provider (Mandrill) to send emails using your domain you will be required to make the following DNS changes:

###DKIM

`v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;`

`v=DKIM1\; k=rsa\; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB\;`

DKIM is a DNS-based email authentication mechanism that helps Mandrill more effectively send mail on your behalf by allowing receivers to verify that we have permission to send your email.

To enable DKIM, create a `TXT` record for `mandrill._domainkey.yourdomain.com` (replace `yourdomain.com` with the domain you're setting up).

Some DNS providers require that semicolons be escaped. If your provider requires escaping, use this value instead.


###SPF

`v=spf1 include:spf.mandrillapp.com ?all`

SPF is another DNS-based email authentication mechanism. If you don't yet have an SPF record, you'll want to add one for your domain. At a minimum, the value should be the following if you're only sending mail through Mandrill for that domain.

If you already have a `TXT` record with SPF information, you'll need to add Mandrill's servers to that record by adding `include:spf.mandrillapp.com` in the record (before the last operator, which is usually `?all`, `~all`, or `-all`).

###Domain Ownership Verification
Additionally, we need to send a verification email to verify your ownership of the domain. Please let us know which email address to send this to and when you receive the email from Mandrill, please forward it to [techsupport@goji.investments](mailto:techsupport@goji.investments)

