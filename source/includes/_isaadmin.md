# ISA administration
## Introduction

*Please note this is a standalone API and is not used in conjunction with any of the other APIs.*

The Goji Innovative Finance ISA Platform (Goji Platform) provides the administration, regulatory and compliance functionality to enable the Goji team to efficiently handle all back-office aspects of the Innovative Finance ISA on behalf of a P2P Platform and provide best-in-class 2nd level customer support.

The Goji Platform provides a number of key features to enable efficient IF ISA administration:

* Regulatory reporting to HMRC
* Workflow management for ISA admin tasks eg transferring an ISA in/out, void & repair, death of investor etc.
* Business rule validation on data input (e.g. check ISA limits, NI number checking)
* Customer support instant messaging, ticketing and originator FAQs
* Management information and insights into types of customers enabling improved customer marketing

This document details how an Originator integrates with the Goji Platform.
The intended audience of this document are the developers and analysts responsible for building the integration between the Originator's systems and the Goji Platform.

The Goji Platform requires data from the Originator at a number of points in the Investor lifecycle to facilitate HMRC reporting, process workflow management and data validation (see API Integration below)

Additionally, the Goji platform provides an admin interface to allow Originators and Goji staff to manage ISA specific workflows eg transfers in/out, repairing/voiding ISAs, death of investor etc.

*Please note* that the Originator must have a full understanding of the responsibilities of an ISA Manager as defined in the HMRC guidance: [https://www.gov.uk/government/collections/isa-managers-guidance](https://www.gov.uk/government/collections/isa-managers-guidance). The ISA Manager is ultimately responsible for compliance with the appropriate regulations. Goji provides technical and administrative functionality to support the efficent managemement of an ISA scheme and does not provide legal advice.

## Opening an ISA

When a customer on the Originator's platform elects to open an ISA, the Investor first needs to be shown an ISA declaration and the
current set of terms and conditions.

### Terms and conditions

Goji expects to host the terms. The Originator would provide the terms and conditions in basic HTML, these can be uploaded by the Originator at any point and are automatically versioned.

    POST /terms

On requesting the terms,
the latest content is returned along with the version.

    GET /terms

On the Investor checking a checkbox to confirm agreement (in the most likely scenario), the Originator would then make a request
to obtain a token
that serves as the record that the Investor has seen and agreed to that version of the terms.

    POST /terms/agreement

The returned token will be required when making the request to create the Investor (and their ISA).

### ISA declaration

The process for recording of the ISA declaration is very similar to that of the terms and conditions, bar the creation of the content;
Goji provide a standard declaration here.

On requesting the ISA declaration,
the latest content is returned along with the version.

    GET /declaration

The token to capture confirmation
can then be requested.

    POST /declaration/agreement

The ISA declaration token can then be included in the request to create the Investor (and their ISA).

### ISA and Investor creation

Once these documents have been agreed to, the Investor can be created
on the Goji Platform by calling:

    POST /investors

Validation will be performed to ensure that the data provided is a) valid and b) includes the data needed to comply with HMRC reporting.

We also validate that the Investor has not already opened an IF ISA on the Goji Platform with another Originator in the current tax year.

It is assumed that the Originator has already performed KYC and AML checks by this point.

## Cooling off period

Once the declaration and terms have been signed and the Investor details have been recorded, the ISA is considered 'provisionally opened'.
It is not fully opened until a deposit is made. Some platforms may wish to apply a cooling-off period for an investor before they can invest. This is configurable on the Goji platform for an Originator. Please inform Goji if you wish to apply a cooling off period.

The current state of the ISA, including when the cooling off period ends, can be checked:

     GET /investors/{investorId}/isa

Summary data for the ISA can be retrieved using:

     GET /investors/{investorId}/isa/summary

## Funding an ISA

The Investor's ISA can be funded by depositing cash, transferring funds from an existing account with the Originator
or by transferring in an ISA held with another ISA manager.

### Validation

When money is added to the ISA account, validation is applied to ensure the annual subscription amount is not exceeded.
The transfer will be rejected in whole if it exceeds the limit.
The remaining maximum deposit amount is returned on the ISA details endpoint:

     GET /investors/{investorId}/isa

### Cash deposit

If an Investor deposits money to their IF ISA account, this needs to be recorded on the Goji Platform:

     POST /investors/{investorId}/cash

setting the `type` to `CUSTOMER_DEPOSIT`. The date provided must be the date the transaction was carried out (eg card payment made), not the date you finally receive the funds.

### Transferring funds from an existing account

If an Investor transfers money from an existing investment account on the Originator's platform to their IF ISA, this similarly needs to be recorded as a cash transaction:

     POST /investors/{investorId}/cash

setting the `type` to `CUSTOMER_DEPOSIT`.

### Transfers in

If an Investor holds an existing cash/stocks and shares ISA with another ISA manager, the Investor can elect to transfer that balance to a different ISA Manager.
Please see the section below which details how the Transfers In/Out process works.

## Investing

Once an Investor has funded their account (and, if configured, the cooling off period has expired), they can invest up to the amount of the cash balance on their IF ISA account.

### Creating an investment

If an Investor can invest their money without going via an auction or queue, the investment should be created directly.

     POST /investors/{investorId}/investment

This will reduce the cash balance available on the ISA.

### Repayments

When the borrower makes a repayment against a loan, this repayment needs to be recorded on the Goji Platform.
A repayment increases the cash balance on an ISA by the interest component of the repayment.
If the repayment is automatically re-invested, please see the [Reinvestments](#reinvestments) section below.

     POST /investors/{investorId}/investment/{investmentId}/repayment

<small>N.B. It is worth ensuring that the accruacy of monetary amounts is consistent to ensure that fractions of a penny
aren't left invested.</small>

### Reinvestments

When a borrower makes a repayment against a loan, this repayment needs to be recorded on the Goji Platform.
A reinvestment differs from a repayment in that a reinvestment automatically invests the repaid capital and interest.
The balance of the ISA is increased by the interest portion of the reinvestment.
The cash balance remains unchanged.

     POST /investors/{investorId}/investment/{investmentId}/reinvestment

Alternatively, this can be achieved with two separate calls to record the repayment and the subsequent investment.

### Sale of investment

When an investor sells an investment this is recorded on the Goji Platform by making a repayment equal to the remaining capital balance on the investment.

    POST /investors/{investorId}/investment/{investmentId}/repayment

Setting the `capitalAmount` to the amount of the sale and the `interestAmount` to zero (assuming there is no interest element to the sale).

If a loan has been sold for more or less than the capital outstanding amount (eg in an auction), then there is a specific endpoint that can be called:

     POST /investors/{investorId}/investment/{investmentId}/sale

### Defaults and write offs

If a loan has defaulted and either all or a portion of the loan should be written off, the write off endpoint can be called. This will reduce the ISA balance by the write off amount.

     POST /investors/{investorId}/investment/{investmentId}/writeOff

If repayments need to be made after the full balance has been written off (eg recoveries), these should be processed as interest repayments.

### Withdrawing funds

An Investor can withdraw funds up to the cash balance available on the ISA.
The amount that can be withdrawn is available from the ISA details:

     GET /investors/{investorId}/isa

When a user withdraws cash, this needs to be recorded on the Goji Platform as a cash transaction:

     POST /investors/{investorId}/cash

setting the `type` to `CUSTOMER_WITHDRAWAL`. The amount sent is still a positive amount. The type will indicate to Goji to decrement the cash balance.

## Editing investor details

If an Investor's details need to be updated eg they change address, this needs to be reflected on the Goji platform:

     PUT /investors/{investorId}

## Transfers In

A 'transfer in' is the process where an Investor moves the cash balance of an existing Cash and/or stocks and shares ISA from another ISA Manager to the Originator's platform.

An Investor-facing web application will guide the Investor through the steps necessary to facilitate this process. A link to this web application can be added to the Originator's platform. Please see the <a href="#transfer-in-integration">section below for details</a> on how to integrate the web application.

Once the process is complete, a workflow will be created and Goji will inform the 3rd party ISA plan manager of the Originator's bank details and the money will be transferred directly.

Once the 3rd party ISA manager have sent Goji the details of the ISA being transferred, Goji will email the Originator to inform them to expect a transfer in.

Once the transfer in funds have been received, the Originator would make call to

      POST /investors/{investorId}/transferIn/{transferInId}/cash

specifying the `transferAmount` and either the `repairedAmount` or `subscribedAmount`. These amounts can be determined based on the values Goji will provide upon receiving the transfer history form from the prior ISA manager. These values can be retrieved from the Goji Admin Console. The `transferAmount` is the total amount received from the previous ISA manager. The `repairedAmount` is any amount from this total that had to be transferred to a standard investment account to prevent the current year subscription amount from being exceeded. The `subscribedAmount` is the amount that is credited to the ISA account. If no funds have to be repaired, the `subscribedAmount` would equal the `transferAmount`.

The `repairedAmount` refers to any part of the transferred amount that cannot be applied to the current year ISA as it would breach the subscription allowance. This portion should be credited to the Investor's standard investment account. The amount that was repaired needs to be recorded in the API call to Goji to ensure a complete record of where the money has been applied is created.

Goji will email the Originator once the Transfer History Form has been received from the previous ISA Manager. This form includes the details of how the transferred amount should be split between current and prior year subscriptions. The Originator must not process the deposit of the transferred funds until these details have been received.

The majority of transfers in are received by cheque and will be deposited by Goji into your bank account as a batch per day cheques are received. Details of the transfers in that have been banked on a given day by cheque can be retrieved by calling:

          GET /transferIn/deposits/{date}

Summary details regarding an individual transfer in can be retrieved by calling:

          GET /investors/{investorId}/transferIn/{transferInId}/summary

### Residual Income for Transfers In

On occasion a ceding ISA manager may send additional income from an ISA that has been transferred in the form of a residual income payment. This can occur, for example, if some interest is paid after the funds have been sent to the new ISA manager.

You can elect whether you are happy to receive these additional payments. The ISA manager will send details of incoming residual income to Goji who will inform you of the amount. If you do not wish to receive these payments, they will be returned to the ceding ISA manager and they will sit in the investor's account.

You can record receipt of a residual income payment by calling:

          POST /investors/{investorId}/transferIn/{transferInId}/residualIncome

Multiple residual income payments can be recorded against a single transfer in.

### Integrating the Transfer In pages

The Goji Transfer In application exposes an ISA transfer in form intended for an investor to complete.

It supports ISA transfers of the following types:

- Cash
- Stocks and Shares
- Innovative Finance

### Workflow

1. The investor creates a transfer in request by using the widget that we provide. You should embed this in your site according to the instructions below.

2. Once the form has been completed the investor will download and print the form (or optionally receive it in the mail) and return it to Goji via a PO Box.

3. Goji will liaise with the existing ISA manager to arrange the transfer.

4. Once the funds have been received they will be credited to the investor's ISA balance. An email is sent to the investor.

5. In the case where the received funds would exceed the current year's allowance, then the surplus will be credited to their standard account.

### Embedding the Transfer In Widget

The Goji Transfer In application is a JavaScript component which can be integrated in a number of ways.
For each possible way of integrating with the application, you will need to first obtain a one time security token.

### Obtaining the _uiData_ and the security token

To obtain the application's asset URLs one time security token, make an authenticated request to the following URL:

   `/investors/{clientId}/accounts/ISA/transferIn/UI`

   The response will be structured like so:

   _(Please note that you should never hard-code the URLs returned since they are subject to change)_

               {
                 "apiUrl": "https://api.gojip2p.net",
                 "styleSrc": "https://goji-assets-domain/transfer-in/assets/goji-transfer-in-123456.css",
                 "scriptSrc": "https://goji-assets-domain/transfer-in/assets/goji-transfer-in-123456.js",
                 "investorId": "<investorId>",
                 "token": "<oneTimeToken>"
               }

   With this data you are then able to bootstrap the application using any of the methods outlined below.

  If your front-end application uses Ember, using as an Ember Addon makes sense. Alternatively, the suggested approach would be to
  embed as a standalone JavaScript component on your existing pages - this enables full control over the application's styling.

### Application Arguments

Four arguments are required for the application to function fully, these are described below:

- `apiUrl`: [Specified in the _uiData_ response] The API URL the front-end application should use when interacting with the Goji service
- `investorId`: [Specified in the _uiData_ response] The ID of the active investor
- `token`: [Specified in the _uiData_ response] The security token used to authenticate the active investor's requests
- `accountUrl`: The URL used when an investor chooses to return to their account page having successfully completed a transfer in request

### Using as a Standalone JavaScript Component

To include the application in your existing page as a JavaScript component, you will need to do the following:

1). In the body of your HTML include the following:

           `<div id="goji-application">`
             `<div data-component="goji-transfer-in"`
                  `data-attrs='{ "apiUrl": "<uiData.apiUrl>", "accountUrl": "<platform-manage-account-url>",`
                                `"investorId": "<uiData.investorId>", "token": "<uiData.token>" }'>`
             `</div>`
           `</div>`

