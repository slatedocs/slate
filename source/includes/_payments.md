# Payments

## Acknowledge Payment Sent

We offer support for carriers to give us acknowledgement that payment has been sent to the lender. Enabling this allows us to more effectively answer questions directed at us by lenders regarding payment status. Additionally, this step can be skipped if an integration with our designated payment processing partner has been enabled.

### HTTP Request

`POST https://exapi.lossexpress.com/claims/{claimId}/payoff-sent`

### Request Body

This route accepts a JSON payload of an object comprising of:

Body Parameter | Description | Required?
-------------- | ----------- | ---------
sentTo | An object containing streetAddress, streetAddress2, city, state, and zipCode keys | N
trackingNumber | A string containing the relevant tracking number for the check | N
sentVia | A string describing how the check was sent; mailing provider if sent via mail | N
sentAt | A JSON date that the payment was sent | Y
checkAmount | An integer describing the amount sent | Y

<aside class="warning">Although fields are not required, our Claims Specialist teams request that you pass as much information as available to your systems so that they may better serve your organization.</aside>
