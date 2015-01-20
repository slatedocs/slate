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
  “error_message” : “Bad data format:Failed to parse the date string provided in the data.  Please use ISO 8601 format.”
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
			<td>The account creation date. Either an ISO 8601 encoded string or a UNIX timestamp.
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
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, either as a ISO 8601 encoded string or a unix timestamp.
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
			<td>The affiliate signup/creation date associated with this transaction. Either an ISO 8601 encoded string or UNIX timestamp.</td>
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