2). Extract the JavaScript asset's URL from the request above and include it in your page.

   __Please note that the inclusion of the script import must be made after inclusion of the HTML in the previous step.__

   e.g `<script src="{{uiData.scriptSrc}}"></script>`

   Optionally do the same for the CSS file if you wish to have a basic layout.

   e.g `<link rel="stylesheet" href="{{uiData.styleSrc}}">`

3). The component will then render when the document's body has fully loaded.

## Transfers Out

A 'transfer-out' is the process where an Investor elects to move their IF ISA from the Originator to an alternative ISA Manager.

The new ISA Manager will contact Goji who will perform the checks necessary to validate that the transfer request is genuine.

It is up to the terms and conditions of the agreement between the Originator and the Investor as to whether loan parts can be liquidated to meet the requirements of a transfer out.

If this is allowed and the Investor has elected to liquidate their loans, Goji will inform the Originator what portion of loans need to be sold on the secondary market.

Once there is enough cash in the IF ISA to enable the transfer out to complete, the cash needs to be transferred either directly to the new ISA manager. The bank co-ordinates for the new ISA manager will be available in the Goji admin console.

### Marking the cash as transferred

Once the cash has been transferred, a call needs to be made to:

     POST /transferOut/:transferOutId/cash

The Originator platform will need to expose a mechanism to allow an IF ISA cash balance to be transferred to a designated bank account different to the bank account held by the investor.

### Fees

If the Originator is charging a fee for the Transfer Out, this will have been configured by Goji when the Transfer Out details are entered into the Goji system.

The fee amount can be retrieved by getting all of the Investor's Transfers Out and checking the relevant Transfer Out's `transferDetails.transferOutFee` value:

     GET /investors/{investorId}/transferOut

When the fee has been extracted from the account, the following endpoint should be called. No other endpoints (e.g. withdrawal) should be used:

     POST /transferOut/:transferOutId/fee

### Residual Income for Transfers Out

If an investor has transferred their whole ISA to another ISA manager and they subsequently gain income/interest on their account, you can send this to the new ISA manager.

In this event, Goji will communicate with the new ISA manager and inform them that the Originator will be sending a further payment.

Once the payment is made, a cash transaction should be recorded with type `RESIDUAL_INCOME` and the amount as a negative value.

## Death of Investor

In the event of a death of an Investor, specific tasks need to be carried out. The flow will follow one of the following paths:

1) The investor's cash and/or investments are being transferred to a surviving spouse on the same platform using an Additional Permitted Subscription ('APS').<br/>
2) The investor's cash and/or investments are being transferred to a different ISA Manager for a surviving spouse using an Additional Permitted Subscription ('APS').<br/>
3) The investor's cash and/or investments are being transferred to a beneficiary's ISA on the same platform (not through an APS).<br/>
4) The investor's cash and/or investments are being transferred to a beneficiary's non-ISA account on the same platform (not through an APS).<br/>
5) The investor's cash and/or investments are being transferred to a beneficiary  off-platform (not through an APS).<br/>


### 1) The investor's cash and/or investments are being transferred to a surviving spouse on the same platform using an Additional Permitted Subscription ('APS')

If you want to transfer investments to a surviving spouse, you must make sure you have the appropriate legal paperwork and technical capability in place to transfer investments on your platform.  Alternatively, you can wait for investments to mature and only transfer cash when it becomes available.

The process flow is:

- Notify the Goji operations team of the death by emailing platformsupport@goji.investments.
- Goji will create a 'Death of investor' workflow and lock the account. 
- The Goji operations team will liaise with you and the surviving spouse to complete the relevant APS paperwork and to gather the required paperwork (e.g. death certificate and grant of probate).
- The surviving spouse must have an active ISA account.  If this isn't already in place, the surviving spouse must sign-up and create an account. You must notify us of the account creation in the usual way through the `POST /investors` API call.
- Once required paperwork has been provided, Goji will confirm, unlock and the account and ask you to transfer the cash and investments to the beneficiary's account.
- To notify us of cash moving between accounts using an APS:
    - On the deceased account: `POST /investors/{investorId}/cash`, setting the `type` to `CUSTOMER_WITHDRAWAL` with `amount.amount` set to a positive amount equal to the total cash balance.
    - On the spouse's account: `POST /cash` setting the `type` to `ADDITIONAL_PERMITTED_SUBSCRIPTION` with `amount.amount` set to a positive amount equal to the total cash being transferred.
- To notify us of investments moving between accounts using an APS:
    - On the deceased account: `POST /investors/{investorId}/investment/{investmentId}/writeOff`, with the `writeOffAmount.amount` equal to the investment balance.
    - On the spouse’s account: `POST /cash` setting the type to `ADDITIONAL_PERMITTED_SUBSCRIPTION` with `amount.amount` set to a positive amount equal to the investment balance being transferred.
    - On the spouse’s account: `POST /investors/{investorId}/investment`, with the `clientinvestmentId` and other investment details the same as the deceased investor’s loan.
- After the calls are completed, the cash and investment balances of the deceased account should be 0.
- Let Goji know when you have completed the calls by emailing our Ops team at platformsupport@goji.investments. Goji can then record the date the transfers were completed (for HMRC reporting purposes) and close the workflow and ISA account.

### 2) The investor's cash and/or investments are being transferred to a different ISA Manager for a surviving spouse using an Additional Permitted Subscription ('APS')

Only cash can be transferred to an alternative ISA Manager as an APS, loans or bonds cannot be transferred in specie.  If a surviving spouse wants to transfer cash and investments to another ISA Manager via an APS, they will need to wait until investments have matured and repaid.

The process flow is:

- Notify the Goji operations team of the death by emailing platformsupport@goji.investments.
- Goji will create a 'Death of investor' workflow and lock the account.
- The Goji operations team will liaise with you, the surviving spouse and the new ISA Manager to complete the relevant APS paperwork and to gather the required paperwork (e.g. death certificate and grant of probate).
- Once required paperwork has been provided, Goji will confirm, unlock and the account and ask you to transfer the cash to the new ISA manager. You must notify us once the transfer has completed with `POST /investors/{investorId}/cash`, setting the `type` to `CUSTOMER_WITHDRAWAL` with `amount.amount` set to a positive amount equal to the total cash balance.
- After the call is completed, the cash and investment balances of the deceased account should be 0.
- Let Goji know when you have completed the calls by emailing our Ops team at platformsupport@goji.investments. Goji can then record the date the transfers were completed (for HMRC reporting purposes) and close the workflow and ISA account.

