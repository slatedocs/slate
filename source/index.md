---
title: eDNA API Reference

language_tabs:
  - java
  - php

toc_footers:
  - eDNA API Reference Beta v1.0.5

includes:	
  - appendixA
  - appendixB
  - appendixC
  - appendixD
  - appendixE

search: true

---

# eDNA API Reference

## Transaction Evaluation

The IdentityMind Engine exports a REST based Web Service interface over HTTPS, using JSON to encode service request and response data.

A typical merchant / IdentityMind interaction to validate a transaction is shown below:

![](http://i.imgur.com/4o540Tw.png)

## Authentication

IdentityMind uses an SSL Server certificate for the client to authenticate the service.  The merchant is authenticated using HTTP basic authentication (over HTTPS) via a merchant name and password/license key that is supplied when the merchant registers for the service. 

# Payment Transaction Validation Web Service

The evidence is the payment transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, anti-fraud evaluation is more comprehensive when richer evidence is provided. 

## Arguments

The following URL can be used for requesting payment transaction anti-fraud evaluation:

[https://edna.identitymind.com/im/transaction](https://edna.identitymind.com/im/transaction)

```code
EXAMPLE SERVICE REQUEST

{ 
  “amt” : 40,
  “bc” : “Palo Alto”,
  “bco” : “US”,
  “bfn” : “James”,
  “bln” : “Dinh”,
  “bz” : “55555”,
  “bs” : “CA”,
  “bsn” : “123 anystreet”,
  “dft” : “BC”,
  “dfp” : “1872ABCD129E…”,
  “pccn” : “4513bfe30439b317d3a504ecac74858965a89ce7”,
  “pcct” : “411111XXXXXX1111”,
  “tea” : “james@gmail.com”,
  “aph” : “555555555”,
  “ip “ : “69.181.162.146”,
  “sc” : “Palo Alto”,
  “sco” : “US”,
  “sfn” : “James”,
  “sln” : “Dinh”,
  “sz” : “55555”,
  “ss” : “CA”,
  “ssn” : “123 anystreet”,
  “tid” : “89”
}
```

> The response is a JSON encoding of the IdentityMind Service result:

```code
EXAMPLE SERVICE RESPONSE DATA

{ 
  “res” : “ACCEPT”,
  “tid” : “89”,
  “transaction_status” : “complete”,
  “rcd” : “1000,100,110,151,120”,
  “frn”:”Fallthrough”,
  “frd”:”User is trusted and no fraud rules were triggered.”
}

{
  “transaction_status” : “error”,
  “error_message” : “Bad data format:Failed to parse the date string provided in the data.  Please use ISO8601 format.”
}
```

> The response includes detailed result codes and the transaction unique identifier. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured fraud policy. The keys are fully defined in *Appendix A: Result Keys and Codes*.

	<br>
	<table>
		<tr>
			<th colspan=3>Billing Name</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>bfn</td>
			<td>The first name of the billing name. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>The last name of the billing name. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Billing Address</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>bsn</td>
			<td>The billing street address, (e.g. "123 Main Street"). Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>The billing city. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>The billing state. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>The billing zip code. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is "US." Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Shipping Name</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>sfn</td>
			<td>The first name of the shipping name. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sln</td>
			<td>The last name of the shipping name. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Shipping Address</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>scomp</td>
			<td>The name of the company that is being shipped to, if any (e.g. "IdentityMind").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ssn</td>
			<td>The shipping street address (e.g. "123 Main Street"). Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sc</td>
			<td>The shipping city. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ss</td>
			<td>The shipping state. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sz</td>
			<td>The shipping zip code. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sco</td>
			<td>ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is "US." Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the consumer as seen by the merchant. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the attribute "dft"</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul> 
			Default is "BC"</td>
			<td>data</td>
		</tr>
		<tr>
			<td>blg</td>
			<td>The configured language of the browser. Typically available in the HTTP_ACCEPT_LANGUAGE header. Values are defined in ISO-639-1.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dts</td>
			<td>Third party service device token and scheme ID. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Consumer Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tea</td>
			<td>Email of the user account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, used for OAuth authentication. The content of the field is merchant defined, but the following values are recommended: 
				<ul type="disc">
					<li>facebook</li>
					<li>google</li>
					<li>twitter</li>
					<li>yahoo</li>
				Maximum length is 60 characters.</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>acd</td>
			<td>The account creation date. Either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>"acd": "2011-01-01T13:12:16+0000"</li>
					<li>"acd":1293887536</li>
					<li>"acd":"1293887536"</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>man</td>
			<td>Consumer account name/identifier. This identifier must uniquely identify the account at the merchant. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>mem</td>
			<td>DEPRECATED: <strike>email address associated to the consumer account</strike></td>
			<td>No</td>
		</tr>
		<tr>
			<td>memcd</td>
			<td>The date the account email was last changed</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ph</td>
			<td>Registered home phone number associated to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Registered mobile phone number associated to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419")</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Credit Card</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit Card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The has must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.
			</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token. Maximum length is 64 characters.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1. Maximum length is two characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcty</td>
			<td>The card type. Values are:
				<ul type="disc">
					<li>CREDIT</li>
					<li>DEBIT</li>
					<li>PREPAID</li>
					<li>UNKNOWN</li>
				</ul>
			Default is UNKNOWN
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from the PayPal Express Checkout.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated with the PayPal account. It corresponds to PayPal's "EMAIL" field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ppps</td>
			<td>Whether the user is verified or unverified. It corresponds to PayPal's "PAYERSTATUS" field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pppc</td>
			<td>Whether the address provided by the consumer matches the one registered with PayPal. Values are:
				<ul type="disc">
					<li>none</li>
					<li>confirmed</li>
					<li>unconfirmed</li>
				</ul>
			It corresponds to PayPal's "PAYMENTREQUEST n ADDRESSSTATUS" or "ADDRESSSTATUS" fields from the PayPal Express Checkout.
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout Account. It corresponds to the "email" element.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gcpe</td>
			<td>Whether the user is eligible for Google's risk information protection. It corresponds to the "eligible-for-protection" element in the "risk-information" API. Accepted value is "true" or "false." Default is "false."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gcba</td>
			<td>Age associated ot the account. It corresponds to the "buyer-account-age" element in the "risk-information" API.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Generic Financial Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>phash</td>
			<td>Account unique ID (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: This hash must be of the full account ID, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Bitcoin</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Bitcoin wallet unique ID (hash). Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>ACH</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account
			<br><br>
			<b>Note</b>: This hash must be of the full account number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Total amount for the transaction. Encoded as a string or a double. Both of the following are accepted:
				<ul type="disc">
					<li>"amt":"42.00"</li>
					<li>"amt":42.00</li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>vg</td>
			<td>Whether the transaction is associated to a virtual good (true) as opposed to a physical good (false). The default is false.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sub</td>
			<td>Whether the transaction is associated to a subscription service. The default is false.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is "USD." Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none provided. The transaction ID must be encoded as a string (e.g. "tid":"123455"). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, either as a ISO8601 encoded string or a unix timestamp.
				<ul type="disc">
					<li>“tti”: “2011-01-01T13:12:16+0000”</li>
					<li>“tti”:1293887536</li>
					<li>“tti”:”1293887536”</li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.
			<br><br>
			In addition to being an identifier used in the analysis user interface, if a custom fraud policy has been defined for a merchant with this ID, then this policy will be used in preference to the default policy.
				<ul type="disc">
					<li>"smid"="42"</li>
					<li>"smid"="Acme"</li>
				Maximum length is 255 characters.</ul>
			<br><br>
			<b>Note</b>: The value of the smid should not include the apostrophe symbol.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>smna</td>
			<td>The user-friendly name for the merchant for whom this transaction is being processed.
			<br><br>
			This name is displayed in the analysis user interface. If both "smid" and "smna" are present in a transaction, then the "smna" is preferentially displayed.
				<ul type="disc">
					<li>"smna":"Acme"</li>
				</ul>
			<br><br>
			<b>Note</b>: The value of the smna should not include the apostrophe symbol.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pzip</td>
			<td>The zip code of the point of sale device at which this transaction is being processed.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>moto</td>
			<td>The MOTO/eCommerce indicator describes the type of eCommerce transaction that is taking place.
				<ul type="disc">
					<li>" " - (space) card present</li>
					<li>"1" - one time mail / phone order</li>
					<li>"2" - recurring payment</li>
					<li>"3" - installment payment</li>
					<li>"4" - other</li>
					<li>"5" - 3D secure full</li>
					<li>"6" - 3D secure merchant</li>
					<li>"7" - eCommerce (channel encrypted)</li>
					<li>"8" - eCommerce (non-secure)</li>
				</ul>
			<br><br>
			The default is "7" if this field is not supplied.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>The affiliate signup/creation date associated with this transaction. Either an ISO8601 encoded string or UNIX timestamp.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Inline Feedback***</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Whether the gateway accepted or rejected the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>The error code fields from the authorization request as expressed by the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response_test</td>
			<td>Auth comments from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Free-form descriptive text providing addition information about the feedback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td>The AVS response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td>The CVV22 response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>The name of the payment gateway used. This information is used to interpret the result/error codes. Currently, we support:
				<ul type="disc">
					<li>"MES" - Merchant e-Solutions</li>
					<li>"GC" - Google Checkout</li>
					<li>"PPP" - PayPal Pro</li>
					<li>"PFP" - Pay Flow Pro</li>
					<li>"CDP" - Centro de Pagos</li>
					<li>"commerce" - CommerceGate</li>
					<li>"DHD" - DHD Media</li>
					<li>"IDM" - IDMPay</li>
					<li>"SC" - Safe Charge</li>
					<li>"AUTH" - Auth.net</li>
					<li>"INTERAC" - Interac</li>
					<li>"generic" - See <i>Appendix C: Generic Gateway Codes</i></li>
				</ul>
			<br><br>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data.
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td>Returned authorization code</td>
			<td>No</td>
		</tr>
	</table>

**Only one payment instrument is required. eDNA supports credit card, PayPal, and Google Checkout.*

***Inline feedback elements provide the results from the gateway call at the same time the payment transaction is being passed for anti-fraud evaluation. Inline feedback is only applicable when the anti-fraud evaluation is performed after the merchant receives the information from the gateway.*

**Note**: The clear text credit card number is never sent to IdentityMind. Instead, IdentityMind uses a cryptographically secure hash to have a unique representation of each credit card. IdentityMind provides the required utilities to generate these hashes.

# Chargeback Notification

Notifies that a chargeback occurred on a transaction. Note that the transaction may be either a Payment Transaction or an Account Transfer.

In the case of a chargeback on a transaction that eDNA has not previously processed then the Payment Instrument information is required.

## Arguments

The following URL can be used for requesting chargeback notification evaluation:

[https://edna.identitymind.com/im/jax/chargeback/](https://edna.identitymind.com/im/jax/chargeback/)

```code
EXAMPLE SERVICE REQUEST

{
     “amt”: 250,
     “cbtype”: “DEBIT”,
     “pccn”: “DNsxhwmQCWeC5gPxTOwPRZlFfx”,
     “pcct”: “401201XXXXXX1110”,
     “tid”: “9900040”
}
```

> The response contains a JSON encoded message or error message:

```code
EXAMPLE SERVICE RESPONSE DATA

{
  “message”: “credit notification accepted”
}

or 

{
  “error_message”: “A JSONObject text must begin with ‘{‘ at character 1”
}
```
	<br>
	<table>
		<tr>
			<th colspan=3>Chargeback</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Amount of the chargeback</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is "USD." Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>This should be used to pass the reason code for the chargeback. For a full set of reason codes as defined by the card brands, click [here](https://www.merchantconnect.com/CWRWeb/pdf/chargeback_reason_codes.pdf).</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing the reason for refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>cbtype</td>
			<td>The chargeback type:
				<ul type="disc">
					<li>DEBIT</li>
					<li>CREDIT</li>
					<li>REPRESENTMENT</li>
					<li>REVERSAL</li>
				</ul>
			The default is "DEBIT" if not provided.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>cbdate</td>
			<td>Date of the chargeback action. For example, if the cbtype is "CREDIT," then the date field should be the date that the "CREDIT" happens. The format of the value for this field is either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>“cbdate”: “2011-01-01T13:12:16+0000”</li>
					<li>“cbdate”:1293887536</li>
					<li>“cbdate”:”1293887536”</li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>authdate</td>
			<td>Date of the original authorization transaction. The format of the value for this field is either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>“authdate”: “2011-01-01T13:12:16+0000”</li>
					<li>“authdate”:1293887536</li>
					<li>“authdate”:”1293887536”</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>The name of the payment gateway used. This information is used to interpret the result/error codes. Currently, we support:
				<ul type="disc">
					<li>"MES" - Merchant e-Solutions</li>
					<li>"GC" - Google Checkout</li>
					<li>"PPP" - PayPal Pro</li>
					<li>"PFP" - Pay Flow Pro</li>
					<li>"CDP" - Centro de Pagos</li>
					<li>"commerce" - CommerceGate</li>
					<li>"DHD" - DHD Media</li>
					<li>"IDM" - IDMPay</li>
					<li>"SC" - Safe Charge</li>
					<li>"AUTH" - Auth.net</li>
					<li>"INTERAC" - Interac</li>
					<li>"generic" - See Appendix C)</li>
				</ul>
			<br><br>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data. 
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. "tid":"123455"). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Sub Merchant</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.
			<br><br>
			<b>Note</b>: The value of the smid should not include the apostrophe symbol. Maximum length is 255 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Credit Card</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token. Maximum length is 64 characters.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1. Maximum length is two characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcty</td>
			<td>The card type. Values are:
				<ul type="disc">
					<li>CREDIT</li>
					<li>DEBIT</li>
					<li>PREPAID</li>
					<li>UNKNOWN</li>
				</ul>
			Default is UNKNOWN</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pccn2</td>
			<td>Hash of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.
			<br><br>
			<b>Note</b>: The has must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct2</td>
			<td>Token of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ric2</td>
			<td>The issuer country of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported. The country code is the two letter abbreviation as defined in ISO-3166-1. Maximum length is two characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcty2</td>
			<td>The type of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.
				<ul type="disc">
					<li>CREDIT</li>
					<li>DEBIT</li>
					<li>PREPAID</li>
					<li>UNKNOWN</li>
				</ul>
			Default is UNKNOWN</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from PayPal Express Checkout.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's "EMAIL" field from PayPal Express Checkout.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It corresponds to the "email" element.</td>
			<td>No</td>
		</tr>
	</table>

# Credit Notification

Notifies that a credit occurred on a transaction. 
 
**Note**: The transaction may either be a payment transaction or an account transfer. 

In the case of credit or blind credit on a transaction that eDNA has not previously processed, then the payment instrument information is required.

## Arguments

The following URL can be used for credit notification evaluation:

[https://edna.identitymind.com/im/jax/credit/](https://edna.identitymind.com/im/jax/credit/)

```code
EXAMPLE SERVICE REQUEST

{
     “amt”: 10.4,
     “pccn”: “DNsxhwmQCWeC5gPxTOwPRZlFfx”,
     “pcct”: “401201XXXXXX1110”,
     “tid”: “988833” 
}
```

> The response contains a JSON encoded message or error message:

```code
EXAMPLE SERVICE RESPONSE DATA

{
  “message”: “credit notification accepted”
}

or 

{
  “error_message”: “A JSONObject text must begin with ‘{‘ at character 1”
}
```
	<br>
	<table>
		<tr>
			<th colspan=3>Credit</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Amount of the credit</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is "USD." Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing the reason for the credit</td>
			<td>No</td>
		</tr>
		<tr>
			<td>crdate</td>
			<td>Date of the credit action. The format of the value for this field is either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>“crdate”: “2011-01-01T13:12:16+0000”</li>
					<li>“crdate”:1293887536</li>
					<li>“crdate”:”1293887536”</li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. "tid":"123455"). Maximum length is 40 characters.
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Sub Merchant</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed. Maximum length is 255 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Credit Card</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate the hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate the token. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1. Maximum length is two characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcty</td>
			<td>The card type. Values are:
				<ul type="disc">
					<li>CREDIT</li>
					<li>DEBIT</li>
					<li>PREPAID</li>
					<li>UNKNOWN</li>
				</ul>
			Default is UNKNOWN</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from PayPal Express Checkout.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's "EMAIL" field from the PayPal Express Checkout</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It corresponds to the "email" element.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Generic Financial Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>phash</td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
	</table>


# Feedback: Transaction Neutral/Refund Notification

Notifies that a refund occurred on a transaction. All arguments are optional. 

**Note**: The transaction may be either a payment transaction or an account transfer.

## Arguments

The transaction ID is part of the URL. The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud)
 
```code
EXAMPLE SERVICE REQUEST

{
    “amt”: 0.25,
    “auth_response”: “rejected”,
    “auth_response_text”: “Transaction already refunded”,
    “error_code”: “206”,
    “reason”: “Suspected friendly fraud”,
    “tid”: “42”
}
```

> The response contains a JSON encoded message or error message:

```code
EXAMPLE SERVICE RESPONSE DATA

{
    “message”: “Feedback accepted for REFUND_FRAUD feedback on transaction 42”
}
```

	<table>		
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Amount of the refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Text describing response code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>Error code from the gateway, if any</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing reason for refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bank_status</td>
			<td>The status of the transaction at the gateway/bank:
				<ul type="disc">
					<li>"a" - auth_only</li>
					<li>"c" - captured</li>
					<li>"d" - declined</li>
					<li>"v" - void</li>
					<li>"r" - refund</li>
					<li>"b" - chargeback</li>
					<li>"u" - unknown</li>
				</ul>
			Default is "u"
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Transaction ID. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>

# Feedback: Final Payment Transaction Result

## Arguments

The following URLs are used to notify IdentityMind of the acceptance or rejection of the transaction that was previously analyzed with the given transaction ID by the merchant's payment gateway or the merchant themselves. All arguments are optional. The transaction ID is part of the URL.

### Bank Authorization Feedback

[https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-accepted](https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-accepted)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-rejected](https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-rejected)

### Merchant Final Resolution Feedback

[https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted](https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected](https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-ok](https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-ok) 

[https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-user-validated](https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-user-validated)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-user-failed-validation](https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-user-failed-validation)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-default](https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-default) 

