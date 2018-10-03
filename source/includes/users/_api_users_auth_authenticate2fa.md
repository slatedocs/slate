## Authenticate2FA

**Category:** Authentication<br />
**Permissions:** Public<br />
**Call Type:** Synchronous

### Request
```json
{
  "Code": "YourCode"
}
```

Completes the second part of a two-factor authentication by sending the authentication token from the non-Cubobit authentication system to the Order Management System. The call returns a verification that the user logging in has been authenticated, and a token.

Here is how the two-factor authentication process works:

1. Call **webauthenticateuser**. The response includes values for *TwoFAType* and *TwoFAToken*. For example, *TwoFAType* may return "Google," and the *TwoFAToken* then returns a Google-appropriate token (which in this case would be a QR code).
2. Enter the *TwoFAToken* into the two-factor authentication program, for example, Google Authenticator. The authentication program returns a different token.
3. Call **authenticate2FA** with the token you received from the two-factor authentication program (shown as *YourCode* in the Request example below).

| Key    | Value                                                        |
| ------ | ------------------------------------------------------------ |
| Code   | **string**. *Code* holds the token obtained from the other authentication source. |


### Response
```json
{
  "Authenticated": true,
  "SessionToken": "YourSessionToken"
}
```


| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| Authenticated | **Boolean**. A successful authentication returns *true*. Unsuccessful returns *false*. |
| SessionToken  | **string**. The *SessionToken* is valid during the current session for connections from the same IP address. If the connection is interrupted during the session, you can sign back in using the *SessionToken* instead of repeating the full two-factor authentication process. A session lasts one hour after the last-detected activity or until logout. |

>To send a session token to re-establish an interrupted session:

```json
{
  "SessionToken": "YourSessionToken"
}
```



