# Third-Party Payouts Guide

Third-Party Payouts allows marketplaces and financial institutions (banks and payment service providers) to use TransferWise as a payout option for their customers.
It’s different from Payouts since it doesn’t require your company to be the originator of payments.
Instead, TransferWise will act as a third-party to your customers when they initiate a payment through your site.  

All the above listed payouts and account automation benefits are also true for third-party payouts service. You can build payment services to your customers on top of TransferWise payment platform that enables your customers to send cross-border payouts to 40+ currencies in 70+ countries.

In addition there will also be a dedicated account manager who will be your primary contact
to solve all questions and support issues should these arise.

Please note that subscribing to third party payouts service requires your company to complete enhanced due diligence process performed by TransferWise compliance team.
Please contact our [sales team](https://transferwise.com/gb/business/contact) for more info how to get started.

This guide is an extension to [Payouts Guide](#payouts-guide) and it only outlines small differences between creating regular transfers and creating third party transfers.
Please read through regular Payouts Guide first.  

## Differences

There are four steps to complete payouts: 

<ul>
  <li>Step 1: Create a quote</li>
  <li>Step 2: Create a recipient account</li>
  <li>Step 3: Create a transfer</li>
  <li>Step 4: Fund a transfer</li>
</ul>

The  difference compared to regular payouts is limited to using a different endpoint in **Step 3: Create a transfer**.

Instead of using  **`POST https://api.sandbox.transferwise.tech/v1/transfers`** endpoint to create transfers you need to use

**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/third-party-payments`** endpoint.

This endpoint is very similar to regular **Create transfers** endpoint, but please note these differences:
<ul>
  <li>Payment originator datablock is additionally required.</li>
  <li>originalTransferId field is being used instead of customerTransactionId</li>
</ul>

Full details how to use this endpoint can be found under API Reference section [Create Third-Party Transfers](#transfers-create-third-party-transfers).

All other functionality is available exactly same way as described under Payouts Guide above.

## Limitations

* **API only.** You can only create third party transfers via API.  Creating third party transfers via batch file upload or via transferwise.com user interface is not possible yet.
* **Email recipients are not supported.** We don't support setting up third party transfers to email recipients. You can send payments to bank accounts only.
* **Some currency routes are not supported.** Please contact our [sales team](https://transferwise.com/gb/business/contact) for details.
