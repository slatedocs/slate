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