### 3) The investor's cash and/or investments are being transferred to a beneficiary's ISA on the same platform (not through an APS)

If you want to transfer investments to a beneficiary, you must make sure you have the appropriate legal paperwork and technical capability in place to transfer investments on your platform.  Alternatively, you can wait for investments to mature and only transfer cash when it becomes available.

To transfer cash or investments into the beneficiary's ISA, they must have sufficient ISA allowance remaining in the current tax year to cover the amount being transferred.  You can split the transfer between the beneficiary's general and ISA account if needed (e.g. Investor A has died with a cash balance of £10k and an investment balance of £15k. Investor B is inheriting all investments and cash and has a remaining ISA allowance of £10k. Investor B can only transfer £10k of cash or investments into their ISA. The remaining balances must be transferred to their general account using option 4 below).

The process flow is:

- Notify the Goji operations team of the death by emailing platformsupport@goji.investments.
- Goji will create a 'Death of investor' workflow and lock the account.
- The Goji operations team will liaise with you and the beneficiary to gather the required paperwork (e.g. death certificate and grant of probate).
- The beneficiary must have an active ISA account.  If this isn't already in place, they must sign-up and create an account.  You must notify us of the account creation in the usual way through the `POST /investors` API call.
- Once required paperwork has been provided, Goji will confirm, unlock and the account and ask you to transfer the cash and investments to the beneficiary's account.
- To notify us of cash moving **between ISA accounts**:
    - On the deceased account: `POST /investors/{investorId}/cash`, setting the `type` to `CUSTOMER_WITHDRAWAL` with `amount.amount` set to a positive amount equal to the total cash balance.
    - On the beneficiary's account: `POST /investors/{investorId}/cash` setting the `type` to `CUSTOMER_DEPOSIT` with `amount.amount` set to a positive amount equal to the total cash being transferred.
- To notify us of investments moving **between ISA accounts**:
    - On the deceased account: `POST /investors/{investorId}/investment/{investmentId}/writeOff`, with the `writeOffAmount.amount` equal to the investment balance.
    - On the receiving account: `POST /cash` setting the type to `CUSTOMER_DEPOSIT` with `amount.amount` set to a positive amount equal to the investment balance being transferred.
    - On the receiving account: `POST /investors/{investorId}/investment`, with the `clientinvestmentId` and other investment details the same as the deceased investor’s loan.
- After the calls are completed, the cash and investment balances of the deceased account should be 0.
- Let Goji know when you have completed the calls by emailing our Ops team at platformsupport@goji.investments. Goji can then record the date the transfers were completed (for HMRC reporting purposes) and close the workflow and ISA account.

### 4) The investor's cash and/or investments are being transferred to a beneficiary's non-ISA account on the same platform (not through an APS)

If you want to transfer investments to a beneficiary, you must make sure you have the appropriate legal paperwork and technical capability in place to transfer investments on your platform.  Alternatively, you can wait for investments to mature and only transfer cash when it becomes available.

The process flow is:

- Notify the Goji operations team of the death by emailing platformsupport@goji.investments.
- Goji will create a 'Death of investor' workflow and lock the account.
- The Goji operations team will liaise with you and the beneficiary to gather the required paperwork (e.g. death certificate and grant of probate).
- Once required paperwork has been provided, Goji will confirm, unlock and the account and ask you to transfer the cash and investments to the beneficiary's account.
- To notify us of cash moving from an ISA account to a non-ISA account:
    - On the deceased account: `POST /investors/{investorId}/cash`, setting the `type` to `CUSTOMER_WITHDRAWAL` with `amount.amount` set to a positive amount equal to the total cash balance.
- To notify us of investments moving from an ISA account to a non-ISA account:
    - On the deceased account: `POST /investors/{investorId}/investment/{investmentId}/writeOff`, with the `writeOffAmount.amount` equal to the investment balance.
- After the calls are completed, the cash and investment balances of the deceased account should be 0.
- Let Goji know when you have completed the calls by emailing our Ops team at platformsupport@goji.investments. Goji can then record the date the transfers were completed (for HMRC reporting purposes) and close the workflow and ISA account.

### 5) The investor's cash and/or investments are being transferred to a beneficiary  off-platform (not through an APS)

Only cash can be withdrawn off the platform by a beneficiary. If a surviving beneficiary wants to withdraw all cash and investments, they will need to wait until investments have matured and repaid.

The process flow is:

- Notify the Goji operations team of the death by emailing platformsupport@goji.investments.
- Goji will create a 'Death of investor' workflow and lock the account.
- The Goji operations team will liaise with you and the beneficiary to gather the required paperwork (e.g. death certificate and grant of probate).
- Once required paperwork has been provided, Goji will confirm, unlock and the account and ask you to facilitate the beneficiary withdrawing the cash.
- To notify us of cash being withdrawn:
    - On the deceased account: `POST /investors/{investorId}/cash`, setting the `type` to `CUSTOMER_WITHDRAWAL` with `amount.amount` set to a positive amount equal to the total cash balance.
- After the calls are completed, the cash and investment balances of the deceased account should be 0.
- Let Goji know when you have completed the calls by emailing our Ops team at platformsupport@goji.investments. Goji can then record the date the transfers were completed (for HMRC reporting purposes) and close the workflow and ISA account.


## Tax Year Breaks

A tax year break occurs when an investor has not subscribed for a whole tax year and is therefore required to re-open an ISA before they can make further subscriptions.

For example, Investor A opens an ISA on 1st April 2016 (ie in the 2015/16 tax year) and subscribes £10,000.

The investor does not subscribe between 6th April 2016 and 5th April 2017.

This is considered a tax year break and so the investor will have to re-open their ISA to subscribe in the 2017/18 tax year.

To re-open the ISA, the investor has to agree to the ISA declaration. This can be achieved by calling:

    POST /investors/{investorId}/declaration/agreement

To check whether an investor has a tax year break and needs to agree to the declaration, check whether `isaSubscriptionStatus` on `/isa` is set to `INVALID_TAX_YEAR_BREAK`.

* Please note that Goji can contact the affected investors on your behalf to encourage them to re-open their ISAs. *

## Repairing / voiding ISAs

If HMRC deem that an Investor has breached any ISA regulations eg opened two IF ISAs in one tax year, then an ISA may need to be voided or repaired.

Voiding an ISA involves closing the ISA completely. A repair requires a certain amount of funds and associated income to be removed from the wrapper.

### Voiding an ISA

If an investor has opened multiple IF ISAs within a tax year, HMRC may instruct their ISA manager(s) to void the ISA.

Goji will handle all the associated admin wth voiding the ISA, however the Originator will need to be able to support moving funds and/or investments out of the wrapper.

The steps to repair the ISA will be as follows:

 * HMRC write to the ISA manager to instruct them to void the ISA
 * Goji/Originator will contact the investor to determine how the funds should be removed from the wrapper eg withdrawing cash, selling investments, moving in specie
 * Any cash on account is withdrawn using `/cash` with type set to `CUSTOMER_WITHDRAWAL`
 * If investments are to be removed from the tax wrapper, call `DELETE /investors/{investorId}/investment/{investmentId}/investment`. This reduces the ISA balance by the outstanding capital amount.
 * Once this process is complete, Goji will email the investor with details of the taxable income that needs to be declared in their tax return.

### Repairing an ISA

If an investor has oversubscribed to their ISA(s) within a tax year, HMRC may instruct their ISA manager(s) to repair the ISA. HMRC will contact the ISA manager with the amount that needs to be removed from the ISA.

Goji will handle all the associated admin wth repairing the ISA, however the Originator will need to be able to support moving funds and/or investments out of the wrapper.

The steps to repair the ISA will be as follows:

 * HMRC write to the ISA manager to instruct them to repair the ISA
 * Goji/Originator will contact the investor to determine how the funds should be removed from the wrapper eg withdrawing cash, selling investments, moving in specie
 * Any cash on account is withdrawn using `/cash` with type set to `CUSTOMER_WITHDRAWAL`
 * If investments are to be removed from the tax wrapper, call `DELETE /investors/{investorId}/investment/{investmentId}/investment`. This reduces the ISA balance by the outstanding capital amount.
 * Once this process is complete, Goji will email the investor with details of the taxable income that needs to be declared in their tax return.
 
## `GET /terms`

```http

GET /terms HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "version" : "version",
  "termsAndConditions" : "termsAndConditions"
}
```
### Description
Returns the Terms and Conditions to show to the investor.
#### Investor Lifecycle
This endpoint should be called to return the Terms and Conditions that the investor must agree to before they can open an IF ISA.
### Response
| Name               | Type   | Description                                      |
| ------------------ | ------ | ------------------------------------------------ |
| termsAndConditions | string | The terms and conditions                         |
| version            | string | The version of the terms and conditions eg 1.0.0 |
## `POST /terms`

```http

POST /terms HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "termsAndConditions" : "termsAndConditions"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "version" : "version",
  "termsAndConditions" : "termsAndConditions"
}
```
### Description
Creates or updates the Terms and Conditions to show to the investor.
#### Investor Lifecycle
This endpoint should be called to create or update the Terms and Conditions that the investor must agree to before they can open an IF ISA.
### Request
| Name               | Type   | Description                                | Required |
| ------------------ | ------ | ------------------------------------------ | -------- |
| termsAndConditions | string | The new Terms and Conditions HTML content. | required |
### Response
| Name               | Type   | Description                                      |
| ------------------ | ------ | ------------------------------------------------ |
| termsAndConditions | string | The terms and conditions                         |
| version            | string | The version of the terms and conditions eg 1.0.0 |
## `POST /terms/agreement`