[https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-default](https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-default)

**Note**: The transaction may be a payment transaction or an account transfer.

```code
EXAMPLE SERVICE REQUEST

{
  “auth_code”: “T1627H”,
  “auth_response_text”: “Decline”,
  “avs_result”: “Y”,
  “error_code”: “05”
}
```

> The response contains a JSON encoded message or error message:

```code
EXAMPLE SERVICE RESPONSE DATA

{
  “message”: “Feedback accepted for ACCEPT feedback on transaction 42”
}
```

	<table>		
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Whether the gateway accepted or rejected the transaction</td>
			<td>No</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>The error code fields from the authorization request as expressed by the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Auth comments from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Free-form descriptive text providing additional information about the feedback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td>The AVS response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td>The CVV2 response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>The name of the payment gateway used. This information is used to interpret the result/error codes. Currently, we support:
				<ul type="disc">
					<li>"MES" - Merchant e-Solutions</li>
					<li>"GC" - Google Checkout</li>
					<li>"PPP" - PayPal Pro</li>
					<li>"PFP" - Pay Flow Pro</li>
					<li>"CDP" - Centro de Pagos</li>
					<li>"commerce" - CommerceGate</li>
					<li>"DHD" - DHD Media</li>
					<li>"IDM" - IDMPay</li>
					<li>"SC" - Safe Charge</li>
					<li>"AUTH" - Auth.net</li>
					<li>"INTERAC" - Interac</li>
					<li>"generic" - See Appendix C)</li>
				</ul>
			<br><br>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data. </td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td>Returned authorization code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bank_status</td>
			<td>The status of the transaction at the gateway/bank:
				<ul type="disc">
					<li>"a" - auth_only</li>
					<li>"c" - captured</li>
					<li>"d" - declined</li>
					<li>"v" - void</li>
					<li>"r" - refund</li>
					<li>"b" - chargeback</li>
					<li>"u" - unknown</li>
				</ul>
			Default is "u"</td>
			<td>No</td>
		</tr>
	</table>


