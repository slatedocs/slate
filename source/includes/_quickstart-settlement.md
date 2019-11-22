## Quickstart Settlement - Debt
This guide gives a brief overview on how to:

* Onboard an Investor
* Deposit funds
* Settle an investment
* Repay using the Settlement API

Please ensure you also read the complete documentation for each API.

* [Investors API](/#investors)
* [Payments API](/#payments-investors)
* [Settlement API](/#settlement-debt)

### Authentication
API calls in production need to be cryptographically signed. You can find more information [here](/#introduction-authentication).

In Sandbox, `Basic Auth` can be used to help you prototype integrations.

### Registering a Webhook

> Create Webhook

```json
{
    "url": "https://webhook.site/44e66f2d-eaac-4225-86aa-7549f628c5d0"
}
```
Webhooks are fired to inform you whenever specific events are fired in the Goji Platform.

You can register a URL to receive webhooks by calling [POST https://api-sandbox.goji.investments/platformApi/webhooks](/#post-webhooks) with example `POST` body:

[//]: # (Example is missing)

### Creating an Investor

> Create Investor

```json
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

To create an Investor, the Investor must first agree to the Terms and Conditions, and optionally the ISA declaration if the Investor is opening an ISA.

Goji supports hosting the Terms and Conditions, retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/terms](/#get-terms).

The ISA Declaration can be retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/isaDeclaration](/#get-isadeclaration)

An Investor is created by posting to [https://api-sandbox.goji.investments/platformApi/investors](/#post-investors) with example `POST` body:

The Goji Platform will generate a `clientId` which should be saved as this is used for subsequent calls.

### Checking the KYC details
Once the Investor has been created, a KYC check is done in the background and the status can be checked by calling [GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/kyc](/#get-investors-clientid-kyc)

In the sandbox environment, all Investors are considered verified unless the `lastName` contains `referred`.

### Depositing Test Funds

> Bank Transfer Details

```json
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

Once an Investor is KYC approved, funds can be deposited.

#### An Investor's Bank Details
The Investor's unique bank details for depositing funds can be retrieved by calling: [GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankTransferDetails](/#get-investors-clientid-banktransferdetails)

#### An ISA Investor's Bank Details
For an ISA account, use: [GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankTransferDetails/isa](/#get-investors-clientid-banktransferdetails-isa)

#### Testing
You can simulate depositing funds by calling [POST https://api-sandbox.goji.investments/platformApi/test/payment](/#post-test-payment) with a example `POST` body:

The payment reference must start with `ISA` if the funds are to be deposited to the ISA account.

Once funds are deposited, a webhook will be fired with type `INVESTOR_FUNDS_RECEIVED`.

#### An Investor's Balance
An Investor's balance can be queried by calling:

[GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/accounts/balances](/#get-investors-clientid-accounts-balances)

### Settling an Investment
Once an Investor has a cash balance, the funds can be invested by calling the settlement API. This will move the funds from one or more investors to a predetermined account. This account may be with the Investment Manager, a Solicitor or the borrower directly.

### Register the Investment Product

> Investment Product

```json
{
    "id": "PRODUCT-1",
    "investmentDocument": "https://document.url",
    "isaEligible": "true"
}
```

First register the investment product:

[POST https://api-sandbox.goji.investments/platformApi/settlement/product](/#post-settlement-product)

*This can be reused multiple times.*

### Register a Payment Destination

> Payment Destination

```json
{
    "accountName": "Account name",
    "accountNumber": "123456",
    "reference": "Bank ref",
    "sortCode": "112233"
}
```

Next, register a payment destination. This is where the funds will be sent.

[POST https://api-sandbox.goji.investments/platformApi/settlement/payment-destination](/#post-settlement-payment-destination)

This returns a payment destination ID which must be saved and used for the subsequent call.

To ensure the payment is processed correctly, please the following test account number and sort code:

`accountNumber: 00004588`
`sortCode: 203002`

Then settle the investment.

The following example includes a single investment from a single Investor:

> Settle Investment

```json
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

### Repaying the Investment

> Repaying Investment

```json
{
    "accountNumber": "123456",
    "reference": "some-ref",
    "sortCode": "112233"
}
```

To record a repayment against an investment, firstly generate a unique reference that will be used when sending the funds to the Goji Platform.

[GET https://api-sandbox.goji.investments/platformApi/settlement/repayment/reference](/#get-settlement-repayment-reference)

This will return the account details to use when sending the funds to repay:

Once the funds have been sent to this destination and the funds have cleared, call the Settlement API to distribute the funds.

> Record Repayment

```json
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

This will ensure that `£123.45` has been deposited with reference `some-ref` which was generated by the previous call. If this check passes, the funds will be credited to the Investor and recorded as an interest repayment against `client-investment-1`.  

### Withdrawing Funds
An Investor can withdraw funds by firstly registering bank account details:

#### Register Withdrawal Bank Details

> Register Bank Details

```json
{
    "accountName": "Jane Doe",
    "accountNumber": "12345678",
    "sortCode": "112344"
}
``` 

[POST https://api-sandbox.goji.investments/platformApi/investors/{clientId}/bankDetails](/#post-investors-clientid-bankdetails)

#### Process Withdrawal
Then the funds can be withdrawn:

> Withdraw Funds

```json
{
    "amount": {
        "amount": "101234.56",
        "currency": "GBP"
    },
    "reference": "my withdrawal ref"
}
```

[https://api-sandbox.goji.investments/platformApi/investors/{clientId}/accounts/{accountType}/withdrawal](/#post-investors-clientid-accounts-accounttype-withdrawal)