```http

POST /terms/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "termsAndConditionsVersion" : "termsAndConditionsVersion",
  "dateTimeSigned" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "token" : "token"
}
```
### Description
Issues a token that indicates that the investor has read and agreed to the specified version of the terms and conditions. The returned token can then be used as part of the create investor request or when the investor is signing a new version of the terms and conditions.
#### Investor Lifecycle
This endpoint should be called before creating the investor and when the investor signs a new version of the terms and conditions.
#### Possible Error Codes:
Please see [sign terms errors](#errors)
### Request
| Name                      | Type   | Description                                                                               | Required |
| ------------------------- | ------ | ----------------------------------------------------------------------------------------- | -------- |
| termsAndConditionsVersion | string | The version of the Terms and Conditions the user has signed, as returned in GET response. | required |
| dateTimeSigned            | string | The date and time the conditions were signed                                              | required |
### Response
| Name  | Type   | Description                                                                             |
| ----- | ------ | --------------------------------------------------------------------------------------- |
| token | string | A token identifying the signing of the Ts & Cs. To be used on the POST /investors call. |
## `GET /investors/{clientId}/terms/status`

```http

GET /investors/{clientId}/terms/status HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "status" : "UNSIGNED"
}
```
### Description
Loads the investor's terms and conditions status which can be used to determine if they have signed the latest terms and conditions.
### Response
| Name   | Type   | Description                                                                                                  |
| ------ | ------ | ------------------------------------------------------------------------------------------------------------ |
| status | string | The status. Possible values are: <br>`UNSIGNED`<br>`PREVIOUS_VERSION_SIGNED`<br>`CURRENT_VERSION_SIGNED`<br> |
## `PUT /investors/{clientId}/terms/agreement/token`

```http

PUT /investors/{clientId}/terms/agreement/token HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "token" : "token"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Applicable when the terms and conditions are updated and the investor must accept the latest version. The token is obtained from the 'terms/agreement' request. Note that this should not be called on investor registration, this is only applicable if an existing investor is signing a new version of the terms and conditions.
### Request
| Name  | Type   | Description                                                                             | Required |
| ----- | ------ | --------------------------------------------------------------------------------------- | -------- |
| token | string | A token identifying the signing of the Ts & Cs. To be used on the POST /investors call. | optional |
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## `GET /declaration`

```http

GET /declaration HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "declaration" : "declaration",
  "version" : "version"
}
```
### Description
Returns the ISA Declaration to show to the investor.
#### Investor Lifecycle
This endpoint should be called to return the ISA Declaration that the investor must agree to before they can open an IF ISA.
### Response
| Name        | Type   | Description                                                     |
| ----------- | ------ | --------------------------------------------------------------- |
| declaration | string | The declaration                                                 |
| version     | string | A unique identifier of the version of this declaration eg. 0.11 |
## `POST /declaration/agreement`

```http

POST /declaration/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "declarationVersion" : 2.68,
  "dateTimeSigned" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "token" : "token"
}
```
### Description
Records an investor agreeing to the ISA Declaration.
#### Investor Lifecycle
This endpoint should be called before creating the investor.
#### Possible Error Codes:
Please see [sign declaration errors](#errors)
### Request
| Name               | Type   | Description                                                                      | Required |
| ------------------ | ------ | -------------------------------------------------------------------------------- | -------- |
| declarationVersion | number | The version of the Declaration the user has signed, as returned in GET response. | required |
| dateTimeSigned     | string | The date and time the conditions were signed                                     | required |
### Response
| Name  | Type   | Description                                                                                 |
| ----- | ------ | ------------------------------------------------------------------------------------------- |
| token | string | A token identifying the signing of the Declaration. To be used on the POST /investors call. |
## `POST /investors`

```http

POST /investors HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "declarationToken" : "declarationToken",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "termsAndConditionsToken" : "termsAndConditionsToken",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Creates a new investor and an accompanying ISA.
This creates an investor on the Goji platform and allocates it to the P2P platform that sent the request.
#### Investor Lifecycle
This endpoint should be called whenever an investor wishes to create an IF ISA.
#### Validation

In addition to checking the format of the supplied data, the following validation is applied:

* ensure the investor has not already created an IF ISA via the Goji platform.
* ensure the National Insurance number is valid.
* ensure the user complies with the ISA UK residency checks

#### Possible Error Codes
Please see [create investor errors](#errors)
### Request
| Name                           | Type   | Description                                                                                                                                                                                        | Required |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       | required |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         | required |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        | optional |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          | required |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      | required |
| contactDetails                 | ref    |                                                                                                                                                                                                    | required |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      ||
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   ||
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          | required |
| address                        | ref    |                                                                                                                                                                                                    | required |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                ||
| address.region                 | string | The region of the investor's address.                                                                                                                                                              ||
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           ||
| termsAndConditionsToken        | string | A token returned by POST /terms to identify that the user has signed the Ts & Cs.                                                                                                                  | required |
| declarationToken               | string | A token returned by POST /declaration to identify that the user has signed the Declaration.                                                                                                        | required |
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## `POST /investors/validIsaApplication`

```http

POST /investors/validIsaApplication HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "dateOfBirth" : "2000-01-23"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Validates the details of an investor to allow a P2PP to verify whether an investor is ellgibile for an ISA.

Checks performed:

* UK residency check against the address
* Age of investor

#### Possible Error Codes
Please see [validate investor errors](#errors)
### Request
| Name                    | Type   | Description                                                                                                                                                                                        | Required |
| ----------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| dateOfBirth             | string | The date of birth of the investor in yyyy-MM-dd format                                                                                                                                             | required |
| address                 | ref    |                                                                                                                                                                                                    | required |
| address.lineOne         | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo         | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree       | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity        | string | The town of the investor's address.                                                                                                                                                                ||
| address.region          | string | The region of the investor's address.                                                                                                                                                              ||
| address.country         | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode        | string | The Post Code of the investor's address.                                                                                                                                                           ||
| nationalInsuranceNumber | string | Optionally check to see if the National Insurance number has already been registered                                                                                                               | required |


## `GET /investors/{investorId}`

```http

GET /investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Retrieves the details of an investor.
#### Investor Lifecycle
This endpoint should be called when the non-financial details of an investor need to be accessed.
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## `PUT /investors/{investorId}`

```http

PUT /investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Updates the details of an investor.
#### Investor Lifecycle
This endpoint should be called whenever the details of an investor change.
### Request
| Name                           | Type   | Description                                                                                                                                                                                        | Required |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         | required |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        | optional |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          | required |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      | required |
| contactDetails                 | ref    |                                                                                                                                                                                                    | required |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      ||
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   ||
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          | required |
| address                        | ref    |                                                                                                                                                                                                    | optional |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                ||
| address.region                 | string | The region of the investor's address.                                                                                                                                                              ||
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           ||
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## `GET /investors/{investorId}/isa`

```http

GET /investors/{investorId}/isa HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Returns details of the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever up to date details of the investor's ISA are required eg remaining subscription amount etc.
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `GET /investors/{investorId}/isa/summary`

```http

GET /investors/{investorId}/isa/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalAmountInvested" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Returns summary details of the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever summary details of the investor's ISA are required eg remaining subscription amount etc.
### Response
| Name                                 | Type   | Description                                                                   |
| ------------------------------------ | ------ | ----------------------------------------------------------------------------- |
| totalCashBalance                     | ref    | The total amount of cash in the ISA that is not currently invested.           |
| totalCashBalance.amount              | number | The amount                                                                    |
| totalCashBalance.currency            | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalAmountInvested                  | ref    | The total amount of the ISA that is currently invested.                       |
| totalAmountInvested.amount           | number | The amount                                                                    |
| totalAmountInvested.currency         | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalIsaBalance                      | ref    | The total current balance in the ISA, inclusive of all years.                 |
| totalIsaBalance.amount               | number | The amount                                                                    |
| totalIsaBalance.currency             | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| remainingSubscriptionAmount          | ref    | The amount remaining that can be invested in the ISA in the current tax year. |
| remainingSubscriptionAmount.amount   | number | The amount                                                                    |
| remainingSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                       |

## `GET /transferIn/investors/{clientId}/open`

```http

GET /transferIn/investors/{clientId}/open HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "isaManagerName" : "isaManagerName",
  "transferSummary" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "cashArrived" : true,
  "previousYearsAmountType" : "previousYearsAmountType",
  "id" : "id",
  "isaType" : "isaType",
  "transferDate" : "2000-01-23",
  "includeCurrentYear" : true
} ]
```
### Description
Returns an overview of all open transfers in for a particular investor. 
The `transferDate` is only non-null if the transfer history form has been received.
### Response
| Name                                        | Type    | Description                                                                    |
| ------------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| [].id                                       | string  | The id                                                                         |
| [].isaType                                  | string  | The type of ISA the investor holds                                             |
| [].isaManagerName                           | string  | The name of the ISA manager involved with the Transfer In                      |
| [].transferSummary                          | ref     | Details of the amounts being transferred                                       |
| [].currentYearSubscriptionAmount.amount     | number  | The amount                                                                     |
| [].currentYearSubscriptionAmount.currency   | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].previousYearsSubscriptionAmount.amount   | number  | The amount                                                                     |
| [].previousYearsSubscriptionAmount.currency | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].repairAmount.amount                      | number  | The amount                                                                     |
| [].repairAmount.currency                    | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].totalIsaTransferAmount.amount            | number  | The amount                                                                     |
| [].totalIsaTransferAmount.currency          | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].includeCurrentYear                       | boolean | True if current year subscriptions should be transferred                       |
| [].previousYearsAmountType                  | string  | Determines how much prior year subscription should be included in the transfer |
| [].transferDate                             | string  | The date on which the transfer should occur                                    |
| [].cashArrived                              | boolean | True if the cash for the Transfer In has arrived                                                            |

## `GET /transferIn/investors/{clientId}/closed`

```http

