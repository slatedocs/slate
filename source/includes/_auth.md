SortOrder: 1

# Authentication

Authentication to the API is via an HMAC mechanism.

A basic HTTP API key and password will also be made available to make it easy to prototype against the sandbox environment.

## HMAC Authentication

HMAC authentication is a mechanism where each HTTP request made by the client of the API is cryptographically signed.

By signing the request with a secret key known only to the API client and the API itself it means that the authenticity of the request can be established.

## How to sign the request

The request is signed by including three headers:

`x-nonce` A unique string for every request. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`x-timestamp` Milliseconds since epoch. This will also be included in the signature string (see below) and is used to prevent replay attacks.

`Authorization` In the format `<api-key>:<signature-string>` See below for how to build the `signature-string` .

## Building the signature string

The following details are concatenated together:

    nonce + \n
    timestamp

The string is then encrypted using `HMAC-SHA256` using the private key.

The result is then Base64 encoded to produce a string.

The encrypted string is then UTF-8 URL encoded.

### Examples

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

## Security

All communication is over HTTPS. Authentication will be via HMAC Authentication. Basic HTTP Auth can be used for testing in the Sandbox environment.

API keys will be made available once integration starts.

## Error handling and retry policy

It is recommended that clients use circuit breakers and a retry policy to make connections to the Goji API resilient to failure.

Including a unique `X-CLIENT-REQUEST-ID` header with each request will ensure `POST` and `PUT` requests are idempotent. If a call is made with a `X-CLIENT-REQUEST-ID` that has been seen in the last 24 hours, no modifications will be made and a `200` response code returned. This will allow a client to retry a request in the event of a timeout or network failure with confidence that the action will only be carried out once.

## Request IDs

All responses will include a header `X-GOJI-REQUEST-ID`. Please include this in all correspondence to assist with our investigation.

## Test Environment

Goji supports a Sandbox environment which can be used for integration testing.

## Dates

Dates and time are in ISO 8601 format eg 2015-02-18 or 2015-02-18T04:57:56Z

