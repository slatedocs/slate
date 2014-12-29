---
title: eDNA API Reference

language_tabs:
  - java
  - javascript
  - PHP
  - python
  - ruby
  - shell

toc_footers:
  - placeholder

includes:
  - errors

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

## URL

placeholder

## Example Service Request

placeholder

## Response

placeholder


# Login Annotation Web Service

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Appendix A: Result Keys and Codes

## Result Key Names

### Payment Transaction

placeholder

### Account Transfer / Login Validation Transaction

placeholder

### Merchant/Customer Application Transaction

placeholder


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

placeholder

## Account Validation Rule Codes

placeholder

## Automated Review Policy Rule Codes

placeholder

## Consumer/Merchant Application Security Tests

placeholder


# Appendix B: Additional Reseller Fields

## Transaction Validation Web Service

placeholder


# Appendix C: Generic Gateway Codes

## "gateway" property

placeholder

## "auth_response" property

placeholder

## "avs_result" property

placeholder

## "cvv2_result" property

placeholder

## "error_code" property in bank-accepted and bank-rejected feedback

placeholder

## "error_code" property in chargeback feedback

placeholder


# Appendix D: Payment Instrument Hashing

## Including Credit number Hash and Token in Transaction Report

placeholder

### Credit Card Number Hash

placeholder

### Credit Card Number Token

placeholder

## Including Bank Account Hash and Token in Transaction Request

placeholder

### Bank Account Number Hash

placeholder

### Bank Account Number Token

placeholder


# Appendix E: Change History


## 1.18

placeholder

## 1.17.1

placeholder

## 1.17

placeholder

## 1.16.2

placeholder