GET /transferIn/investors/{clientId}/closed HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "isaManagerName" : "isaManagerName",
  "transferSummary" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "cashArrived" : true,
  "previousYearsAmountType" : "previousYearsAmountType",
  "id" : "id",
  "isaType" : "isaType",
  "transferDate" : "2000-01-23",
  "includeCurrentYear" : true
} ]
```
### Description
Returns an overview of all closed transfers in for a particular investor.
### Response
| Name                                        | Type    | Description                                                                    |
| ------------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| [].id                                       | string  | The id                                                                         |
| [].isaType                                  | string  | The type of ISA the investor holds                                             |
| [].isaManagerName                           | string  | The name of the ISA manager involved with the Transfer In                      |
| [].transferSummary                          | ref     | Details of the amounts being transferred                                       |
| [].currentYearSubscriptionAmount.amount     | number  | The amount                                                                     |
| [].currentYearSubscriptionAmount.currency   | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].previousYearsSubscriptionAmount.amount   | number  | The amount                                                                     |
| [].previousYearsSubscriptionAmount.currency | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].repairAmount.amount                      | number  | The amount                                                                     |
| [].repairAmount.currency                    | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].totalIsaTransferAmount.amount            | number  | The amount                                                                     |
| [].totalIsaTransferAmount.currency          | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].includeCurrentYear                       | boolean | True if current year subscriptions should be transferred                       |
| [].previousYearsAmountType                  | string  | Determines how much prior year subscription should be included in the transfer |
| [].transferDate                             | string  | The date on which the transfer should occur                                    |
| [].cashArrived                              | boolean | True if the cash for the Transfer In has arrived                                                            |

## `GET /investors/{clientId}/isa/subscriptionStatus`

```http

GET /investors/{clientId}/isa/subscriptionStatus HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "subscriptionStatus" : "VALID"
}
```
### Description
Used to retrieve the subscription status of an investor's ISA. Can be used for tax year breaks.
### Response
| Name               | Type   | Description                                                                                                                                                                                                                                                                             |
| ------------------ | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| subscriptionStatus | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
## `PUT /investors/{investorId}/isa/status`

```http

PUT /investors/{investorId}/isa/status HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "isaSubscriptionStatus" : "VALID"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalAmountInvested" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Updates the status of an investor's ISA.  This can aid testing by placing an ISA into an invalid status.
### Request
| Name                  | Type   | Description                                                                                                                                                                                                                                        | Required |
| --------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| dateTime              | string | The date time the residual income payment was received.                                                                                                                                                                                            | required |
| isaSubscriptionStatus | string | The status to change this ISA to. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> | required |
### Response
| Name                                 | Type   | Description                                                                   |
| ------------------------------------ | ------ | ----------------------------------------------------------------------------- |
| totalCashBalance                     | ref    | The total amount of cash in the ISA that is not currently invested.           |
| totalCashBalance.amount              | number | The amount                                                                    |
| totalCashBalance.currency            | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalAmountInvested                  | ref    | The total amount of the ISA that is currently invested.                       |
| totalAmountInvested.amount           | number | The amount                                                                    |
| totalAmountInvested.currency         | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalIsaBalance                      | ref    | The total current balance in the ISA, inclusive of all years.                 |
| totalIsaBalance.amount               | number | The amount                                                                    |
| totalIsaBalance.currency             | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| remainingSubscriptionAmount          | ref    | The amount remaining that can be invested in the ISA in the current tax year. |
| remainingSubscriptionAmount.amount   | number | The amount                                                                    |
| remainingSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
## `PUT /investors/{clientId}/transferIn/{transferInId}/transferHistory`

```http

PUT /investors/{clientId}/transferIn/{transferInId}/transferHistory HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "adjustedAmounts" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Updates the transfer history for an investor's Transfer In
### Request
| Name                                   | Type   | Description                                                            | Required |
| -------------------------------------- | ------ | ---------------------------------------------------------------------- | -------- |
| transferAmount                         | ref    | The total transfer amount                                              | required |
| transferAmount.amount                  | number | The amount                                                             ||
| transferAmount.currency                | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| currentYearSubscriptionAmount          | ref    | The total amount subscribed within the current tax year                | required |
| currentYearSubscriptionAmount.amount   | number | The amount                                                             ||
| currentYearSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| transferInDate                         | string | The date specified by the ISA manager for the transfer to be completed | required |
| firstSubscriptionDateInCurrentYear     | string | The date of the first ISA subscription within the current tax year     | required |
### Response
| Name                                     | Type   | Description                                                                      |
| ---------------------------------------- | ------ | -------------------------------------------------------------------------------- |
| transferAmount                           | ref    | The total transfer amount                                                        |
| transferAmount.amount                    | number | The amount                                                                       |
| transferAmount.currency                  | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| currentYearSubscriptionAmount            | ref    | The total amount subscribed within the current tax year                          |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| transferInDate                           | string | The date specified by the ISA manager for the transfer to be completed           |
| firstSubscriptionDateInCurrentYear       | string | The date of the first ISA subscription within the current tax year               |
| adjustedAmounts                          | ref    | The calculated amounts to be used to determine how to allocate the cash received |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| previousYearsSubscriptionAmount.amount   | number | The amount                                                                       |
| previousYearsSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| repairAmount.amount                      | number | The amount                                                                       |
| repairAmount.currency                    | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| totalIsaTransferAmount.amount            | number | The amount                                                                       |
| totalIsaTransferAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
## `POST /investors/{clientId}/transferIn/{transferInId}/transferHistory`

```http

POST /investors/{clientId}/transferIn/{transferInId}/transferHistory HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "adjustedAmounts" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Creates the transfer history for an investor's Transfer In
### Request
| Name                                   | Type   | Description                                                            | Required |
| -------------------------------------- | ------ | ---------------------------------------------------------------------- | -------- |
| transferAmount                         | ref    | The total transfer amount                                              | required |
| transferAmount.amount                  | number | The amount                                                             ||
| transferAmount.currency                | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| currentYearSubscriptionAmount          | ref    | The total amount subscribed within the current tax year                | required |
| currentYearSubscriptionAmount.amount   | number | The amount                                                             ||
| currentYearSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| transferInDate                         | string | The date specified by the ISA manager for the transfer to be completed | required |
| firstSubscriptionDateInCurrentYear     | string | The date of the first ISA subscription within the current tax year     | required |
### Response
| Name                                     | Type   | Description                                                                      |
| ---------------------------------------- | ------ | -------------------------------------------------------------------------------- |
| transferAmount                           | ref    | The total transfer amount                                                        |
| transferAmount.amount                    | number | The amount                                                                       |
| transferAmount.currency                  | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| currentYearSubscriptionAmount            | ref    | The total amount subscribed within the current tax year                          |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| transferInDate                           | string | The date specified by the ISA manager for the transfer to be completed           |
| firstSubscriptionDateInCurrentYear       | string | The date of the first ISA subscription within the current tax year               |
| adjustedAmounts                          | ref    | The calculated amounts to be used to determine how to allocate the cash received |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| previousYearsSubscriptionAmount.amount   | number | The amount                                                                       |
| previousYearsSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| repairAmount.amount                      | number | The amount                                                                       |
| repairAmount.currency                    | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| totalIsaTransferAmount.amount            | number | The amount                                                                       |
| totalIsaTransferAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
## `POST /investors/{investorId}/declaration/agreement`

```http

POST /investors/{investorId}/declaration/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

""

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Used to record an investor agreeing to the ISA declaration after the ISA has been opened. Can be used for tax year breaks.

### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `GET /audit/investors/{investorId}`

```http

GET /audit/investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "responseBody" : "responseBody",
  "queryParameters" : "queryParameters",
  "requestBody" : "requestBody",
  "requestId" : "requestId",
  "httpMethod" : "GET",
  "url" : "url",
  "responseCode" : "responseCode"
} ]
```
### Description
Returns an audit record of HTTP requests relating to the investor.
### Response
| Name               | Type   | Description                                                                                       |
| ------------------ | ------ | ------------------------------------------------------------------------------------------------- |
| [].requestId       | string | The Goji request ID assigned to the HTTP request.                                                 |
| [].dateTime        | string | The time the request was received.                                                                |
| [].httpMethod      | string | The HTTP method of the request. Possible values are: <br>`GET`<br>`POST`<br>`PUT`<br>`DELETE`<br> |
| [].url             | string | The URL of the request.                                                                           |
| [].queryParameters | string | Any optional query parameters supplied with the request.                                          |
| [].responseCode    | string | The HTTP status code of the response.                                                             |
| [].requestBody     | string | The JSON payload supplied with the request if applicable.                                         |
| [].responseBody    | string | The JSON payload returned.   
                                                                     |
## `POST /investors/{investorId}/investment`

```http

POST /investors/{investorId}/investment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "clientInvestmentId" : "clientInvestmentId",
  "expectedInterest" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "termOfInvestment" : 7.54,
  "originalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
  "investmentType" : "LOAN"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Adds an investment to the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever monies are drawn down from the investor's account to fund an investment. This creates the investment on the Goji platform and decreases the cash balance of the ISA.
