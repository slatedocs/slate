---
title: eDNA API Reference

language_tabs:
  - java
  - javascript
  - php
  - python
  - ruby
  - shell

toc_footers:
  - placeholder

search: true
---

# Welcome

placeholder

# Transaction Evaluation

The IdentityMind Engine exports a REST based Web Service interface over HTTPS, using JSON to encode service request and response data.

A typical Merchant / IdentityMind interaction to validate a transaction is shown below:


![](http://i.imgur.com/UwJEaJZ.png)

## Authentication

IdentityMind uses an SSL Server certificate for the client to authenticate the service.  The merchant is authenticated using HTTP basic authentication (over HTTPS) via a merchant name and password/license key that is supplied when the merchant registers for the service. 

# Payment Transaction Validation Web Service

The evidence is the payment transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, anti-fraud evaluation is more comprehensive when richer evidence is provided. 

## Arguments

> [This URL](https://edna.identitymind.com/im/transaction) can be used for requesting payment transaction anti-fraud evaluation.

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
> The response is a JSON encoding of the IdentityMind Service result. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured fraud policy. 
>
> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

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
	<table>
		<tr>
			<th colspan=4><h3>Billing Name</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>First Name</td>
			<td>bfn</td>
			<td>The first name of the billing name.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>bln</td>
			<td>The last name of the billing name.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Billing Address</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Street</td>
			<td>bsn</td>
			<td>The billing street address, (e.g. "123 Main Street")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>City</td>
			<td>bc</td>
			<td>The billing city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>State</td>
			<td>bs</td>
			<td>The billing state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Zip</td>
			<td>bz</td>
			<td>The billing zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Country</td>
			<td>bco</td>
			<td>ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is "US"</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Shipping Name</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>First Name</td>
			<td>sfn</td>
			<td>The first name of the shipping name</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>sln</td>
			<td>The last name of the shipping name</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Shipping Address</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Company</td>
			<td>scomp</td>
			<td>The name of the company that is being shipped to, if any (e.g. "IdentityMind")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Street</td>
			<td>ssn</td>
			<td>The shipping street address (e.g. "123 Main Street")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>City</td>
			<td>sc</td>
			<td>The shipping city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>State</td>
			<td>ss</td>
			<td>The shipping state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Zip</td>
			<td>sz</td>
			<td>The shipping zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Country</td>
			<td>sco</td>
			<td>ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is "US"</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Device</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Received IP Address</td>
			<td>ip</td>
			<td>The IP address of the consumer as seen by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint</td>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the attribute "dft"</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint Type</td>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to genereate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul> 
			Default is "BC"</td>
			<td>data</td>
		</tr>
		<tr>
			<td>Browser Language</td>
			<td>blg</td>
			<td>The configured language of the browser. Typically available in the HTTP_ACCEPT_LANGUAGE header. Values are defined in ISO-639-1.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Token and Scheme</td>
			<td>dts</td>
			<td>Third party service token and scheme identified. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Consumer Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Transaction Email Address</td>
			<td>tea</td>
			<td>Email of the user account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Social Authentication</td>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, used for OAuth authentication. The content of the field is merchant defined, but the following values are recommended: 
				<ul type="disc">
					<li>facebook</li>
					<li>google</li>
					<li>twitter</li>
					<li>yahoo</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Creation Date</td>
			<td>acd</td>
			<td>The date on which the account was initially created by the consumer. Either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>"acd": "2011-01-01T13:12:16+0000"</li>
					<li>"acd":1293887536</li>
					<li>"acd":"1293887536"</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Name</td>
			<td>man</td>
			<td>Consumer account identifier. This identifier must uniquely identify the account at the merchant.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Email</td>
			<td>mem</td>
			<td>DEPRECATED: <strike>email address associated to the consumer account</strike></td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Email Last Change</td>
			<td>memcd</td>
			<td>Date on which the account email was last changed</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Home Phone</td>
			<td>ph</td>
			<td>Registered home phone number associated to the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Mobile Phone</td>
			<td>pm</td>
			<td>Registered mobile phone number associated to the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Consumer Location - Latitude</td>
			<td>clat</td>
			<td>The current latitude of the customer specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Customer Location - Longitude</td>
			<td>clong</td>
			<td>The current longitude of the customer specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419")</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Credit Card</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Number Hash</td>
			<td>pccn</td>
			<td>Credit Card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The has must be of the full card number, not a masked or tokenized representation.
			</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>Number Token</td>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Issuer Country</td>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Type</td>
			<td>pcty</td>
			<td>Type of card:
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
			<th colspan=4><h3>PayPal</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from the PayPal Express Checkout.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>pppe</td>
			<td>Email address associated with the PayPal account. It corresponds to PayPal's "EMAIL" field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Status</td>
			<td>ppps</td>
			<td>Whether the user is verified or unverified. It corresponds to PayPal's "PAYERSTATUS" field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Confirmed Address</td>
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
			<th colspan=4><h3>Google Checkout</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout Account. It corresponds to the "email" element.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Protection Eligibility</td>
			<td>gcpe</td>
			<td>Whether the user is eligible for Google's risk information protection. It corresponds to the "eligible-for-protection" element in the "risk-information" API. Accepted value is "true" or "false." Default is "false."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Buyer Account Age</td>
			<td>gcba</td>
			<td>Age associated ot the account. It corresponds to the "buyer-account-age" element in the "risk-information" API.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Generic Financial Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID Hash</td>
			<td>phash</td>
			<td>Account unique identified (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: This hash must be of the full account ID, not a masked or tokenized representation.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>Account Token</td>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Bitcoin</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Bitcoin Wallet ID</td>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bitcoin Token</td>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>ACH</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ACH Account Number</td>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account
			<br><br>
			<b>Note</b>: This hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Token</td>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Transaction</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Amount</td>
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
			<td>Virtual Good</td>
			<td>vg</td>
			<td>Whether the transaction is associated to a virtual good (true) as opposed to a physical good (false). The default is false.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Subscription Service</td>
			<td>sub</td>
			<td>Whether the transaction is associated to a subscription service. The default is false.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Currency</td>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as as tringe. Default is "USD".</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Transaction ID</td>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none provided. The transaction ID must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Transaction Time</td>
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
			<td>Merchant ID</td>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.
			<br><br>
			In addition to being an identifier used in the analysis user interface, if a custom fraud policy has been defined for a merchant with this ID, then this policy will be used in preference to the default policy.
				<ul type="disc">
					<li>"smid"="42"</li>
					<li>"smid"="Acme"</li>
				</ul>
			<br><br>
			<b>Note</b>: The value of the smid should not include the apostrophe symbol.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Merchant Name</td>
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
			<td>PoS ZIP Code</td>
			<td>pzip</td>
			<td>The zip code of the point of sale device at which this transaction is being processed.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>MOTO Indicator</td>
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
			<td>Affiliate ID</td>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Affiliate Signup Date</td>
			<td>aflsd</td>
			<td>The affiliate signup/creation date associated with this transaction. Either an ISO8601 encoded string or UNIX timestamp.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Inline Feedback***</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>GW Response</td>
			<td>auth_response</td>
			<td>Whether the Gateway accepted ("accepted") the transaction or not ("rejected").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>GW Response Error Code</td>
			<td>error_code</td>
			<td>The error code fields from the authorization request as expressed by the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>GW Response Test</td>
			<td>auth_response_test</td>
			<td>Auth comments from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Free-form descriptive text providing addition information about the feedback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>AVS</td>
			<td>avs_result</td>
			<td>The AVS response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>CVV2</td>
			<td>cvv2_result</td>
			<td>The CVV22 response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Gateway Name</td>
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
			<td>Auth Code</td>
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

> [This URL](https://edna.identitymind.com/im/jax/chargeback/) can be used for PLACEHOLDER.

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

> The response contains a JSON encoded message or error message.

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

	<table>
		<tr>
			<th colspan=4><h3>Chargeback</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Amount</td>
			<td>amt</td>
			<td>Amount of the chargeback</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Currency</td>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is "USD."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Error Code</td>
			<td>error_code</td>
			<td>This should be used to pass the reason code for the chargeback. For a full set of reason codes as defined by the card brands, click [here](http://www.managechargebacks.com/reasoncodes.html).</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Text describing the reason for refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Chargeback Type</td>
			<td>cbtype</td>
			<td>The type of chargeback:
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
			<td>Chargeback Date</td>
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
			<td>Original Transaction Date</td>
			<td>authdate</td>
			<td>Date of the authorization transaction. The format of the value for this field is either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>“authdate”: “2011-01-01T13:12:16+0000”</li>
					<li>“authdate”:1293887536</li>
					<li>“authdate”:”1293887536”</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Gateway Name</td>
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
			<td>Merchant Transaction ID for the Original Auth Transaction</td>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Sub Merchant</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Sub Merchant ID</td>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.
			<br><br>
			<b>Note</b>: The value of the smid should not include the apostrophe symbol.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Credit Card</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Number Hash</td>
			<td>pccn</td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>Number Token</td>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>Issuer Country</td>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Type</td>
			<td>pcty</td>
			<td>Type of card:
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
			<td>Number Hash</td>
			<td>pccn2</td>
			<td>Hash of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.
			<br><br>
			<b>Note</b>: The has must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Number Token</td>
			<td>pcct2</td>
			<td>Token of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Issuer Country</td>
			<td>ric2</td>
			<td>The issuer country of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported. The country code is the two letter abbreviation as defined in ISO-3166-1.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Type</td>
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
			<th colspan=4><h3>PayPal</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from PayPal Express Checkout.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's "EMAIL" field from PayPal Express Checkout.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Google Checkout</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It correpsonds to the "email" element.</td>
			<td>No</td>
		</tr>
	</table>

# Credit Notification

Notifies that a credit occurred on a transaction. 
 
 **Note**: The transaction may either be a payment transaction or an account transfer. 

In the case of credit or blind credit on a transaction that eDNA has not previously processed, then the payment instrument information is required.

## Arguments

> [This URL](https://edna.identitymind.com/im/jax/credit/) can be used for PLACEHOLDER

```code
EXAMPLE SERVICE REQUEST

{
     “amt”: 10.4,
     “pccn”: “DNsxhwmQCWeC5gPxTOwPRZlFfx”,
     “pcct”: “401201XXXXXX1110”,
     “tid”: “988833” 
}
```

> The response contains a JSON encoded message or error message.

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

	<table>
		<tr>
			<th colspan=4><h3>Credit</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Amount</td>
			<td>amt</td>
			<td>Amount of the credit</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Currency</td>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is "USD."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Text describing the reason for the credit</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Credit Date</td>
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
			<td>Merchant Transaction ID for the Original Auth Transaction</td>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters.
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Sub Merchant</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Sub Merchant ID</td>
			<td>smid</td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Credit Card</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Number Hash</td>
			<td>pccn</td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate the hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Number Token</td>
			<td>pcct</td>
			<td>A masked or tokenized vesion of the credit card number. IdentityMind will supply procedure to generate the token.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Issuer Country</td>
			<td>ric</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Type</td>
			<td>pcty</td>
			<td>Type of card:
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
			<th colspan=4><h3>PayPal</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's "PAYERID" field from PayPal Express Checkout.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's "EMAIL" field from the PayPal Express Checkout</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Google Checkout</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID</td>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the "buyer-id" element.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It corresponds to the "email" element.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Generic Financial Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account ID Hash</td>
			<td>phash</td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Account Token</td>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token</td>
			<td>No</td>
		</tr>
	</table>


# Feedback: Transaction Neutral/Refund Notification

Notifies that a refund occurred on a transaction.

**Note**: The transaction may be either a payment transaction or an account transfer.

## Arguments

> All arguments are optional. They key parameter:transaction ID is part of the URL. The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.

```code
https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok

https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud

https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok

https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud
```
 
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
> The response contains a JSON encoded message or error message.

```code
EXAMPLE SERVICE RESPONSE DATA

{
    “message”: “Feedback accepted for REFUND_FRAUD feedback on transaction 42”
}
```
	<table>		
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Amount</td>
			<td>amt</td>
			<td>Amount of the refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Authorization Response</td>
			<td>auth_response</td>
			<td>Response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Authorization Response Description</td>
			<td>auth_response_text</td>
			<td>Text descripting response code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Error Code</td>
			<td>error_code</td>
			<td>Error code from the gateway, if any</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Text describing reason for refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bank Status</td>
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
			<td>Transaction ID</td>
			<td>tid</td>
			<td>Transaction ID</td>
			<td>No</td>
		</tr>
	</table>

# Feedback: Final Payment Transaction Result

## Arguments

> The following URLs are used to notify IdentityMind of the acceptance or rejection of the transaction previously analyzed with the given transaction ID by the merchant's payment gateway or the merchant themselves.
> 
> **Note**: The transaction may be a payment transaction or an account transfer.
> 
> All arguments are optional. They key parameter:transaction ID is part of the URL.

```code
BANK AUTHORIZATION FEEDBACK

https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-accepted

https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-rejected

MERCHANT FINAL RESOLUTION FEEDBACK

https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted

https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected

https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-ok 

https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-user-validated

https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-user-failed-validation

https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-default 

https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-default
```
```code
EXAMPLE SERVICE REQUEST

{
  “auth_code”: “T1627H”,
  “auth_response_text”: “Decline”,
  “avs_result”: “Y”,
  “error_code”: “05”
}

```

> The response contains a JSON encoded message or error message.

```code
EXAMPLE SERVICE RESPONSE DATA

{
  “message”: “Feedback accepted for ACCEPT feedback on transaction 42”
}
```

	<table>		
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>GW Response</td>
			<td>auth_response</td>
			<td>Whether the gateway accepted or rejected the transaction</td>
			<td>No</td>
		</tr>
		<tr>
			<td>GW Response Error Code</td>
			<td>error_code</td>
			<td>The error code fields from the authorization request as expressed by the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>GW Response Test</td>
			<td>auth_response_text</td>
			<td>Auth comments from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Free-form descriptive text providing additional information about the feedback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>AVS</td>
			<td>avs_result</td>
			<td>The AVS response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>CVV2</td>
			<td>cvv2_result</td>
			<td>The CVV2 response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Gateway Name</td>
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
			<td>Auth Code</td>
			<td>auth_code</td>
			<td>Returned authorization code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bank Status</td>
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

## Arguments

> The following URLs are used for account transaction validation:

```code

Validate an external transfer (deposit) into an account:
https://edna.identitymind.com/im/account/transferin (POST)

Validate an internal transfer between accounts:
https://edna.identitymind.com/im/account/transfer (POST)

Validate an external transfer (withdrawal) from an account:
https://edna.identitymind.com/im/account/transferout (POST)
```
> The evidence is the account transfer transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

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
> The response is a JSON encoding of the IdentityMind Service result. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured validation policy. The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in Appendix A: Result Keys and Codes.

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

	<table>
		<tr>
			<th colspan=4><h3>User Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account Name</td>
			<td>man</td>
			<td>Free form unique identifier for this account at this merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Email Address</td>
			<td>tea</td>
			<td>Email address of record. An email address that the merchant is comfortable using to validate access to the account.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Social Authentication</td>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, and is used for Oauth authentication. The following values are recommended:
				<ul type:"disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Home Phone</td>
			<td>ph</td>
			<td>Home phone on record. A landline phone number that the merchant is comfortable using to validate access to the account.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Mobile Phone</td>
			<td>pm</td>
			<td>Mobile phone on record. A mobile phone number that the merchant is comfortable using to validate access to the account.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>High Value Account</td>
			<td>hiv</td>
			<td>The account is high value</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Latitude</td>
			<td>clat</td>
			<td>The current latitude of the customer specified in decimal degrees. Encoded as a string (e.g. “clat”:“37.4419”)</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Longitude</td>
			<td>clong</td>
			<td>The current longitude of the customer specified in decimal degrees. Encoded as a string (e.g. “clong”:“-122.1419”)</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Billing Address</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Billing First Name</td>
			<td>bfn</td>
			<td>First name associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Last Name</td>
			<td>bln</td>
			<td>Last name associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Street Address</td>
			<td>bsn</td>
			<td>Street address associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing City</td>
			<td>bc</td>
			<td>City associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing State</td>
			<td>bs</td>
			<td>State associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Zip / Postal Code</td>
			<td>bz</td>
			<td>Zip code associated with the payment/funding account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Country</td>
			<td>bco</td>
			<td>Country associated with the payment/funding account</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Device</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Client IP</td>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint</td>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the "dft" attribute.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint Type</td>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Token and Scheme</td>
			<td>dts</td>
			<td>Third party device token and scheme identifier. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Payment</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Card Number Hash</td>
			<td>pccn</td>
			<td>Credit/debit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Number Token</td>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account ID Hash</td>
			<td>phash</td>
			<td>Acount unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bitcoin Wallet ID</td>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ACH Account Number</td>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Token</td>
			<td>ptoken</td>
			<td>A masked or tokenized version of the account token. This attribute is used in conjunction with "phash," "pbc," and "pach."</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Txn</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Transcation Time</td>
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
			<td>Transaction Identifier</td>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none provided. The transqaction ID must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Affiliate ID</td>
			<td>aflid</td>
			<td>The affiliate ID associatec with this transaction. Encoded as a string</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Affiliate Signup Date</td>
			<td>aflsd</td>
			<td>The affiliate signup/creation date associated with this transaction. Either an ISO8601 encoded string or UNIX timestamp.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Memo</td>
			<td>memo</td>
			<td>Free form text memo field</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Transfer Destination</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Destination Account Name</td>
			<td>dman</td>
			<td>Free form unique identifier for the destination account at this merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Email Address</td>
			<td>demail</td>
			<td>Email address associated with the destination account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Phone Number</td>
			<td>dph</td>
			<td>Phone number associated with the destination account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Transfer Amount</td>
			<td>amt</td>
			<td>If this transaction is a transfer, the amount being transferred.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Transfer Currency</td>
			<td>ccy</td>
			<td>If this transaction is a transfer, the currency of the "amt" field being transferred.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Card Hash</td>
			<td>dpccn</td>
			<td>Unique identifier (hash) of the destination credit card while obscuring the actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Card Token</td>
			<td>dpcct</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination PayPal Payer ID</td>
			<td>dpppi</td>
			<td>Destination PayPal Payer ID</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination PayPal Payer Email</td>
			<td>dpppe</td>
			<td>Destination PayPal Payer email</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Bitcoin Wallet</td>
			<td>dpbc</td>
			<td>Hash of the unique identifier for the destination Bitcoin wallet ID</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination ACH</td>
			<td>dpach</td>
			<td>Hash of the unique identifier of the destination ACH account
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Payment Hash</td>
			<td>dphash</td>
			<td>Unique identifier (hash) of the destination payment instrument while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Destination Payment Token</td>
			<td>dptoken</td>
			<td>A masked or tokenized version of tyhe destination payment instrument number. IdentityMind will supply procedure to generate token. This field is used in conjunction with "dpbc," "dpach," and "dptoken."</td>
			<td>No</td>
		</tr>
		<tr>
			<td>First Name</td>
			<td>sfn</td>
			<td>The first name of the recipient</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>sln</td>
			<td>THe last name of the recipient</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Street</td>
			<td>ssn</td>
			<td>The recipient street address (e.g. "123 Main St")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>City</td>
			<td>sc</td>
			<td>The recipient city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>State</td>
			<td>ss</td>
			<td>The recipient state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Zip</td>
			<td>sz</td>
			<td>The recipient zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Country</td>
			<td>sco</td>
			<td>ISO 3166 country code of the recipient address of the transaction, encoded as a string. Default is "US"</td>
			<td>No</td>
		</tr>
	</table>

# KYC - Merchant: Merchant Application Validation Web Service

## Reseller Only Feature: How to associate a merchant with its owners

Each merchant can be associated with one or more owners.  The merchant will be evaluated with the Merchant Application Web Service.  One can provide an application ID (tid in the Request API), or extract this ID from the Response.

Each owner will be evaluated with the Consumer Application Web Service.  In the Consumer Application request, the merchantAid must be set to the value of the application ID of the Merchant Application.  This will link the merchant to all of its owners. 

![](http://i.imgur.com/TSTKfQg.png)

## Arguments

> The following URLs are used for merchant application validation:

```code
Validate a merchant application:

https://edna.identitymind.com/im/account/merchant (POST)


Retrieve the current state of a merchant application:

https://edna.identitymind.com/im/account/merchant/<tid> (GET)
```

>The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

> The response is a JSON encoding of the IdentityMind Service result.   
The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in Appendix A.
Parameters that are not defined here but appearing in the Request API will be categorized as custom data and can be displayed on the UI as proprietary information for the merchant.

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
	<table>
		<tr>
			<th colspan=4><h3>Application</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ID</td>
			<td>tid</td>
			<td>Unique application identifier. The system will assign one if not provided. It is recommended to pass one if needed to be correlatedf to client's backend system. The tid must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters. The tid is used to combine the multiple stages of an application.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Company</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account Merchant Name</td>
			<td>amn</td>
			<td>Legal name of the company</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Doing Business As</td>
			<td>dba</td>
			<td>DBA</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Tax ID</td>
			<td>ataxid</td>
			<td>The merchant's tax ID</td>
			<td>Yes, unless SSN is provided</td>
		</tr>
		<tr>
			<td>Account SSN</td>
			<td>assn</td>
			<td>The merchant's social security number</td>
			<td>Yes, unless tax ID is provided</td>
		</tr>
		<tr>
			<td>GIIN</td>
			<td>giin</td>
			<td>The merchant's Guild Intermediary Identification Number. GIIN is a 19 character number that uniquely identifies an entity as having registered with the IRS for purposes of FATCA</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Business Type</td>
			<td>businesstype</td>
			<td>Possible values are:
				<ul type="disc">
					<li>corporation - Corporation</li>
					<li>llc - LLC</li>
					<li>partnership - Partnership</li>
					<li>individual - Individual/Sole Proprietorship</li>
					<li>nonprofit - Nonprofit</li>
					<li>foreigncorp - Foreign corporation</li>
				</ul>
			</td>
			<td>No/td>
		</tr>
		<tr>
			<td>Account Contact First Name</td>
			<td>afn</td>
			<td>The first name of the contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Contact Last Name</td>
			<td>aln</td>
			<td>The last name of hte contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Merchant Phone</td>
			<td>aph</td>
			<td>The merchant's business phone number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Street Address</td>
			<td>asn</td>
			<td>The merchant's street address</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account City</td>
			<td>ac</td>
			<td>The merchant's city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account State</td>
			<td>as</td>
			<td>The merchant's state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Zip/Postal Code</td>
			<td>az</td>
			<td>The merchant's zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Country</td>
			<td>aco</td>
			<td>The merchant's country</td>
			<td>No</td>
		</tr>
		<tr>
			<td>MCC</td>
			<td>mcc</td>
			<td>Merchant Category Code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Token</td>
			<td>pcct</td>
			<td>Credit card number</td>
			<td>Yes, if pccn is provided</td>
		</tr>
		<tr>
			<td>Bank Account Type</td>
			<td>bankaccounttype</td>
			<td>Valid values are:
				<ul type="disc">
					<li>checking</li>
					<li>saving</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Credit Card</td>
			<td>ccaccept</td>
			<td>Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>PayPal</td>
			<td>ppaccept</td>
			<td>Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ACH</td>
			<td>achaccept</td>
			<td>Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bitcoin</td>
			<td>bitcoinaccept</td>
			<td>Boolean</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Transaction</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Transaction Time</td>
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
			<td>Application Stage</td>
			<td>stage</td>
			<td>Stage of the application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Group</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>IDM Merchant Aggregation</td>
			<td>merchantgroup</td>
			<td>Aggregation that defines KYC configuration and monitoring thresholds</td>
			<td>No</td>
		</tr>
	</table>


# KYC - Consumer: Consumer Application Validation Web Service

## Arguments

>The following URLs are used for consumer application validation:

```code
Validate a consumer application:

https://edna.identitymind.com/im/account/creation (POST)

Retrieve the current state of a consumer application:

https://edna.identitymind.com/im/account/creation/<tid> (GET)
```

>The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

> The response is a JSON encoding of the IdentityMind Service result.   
The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in Appendix A.

```code
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

	<table>
		<tr>
			<th colspan=4><h3>User</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>First Name</td>
			<td>bfn</td>
			<td>The first name of the individual opening the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>bln</td>
			<td>The last name of the individual opening the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Name</td>
			<td>man</td>
			<td>Free form unique identifier for this account at this merchant</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>User Email Address</td>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Social Authentication</td>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site; in particular, that it is used for Oauth authentication. The content of the field is merchant defined, but the following values are recommended:
				<ul type="disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Date of Birth</td>
			<td>dob</td>
			<td>The date of birth of the individual opening the account. Format is ISO8601 (e.g. 1984-01-21).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Phone</td>
			<td>phn</td>
			<td>Customer's primary phone number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Mobile Phone</td>
			<td>pm</td>
			<td>Cstomer's mobile phone number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Latitude</td>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Longitude</td>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Document Verification Front Side Scan Data</td>
			<td>scanData</td>
			<td>If using Jumio NetVerify Perform, the document front side image data, Base64 encoded. If provided, this will override the configured "Jumio client integration." 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Document Verification Back Side Image Data</td>
			<td>backsideImageData</td>
			<td>If using Jumio NetVerify Perform, the document back side image data, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Document Verification Face Data</td>
			<td>faceImageData</td>
			<td>If using Jumio NetVerify Perform with face match enabled, the face image file, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Device</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Client IP</td>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint</td>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the "dft" attribute</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint Type</td>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type"disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Payment/Funding Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Card Number Hash</td>
			<td>pccn</td>
			<td>Credit/debit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Card Number Token</td>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account ID Hash</td>
			<td>phash</td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account ID, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Bitcoin Wallet ID</td>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ACH Account Number</td>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Street Address</td>
			<td>bsn</td>
			<td>Payment street address</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing City</td>
			<td>bc</td>
			<td>Payment city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing State</td>
			<td>bs</td>
			<td>Payment state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Zip/Postal Code</td>
			<td>bz</td>
			<td>Payment zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Billing Country</td>
			<td>bco</td>
			<td>Payment country</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Transaction</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Transaction Time</td>
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
			<td>Transaction Identifier</td>
			<td>tid</td>
			<td>Unique identifier for the application. eDNA assigns an internal ID if none is provided. The tid must be encoded as a string (e.g. "tid":"123455"). The maxiumum length is 40 characters. The tid is used to combine the multiple stages of an application.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Application Stage</td>
			<td>stage</td>
			<td>Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Affiliate ID</td>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Affiliate Signup Date</td>
			<td>aflsd</td>
			<td>The signup/creation date of the affiliate associated with this transaction. Either an ISO8601 encoded string or a UNIX timestamp.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Memo</td>
			<td>memo</td>
			<td>Free form text memo field</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Merchant</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Merchant</td>
			<td>merchantAid</td>
			<td>If this consumer is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant (see tid in the Merchant Application API below)</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Personal Guarantee</td>
			<td>personalguarantee</td>
			<td>Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Percentage of Owner</td>
			<td>ownership</td>
			<td>The percentage of ownership</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Title</td>
			<td>title</td>
			<td>Title of the owner</td>
			<td>No</td>
		</tr>
	</table>

# Quiz Response (IDAnalytics)

> The following URLs are used to return a customer’s response to a set of out of wallet questions returned either by a merchant or consumer application respectively.

```code
https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse (POST)

https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse (POST)
```
> The body of the request contains an encoding of the customer’s answers to the quiz questions. The encoding is in JSON as described below. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

> The response to this request is an Application Response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of “challenge” questions that should once again be passed back to the consumer for answers.

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
	
	<table>
		<tr>
			<th colspan=2><h3>JSON Answers Encoding</h3></th>
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

> The following URLs are used to return a customer’s response to a phone validation request:

```code
https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse (POST)

https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse (POST)
```
> The body of the request contains an encoding of the customer’s code response. The encoding is in JSON as described below. The answers are processed and the response used to update the Phone Ownership Security Test and the Application state. The response to this request is an Application Response containing the newly updated application.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse


{
   "smsCode":”1234”
}
```

	<table>
		<tr>
			<th colspan=2><h3>JSON Answers Encoding</h3></th>
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

> The following URLs are used to initiate a Jumio Netverify Multi Document transaction for a Consumer or Merchant application:

```code
https://edna.identitymind.com/im/account/merchant/<appid>/document  (POST)

https://edna.identitymind.com/im/account/consumer/<appid>/document  (POST)
```

> The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

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

	<table>
		<tr>
			<th colspan=2><h3>JSON Request Encoding</h3></th>
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
			<th colspan=2><h3>JSON Response Encoding</h3></th>
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

## Arguments

> The following URLs are used to notify IdentityMind of the acceptance or rejection of an application by the merchant.

```code
https://edna.identitymind.com/im/account/consumer/<application_ID>/accepted (POST)

https://edna.identitymind.com/im/account/consumer/<application_ID>/rejected (POST)

https://edna.identitymind.com/im/account/merchant/<application_ID>/accepted (POST)

https://edna.identitymind.com/im/account/merchant/<application_ID>/rejected (POST)
```
> All arguments are optional, although a JSON object must be provided.

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
	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Reason</td>
			<td>reason</td>
			<td>Free form code. Up to 4 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Description</td>
			<td>description</td>
			<td>Free form descriptive text providing additional information about the feedback. Up to 255 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Validation</td>
			<td>validate</td>
			<td>Whether the user defined in the application should be validated. Encoded as a boolean.
			<br><br>
			For a rejected application, the property is interpreted as whether to mark the applicant as having failed validation.
			<br><br>
			Defaults to false</td>
			<td></td>
		</tr>
	</table>


# Login Annotation Web Service

## Arguments

> The following URLs are used for account login transactions:

```code
Annotate a user's transactions with login data:

https://edna.identitymind.com/im/account/login (POST)
```

> The evidence is the login transaction data to be added to the entities transaction record. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided.

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

> The response is a JSON encoding of the IdentityMind service result. The response incldes detailed result codes and transaction unique identifier. The keys are fully defined in Appendix A: Result Keys and Codes.

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

	<table>
		<tr>
			<th colspan=4><h3>User Account</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Account Name</td>
			<td>man</td>
			<td>Free form unique identifier for this account at this merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Email Address</td>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Social Authentication</td>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site; in particular, that it is used for Oauth authentication. The content of the field is merchant defined, but the following values are recommended:
				<ul type="disc">
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Latitude</td>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clat”:“37.4419”).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>User Location - Longitude</td>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. “clong”:“-122.1419”).</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=4><h3>Device</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Client IP</td>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint</td>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of hte "dft" attribute.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint Type</td>
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
			<td>Device Token and Scheme</td>
			<td>dts</td>
			<td>Third party device token and scheme identifier. Contact IdentityMind for detailed format information.</td>
			<td></td>
		</tr>


		<tr>
			<th colspan=4><h3>Txn</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Login Time</td>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li>“tti”:129887536</li>
					<li>“tti”:“129887536”</li>
				</ul></td>
			<td>No</td>
		</tr>
		<tr>
			<td>Login Identifier</td>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none is provided. The transaction ID must be encoded as a string (e.g. "tid":"123455"). The maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>

# Appendix A: Result Keys and Codes

## Result Key Names

	<table>
		<tr>
			<th colspan=4><h3>Payment Transaction</h3></th>
		</tr>
		<tr>
			<th>Name</th>
			<th>Key</th>
			<th>Example</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>Transaction ID</td>
			<td>tid</td>
			<td>4223</td>
			<td>The transaction to which this response pertains. If a tid was supplied on the request, then this will be that value. Otherwise, it will be an IdentityMind generated identifier.</td>
		</tr>
		<tr>
			<td>Transaction Status</td>
			<td>transaction_status</td>
			<td>complete</td>
			<td>The current state of processing the transaction:
				<ul type="disc">
					<li>complete</li>
					<li>error</li>
				</ul></td>
		</tr>
		<tr>
			<td>Result</td>
			<td>res</td>
			<td>accept</td>
			<td>The result of the transaction by IdentityMind:
				<ul type="disc">
					<li>ERROR</li>
					<li>ACCEPT</li>
					<li>DENY</li>
					<li>MANUAL_REVIEW</li>
				</ul></td>
		</tr>
		<tr>
			<td>Result Codes</td>
			<td>rcd</td>
			<td>1000,100,110,120,150,523</td>
			<td>A comma-separated list of result codes representing a more detailed explanation of the result. The actual result codes are defined in the next subsection.</td>
		</tr>
		<tr>
			<td>Error Message</td>
			<td>error_message</td>
			<td>Bad data format:Failed to parse the date string provided in the data. Please use ISO8601 format.</td>
			<td>A textual description of an error that occured while processing the transaction.</td>
		</tr>
		<tr>
			<td>Fraud Rule Name</td>
			<td>frn</td>
			<td>Fallthrough</td>
			<td>The short name of the fraud rule that triggered for this transaction.
			<br><br>
			<b>Note</b>: A fraud rule will be triggered for all transactions, including those that have result ACCEPT</td>
		</tr>
		<tr>
			<td>Fraud Rule Description</td>
			<td>frd</td>
			<td>User is trusted and no fraud rules were triggered.</td>
			<td>A longer description of the fraud rule that triggered.</td>
		</tr>
		<tr>
			<td>Domestic Card</td>
			<td>rfb</td>
			<td>true</td>
			<td>True if the credit card used in the transaction is domestic.
				<ul type="disc">
					<li>True</li>
					<li>False<li>
				</ul></td>
		</tr>
		<tr>
			<td>Card Issuer Country</td>
			<td>ric</td>
			<td>US</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1</td>
		</tr>
		<tr>
			<td>User Description</td>
			<td>erd</td>
			<td>Existing Trusted User</td>
			<td>A textual description of the reputation of the user associated with the transaction.</td>
		</tr>
		<tr>
			<td>Alert Severity</td>
			<td>ras</td>
			<td>HIGH</td>
			<td>If an alert was generated, the severity of the alert.
				<ul type="disc">
					<li>CRITICAL</li>
					<li>HIGH</li>
					<li>MEDIUM</li>
					<li>WARNING</li>
					<li>INFO</li></td>
		</tr>
		<tr>
			<td>Alert Message</td>
			<td>ram</td>
			<td>Card is issued by a foreign bank.</td>
			<td>If an alert was generated, the message associated with the alert.</td>
		</tr>
		<tr>
			<td>Automated Review Policy Rule ID</td>
			<td>arpid</td>
			<td>20005</td>
			<td>The Automated Review Policy rule, if any, that accepted the transaction.</td>
		</tr>
		<tr>
			<td>Automated Review Policy Rule Description</td>
			<td>arpd</td>
			<td>Parameters of the transaction are associated with a history of good transactions</td>
			<td>A textual description of the Automated Review Policy rule, if any, that accepted the transaction.</td>
		</tr>


		<tr>
			<th colspan=4><h3>Account Transfer / Login Validation Transaction</h3></th>
		</tr>
		<tr>
			<th>Name</th>
			<th>Key</th>
			<th>Example</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>eDNA User Result</td>
			<td>user</td>
			<td>TRUSTED</td>
			<td><ul type="disk>
					<li>TRUSTED</li>
					<li>UNKNOWN</li>
					<li>BAD</li>
			</ul></td>
		</tr>
		<tr>
			<td>User eDNA Description</td>
			<td>erd</td>
			<td>Validated User</td>
			<td>Textual explanation of the eDNA user result</td>
		</tr>
		<tr>
			<td>Result Codes</td>
			<td>rcd</td>
			<td>10001,50005,202,111,101,131</td>
			<td>The complete set of result codes for this transaction. Includes:
				<ul type="disk>
					<li>UAI reputation</li>
					<li>Device reputation</li>
					<li>Funding payment reputation</li>
					<li>User reputation</li>
					<li>eDNA rule number</li>
					<li>Account validation rule number</li>
					<li>User verification state</li></td>
		</tr>
		<tr>
			<td>Account Policy Result</td>
			<td>res</td>
			<td>ACCEPT</td>
			<td><ul type="disc">
					<li>ERROR</li>
					<li>ACCEPT</li>
					<li>DENY</li>
					<li>MANUAL_REVIEW</li>
				</ul></td>
		</tr>
		<tr>
			<td>User First Seen</td>
			<td>ufs</td>
			<td>1372101668000</td>
			<td>The first time that this user was seen (globally) by eDNA. Encoded in Java timestamp format, milliseconds since the epoch.</td>
		</tr>
		<tr>
			<td>User Most Recently Seen</td>
			<td>umrs</td>
			<td>1372101668000</td>
			<td>The most recent time that this user was seen (globally) by eDNA. Encoded in Java timestamp format, milliseconds since the epoch.</td>
		</tr>
		<tr>
			<td>User Seen Count</td>
			<td>usc</td>
			<td>42</td>
			<td>The number of times this user has been seen (globally) by eDNA</td>
		</tr>
		<tr>
			<td>Transaction Identifier</td>
			<td>tid</td>
			<td>4224</td>
			<td>The transaction ID provided on the request, or a unique identifier generated by IdentityMind if none was originally provided.</td>
		</tr>
		<tr>
			<td>Error Message</td>
			<td>error_message</td>
			<td>Bad data format:Failed to parse the date string provided in the data.  Please use ISO8601 format.</td>
			<td>A textual description of an error that occured while processing the transaction.</td>
		</tr>
		<tr>
			<td>Alert Severity</td>
			<td>ras</td>
			<td>HIGH</td>
			<td>If an alert was generated, the severity of the alert.
				<ul type="disc">
					<li>CRITICAL</li>
					<li>HIGH</li>
					<li>MEDIUM</li>
					<li>WARNING</li>
					<li>INFO</li></td>
		</tr>
		<tr>
			<td>Alert Message</td>
			<td>ram</td>
			<td>Card is issued by a foreign bank.</td>
			<td>If an alert was generated, the message associated with the alert.</td>
		</tr>


		<tr>
			<th colspan=4><h3>Merchant / Consumer Application Transaction</h3></th>
		</tr>
		<tr>
			<th>Name</th>
			<th>Key</th>
			<th>Example</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>The current state of the application</td>
			<td>state</td>
			<td>R</td>
			<td><ul type="disc">
					<li>A - Accepted</li>
					<li>R - Review</li>
					<li>D - Denied</li>
					<li>E - Error</li>
					<li>C - Closed</li></td>
		</tr>
		<tr>
			<td>Application Identifier</td>
			<td>mtid</td>
			<td>4224</td>
			<td>The transaction ID provided on the request, or a unique identifier generated by IdentityMind if none was originally provided.</td>
		</tr>
		<tr>
			<td>eDNA Account Transaction Response</td>
			<td>merchantApplicationResponse</td>
			<td></td>
			<td>The response to the eDNA account transaction that was executed for this application. It is encoded as a JSON object, the attributes of which are described in the Account Transfer / Login Validation section above. This property is not present when a GET is performed on a consumer/merchant application.</td>
		</tr>
		<tr>
			<td>Application Scorecard</td>
			<td>ednaScoreCard</td>
			<td></td>
			<td>A JSON encoded list of results of the tests that were run on the application. The encoding in JSON is described below.</td>
		</tr>
		<tr>
			<td>Error Message</td>
			<td>error_message</td>
			<td>Bad data format:Failed to parse the date string provided in the data.  Please use ISO8601 format.</td>
			<td>A textual description of an error that occured while processing the transaction.</td>
		</tr>
		<tr>
			<td>Out of Wallet / KYC Questions</td>
			<td>oowQuestions</td>
			<td></td>
			<td>The set of questions, if any, provided by IDAnalytics. The encoding is JSON, described below. The property is not present when a GET is perfomed on a consumer/merchant application.</td>
		</tr>
		<tr>
			<td>SMS Verification Sent</td>
			<td>smsVerification</td>
			<td>3105551212</td>
			<td>The phone number, if any, to which an SMS verification code has been sent. This property is not present when a GET is performed on a consumer/merchant application.</td>
		</tr>
		<tr>
			<td>Merchant API Name</td>
			<td>merchantAPIName</td>
			<td>Joseshoe</td>
			<td>This is the API name that identifies newly created merchants</td>
		</tr>
		<tr>
			<td>Owner Application IDs</td>
			<td>ownerApplicationIds</td>
			<td>[<br>
				“consumerapp001”,<br>
				“consumerapp002”,<br>
				“consumerapp003”<br>
				]
			</td>
			<td>The application IDs of the owners for this merchant.</td>
		</tr>
	</table>

### Out of Wallet Questions Encoding

```code
EXAMPLE

{
   “questions”:[
      {
         “questionId”:0,
         ”questionText”:”With which of these cities have you been associated?”,
         ”choices”:[
            “KERRVILLE”,
            ”HOUSTON”,
            ”SAN ANTONIO”,
            ”SAN DIEGO”,
            ”None of the above”
         ]
      },
      {
         “questionId”:1,
         ”questionText”:”Which person has shared a previous address with you?”,
         ”choices”:[
            “DICK”,
            ”TOM”,
            ”HARRY”,
            ”BOB”,
            ”None of the above”
         ]
      },
      {
         “questionId”:2,
         ”questionText”:”What is SANDRA's birthday who shares your current or a recent address?”,
         ”choices”:[
            “October 1964”,
            ”February 1965”,
            ”August 1966”,
            ”August 1946”,
            ”None of the above”
         ]
      },
      {
         “questionId”:3,
         ”questionText”:”In what county is 1313 MOCKINGBIRD LN?”,
         ”choices”:[
            “MUNSTER”,
            ”HOWELL”,
            ”TRANSYLVANIA”,
            ”COOK”,
            ”None of the above”
         ]
      }
   ]
}
```
	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>questions</td>
			<td>JSON Array of JSON encoded question objects</td>
		</tr>
		<tr>
			<td>questionId</td>
			<td>Integer itentifier for this question</td>
		</tr>
		<tr>
			<td>questionText</td>
			<td>Text of the question that is to be asked of the consumer</td>
		</tr>
		<tr>
			<td>choices</td>
			<td>JSON Array of strings that represent the set of possible multiple choice answers</td>
		</tr>
	</table>

### eDNA Score Card Encoding

```code
EXAMPLE

{
 "ednaScoreCard": {
        "tr": [
           {
                "testCategory": "Identity",
                "testDescription": "Waiting for applicant to respond with code",
                "testName": "Phone Ownership: Correct Code Provided",
                "testId": "po:1",
                "waitingForData": true
            },
            {
                "testCategory": "eDNA",
                "testDescription": "Checks the number of applications for a particular billing address.\nIt fails when the number of applications associated to the billing address is higher than the configured threshold",
                "testDetails": "0",
                "testName": "User Account Billing Address Count",
                "testId": "ed:25",
                "testPass": true
            },
            {
                "testCategory": "eDNA",
                "testDescription": "It verifies that the application's user account hasn't been previously evaluated and failed validation. \nIt fails when the user account previously has failed validation.",
                "testName": "Account Failed Validation",
                "testId": "ed:20",
                "testPass": true
            },
            {
                "testCategory": "eDNA",
                "testDescription": "Informational -- It displays the number of devices associated with the application's user account.",
                "testName": "User Account Device Count",
                “testId”: “ed:23”,
                “testResult”: “0”
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Checks whether any application parameter is in the wacth list.\nIt fails when any parameter is on the watch list.”,
                “testName”: “Watch List”,
                “testId”: “ed:2”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Checks the number of applications for a particular user account.\nIt fails when the number of applications is higher than the configured threshold.”,
                “testDetails”: “0”,
                “testName”: “User Account Application Count”,
                “testId”: “ed:21”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Informational – It displays the first time the system has seen the user account”,
                “testName”: “User Account First Seen”,
                “testId”: “ed:26”,
                “testResult”: “Wed May 21 00:36:32 UTC 2014”
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Checks the payment reputation associated with the application’s user account.\nIt fails when the reputation is \”bad\”.”,
                “testDetails”: “User Account reputation is UNKNOWN”,
                “testName”: “User Account Reputation”,
                “testId”: “ed:19”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Informational – It displays the number of payment instruments associated with the application’s user account.”,
                “testName”: “User Account Payment Count”,
                “testId”: “ed:22”,
                “testResult”: “0”
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “It evaluates the merchant application against the rules as configured in the account policy. It fails when the policy result is either DENY or MANUAL REVIEW.”,
                “testDetails”: “Result = ACCEPT; Rule Name = Account Fallthrough; Rule Description = No fraud rules triggered.”,
                “testName”: “eDNA Merchant Application Transaction”,
                “testId”: “ed:0”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Checks whether any application parameter is in the black list.\nIt fails when any parameter is on the black list.”,
                “testName”: “Black List”,
                “testId”: “ed:1”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Checks the chargeback count associated with an application’s parameter. \nIt fails when the chargeback count for a particular parameter is higher than the configured threshold.”,
                “testName”: “Chargeback Count”,
                “testId”: “ed:3”,
                “testPass”: true
            },
            {
                “testCategory”: “eDNA”,
                “testDescription”: “Informational – It displays the number of shipping addresses associated with the application’s user account.”,
                “testName”: “User Account Shipping Address Count”,
                “testId”: “ed:24”,
                “testResult”: “0”
            }
        ]
    }, 
```
	<table>
		<tr>
			<th>Key</th>
			<th colspan=2>Description</th>
		</tr>
		<tr>
			<td>tr</td>
			<td>JSON Array of JSON encoded security test results</td>
		</tr>
		<tr>
			<td>testCategory</td>
			<td>
				<ul type="disc">
					<li>eDNA</li>
					<li>Identity</li>
					<li>Device</li>
					<li>Merchant</li>
			</td>
		</tr>
		<tr>
			<td>testId</td>
			<td>A unique string identifier for the security test</td>
		</tr>
		<tr>
			<td>testName</td>
			<td>The name of the test</td>
		</tr>
		<tr>
			<td>testDescription</td>
			<td>Description of the check that the test performs</td>
		</tr>
		<tr>
			<td>testDetails</td>
			<td>Textual details of the result of the test</td>
		</tr>
		<tr>
			<td>testPass</td>
			<td>Boolean to indicate whether the test succeeded or not. 
			<br><br>
			<b>Note</b>: Some tests are informational and do not have a testPass attribute. Similarly, if the waitingForData attribute is present, the testPass will be absent.</td>
		</tr>
		<tr>
			<td>waitingForData</td>
			<td>If the test is waiting for data (e.g. out of wallet questions), then this field will be present with the value of true. Otherwise, it is absent.</td>
		</tr>
	</table>


## Result Codes

Code | Meaning
-----|---------
100	| Good User Account Info
101	| Unknown User Account Info
102	| Bad User Account Info
103	| Suspicious User Account Info
104	| Very Good User Account Info
110	| Good Device
111	| Unknown Device
112	| Bad Device
113	| Suspicious Device
114	| Very Good Device
120	| Known Payment Instrument
121	| Unknown Payment Instrument
122	| Bad Payment Instrument
123	| Suspicious Payment Instrument
124	| Very Good Payment Instrument
130	| Trusted User
131	| Unknown User
132	| Bad User
133	| Recognized User
134	| Suspicious User
150	| No Relationship
151	| User Account Info, Device and Payment Instrument all related
152	| User Account Info and Device related
153	| User Account Info and Payment Instrument related
154	| Device and Payment Instrument related
155	| Payment Instrument related to User Account Info and Device via a household relationship
156	| User Account Info related to Payment Instrument and Device via a household relationship
157	| Device related to User Account Info and Payment Instrument via a household relationship
158	| User Account Info related to Payment Instrument, and Payment Instrument related to device
159	| User Account Info related to device, and User Account Info related to Payment Instrument
160	| User Account Info related to device, and device related to Payment Instrument
180	| Trusted Shipping Address
181	| Unknown Shipping Address
182	| Bad Shipping Address
183	| Recognized Shipping Address
184	| Suspicious Shipping Address
190	| Automated Review Policy Disabled
191	| Automated Review Policy Rejected
192	| Automated Review Policy Accepted
193	| Automated Review Policy Transaction Filtered
194	| Automated Review Policy Indeterminate
195	| Automated Review Policy Pending
200	| Validated User
201	| User Who Has Failed Validation
202	| Un-validated User
210	| Good Destination User Account Info
211	| Unknown Destination User Account Info
212	| Bad Destination User Account Info
213	| Suspicious Destination User Account Info
214	| Very Good Destination User Account Info
220	| Known Destination Payment Instrument
221	| Unknown Destination Payment Instrument
222	| Bad Destination Payment Instrument
223	| Suspicious Destination Payment Instrument
224	| Very Good Destination Payment Instrument
501	| Fraudulent Device
502	| Fraudulent Payment
503	| Fraudulent User Account
504	| Suspicious Device
505	| Suspicious Payment
506	| Suspicious User Account
507	| Validated User
508	| User who previously failed validation
509	| Existing Trusted User
510	| Existing, but newly created User
511	| New User, with good existing User Account, Device and Payment
512	| New User, with entities related via household relationships
516	| New account information, but previously used shipping address by the payment/device
517	| New account information, and a new shipping address
518	| New account information, for a device and payment pair
519	| New payment, but same billing address as other payments used by account/device
520	| New payment with new billing address for this account/device
521	| New payment for a device and user account pair
522	| New device with the same IP as a previously used device
523	| New device with a new IP, but using an existing shipping address for account/payment
524	| New device with a new IP and using a new shipping address
525	| New device with a new IP and no shipping address supplied
526	| New device for a payment and user account pair
528	| Previously unrelated good payment and device, no user account information supplied
529	| Existing relationship between payment and user account, no device information supplied, but using an existing shipping address
530	| Good Payment, neither device nor user account information supplied
531	| First Time Access
532	| Infrequent Access, over a long period of time
533	| Infrequent Access, over a short time period
534	| New device and payment, no user account information supplied
535	| New payment and user account info, no device information supplied
536	| New payment, neither device nor user account information supplied
537	| Good device and a new payment, no user account information supplied
538	| Good payment and a new device, no user account information supplied
539	| Good user account information and a new payment, no device information supplied
540	| Good payment and new user account information, no device information supplied
541	| Existing payment and device, though recently created, no user account information supplied
542	| Existing payment and device, no user account information supplied
543	| Existing relationship between payment and user account, no device information supplied
544	| Recently created existing relationship between payment and user account, no device information supplied
545	| Good Payment and User Account information, previously unrelated, no device information supplied
546	| Existing relationship between good User Account information and neutral device and payment
547	| Recently created existing relationship between good User Account information, and neutral device and payment
548	| Good User Account information with a new payment and device
549	| Existing relationship between a good payment and neutral device and user account information
550	| Recently created existing relationship between a good payment and neutral device and user account information
551	| Good payment with new device and user account information
552	| Existing relationship between a good device and neutral payment and user account information
553	| Recently created existing relationship between a good device and neutral payment and user account information
554	| Good device with new payment and user account information
555	| Validated User, that has been recently created
556	| New account information, no shipping address provided
557	| User validation extended to user with new device
558	| User validation extended to user with new device
559	| User validation extended to user with new payment
560	| User validation extended to user with new payment
561	| User validation extended to user with new account info
562	| User validation extended to user with new account info
563	| Validated user using a new device and a new shipping address
564	| Validated user using a new device and a new shipping address
565	| Good Payment Instrument, neither device nor user account information supplied
566	| Good Payment Instrument with clean history, neither device nor user account information supplied
567	| Fraudulent Shipping Address
568	| Suspicious Shipping Address
599	| Error
50001 | User is Validated (Account Transaction)
50002 | User failed validation (Account Transaction)
50003 |	Bad User (Account Transaction)
50004 |	Trusted User (Account Transaction)
50005 |	Unknown User (Account Transaction)
50006 |	New Device for Validated User (Account Transaction)
50007 |	New Payment for Validated User (Account Transaction)
50008 |	New Account for Validated User (Account Transaction)
50009 |	Validation Extended for Account
50010 |	Good History of Account and Destination Payment
50011 |	Recent History of Account and Destination Payment


## Payment Fraud Rule Codes

This section documents the result codes related to payment transaction fraud policy processing.  In the table below codes such as 104X represent the codes 1041-1045 where the first three digits indicate the fraud rule and the last digit represents the reputation of the User that triggered that rule as follows:

1.	Trusted
2.	Recognized
3.	Unknown
4.	Suspicious
5.	Bad

Thus, the code 1042 indicates that the rule “TRANSACTION REJECTED BY BANK” triggered for a Recognized User.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Rule Editor view (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

CODE | MEANING
-----|--------
1000|	NO FRAUD RULE TRIGGERED, USER IS TRUSTED
1001|	NO FRAUD RULE TRIGGERED, USER IS RECOGNIZED
1002|	NO FRAUD RULE TRIGGERED, USER IS UNKNOWN
1003|	NO FRAUD RULE TRIGGERED, USER IS SUSPICIOUS
1004|	NO OTHER FRAUD RULE TRIGGERED, USER IS BAD
104X|	TRANSACTION REJECTED BY BANK
105X|	WHITELIST: USER, DEVICE OR PAYMENT WHITELISTED BY MERCHANT.
107X|	CHARGEBACK COUNT THRESHOLD EXCEEDED
108X|	REFUND COUNT THRESHOLD EXCEEDED
109X|	CVV MISMATCH
111X|	BLACKLIST: USER, DEVICE OR PAYMENT BLACKLISTED BY MERCHANT
113X|	SHIPPING COUNTRY BANNED BY MERCHANT
115X|	EMAIL ADDRESS IS DISPOSABLE
117X|	IP COUNTRY IS BLACKLISTED BY MERCHANT
119X|	IP COUNTRY IS WATCHLISTED BY MERCHANT
121X|	SHIPPING COUNTRY IS WATCHLISTED BY MERCHANT
123X|	PREFERRED: USER, DEVICE OR PAYMENT IS ON THE PREFERRED LIST FOR THE MERCHANT
125X|	WATCHLIST: USER, DEVICE OR PAYMENT WATCHLISTED BY MERCHANT
130X|	TRANSACTION AMOUNT IS BELOW SET THRESHOLD
132X|	TRANSACTION AMOUNT IS ABOVE SET THRESHOLD
134X|	PREPAID CARD TRANSACTION
135X|	DEBIT CARD TRANSACTION
137X|	PREPAID CARD TRANSACTION FOR SUBSCRIPTION SERVICE
138X|	DEBIT CARD TRANSACTION FOR SUBSCRIPTION SERVICE
140X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
141X|	IP VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
142X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
143X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
144X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
145X|	IP VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
146X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
147X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
148X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
149X|	IP VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
150X|	THE USER, DEVICE OR PAYMENT IN THE TRANSACTION HAS A FIRST DEGREE RELATIONSHIP WITH A BAD ENTITY
152X|	PAYMENT HAS BEEN USED FROM MORE THAN THE SET THRESHOLD COUNT OF DEVICES
154X|	DEVICE HAS BEEN USED BY MORE THAN THE SET THRESHOLD COUNT OF USERS
156X|	USER HAS USED MORE THAN THE SET THRESHOLD COUNT OF PAYMENTS
160X|	AVS MISMATCH
162X|	BILLING AND SHIPPING ADDRESS DIFFER
163X|	FAILED AVS FROM DOMESTIC BANK
164X|	ABSENT AVS FROM DOMESTIC BANK
165X|	CARD ISSUING BANK IN DIFFERENT COUNTRY FROM BILLING ADDRESS
166X|	CARD IS ISSUED FROM FOREIGN BANK DIFFERENT THAN COUNTRY BASED ON IP ADDRESS LOCATION
167X|	USER OR DEVICE ASSOCIATED TO MULTIPLE CARDS ISSUED BY DIFFERENT COUNTRIES
168X|	CARD ISSUED FROM A HIGH RISK COUNTRY
170X|	IP RISK SCORE IS HIGHER THAN THRESHOLD
171X|	ERROR ACCESSING IP REPUTATION SERVICE
172X|	IP TO BILLING DISTANCE GREATER THAN THRESHOLD
173X|	BROWSER LANGUAGE DOES NOT MATCH IP COUNTRY
174X|	IP ADDRESS IS A KNOWN BAD PROXY
175X|	IP TO SHIPPING DISTANCE GREATER THAN THRESHOLD
176X|	BILLING ADDRESS TO BIN MISMATCH
177X|	THE PAYPAL ACCOUNT ON THE TRANSACTION IS NOT PAYPAL VERIFIED AND ADDRESS IS NOT PAYPAL CONFIRMED
179X|	THE TRANSACTION USES A VERIFIED PAYPAL ACCOUNT WITH A CONFIRMED SHIPPING ADDRESS
180X|	THERE ARE MULTIPLE PAYPAL ACCOUNTS ASSOCIATED WITH THE USER ACCOUNT
181X|	THE PAYPAL ACCOUNT ON THE TRANSACTION IS NOT PAYPAL VERIFIED BUT IS USING A SHIPPING ADDRESS THAT HAS BEEN PREVIOUSLY USED BY THIS USER
182X|	THE PAYPAL ACCOUNT IS NOT VERIFIED
183X|	THE PAYMENT HAS NOW BEEN USED N TIMES, VALIDATE THE USER BEFORE FURTHER TRANSACTIONS WITH BE ALLOWED
185X|	MULTIPLE PHONE NUMBERS ARE ASSOCIATED WITH A USER
186X|	USER HAD USED MORE THEN THE THRESHOLD DEVICES
187X|	PAYMENT HAS BEEN USED BY MORE THAN THRESHOLD USERS
188X|	PAYPAL ACCOUNT HAS BEEN USED BY MORE THAN THRESHOLD USERS
189X|	DEVICE HAS USED MULTIPLE PAYPAL ACCOUNTS
190X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
191X|	MULTIPLE GOOGLE CHECKOUT ACCOUNTS ASSOCIATED WITH USER ACCOUNT
192X|	THE TRANSACTION IS NOT ELIGIBLE FOR GOOGLE PAYMENT GUARANTEE
193X|	GOOGLE CHECKOUT ACCOUNT USED IN THE TRANSACTION IS LESS THAT THRESHOLD DAYS OLD
194X|	IP VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
195X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
196X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
197X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
198X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
199X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
200X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
201X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
202X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
203X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
204X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
205X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
206X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
207X|	IP VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
208X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
209X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
210X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
211X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
212X|	IP VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
213X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
214X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
215X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
216X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
217X|	IP VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
218X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
219X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
220X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
221X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
222X|	IP VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
223X|	NON US ISSUED CARD
224X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 5 MINUTE VELOCITY
225X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 1 HOUR VELOCITY
226X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 24 HOUR VELOCITY
227X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 28 DAY VELOCITY
228X|	SHIPPING ADDRESS IS BANNED
229X|	UNSAFE TELEPHONE TYPE
230X|	MULTIPLE SHIPPING ADDRESS ASSOCIATED WITH USER ACCOUNT, DEVICE OR PAYMENT INSTRUMENT
231X|	MULTIPLE PAYMENT INSTRUMENTS ASSOCIATED WITH SHIPPING ADDRESS
232X|	ELEMENT OF TRANSACTION ON OFFICE OF FOREIGN ASSETS CONTROL (OFAC) SPECIALLY DESIGNATED NATIONALS (SDN) LIST
233X|	SHIPPING COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
234X|	BILLING COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
235X|	IP COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
236X|	DUPLICATE TRANSACTION
237X|	UNMATCHED BILLING NAME AND BILLING ADDRESS
238X|	HIGH RISK BILLING ADDRESS
239X|	HIGH RISK SHIPPING ADDRESS
240X|	NO EMAIL ADDRESS HISTORY
241X|	UNMATCHED BILLING ADDRESS AND EMAIL ADDRESS
242X|	3RD PARTY PROVIDER NOT ACCESSIBLE
243X|	MULTICARD (NO PREPAID) DEVICE
244X|	MULTICARD (NO PREPAID) USER ACCOUNT
246X|	DUPLICATE TRANSACTION, SMALL AMOUNT
250X|	DEVICE BILLING ADDRESS COUNT
251X|	USER ACCOUNT BILLING ADDRESS COUNT
252X|	UNREACHABLE BILLING USER 
253X|	UNMATCHED EMAIL ADDRESS
254X|	NONEXISTENT EMAIL DOMAIN
255X|	PROVIDER BLACKLIST
256X|	RESERVED
257X|	RESERVED
258X|	USING PROXY
259X|	COUNTRY MISMATCH AND WATCHLIST



## Account Validation Rule Codes

This section documents the result codes related to account validation policy processing.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Rule Editor section (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

CODE |	MEANING
-----|-------
10000|	NO FRAUD RULE TRIGGERED
10010|	USER FAILED VALIDATION
10020|	BLACKLIST
10030|	5 MINUTE ACCOUNT CREATION VELOCITY
10040|	1 HOUR ACCOUNT CREATION VELOCITY
10050|	24 HOUR ACCOUNT CREATION VELOCITY
10060|	28 DAY ACCOUNT CREATION VELOCITY
10150|	5 MINUTE ACCOUNT TRANSFER OUT VELOCITY
10160|	1 HOUR ACCOUNT TRANSFER OUT VELOCITY
10170|	24 HOUR ACCOUNT TRANSFER OUT VELOCITY
10180|	28 DAY ACCOUNT TRANSFER OUT VELOCITY
10280|	DEVICE REPUTATION
10320|	PAYMENT REPUTATION
10410|	MULTIPLE ACCOUNTS FOR DEVICE
10550|	DEVICE FAILED VALIDATION
10580|	WATCHLIST
10590|	5 MINUTE IP ACCOUNT CREATION VELOCITY
10620|	5 MINUTE IP ACCOUNT TRANSFER OUT VELOCITY
10630|	1 HOUR IP ACCOUNT CREATION VELOCITY
10660|	1 HOUR IP ACCOUNT TRANSFER OUT VELOCITY
10670|	24 HOUR IP ACCOUNT CREATION VELOCITY
10700|	24 HOUR IP ACCOUNT TRANSFER OUT VELOCITY
10710|	28 DAY IP ACCOUNT CREATION VELOCITY
10740|	28 DAY IP ACCOUNT TRANSFER OUT VELOCITY
10750|	UNSAFE PHONE
10760|	NO EMAIL ADDRESS HISTORY
10770|	UNMATCHED BILLING ADDRESS AND EMAIL ADDRESS
10780|	UNMATCHED BILLING NAME AND ADDRESS
10790|	3RD PARTY PROVIDER NOT ACCESSIBLE
10800|	HIGH RISK BILLING ADDRESS
10810|	HIGH RISK SHIPPING ADDRESS
10820|	SHIPPING COUNTRY NOT ACCEPTABLE
10830|	BILLING COUNTRY NOT ACCEPTABLE
10840|	IP COUNTRY NOT ACCEPTABLE
10850|	UNVALIDATED USER
10860|	MULTIPLE MERCHANT APPLICATIONS FOR DEVICE
10870|	MULTIPLE MERCHANT APPLICATIONS FOR PAYMENT
10880|	MULTIPLE MERCHANT APPLICATIONS FOR USER ACCOUNT
10890|	CHARGEBACK COUNT
10900|	MULTIPLE BILLLING ADDRESSES FOR USER ACCOUNT
10910|	MULTIPLE BILLLING ADDRESSES FOR DEVICE
10920|	IDANALYTICS IDSCORE
10930|	IP REPUTATION
10940|	BAD PROXY
10950|	DESTINATION FINANCIAL ACCOUNT REPUTATION
10960|	DESTINATION USER ACCOUNT REPUTATION
10970|	RESERVED
10980|	RESERVED
10990|	USING PROXY
11000|	RESERVED
11010|	USING DISPOSABLE EMAIL ADDRESS



## Automated Review Policy Rule Codes

This section documents the result codes related to Automated Review Policy processing.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Automated Review Policy section (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

CODE |	MEANING
-----|--------
20005|	ACCEPT TRANSACTION FROM A USER THAT HAS A GOOD HISTORY
20006|	ACCEPT PREPAID CARD
20007|	SIMILAR TRANSACTION PREVIOUSLY MANUALLY ACCEPTED
20008|	TRANSACTION AMOUNT IS BELOW THRESHOLD FOR REVIEW
20009|	COUNTRY MISMATCH OVERRIDE
20010|	ACCEPT MOTO=2 (REBILL) TRANSACTIONS



## Consumer/Merchant Application Security Tests

This section documents the security tests returned for Consumer or Merchant Applications.

TEST ID | SECURITY TEST NAME
-------|-----------------	
19:1|	Experian
19:2|	Experian ProveID: Name and Address Match
19:3|	Experian ProveID: High Risk Address Check
19:4|	Experian ProveID: Deceased
19:5|	Experian ProveID: OFAC
19:6|	Experian ProveID: Unsupported Country
19:7|	Experian ProveID: Previous Address Match
19:8|	Experian ProveID: Last Name and Address Match
19:9|	Experian ProveID: Date of Birth Match
19:10|	Experian ProveID: Alert
bc:0|	BlueCava 
bc:1|	BlueCava: Using Anonymous Proxy
bc:2|	BlueCava: Has Used Anonymous Proxy
bc:3|	BlueCava: Using Proxy
cq:1|	NeuStar/TargusInfo CQR: Valid Phone
cq:2|	NeuStar/TargusInfo CQR
cq:3|	NeuStar/TargusInfo CQR: Unsupported Country
ed:0|	Account Policy Evaluation
ed:1|	Black List
ed:10|	Payment First Seen
ed:11|	Device Reputation
ed:12|	Device Failed Validation
ed:13|	Device Merchant Application Count
ed:14|	Device Payment Count
ed:15|	Device User Account Count
ed:16|	Device Shipping Address Count
ed:17|	Device Billing Address Count
ed:18|	Device First Seen
ed:19|	User Account Reputation
ed:2|	Watch List
ed:20|	Account Failed Validation
ed:21|	User Account Application Count
ed:22|	User Account Payment Count
ed:23|	User Account Device Count
ed:24|	User Account Shipping Address Count
ed:25|	User Account Billing Address Count
ed:26|	User Account First Seen
ed:27|	Billing Address Reputation
ed:28|	Billing country on acceptable list
ed:29|	Email First Seen
ed:30|	User Validated
ed:31|	Acceptable State
ed:3|	Chargeback Count
ed:4|	Payment Reputation
ed:5|	Payment Instrument Application Count
ed:6|	Payment User Account Count
ed:7|	Payment Device Count
ed:8|	Payment Shipping Address Count
ed:9|	Payment Billing Address Count
ep:1|	Experian BusinessIQ Premier Profile
ep:2|	Experian BusinessIQ Premier Profile: Present in Database
ep:3|	Experian BusinessIQ Premier Profile: Active Business
ep:4|	Experian BusinessIQ Premier Profile: Intelliscore Plus Score
ev:1|	NeuStar/TargusInfo Email: Unsupported Country
ev:3|	Neustar/TargusInfo Email Confidence
ia:1|	IDAnalytics 
ia:2|	IDAnalytics IDScore
ia:3|	IDAnalytics IDScore: OFAC Check
ia:4|	IDAnalytics IDScore: Higher Risk
ia:5|	IDAnalytics IDScore: Inactive Credit
ia:6|	IDAnalytics IDScore: Unsupported Country
id:0|	Idology 
id:1|	Idology ExpectID: Public Records Match
id:2|	Idology ExpectID: SSN Valid
id:3|	Idology ExpectID: SSN Match
id:4|	Idology ExpectID: Date of Birth Match
id:5|	Idology ExpectID: Phone Match
id:6|	Idology ExpectID: Address Match
id:7|	Idology ExpectID: Warm Address
id:8|	Idology ExpectID: Hot Address
id:9|	Idology ExpectID: Deceased
id:10|	IDology ExpectID: Unsupported Country
iq:1|	IDAnalytics CertainID: Out of Wallet Questions
iq:2|	IDAnalytics CertainID: Unsupported Country
mh:0|	MATCH 
mh:1|	MATCH: Terminated Merchant
mh:2|	MATCH: Terminated Merchant for Fraudulent Reason
mm:0|	MaxMind MinFraud
mm:1|	MaxMind MinFraud: IP Bad Proxy
mm:2|	MaxMind MinFraud: IP Proxy
mm:3|	MaxMind MinFraud: IP Risk Score
mm:4|	MaxMind MinFraud: IP Country Code
mm:5|	MaxMind MinFraud: IP ISP
mm:6|	MaxMind MinFraud: IP City
mm:7|	MaxMind MinFraud: IP Region / State Match
nv:1|	Jumio NetVerify: Document Validity
nv:2|	Jumio NetVerify: Document Identity Match
nv:3|	Jumio NetVerify: Face Match
nv:4|	Jumio NetVerify: First Name
nv:5|	Jumio NetVerify: Last Name
nv:6|	Jumio NetVerify: Address
nv:7|	Jumio NetVerify: Date of Birth
nv:8|	Jumio NetVerify: ID Expiration
nv:9|	Jumio NetVerify: DoB Match
nv:10|	Jumio NetVerify: State Match
nv:11|	Jumio NetVerify: Multi Document
nv:12|	Jumio NetVerify: Scan ID
nv:13|	Jumio NetVerify: Unsupported Country
of:1|	IDology ExpectID PA
of:2|	IDology ExpectID PA: OFAC Check
jpo:1|	Phone Ownership: Correct Code Provided
ra:0|	RapLeaf 
ra:1|	RapLeaf: Email History
ra:2|	RapLeaf: Email First Seen
ra:3|	RapLeaf: Unsupported Country
ss:0|	Sanctions Screening
ss:1|	Sanctions Screening: Sanction Match
ss:2|	Sanctions Screening: Sanction List
ss:3|	Sanctions Screening: Sanction Entry Update
ts:1|	Telesign 
ts:2|	Telesign PhoneID: Telephone Number Safe
ts:3|	Telesign PhoneID: Telephone Country
ts:4|	Telesign PhoneID: Telephone City
ts:5|	Telesign PhoneID: Telephone Carrier
ts:6|	Telesign PhoneID: Telephone Contact
tc:0|	TIN Verification
tc:1|	TIN Verification: TIN and Name Match
tc:2|	TIN Verification: Possible Death Master File Match Found
tc:3|	TIN Verification: EIN and Name Match
tc:4|	TIN Verification: Lists Match
tc:5|	TIN Verification: Unsupported Country
tc:6|	TIN Verification: Address Match



# Appendix B: Additional Reseller Fields

## Transaction Validation Web Service

The following additional fields are available to resellers of the IdentityMind eDNA service:

	<table>
		<tr>
			<th colspan=4><h3>Transaction</h3></th>
		</tr>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Merchant ID</td>
			<td>m</td>
			<td>The EDNA API username of the merchant to whom the transaction is to be associated.  This field is used when the reseller’s credentials are used to authenticate the service call, but the transaction is to be associated with a Merchant that is being accessing the EDNA service via the reseller’s system.
			<br><br>  
			<b>Note:</b> that a Merchant account must be created in the EDNA system prior to providing this field.
			</td>
			<td>No</td>
		</tr>
	</table>


# Appendix C: Generic Gateway Codes

The gateway property of feedback lets IdentityMind know the gateway that processed the transaction, and how to interpret the response codes. IdentityMind supports many gateways natively, and adds new gateway support as requested by merchants. If a merchant would prefer to perform their own mapping from their gateway’s codes, the following generic gateway definition is provided. 

This appendix defines the values to be used for feedback properties for the generic gateway.

	<table>
		<tr>
			<th colspan=4><h3>"gateway" property</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>generic</td>
			<td></td>
		</tr>
		<tr>
			<th colspan=4><h3>"auth_response" property</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>accepted</td>
			<td>The transaction was approved by the gateway</td>
		</tr>
		<tr>
			<td>rejected</td>
			<td>The transaction was rejected by the gateway</td>
		</tr>
		<tr>
			<th colspan=4><h3>"avs_result" property</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>Y</td>
			<td>AVS match</td>
		</tr>
		<tr>
			<td>N</td>
			<td>AVS mismatch</td>
		</tr>
		<tr>
			<td>P</td>
			<td>AVS partial match</td>
		</tr>
		<tr>
			<td>U</td>
			<td>AVS unavailable</td>
		</tr>
		<tr>
			<th colspan=4><h3>"cvv2_result" property</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>Y</td>
			<td>CVV match</td>
		</tr>
		<tr>
			<td>N</td>
			<td>CVV mismatch</td>
		</tr>
		<tr>
			<th colspan=4><h3>"error_code" property in bank-accepted and bank-rejected feedback</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>0</td>
			<td>Approved</td>
		</tr>
		<tr>
			<td>1</td>
			<td>Insufficient funds</td>
		</tr>
		<tr>
			<td>2</td>
			<td>AVS mismatch</td>
		</tr>
		<tr>
			<td>3</td>
			<td>CVV mismatch</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Card verification</td>
		</tr>
		<tr>
			<td>5</td>
			<td>System error</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Cancelled card</td>
		</tr>
		<tr>
			<td>7</td>
			<td>Likely user input error. In IdentityMind's experience, the majority of bank declines are due to the consumer accidentally entering erroneous payment information. This error code is specifically handled within eDNA to reduce teh level of false positives from, for example, velocity based fraud rules. Examples of decline reasons that should be catagorized as Likely User Input Error are:
				<ul type="disc">
					<li>No Such Issuer</li>
					<li>Expired Card</li>
					<li>Invalid Card Number</li>
					<li>Invalid PIN</li>
				</ul></td>
		</tr>
		<tr>
			<td>8</td>
			<td>Fraud. For example, the card has responded with a code meaning "pickup card / stolen." Only use this error code if the gateway is explicit that this is a fraudulent card.</td>
		</tr>
		<tr>
			<td>9</td>
			<td>Gateway Fraud Filter - The gateway has decline the transaction due to its internal fraud filters</td>
		</tr>
		<tr>
			<td>10</td>
			<td>Other - An uncategorized code.</td>
		</tr>
		<tr>
			<th colspan=4><h3>"error_code" property in chargeback feedback</h3></th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>CB1</td>
			<td>Fraud</td>
		</tr>
		<tr>
			<td>CB2</td>
			<td>Merchant Error</td>
		</tr>
		<tr>
			<td>CB3</td>
			<td>Suspected Friendly Fraud</td>
		</tr>
		<tr>
			<td>CB4</td>
			<td>Other</td
	</table>

In addition to the above generic codes, the standard chargeback codes as defined by the card brands are supported.  Please reference http://www.managechargebacks.com/reasoncodes.html for the complete set.

Please contact IdentityMind support if you have questions with how to categorize a specific error code.

# Appendix D: Payment Instrument Hashing

## Including Credit number Hash and Token in Transaction Report

```java
For Java, the sample code is in imclientSDK/samplecode/java/REST/TransactionViaREST.java:

JSONObject jsonRequest = new JSONObject();

// credit card token and hash

// replace the 2nd parameter below with the actual card number

CreditCardUtils.addCreditCardData(jsonRequest, "4012012301230123"); 

…

// the json string generated below will include the token, and hashes generated from the actual number

String body = jsonRequest.toString(2);
```

```php
For PHP, the sample code is in imclientSDK/samplecode/php/ednaTransaction.php:

	$arr = array();

/* replace the 2nd parameter below with the actual card number */

	$arr[CREDIT_CARD_NUMBER] = identitymind_hashCCN("4012012301230123");

	$arr[CREDIT_CARD_TOKEN] = identitymind_tokenCCN("4012012301230123");

	…

/* Turn the array into a JSON string to be used as the body of the POST */

	$data = json_encode($arr);
```

IdentityMind Transaction API does not accept actual credit card number. It accepts the following information about the credit card number used in the transaction: 

1.	Credit card number hash
2.	Credit card number token 

IdentityMind provides a client SDK for Java and PHP. If you use these languages, you can use the SDK to include the information in your request to the API. The SDK contains sample code on how to do that.

**Note**: The hash must be of the full card number, not a masked or tokenized representation.
If you use other languages, please see below “Credit Card Number Hash”.


### Credit Card Number Hash

To generate the credit card number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non-masked credit card number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field pccn. 

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex, you would concatenate the salt and the credit card number and pass that to the function to get credit card number hash.   Note that all non-numeric characters should be removed from the card number prior to hashing.

Please contact IdentityMind to get the salt. 

For example, the salted credit card number hash for 4012012301230123 is 32c1950468af7489efb48c911f9550092ebf34c5

The credit card number hash should be included in the JSON string of the request to IdentityMind Transaction API in the field “pccn”. 

**Note**:  The hash must be of the full card number, not a masked or tokenized representation.


### Credit Card Number Token

The credit card number token is the first 6 digits of the actual card number followed by XXXXXX followed by the last 4 digits of the actual card number. For example, the credit card number token for card number 4012012301230123 is 401201XXXXXX0123. 

The credit card number token should be included in the JSON string of the request to IdentityMind Transaction API in the field “pcct”. 


## Including Bank Account Hash and Token in Transaction Request

```java
For Java, the sample code is in imclientSDK/samplecode/java/REST/ACHTransactionViaREST.java:

JSONObject jsonRequest = new JSONObject();

// bank account hash and token

BankAccountUtils.addBankAccountData(json, "321076479", "74600015199010"); 
	
…
	
// the json string generated below will include the token, and hash generated from the actual number
	
String body = jsonRequest.toString(2);
```

```php
For PHP, the sample code is in imclientSDK/samplecode/php/achEdnaTransaction.php:

	$arr = array();

/* replace the 2nd parameter below with the actual card number */

$arr[BANK_ACCOUNT_NUMBER] = identitymind_hashBankRoutingAccount("321076479", "74600015199010");

$arr[BANK_ACCOUNT_TOKEN] = identitymind_bankRoutingAccountToken("321076479", "74600015199010");

	…

/* Turn the array into a JSON string to be used as the body of the POST */

	$data = json_encode($arr);
```

Similar to the mechanism for sending credit card information, IdentityMind Transaction API accepts: 

1.	Bank account number hash
2.	Bank account number token 

IdentityMind provides a client SDK for Java and PHP. If you use these languages, you can use the SDK to include the information in your request to the API. The SDK contains sample code on how to do that.

If you use other languages, please see “Bank Account Number Hash” below.

**Note**: The hash must be of the full account number, not a masked or tokenized representation.

### Bank Account Number Hash

To generate the bank account number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non masked account number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field “pach”.

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex:

- for a US bank account number concatenate the salt and the routing number and account number and pass that to the function to get account number hash
- for an international IBAN account number concatenate the salt and full IBAN account number and pass that to the function to get account number hash

**Note**: All spaces and dashes should be removed from the account number prior to hashing.

Please contact IdentityMind to get the salt. 

For example, the salted bank account number hash for 321076479 74600015199010 is 3f57733f34b677294fed96efd440b8d9e7728fa5 and the hash for SN12K00100152000025690007542 is dd91898995dfef188eca122c5e0dd92f3aa34550

The account number hash should be included in the JSON string of the request to IdentityMind Transaction API in the field “pach."


### Bank Account Number Token

For the bank account number token we recommend: 
- for a US bank account number the first 6 digits of the routing number, followed by XXXXXXXX and the last 4 digits of the account number
- for an international IBAN account number the first 6 digits of the account, followed by XXXXXXXX and the last 4 digits of the account number

For example, the token for 321076479 74600015199010 is 321076XXXXXXXX9010 and the hash for SN12K00100152000025690007542 is SN12K0XXXXXXXX7542

The bank account number token should be included in the JSON string of the request to IdentityMind Transaction API in the field “ptoken." 


# Appendix E: Change History


## 1.18

- Updated Merchant and Consumer Application Validation Web Services to support multiple owners for a merchant.  We also added extra fields as required by our clients.
- Added additional security tests


## 1.17.1

- Added Account Validation Rule 11010
- Switched from Experian 192 CheckID to Experian ProveID
	- Added “Unsupported Country” security test to Experian


## 1.17

- Document the Quiz Response (Phone Ownership)
- Add Auth.net and Interac as supported gateways
- Document application accepted and rejected API
- Added bank_status property to the Merchant Accept/Reject Feedback API
- Corrected format of the “ufs” and “umrs” fields
- Add API call to get the current state of a consumer or merchant application
- Clarify that a payment hash must be of the original non-masked account number
- Documented memo field in Transfer and KYC transaction data


## 1.16.2

- Added support for Jumio Netverify Multi Document
- Added additional KYC request attributes to support Jumio NetVerify
	- Face match in NetVerify Perform
	- Backside Image in NetVerity Perform
- Add security tests
	- IdentityMind Sanctions Screening
	- Jumio NetVerify Multi Document