# Transaction Monitoring: Account Transfer Validation Web Service

The evidence is the account transfer transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

## Arguments

The following URLs are used for account transaction validation:

Validate an external transfer (deposit) into an account:<br>
[https://edna.identitymind.com/im/account/transferin](https://edna.identitymind.com/im/account/transferin) (POST)

Validate an internal transfer between accounts:<br>
[https://edna.identitymind.com/im/account/transfer](https://edna.identitymind.com/im/account/transfer) (POST)

Validate an external transfer (withdrawal) from an account:<br>
[https://edna.identitymind.com/im/account/transferout](https://edna.identitymind.com/im/account/transferout) (POST)

```code
EXAMPLE SERVICE REQUEST

https://edna.identitymind.com/im/account/transfer   

{ 
  “man” : “jdinh”,
  “soc” : “facebook”
  “tea” : “james@gmail.com”,
  “bc” : “Palo Alto”,
  “bco” : “US”,
  “bfn” : “James”,
  “bln” : “Dinh”,
  “bz” : “55555”,
  “bs” : “CA”,
  “bsn” : “123 anystreet”,
  “dft” : “BC”,
  “dfp” : “1872ABCD129E…”,
  “ip “ : “69.181.162.146”,
  “tid” : “89”,
  “pbc” : “792019bcc…”,
  “ptoken”  : “356007XXXXXX000e”,
  “dpbc” : “8ad0e8859…”,
  “dptoken”  : “517074XXXXXX000e”,
}
```

> The response is a JSON encoding of the IdentityMind Service result:

```code

EXAMPLE SERVICE RESPONSE DATA

{ 
  “res” : “ACCEPT”,
  “erd” : “Validated User”,
  “tid” : “89”,
  “rcd” : “1000,100,110,151,120”,
  “frn” : ”Fallthrough”,
  “usc” : 43,
  "umrs":1372723453000,
  "ufs":1372101668000,
  “frd”:”User is trusted and no fraud rules were triggered.”
}

{
  “res” : “ERROR”,
  “error_message” : “Bad data format:Failed to parse the date string provided in the data.  Please use ISO8601 format.”
}
```
> The response includes detailed result codes and the transaction unique identifier. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured validation policy. The keys are fully defined in *Appendix A: Result Keys and Codes*.

	<br>
	<table>
		<tr>
			<th colspan=3>User Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>man</td>
			<td>Free form unique identifier for the account at this merchant. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, and is used for Oauth authentication. The following values are recommended:
				<ul type:"disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				Maximum length is 60 characters.</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ph</td>
			<td>Home phone on record. A landline phone number that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Mobile phone on record. A mobile phone number that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>hiv</td>
			<td>The account is a high value account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clat”:“37.4419”)</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clong”:“-122.1419”)</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Billing Address</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>bfn</td>
			<td>First name associated with the payment/funding account. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>Last name associated with the payment/funding account. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td>Street address associated with the payment/funding account. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>City associated with the payment/funding account. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>State associated with the payment/funding account Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>Zip code associated with the payment/funding account. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>Country associated with the payment/funding account. Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the "dft" attribute.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dts</td>
			<td>Third party service device token and scheme identifier. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Payment</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit/debit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>phash</td>
			<td>Acount unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. This attribute is used in conjunction with "phash," "pbc," and "pach." Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Txn</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC encoded as a UNIX timestamp.
				<ul type="disc">
					<li>“tti”:1293887536</li>
					<li>“tti”:”1293887536”</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none provided. The transaction ID must be encoded as a string (e.g. "tid":"123455"). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>The affiliate signup/creation date associated with this transaction. Either an ISO8601 encoded string or UNIX timestamp.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>memo</td>
			<td>Free form text memo field</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transfer Destination</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>dman</td>
			<td>Free form unique identifier for the destination account at this merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>demail</td>
			<td>Email address associated with the destination account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dph</td>
			<td>Phone number associated with the destination account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>amt</td>
			<td>If this transaction is a transfer, the amount being transferred.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>If this transaction is a transfer, the currency of the "amt" field being transferred. Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpccn</td>
			<td>Unique identifier (hash) of the destination credit card while obscuring the actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpppi</td>
			<td>Destination PayPal Payer ID</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpppe</td>
			<td>Destination PayPal Payer email</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpbc</td>
			<td>Hash of the unique identifier for the destination Bitcoin wallet ID</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dpach</td>
			<td>Hash of the unique identifier of the destination ACH account
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dphash</td>
			<td>Unique identifier (hash) of the destination payment instrument while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dptoken</td>
			<td>A masked or tokenized version of the destination payment instrument number. IdentityMind will supply procedure to generate token. This field is used in conjunction with "dpbc," "dpach," and "dptoken."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sfn</td>
			<td>The first name of the recipient. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sln</td>
			<td>THe last name of the recipient. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ssn</td>
			<td>The recipient street address (e.g. "123 Main St"). Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sc</td>
			<td>The recipient city. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ss</td>
			<td>The recipient state. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sz</td>
			<td>The recipient zip code. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sco</td>
			<td>ISO 3166 country code of the recipient address of the transaction, encoded as a string. Default is "US." Maximum length is three characters.</td>
			<td>No</td>
		</tr>
	</table>

# KYC - Merchant: Merchant Application Validation Web Service

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

## Reseller Only Feature: How to associate a merchant with its owners

Each merchant can be associated with one or more owners.  The merchant will be evaluated with the Merchant Application Web Service.  One can provide an application ID (tid in the Request API), or extract this ID from the Response.

Each owner will be evaluated with the Consumer Application Web Service.  In the Consumer Application request, the merchantAid must be set to the value of the application ID of the Merchant Application.  This will link the merchant to all of its owners. 

![](http://i.imgur.com/rO16Xdb.png)

## Arguments

The following URLs are used for merchant application validation:

Validate a merchant application:<br>
[https://edna.identitymind.com/im/account/merchant](https://edna.identitymind.com/im/account/merchant) (POST)


Retrieve the current state of a merchant application:<br>
[https://edna.identitymind.com/im/account/merchant/<tid>](https://edna.identitymind.com/im/account/merchant/<tid>) (GET)

> The response is a JSON encoding of the IdentityMind Service result:

```code
EXAMPLE SERVICE RESPONSE DATA

{
    "mtid": "eDNABlackListFail",
    "state": "R",
    “merchantAPIName”:“joseshoe”,
    “ownerApplicationIds”:[
        	“consumerapp001”,
        	“consumerapp002”,
	        “consumerapp003”
    ]

    "merchantApplicationResponse": {
        "erd": "Bad User",
        "frd": "1414110157324_accountname in black list.  Added from a test player file",
        "frn": "Account Black List",
        "rcd": "50003,202,111,101,132,10020",
        "res": "DENY",
        "tid": "eDNABlackListFail",
        "ufs": 1414110157000,
        "umrs": 1414110157000,
        "upr": "UNKNOWN",
        "usc": 0,
        "user": "BAD"
    },
    "ednaScoreCard": {
        "tr": [
            {
                "testCategory": "eDNA",
                "testDescription": "Informational -- It displays the number of payment instruments associated with the applicant's device.",
                "testId": "ed:14",
                "testName": "Device Payment Count",
                "testResult": "0"
            },
            {
                "testCategory": "Device",
                "testDescription": "Checks whether the device is currently using an anonymous proxy.  It fails when an anonymous proxy is being used.",
                "testDetails": "The device is not currently using an anonymous proxy",
                "testId": "bc:1",
                "testName": "BlueCava: Using Anonymous Proxy",
                "testPass": true
            },
        ]
    },
} 
```

> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*. Parameters that are not defined here but appearing in the Request API will be categorized as custom data and can be displayed on the UI as proprietary information for the merchant.

	<br>
	<table>
		<tr>
			<th colspan=3>Application</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tid</td>
			<td>Unique application identifier. The system will assign one if not provided. It is recommended to pass one if needed to be correlated to client's backend system. The tid must be encoded as a string (e.g. "tid":"123455"). The tid is used to combine the multiple stages of an application. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Company</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amn</td>
			<td>Legal name of the company</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>dba</td>
			<td>Doing business as</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ataxid</td>
			<td>The merchant's tax ID</td>
			<td>Yes, unless SSN is provided</td>
		</tr>
		<tr>
			<td>assn</td>
			<td>The merchant's social security number</td>
			<td>Yes, unless tax ID is provided</td>
		</tr>
		<tr>
			<td>giin</td>
			<td>The merchant's Guild Intermediary Identification Number. GIIN is a 19 character number that uniquely identifies an entity as having registered with the IRS for purposes of FATCA</td>
			<td>No</td>
		</tr>
		<tr>
			<td>businesstype</td>
			<td>Business type. Possible values are:
				<ul type="disc">
					<li>corporation - Corporation</li>
					<li>llc - LLC</li>
					<li>partnership - Partnership</li>
					<li>individual - Individual/Sole Proprietorship</li>
					<li>nonprofit - Nonprofit</li>
					<li>foreigncorp - Foreign corporation</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>afn</td>
			<td>The first name of the contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aln</td>
			<td>The last name of the contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aph</td>
			<td>The merchant's business phone number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>asn</td>
			<td>The merchant's street address</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ac</td>
			<td>The merchant's city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>as</td>
			<td>The merchant's state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>az</td>
			<td>The merchant's zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aco</td>
			<td>The merchant's country</td>
			<td>No</td>
		</tr>
		<tr>
			<td>mcc</td>
			<td>Merchant Category Code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>Credit card number. Maximum length is 64 characters.</td>
			<td>Yes, if pccn is provided</td>
		</tr>
		<tr>
			<td>bankaccounttype</td>
			<td>Bank account type. Valid values are:
				<ul type="disc">
					<li>checking</li>
					<li>saving</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ccaccept</td>
			<td>Credit card. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ppaccept</td>
			<td>PayPal. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>achaccept</td>
			<td>ACH. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bitcoinaccept</td>
			<td>Bitcoin. Boolean</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li>"tti":129887536</li>
					<li>"tti":"129887536"</li>
				</ul>
			If not supplied, eDNA will assign the time at which it receives the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Stage of the application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Group</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>merchantgroup</td>
			<td>IDM merchant aggregation that defines KYC configuration and monitoring thresholds</td>
			<td>No</td>
		</tr>
	</table>


# KYC - Consumer: Consumer Application Validation Web Service

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

## Arguments

The following URLs are used for consumer application validation:

Validate a consumer application:<br>
[https://edna.identitymind.com/im/account/creation](https://edna.identitymind.com/im/account/creation) (POST)

Retrieve the current state of a consumer application:<br>
[https://edna.identitymind.com/im/account/creation/<tid>](https://edna.identitymind.com/im/account/creation/<tid>) (GET)

```code
> The response is a JSON encoding of the IdentityMind Service result:   

EXAMPLE SERVICE RESPONSE DATA

{
    "mtid": "consumerUIWalkthrough",
    "state": "A",
    "merchantApplicationResponse": {
        "erd": "Unknown User",
        "frd": "No fraud rules triggered.",
        "frn": "Account Fallthrough",
        "rcd": "50005,202,111,101,121,131,10000",
        "res": "ACCEPT",
        "tid": "consumerUIWalkthrough",
        "ufs": 1414122024000,
        "umrs": 1414122024000,
        "upr": "UNKNOWN",
        "usc": 0,
        "user": "UNKNOWN"
    },
    “parentMerchant”:”eDNABlackListFail”,
    "ednaScoreCard": {
        "tr": [
                  {
                "testCategory": "Identity",
                "testDescription": "Checks whether the address is risky: prisons, warehouses, hospitals, universities, etc.\nIt fails if the address is high risk.",
                "testId": "id:7",
                "testName": "IDology ExpectID: Warm Address",
                "testPass": true
            },
            {
                "testCategory": "Device",
                "testDescription": "Checks whether the device is currently using an anonymous proxy.  It fails when an anonymous proxy is being used.",
                "testDetails": "The device is not currently using an anonymous proxy",
                "testId": "bc:1",
                "testName": "BlueCava: Using Anonymous Proxy",
                "testPass": true
            },
            {
                "testCategory": "eDNA",
                "testDescription": "Checks the number of applications for a particular funding payment instrument.\nIt fails when the number of applications is higher than the configured threshold.",
                "testDetails": "0",
                "testId": "ed:5",
                "testName": "Payment Instrument Application Count",
                "testPass": true
            },
        ]
    },
}
```
> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

	<br>
	<table>
		<tr>
			<th colspan=3>User</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>bfn</td>
			<td>The first name of the individual opening the account. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>The last name of the individual opening the account. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>man</td>
			<td>Free form unique identifier for this account at this merchant. Maximum length is 60 characters.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site; in particular, that it is used for Oauth authentication. The content of the field is merchant defined, but the following values are recommended:
				<ul type="disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				Maximum length is 60 characters.</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dob</td>
			<td>The date of birth of the individual opening the account. Format is ISO8601 (e.g. 1984-01-21).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>phn</td>
			<td>Customer's primary phone number. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Cstomer's mobile phone number. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>scanData</td>
			<td>If using Jumio NetVerify Perform, the document front side image data, Base64 encoded. If provided, this will override the configured "Jumio client integration." 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>backsideImageData</td>
			<td>If using Jumio NetVerify Perform, the document back side image data, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>faceImageData</td>
			<td>If using Jumio NetVerify Perform with face match enabled, the face image file, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the "dft" attribute</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type"disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Payment/Funding Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit/debit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>phash</td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account ID, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td>Payment street address. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>Payment city. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>Payment state Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>Payment zip code. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>Payment country. Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li>“tti”:129887536</li>
					<li>“tti”:“129887536”</li>
				</ul>
			If not supplied, eDNA will assign the time at which it receives the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Unique identifier for the application. eDNA assigns an internal ID if none is provided. The tid must be encoded as a string (e.g. "tid":"123455"). The tid is used to combine the multiple stages of an application. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>The signup/creation date of the affiliate associated with this transaction. Either an ISO8601 encoded string or a UNIX timestamp.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>memo</td>
			<td>Free form text memo field</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Merchant</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>merchantAid</td>
			<td>If this consumer is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant (see tid in the Merchant Application API below)</td>
			<td>No</td>
		</tr>
		<tr>
			<td>personalguarantee</td>
			<td>Personal guarantee. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ownership</td>
			<td>The percentage of ownership</td>
			<td>No</td>
		</tr>
		<tr>
			<td>title</td>
			<td>Title of the owner</td>
			<td>No</td>
		</tr>
	</table>

# Quiz Response (IDAnalytics)

The response to this request is an application response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of “challenge” questions that should once again be passed back to the consumer for answers.

The following URLs are used to return a customer’s response to a set of out of wallet questions returned either by a merchant or consumer application respectively:

[https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse](https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse) (POST)

[https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse](https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse) (POST)

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The encoding is in JSON as shown below. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse

{
   "answers":[
      {
         "questionId":"0",
         "choice":"KERRVILLE"
      },
      {
         "questionId":"1",
         "choice":"DICK"
      },
      {
         "questionId":"2",
         "choice":" None of the above "
      },
      {
         "questionId":"3",
         "choice":"MUNSTER"
      }
   ]
}
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Answers Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers</td>
			<td>JSON Array of JSON encoded answer objects</td>
		</tr>
		<tr>
			<td>questionId</td>
			<td>Integer identifier for this question. This value maps to the question within the question data.</td>
		</tr>
		<tr>
			<td>choice</td>
			<td>Text of the answer that was selected by the consumer</td>
		</tr>
	</table>


# Quiz Response (Phone Validation)

The response to this request is an application response containing the newly updated application.

The following URLs are used to return a customer’s response to a phone validation request:

[https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse](https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse) (POST)

[https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse](https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse) (POST)

> The body of the request contains an encoding of the customer’s code response. The encoding is in JSON as shown below. The answers are processed and the response is used to update the Phone Ownership Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse


{
   "smsCode":”1234”
}
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Answers Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>smsCode</td>
			<td>The response code provided by the consumer. Encoded as a string</td>
		</tr>
	</table>

# Document Validation Request

The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

The following URLs are used to initiate a Jumio Netverify Multi Document transaction for a Consumer or Merchant application:

[https://edna.identitymind.com/im/account/merchant/<appid>/document](https://edna.identitymind.com/im/account/merchant/<appid>/document)  (POST)

[https://edna.identitymind.com/im/account/consumer/<appid>/document](https://edna.identitymind.com/im/account/consumer/<appid>/document)  (POST)

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/consumer/743567/document 

{
   "documentTypeCode”:”CC”
}


EXAMPLE SERVICE RESPONSE DATA

{
    "authorizationToken”:”f9d32f46-8f11-4b7c-b146-6d7a95aa765f”
}
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Request Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>documentTypeCode</td>
			<td>One of the following document type codes:
				<ul type="disc">
					<li>BS - Bank statement</li>
					<li>CC - Credit card</li>
					<li>IC - Insurance card</li>
					<li>UB - Utility bill</li>
					<li>CAAP - Cash advance application</li>
					<li>CRC - Corporate resolution certificate</li>
					<li>CCS - Credit card statement</li>
					<li>LAG - Lease agreement</li>
					<li>LOAP - Loan application</li>
					<li>MOAP - Mortgage application</li>
					<li>TR - Tax return</li>
					<li>VT - Vehicle title</li>
					<li>VC - Voided check</li>
					<li>STUC - Student card</li>
					<li>HCC - Healthcare card</li>
					<li>CB - Council bill</li>
					<li>SENC - Seniors card</li>
					<li>MEDC - Medicare card</li>
					<li>BC - Birth certificate</li>
					<li>USSS - US social security card</li>
					<li>WWCC - Working with children check</li>
					<li>SS - Superannuation statement</li>
					<li>TAC - Trade associated card</li>
					<li>SEL - School enrollment letter</li>
					<li>PB - Phone bill</li>
				</ul>
			This key is required and is encoded as a string.
			</td>
		</tr>
	</table>	
	<table>
		<tr>
			<th colspan=2>JSON Response Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>authorizationToken</td>
			<td>The token that is to be provided to the Jumio NetVerify client widget</td>
		</tr>
	</table>

# Feedback: Final Application Result

All arguments are optional, although a JSON object must be provided.

## Arguments

The following URLs are used to notify IdentityMind of the acceptance or rejection of an application by the merchant:

[https://edna.identitymind.com/im/account/consumer/<application_ID>/accepted](https://edna.identitymind.com/im/account/consumer/<application_ID>/accepted) (POST)

[https://edna.identitymind.com/im/account/consumer/<application_ID>/rejected](https://edna.identitymind.com/im/account/consumer/<application_ID>/rejected) (POST)

[https://edna.identitymind.com/im/account/merchant/<application_ID>/accepted](https://edna.identitymind.com/im/account/merchant/<application_ID>/accepted) (POST)

[https://edna.identitymind.com/im/account/merchant/<application_ID>/rejected](https://edna.identitymind.com/im/account/merchant/<application_ID>/rejected) (POST)

```code
EXAMPLE SERVICE REQUEST

{
  “reason”: “0”,
  “description”: “I like this application”,
	  “validate”: true
}

or

{}
```

> The response contains a JSON encoded message or error message.

```code
{
  “message”: “Accepted application”
}
```
	<br>
	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>reason</td>
			<td>Free form code. Up to 4 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Free form descriptive text providing additional information about the feedback. Up to 255 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>validate</td>
			<td>Whether the user defined in the application should be validated. Encoded as a boolean.
			<br><br>
			For a rejected application, the property is interpreted as whether to mark the applicant as having failed validation.
			<br><br>
			Defaults to false</td>
			<td>No</td>
		</tr>
	</table>


# Login Annotation Web Service

The evidence is the login transaction data to be added to the entities transaction record. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided.

## Arguments

The following URLs are used for account login transactions:

Annotate a user's transactions with login data:<br>
[https://edna.identitymind.com/im/account/login](https://edna.identitymind.com/im/account/login) (POST)

```code
EXAMPLE SERVICE REQUEST

https://edna.identitymind.com/im/account/login   

{ 
  “man” : “jdinh”,
  “soc” : “facebook”
  “tea” : “james@gmail.com”,
  “dft” : “BC”,
  “dfp” : “1872ABCD129E…”,
  “ip “ : “69.181.162.146”,
  “tid” : “89”
}
```

> The response is a JSON encoding of the IdentityMind service result. The response includes detailed result codes and transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

```code
EXAMPLE SERVICE RESPONSE DATA

{ 
  “res” : “ACCEPT”,
  “erd” : “Validated User”,
  “tid” : “89”,
  “rcd” : “1000,100,110,151,120”,
  “frn” : ”Fallthrough”,
  “usc” : 43,
  “ufs” : 1372101668000,
  “umrs” : 1371231456000,
  “frd”:”User is trusted and no fraud rules were triggered.”
}
```
	<br>
	<table>
		<tr>
			<th colspan=3>User Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>man</td>
			<td>Free form unique identifier for the account at this merchant. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site; in particular, that it is used for Oauth authentication. The content of the field is merchant defined, but the following values are recommended:
				<ul type="disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				Maximum length is 60 characters.</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clat”:“37.4419”).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clong”:“-122.1419”).</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of hte "dft" attribute.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dts</td>
			<td>Third party service device token and scheme identifier. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Txn</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li>“tti”:129887536</li>
					<li>“tti”:“129887536”</li>
				</ul></td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none is provided. The transaction ID must be encoded as a string (e.g. "tid":"123455"). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>

<link rel="icon" href="http://www.identitymindglobal.com/wp-content/uploads/2013/05/Favicon.png" type="image/png">