#### Validation
The ISA must have a cash balance equal or greater to the amount of the investment.
#### Possible Error Codes
Please see [create investment errors](#errors)
### Request
| Name                      | Type   | Description                                                                                         | Required |
| ------------------------- | ------ | --------------------------------------------------------------------------------------------------- | -------- |
| clientInvestmentId        | string | The ID of the loan defined by the P2P platform                                                      | required |
| investmentType            | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br> | required |
| originalAmount            | ref    | The original capital amount of the investment.                                                      | required |
| originalAmount.amount     | number | The amount                                                                                          ||
| originalAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                                             ||
| dateOfInvestment          | string | The date the investment started                                                                     | required |
| termOfInvestment          | number | The term of the investment in months                                                                | required |
| expectedInterest          | ref    | The expected interest to receive over the life of the investment.                                   | optional |
| expectedInterest.amount   | number | The amount                                                                                          ||
| expectedInterest.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                             ||
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `DELETE /investors/{investorId}/investment`

```http

DELETE /investors/{investorId}/investment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "fromDateTime" : "2000-01-23T04:56:07.000+00:00",
  "toDateTime" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Deletes all, or a matched set of, investments belonging to the ISA.

Currently if the investment has been previously modified this won't work and this test endpoint shouldn't be used.
### Request
| Name         | Type   | Description                                                                                                                           | Required |
| ------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| fromDateTime | string | Investments created on or after this date are considered for deletion. If no date is supplied, no earliest date filtering is applied. | optional |
| toDateTime   | string | Investments created on or before this date are considered for deletion. If no date is supplied, no latest date filtering is applied.  | optional |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `PUT /investors/{investorId}/investment/{investmentId}`

```http

PUT /investors/{investorId}/investment/{investmentId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
  "term" : 1.12
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Updates an investment in the investor's ISA. This call is normally not required. Please discuss with Goji before using it.
#### Investor Lifecycle
This endpoint should be called whenever the captial amount of an investment needs to be updated. It acts in an upsert manner.
#### Validation
The ISA must have a cash balance equal or greater to the amount of the investment.
#### Possible Error Codes
Please see [create investment errors](#errors)
### Request
| Name             | Type   | Description                                                  | Required |
| ---------------- | ------ | ------------------------------------------------------------ | -------- |
| amount           | ref    | The amount to increase the capital amount of the investment. | required |
| amount.amount    | number | The amount                                                   ||
| amount.currency  | string | The currency in ISO 4217 three character codes eg 'GBP'      ||
| dateOfInvestment | string | The date the investment started                              | required |
| term             | number | The term of the investment in months                         | required |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/investment/{investmentId}/repayment`

```http

POST /investors/{investorId}/investment/{investmentId}/repayment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
  "interestAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientRepaymentId" : "clientRepaymentId",
  "capitalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Records a repayment against a specific investment.
#### Investor Lifecycle
This endpoint should be called whenever a repayment is received from the borrower against an investor's investment. This repayment increases the cash balance of the ISA as it is not automatically reinvested by the P2P Platform.
#### Possible Error Codes
Please see [create repayment errors](#errors)
### Request
| Name                    | Type   | Description                                                 | Required |
| ----------------------- | ------ | ----------------------------------------------------------- | -------- |
| clientRepaymentId       | string | The P2P platform assigned ID for the repayment transaction. | required |
| capitalAmount           | ref    | The capital amount being repaid                             | required |
| capitalAmount.amount    | number | The amount                                                  ||
| capitalAmount.currency  | string | The currency in ISO 4217 three character codes eg 'GBP'     ||
| interestAmount          | ref    | The interest amount being repaid                            | required |
| interestAmount.amount   | number | The amount                                                  ||
| interestAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'     ||
| dateTimeOfRepayment     | string | The date and time of the repayment                          | required |


## `POST /investors/{investorId}/investment/{investmentId}/reinvestment`

```http

POST /investors/{investorId}/investment/{investmentId}/reinvestment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "clientReinvestmentId" : "clientReinvestmentId",
  "interestAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 7.54,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "investmentType" : "LOAN"
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 7.54,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "investmentType" : "LOAN"
  } ],
  "capitalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Records a reinvestment against a specific investment.
#### Investor Lifecycle
This endpoint should be called whenever a repayment is received from the borrower against an investor's investment. This amount is automatically reinvested by the P2P Platform and so does not increase the cash balance of the ISA, however the ISA balance is increased by the interest component of the reinvestment.
This endpoint creates the new investment associated with the reinvestment.
#### Possible Error Codes
Please see [create reinvestment errors](#errors)
### Request
| Name                             | Type   | Description                                                                                         | Required |
| -------------------------------- | ------ | --------------------------------------------------------------------------------------------------- | -------- |
| clientReinvestmentId             | string | The P2P platform assigned ID for the reinvestment transaction.                                      | required |
| capitalAmount                    | ref    | The capital amount being repaid that is being reinvested                                            | required |
| capitalAmount.amount             | number | The amount                                                                                          ||
| capitalAmount.currency           | string | The currency in ISO 4217 three character codes eg 'GBP'                                             ||
| interestAmount                   | ref    | The interest amount being repaid that is being reinvested                                           | required |
| interestAmount.amount            | number | The amount                                                                                          ||
| interestAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                             ||
| dateTimeOfReinvestment           | string | The date and time of the reinvestment                                                               | required |
| investments                      | array  | The new investments to create from this reinvestment                                                | required |
| investments[].clientInvestmentId | string | The ID of the loan defined by the P2P platform                                                      | required |
| investments[].investmentType     | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br> | required |
| investments[].originalAmount     | ref    | The original capital amount of the investment.                                                      | required |
| investments[].dateOfInvestment   | string | The date the investment started                                                                     | required |
| investments[].termOfInvestment   | number | The term of the investment in months                                                                | required |
| investments[].expectedInterest   | ref    | The expected interest to receive over the life of the investment.                                   | optional |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/investment/{investmentId}/sale`

```http

POST /investors/{investorId}/investment/{investmentId}/sale HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "saleAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repaymentId" : "repaymentId",
  "dateTimeOfSale" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Records the sale of a specific investment.
#### Investor Lifecycle
This endpoint should be called if an investment should be marked as sold. The amount of the sale may be more or less than the remaining capital amount on the investment.
### Request
| Name                | Type   | Description                                             | Required |
| ------------------- | ------ | ------------------------------------------------------- | -------- |
| repaymentId         | string | A unique reference for the transaction                  | required |
| saleAmount          | ref    | The total amount the investment is being sold for.      | required |
| saleAmount.amount   | number | The amount                                              ||
| saleAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfSale      | string |                                                         | required |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/investment/{investmentId}/writeOff`

```http

POST /investors/{investorId}/investment/{investmentId}/writeOff HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "writeOffAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateTimeOfWriteOff" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Records a write-off amount against a specific investment.
#### Investor Lifecycle
This endpoint should be called if an investment is in default and some or all of the remaining capital amount should be written off.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| writeOffAmount          | ref    |                                                         | required |
| writeOffAmount.amount   | number | The amount                                              ||
| writeOffAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfWriteOff      | string |                                                         | required |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/cash`

```http

POST /investors/{investorId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId",
  "type" : "CUSTOMER_DEPOSIT",
  "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Records a cash transaction into the ISA.
#### Investor Lifecycle
This endpoint should be called whenever the user deposits or withdraws cash from the ISA.
#### Validation
* There must be a cash balance greater than or equal to any amount being withdrawn (debited)
* The amount deposited must not exceed the annual subscription amount

#### Possible Error Codes
Please see [cash transaction errors](/#errors)
### Request
| Name                  | Type   | Description                                                                                                                                                                                                                                   | Required |
| --------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| clientTransactionId   | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                        | required |
| amount                | ref    | The amount of the cash transaction                                                                                                                                                                                                            | required |
| amount.amount         | number | The amount                                                                                                                                                                                                                                    ||
| amount.currency       | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                       ||
| dateTimeOfTransaction | string | The date and time of the transaction                                                                                                                                                                                                          | required |
| type                  | string | Indicates the type of the cash transaction. Possible values are: <br>`CUSTOMER_DEPOSIT`<br>`CUSTOMER_WITHDRAWAL`<br>`ADDITIONAL_PERMITTED_SUBSCRIPTION`<br>`DEFAULTED_INVESTMENT_SUBSCRIPTION`<br>`RESIDUAL_INCOME`<br>`FEE`<br>`PREMIUM`<br> | required |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `DELETE /investors/{investorId}/cash`

```http

DELETE /investors/{investorId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "typesToInclude" : [ { }, { } ],
  "fromDateTime" : "2000-01-23T04:56:07.000+00:00",
  "typesToExclude" : [ null, null ],
  "toDateTime" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Deletes all, or a matched set of, cash transactions belonging to the ISA.
### Request
| Name           | Type   | Description                                                                                                                                | Required |
| -------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| fromDateTime   | string | Transactions created on or after this date are considered for deletion. If no date is supplied, no earliest date filtering is applied.     | optional |
| toDateTime     | string | Transactions created on or before this date are considered for deletion. If no date is supplied, no latest date filtering is applied.      | optional |
| typesToInclude | array  | Types for transactions that should be considered for deletion. Defaults to all types if no 'typesToInclude' attribute or null is supplied. | optional |
| typesToExclude | array  | Types for transactions that should be excluded from the deletion. Defaults to none if no 'typesToExclude' attribute or null is supplied.   | optional |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/cashCorrection`

```http

POST /investors/{investorId}/cashCorrection HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId",
  "type" : "INTEREST_REPAYMENT_CORRECTION",
  "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Records a cash correction transaction into the ISA.
#### Investor Lifecycle
This endpoint should be called whenever the Platform needs to manually correct a cash transaction amount. Currently only interest repayment corrections are supported. This call will not be needed if the Originator will not need to alter interest amounts.
### Request
| Name                  | Type   | Description                                                                                                         | Required |
| --------------------- | ------ | ------------------------------------------------------------------------------------------------------------------- | -------- |
| clientTransactionId   | string | The ID of the transaction assigned by the P2P platform                                                              | required |
| amount                | ref    | The amount of the corrective cash transaction                                                                       | required |
| amount.amount         | number | The amount                                                                                                          ||
| amount.currency       | string | The currency in ISO 4217 three character codes eg 'GBP'                                                             ||
| dateTimeOfTransaction | string | The date and time of the transaction                                                                                | required |
| type                  | string | Indicates the type of the corrective cash transaction. Possible values are: <br>`INTEREST_REPAYMENT_CORRECTION`<br> | required |
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
## `POST /investors/{investorId}/transferIn/{transferInId}/cash`

```http

POST /investors/{investorId}/transferIn/{transferInId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "subscribedAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they have received the deposit for a transfer in and have confirmed the split between current/prior year subscriptions. The transfer amount is the value of the total amount received from the previus ISA manager. Either the repair amount or the subscribed amount needs to be specified. The subscribed amount is the portion allocated to the ISA. The repair amount is the amount that had to be credited to the non-ISA account. Please see the integration guide for more details.
#### Possible Error Codes
Please see [transfer cash errors](#errors)
### Request
| Name                      | Type   | Description                                                                                                                                                                          | Required |
| ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| clientTransactionId       | string | The transaction ID for the transfer cash                                                                                                                                             | required |
| transferAmount            | ref    | The total transfer amount                                                                                                                                                            | optional |
| transferAmount.amount     | number | The amount                                                                                                                                                                           ||
| transferAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| repairAmount              | ref    | The amount that was transferred that had to be immediately repaired and transferred to their standard investment account. Specify either the repair amount or the subscribed amount. | optional |
| repairAmount.amount       | number | The amount                                                                                                                                                                           ||
| repairAmount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| subscribedAmount          | ref    | The amount that was transferred and was credited to the ISA account. Specify either the repair amount or the subscribed amount.                                                      | optional |
| subscribedAmount.amount   | number | The amount                                                                                                                                                                           ||
| subscribedAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||


## `POST /investors/{investorId}/transferIn/{transferInId}/residualIncome`

```http

POST /investors/{investorId}/transferIn/{transferInId}/residualIncome HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they have received a residual income payment for a transfer in. Please see the integration guide for more details.
#### Possible Error Codes
Please see [transfer cash errors](#errors)
### Request
| Name                | Type   | Description                                             | Required |
| ------------------- | ------ | ------------------------------------------------------- | -------- |
| clientTransactionId | string | A unique ID for the transaction                         | optional |
| amount              | ref    | The amount of the residual income payment               | optional |
| amount.amount       | number | The amount                                              ||
| amount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTime            | string | The date time the residual income payment was received. | optional |


## `POST /investors/{investorId}/transferIn/{transferInId}/cash/validation`

```http

POST /investors/{investorId}/transferIn/{transferInId}/cash/validation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "subscribedAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they want to validate the transfer in cash transaction before processing it.
#### Possible Error Codes
Please see [transfer cash errors](#errors)
### Request
| Name                      | Type   | Description                                                                                                                                                                          | Required |
| ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| clientTransactionId       | string | The transaction ID for the transfer cash                                                                                                                                             | required |
| transferAmount            | ref    | The total transfer amount                                                                                                                                                            | optional |
| transferAmount.amount     | number | The amount                                                                                                                                                                           ||
| transferAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| repairAmount              | ref    | The amount that was transferred that had to be immediately repaired and transferred to their standard investment account. Specify either the repair amount or the subscribed amount. | optional |
| repairAmount.amount       | number | The amount                                                                                                                                                                           ||
| repairAmount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| subscribedAmount          | ref    | The amount that was transferred and was credited to the ISA account. Specify either the repair amount or the subscribed amount.                                                      | optional |
| subscribedAmount.amount   | number | The amount                                                                                                                                                                           ||
| subscribedAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||


## `GET /investors/{clientId}/transferInSummary`

```http

GET /investors/{clientId}/transferInSummary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "totalTransferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferInDate" : "2000-01-23",
  "clientId" : "clientId",
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "bankReference" : "bankReference",
  "fundsTransferType" : "fundsTransferType",
  "id" : "id"
} ]
```
### Description
Returns the in progress transfers in for the specified investor
### Response
| Name                            | Type   | Description                                             |
| ------------------------------- | ------ | ------------------------------------------------------- |
| [].id                           | string | The ID of the transfer in                               |
| [].clientId                     | string | The ID of client                                        |
| [].totalTransferAmount          | ref    | The total amount being transferred                      |
| [].totalTransferAmount.amount   | number | The amount                                              |
| [].totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].repairAmount                 | ref    | The repair amount                                       |
| [].repairAmount.amount          | number | The amount                                              |
| [].repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].fundsTransferType            | string | The funds transfer type                                 |
| [].bankReference                | string | The bank reference                                      |
| [].transferInDate               | string | The date stated on the transfer history form            |

## `GET /investors/{clientId}/transferIn/{transferInId}/summary`

```http

GET /investors/{clientId}/transferIn/{transferInId}/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalTransferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferInDate" : "2000-01-23",
  "clientId" : "clientId",
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "bankReference" : "bankReference",
  "fundsTransferType" : "fundsTransferType",
  "id" : "id"
}
```
### Description
Returns the in progress transfers in for the specified investor
### Response
| Name                         | Type   | Description                                             |
| ---------------------------- | ------ | ------------------------------------------------------- |
| id                           | string | The ID of the transfer in                               |
| clientId                     | string | The ID of client                                        |
| totalTransferAmount          | ref    | The total amount being transferred                      |
| totalTransferAmount.amount   | number | The amount                                              |
| totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| repairAmount                 | ref    | The repair amount                                       |
| repairAmount.amount          | number | The amount                                              |
| repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| fundsTransferType            | string | The funds transfer type                                 |
| bankReference                | string | The bank reference                                      |
| transferInDate               | string | The date stated on the transfer history form            |

## `GET /transferIn/deposits/{date}`

```http

GET /transferIn/deposits/{date} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalValue" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "numberCheques" : 7,
  "transfersIn" : [ {
    "clientId" : "clientId",
    "id" : "id"
  }, {
    "clientId" : "clientId",
    "id" : "id"
  } ]
}
```
### Description
Returns the transfer in cheque deposits for a given date.
### Response
| Name                   | Type    | Description                                                           |
| ---------------------- | ------- | --------------------------------------------------------------------- |
| numberCheques          | integer | The number of cheques included in the batch                           |
| totalValue             | ref     | The total value of the cheques deposited                              |
| totalValue.amount      | number  | The amount                                                            |
| totalValue.currency    | string  | The currency in ISO 4217 three character codes eg 'GBP'               |
| transfersIn            | array   |                                                                       |
| transfersIn[].id       | string  | The ID of the transfer in                                             |
| transfersIn[].clientId | string  | The ID assigned by the platform of the investor for this transfer in. |
## `GET /transferIn/open/summary`

```http

GET /transferIn/open/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "totalTransferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferInDate" : "2000-01-23",
  "clientId" : "clientId",
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "bankReference" : "bankReference",
  "fundsTransferType" : "fundsTransferType",
  "id" : "id"
} ]
```
### Description
Returns аll opened transfers in.
### Response
| Name                            | Type   | Description                                             |
| ------------------------------- | ------ | ------------------------------------------------------- |
| [].id                           | string | The ID of the transfer in                               |
| [].clientId                     | string | The ID of client                                        |
| [].totalTransferAmount          | ref    | The total amount being transferred                      |
| [].totalTransferAmount.amount   | number | The amount                                              |
| [].totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].repairAmount                 | ref    | The repair amount                                       |
| [].repairAmount.amount          | number | The amount                                              |
| [].repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].fundsTransferType            | string | The funds transfer type                                 |
| [].bankReference                | string | The bank reference                                      |
| [].transferInDate               | string | The date stated on the transfer history form            |
## `GET /isaReconciliation`

```http

