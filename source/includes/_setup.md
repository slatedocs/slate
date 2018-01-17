# Getting Set Up

Before you use the Shiftboard Web Services API, you must register
with Shiftboard and obtain:

* an Access Key ID (a 36 character sequence)

    * For example: 135fc788-762b-46a6-a80f-3491c14ad26f

* a secret Signature Key (a 40-character sequence)

    * For example: bkvqNVSokbDZVHvt+RzqsrVzI0w7fhcU/jo/eUcY

<aside class="notice">
Caution: Your Signature Key is a secret, which only you and Shiftboard
should know.  It is important to keep it confidential to protect
your account.  Store it securely in a safe place.  Never include
it in your requests to Shiftboard, and never e-mail it to anyone.
Do not share it outside your organization, even if an inquiry appears
to come from Shiftboard.  No one who legitimately represents
Shiftboard will ever ask you for your secret Signature Key.
</aside>

The Access Key ID is associated with an API Account which will be
added to your organization's Shiftboard.  You include the Access
Key ID in all requests to the Shiftboard Web Services API to identify
yourself as the sender of the request, and the associated API Account
is used to authorize the requested action.

The Access Key ID is not a secret.  To provide proof that you truly
are the sender of the request, you also include a digital signature
calculated using your secret Signature Key.