GET /isaReconciliation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "clientId" : "clientId",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalAmountInvested" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
} ]
```
### Description
Returns a reconciliation summary for all investors
### Response
| Name                            | Type   | Description                                             |
| ------------------------------- | ------ | ------------------------------------------------------- |
| [].clientId                     | string | The P2PP ID for the investor                            |
| [].totalCashBalance             | ref    | The total loose cash in the ISA                         |
| [].totalCashBalance.amount      | number | The amount                                              |
| [].totalCashBalance.currency    | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].totalAmountInvested          | ref    | The total amount from the ISA that is invested in loans |
| [].totalAmountInvested.amount   | number | The amount                                              |
| [].totalAmountInvested.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].totalIsaBalance              | ref    | The total balance of the ISA                            |
| [].totalIsaBalance.amount       | number | The amount                                              |
| [].totalIsaBalance.currency     | string | The currency in ISO 4217 three character codes eg 'GBP' |

## `GET /investorReconciliation`

```http

GET /investorReconciliation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "firstName" : "firstName",
  "lastName" : "lastName",
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
} ]
```
### Description
Returns a reconciliation summary of investor name and address data
### Response
| Name                              | Type   | Description                                                                                                                                                                                        |
| --------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].clientId                       | string | The P2PP provided ID of the investor                                                                                                                                                               |
| [].firstName                      | string |                                                                                                                                                                                                    |
| [].middleName                     | string |                                                                                                                                                                                                    |
| [].lastName                       | string |                                                                                                                                                                                                    |
| [].dateOfBirth                    | string |                                                                                                                                                                                                    |
| [].nationalInsuranceNumber        | string |                                                                                                                                                                                                    |
| [].address                        | ref    |                                                                                                                                                                                                    |
| [].address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| [].address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| [].address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| [].address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| [].address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| [].address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| [].address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
| [].contactDetails                 | ref    |                                                                                                                                                                                                    |
| [].contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| [].contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |

## `GET /investors/{investorId}/transferIn/uiData`

```http

GET /investors/{investorId}/transferIn/uiData HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "apiUrl" : "apiUrl",
  "hostedUrl" : "hostedUrl",
  "styleSrc" : "styleSrc",
  "investorId" : "investorId",
  "scriptSrc" : "scriptSrc",
  "token" : "token"
}
```
### Description
Initialisation data for the Transfer In widget
### Response
| Name       | Type   | Description |
| ---------- | ------ | ----------- |
| apiUrl     | string |             |
| hostedUrl  | string |             |
| styleSrc   | string |             |
| scriptSrc  | string |             |
| investorId | string |             |
| token      | string |             |
## `GET /investors/{investorId}/transferOut`

```http

GET /investors/{investorId}/transferOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateFundsTransferred" : "2000-01-23",
  "amountToTransfer" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "isaManager" : {
    "address" : {
      "country" : "country",
      "lineTwo" : "lineTwo",
      "townCity" : "townCity",
      "postcode" : "postcode",
      "lineOne" : "lineOne",
      "lineThree" : "lineThree",
      "region" : "region"
    },
    "bankReference" : "bankReference",
    "name" : "name",
    "accountNumber" : "accountNumber",
    "sortCode" : "sortCode"
  },
  "transferDetails" : {
    "transferCurrentYearSubscriptions" : true,
    "transferAllPriorYearSubscriptions" : true,
    "transferAll" : true,
    "transferDateFromNewIsaManager" : "2000-01-23",
    "transferPriorYearSubscriptions" : true,
    "priorYearAmountToTransfer" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateTAFReceived" : "2000-01-23"
  },
  "id" : "id",
  "amountToTransferAlert" : true
} ]
```
### Description
Lists transfers out for the investor.
### Response
| Name                                                 | Type    | Description                                                                                                                                                                                        |
| ---------------------------------------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].id                                                | string  | The ID Goji assigns to the Transfer Out request.                                                                                                                                                   |
| [].isaManager                                        | ref     |                                                                                                                                                                                                    |
| [].isaManager.name                                   | string  | The name of the ISA manager.                                                                                                                                                                       |
| [].address.lineOne                                   | string  | The first line of the investor's address.                                                                                                                                                          |
| [].address.lineTwo                                   | string  | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| [].address.lineThree                                 | string  | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| [].address.townCity                                  | string  | The town of the investor's address.                                                                                                                                                                |
| [].address.region                                    | string  | The region of the investor's address.                                                                                                                                                              |
| [].address.country                                   | string  | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| [].address.postcode                                  | string  | The Post Code of the investor's address.                                                                                                                                                           |
| [].isaManager.accountNumber                          | string  | The account number to transfer the funds to.                                                                                                                                                       |
| [].isaManager.sortCode                               | string  | The sort code to transfer the funds to.                                                                                                                                                            |
| [].isaManager.bankReference                          | string  | The reference to use for the bank transfer.                                                                                                                                                        |
| [].transferDetails                                   | ref     |                                                                                                                                                                                                    |
| [].transferDetails.dateTAFReceived                   | string  | The date the transfer authority form was received from the ISA manager.                                                                                                                            |
| [].transferDetails.transferDateFromNewIsaManager     | string  | The date the ISA manager has said they will accept subscriptions from.                                                                                                                             |
| [].transferDetails.transferCurrentYearSubscriptions  | boolean | True if current year subscriptions should be transferred.                                                                                                                                          |
| [].transferDetails.transferPriorYearSubscriptions    | boolean | True if prior year subscriptions should be transferred.                                                                                                                                            |
| [].transferDetails.transferAllPriorYearSubscriptions | boolean | True if all prior year subscriptions should be transferred.                                                                                                                                        |
| [].transferDetails.transferAll                       | boolean | True if all ISA subscriptions should be transferred.                                                                                                                                               |
| [].priorYearAmountToTransfer.amount                  | number  | The amount                                                                                                                                                                                         |
| [].priorYearAmountToTransfer.currency                | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransfer                                  | ref     |                                                                                                                                                                                                    |
| [].amountToTransfer.amount                           | number  | The amount                                                                                                                                                                                         |
| [].amountToTransfer.currency                         | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransferAlert                             | boolean | True if the amount requested to be transferred cannot be satisfied. If this is true, the transfer cannot be processed until it is resolved.                                                        |
| [].dateFundsTransferred                              | string  | The date the funds were transferred to the new ISA manager.                                                                                                                                        |

## `GET /transfersOut`

```http

GET /transfersOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateFundsTransferred" : "2000-01-23",
  "amountToTransfer" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "isaManager" : {
    "address" : {
      "country" : "country",
      "lineTwo" : "lineTwo",
      "townCity" : "townCity",
      "postcode" : "postcode",
      "lineOne" : "lineOne",
      "lineThree" : "lineThree",
      "region" : "region"
    },
    "bankReference" : "bankReference",
    "name" : "name",
    "accountNumber" : "accountNumber",
    "sortCode" : "sortCode"
  },
  "transferDetails" : {
    "transferCurrentYearSubscriptions" : true,
    "transferAllPriorYearSubscriptions" : true,
    "transferAll" : true,
    "transferDateFromNewIsaManager" : "2000-01-23",
    "transferPriorYearSubscriptions" : true,
    "priorYearAmountToTransfer" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateTAFReceived" : "2000-01-23"
  },
  "id" : "id",
  "amountToTransferAlert" : true
} ]
```
### Description
Lists all transfers out for all investors.
### Response
| Name                                                 | Type    | Description                                                                                                                                                                                        |
| ---------------------------------------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].id                                                | string  | The ID Goji assigns to the Transfer Out request.                                                                                                                                                   |
| [].isaManager                                        | ref     |                                                                                                                                                                                                    |
| [].isaManager.name                                   | string  | The name of the ISA manager.                                                                                                                                                                       |
| [].address.lineOne                                   | string  | The first line of the investor's address.                                                                                                                                                          |
| [].address.lineTwo                                   | string  | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| [].address.lineThree                                 | string  | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| [].address.townCity                                  | string  | The town of the investor's address.                                                                                                                                                                |
| [].address.region                                    | string  | The region of the investor's address.                                                                                                                                                              |
| [].address.country                                   | string  | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| [].address.postcode                                  | string  | The Post Code of the investor's address.                                                                                                                                                           |
| [].isaManager.accountNumber                          | string  | The account number to transfer the funds to.                                                                                                                                                       |
| [].isaManager.sortCode                               | string  | The sort code to transfer the funds to.                                                                                                                                                            |
| [].isaManager.bankReference                          | string  | The reference to use for the bank transfer.                                                                                                                                                        |
| [].transferDetails                                   | ref     |                                                                                                                                                                                                    |
| [].transferDetails.dateTAFReceived                   | string  | The date the transfer authority form was received from the ISA manager.                                                                                                                            |
| [].transferDetails.transferDateFromNewIsaManager     | string  | The date the ISA manager has said they will accept subscriptions from.                                                                                                                             |
| [].transferDetails.transferCurrentYearSubscriptions  | boolean | True if current year subscriptions should be transferred.                                                                                                                                          |
| [].transferDetails.transferPriorYearSubscriptions    | boolean | True if prior year subscriptions should be transferred.                                                                                                                                            |
| [].transferDetails.transferAllPriorYearSubscriptions | boolean | True if all prior year subscriptions should be transferred.                                                                                                                                        |
| [].transferDetails.transferAll                       | boolean | True if all ISA subscriptions should be transferred.                                                                                                                                               |
| [].priorYearAmountToTransfer.amount                  | number  | The amount                                                                                                                                                                                         |
| [].priorYearAmountToTransfer.currency                | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransfer                                  | ref     |                                                                                                                                                                                                    |
| [].amountToTransfer.amount                           | number  | The amount                                                                                                                                                                                         |
| [].amountToTransfer.currency                         | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransferAlert                             | boolean | True if the amount requested to be transferred cannot be satisfied. If this is true, the transfer cannot be processed until it is resolved.                                                        |
| [].dateFundsTransferred                              | string  | The date the funds were transferred to the new ISA manager.                                                                                                                                        |

## `POST /investors/{investorId}/transferOut/{transferOutId}/cash`

```http

POST /investors/{investorId}/transferOut/{transferOutId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateOfTransfer" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Records the funds transfer for a Transfer Out.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| dateOfTransfer          | string | The date the funds were transferred.                    | required |
| transferAmount          | ref    | The amount transferred.                                 | required |
| transferAmount.amount   | number | The amount                                              ||
| transferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||


## `POST /investors/{investorId}/transferOut/{transferOutId}/fee`

```http

POST /investors/{investorId}/transferOut/{transferOutId}/fee HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "transferOutFee" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "transferOutFee" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferOutId" : "transferOutId"
}
```
### Description
Records that a fee related to a transfer out has been collected from an Investor's account.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| transferOutFee          | ref    | The amount of the fee.                                  | optional |
| transferOutFee.amount   | number | The amount                                              ||
| transferOutFee.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTime                | string | The date time the fee was collected.                    | optional |
### Response
| Name                    | Type   | Description                                                     |
| ----------------------- | ------ | --------------------------------------------------------------- |
| transferOutId           | string | The ID of the transfer out.                                     |
| transferOutFee          | ref    | The amount of the fee.                                          |
| transferOutFee.amount   | number | The amount                                                      |
| transferOutFee.currency | string | The currency in ISO 4217 three character codes eg 'GBP'         |
| dateTime                | string | The date time the fee was collected. Null if not collected yet. |
