# Payment Transaction

The evidence is the payment transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, anti-fraud evaluation is more comprehensive when richer evidence is provided. 

The following URL can be used for requesting payment transaction anti-fraud evaluation:  
`POST https://edna.identitymind.com/im/transaction`

#### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{ 
  	"amt" : 40,
  	"bc" : "Palo Alto",
  	"bco" : "US",
 	"bfn" : "James",
 	"bln" : "Dinh",
	"bz" : "55555",
  	"bs" : "CA",
  	"bsn" : "123 anystreet",
  	"dft" : "BC",
  	"dfp" : "1872ABCD129E…",
  	"pccn" : "4513bfe30439b317d3a504ecac74858965a89ce7",
  	"pcct" : "411111XXXXXX1111",
  	"tea" : "james@gmail.com",
  	"aph" : "555555555",
  	"ip" : "69.181.162.146",
  	"sc" : "Palo Alto",
  	"sco" : "US",
  	"sfn" : "James",
	"sln" : "Dinh",
  	"sz" : "55555",
  	"ss" : "CA",
  	"ssn" : "123 anystreet",
  	"tid" : "89"
}

```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{ 
  "res" : "ACCEPT",
  "tid" : "89",
  "transaction_status" : "complete",
  "rcd" : "1000,100,110,151,120",
  "frn":"Fallthrough",
  "frd":"User is trusted and no fraud rules were triggered."
}

{
  "transaction_status" : "error",
  "error_message" : "Bad data format:Failed to parse the date string provided in the data.  Please use ISO 8601 format."
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
			<td>ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is <code>US</code>. Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Shipping Name</th>
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
			<td>ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is <code>US</code>. Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
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
					<li><code>BC</code> - BlueCava</li>
				</ul> 
			Default is <code>BC</code></td>
			<td>data</td>
		</tr>
		<tr>
			<td>blg</td>
			<td>The configured language of the browser. Typically available in the <code>HTTP_ACCEPT_LANGUAGE</code> header. Values are defined in ISO-639-1.</td>
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
			<td>tea</td>
			<td>Email of the user account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, used for OAuth authentication. The content of the field is merchant defined, but the following values are recommended: 
				<ul type="disc">
					<li><code>facebook</code></li>
					<li><code>google</code></li>
					<li><code>twitter</code></li>
					<li><code>yahoo</code></li>
				</ul>
			Maximum length is 60 characters.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>acd</td>
			<td>The account creation date. Either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"acd": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"acd":1293887536</code></li>
					<li><code>"acd":"1293887536"</code></li>
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
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. <code>"clat":"37.4419"</code>)</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. <code>"clong":"-122.1419"</code>)</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Credit Card</th>
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
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code>
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's <code>PAYERID</code> field from the PayPal Express Checkout.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated with the PayPal account. It corresponds to PayPal's <code>EMAIL</code> field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ppps</td>
			<td>Whether the user is verified or unverified. It corresponds to PayPal's <code>PAYERSTATUS</code> field from the PayPal Express Checkout.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pppc</td>
			<td>Whether the address provided by the consumer matches the one registered with PayPal. Values are:
				<ul type="disc">
					<li><code>none</code></li>
					<li><code>confirmed</code></li>
					<li><code>unconfirmed</code></li>
				</ul>
			It corresponds to PayPal's <code>PAYMENTREQUEST n ADDRESSSTATUS</code> or <code>ADDRESSSTATUS</code> fields from the PayPal Express Checkout.
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the <code>buyer-id</code> element.</td>
			<td>Yes*</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout Account. It corresponds to the <code>email</code> element.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gcpe</td>
			<td>Whether the user is eligible for Google's risk information protection. It corresponds to the <code>eligible-for-protection</code>" element in the <code>risk-information</code> API. Accepted value is <code>true</code> or <code>false</code>. Default is <code>false</code>.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gcba</td>
			<td>Age associated ot the account. It corresponds to the <code>buyer-account-age</code> element in the <code>risk-information</code> API.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Generic Financial Account</th>
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
			<td>amt</td>
			<td>Total amount for the transaction. Encoded as a string or a double. Both of the following are accepted:
				<ul type="disc">
					<li><code>"amt":"42.00"</code></li>
					<li><code>"amt":42.00</code></li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>vg</td>
			<td>Whether the transaction is associated to a virtual good (<code>true</code>) as opposed to a physical good (<code>false</code>). The default is <code>false</code>.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>sub</td>
			<td>Whether the transaction is associated to a subscription service. The default is <code>false</code>.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is <code>USD</code>. Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none provided. The transaction ID must be encoded as a string (e.g. <code>"tid":"123455"</code>). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, either as a ISO 8601 encoded string or a unix timestamp.
				<ul type="disc">
					<li><code>"tti": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"tti":1293887536</code></li>
					<li><code>"tti":"1293887536"</code></li>
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
					<li><code>"smid"="42"</code></li>
					<li><code>"smid"="Acme"</code></li>
			</ul>
			<br>Maximum length is 255 characters.<br>
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
					<li><code>"smna":"Acme"</code></li>
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
					<li><code> </code> - (space) card present</li>
					<li><code>1</code> - one time mail / phone order</li>
					<li><code>2</code> - recurring payment</li>
					<li><code>3</code> - installment payment</li>
					<li><code>4</code> - other</li>
					<li><code>5</code> - 3D secure full</li>
					<li><code>6</code> - 3D secure merchant</li>
					<li><code>7</code> - eCommerce (channel encrypted)</li>
					<li><code>8</code> - eCommerce (non-secure)</li>
				</ul>
			<br><br>
			The default is <code>7</code> if this field is not supplied.
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
					<li><code>MES</code> - Merchant e-Solutions</li>
					<li><code>GC</code> - Google Checkout</li>
					<li><code>PPP</code> - PayPal Pro</li>
					<li><code>PFP</code> - Pay Flow Pro</li>
					<li><code>CDP</code> - Centro de Pagos</li>
					<li><code>commerce</code> - CommerceGate</li>
					<li><code>DHD</code> - DHD Media</li>
					<li><code>IDM</code> - IDMPay</li>
					<li><code>SC</code> - Safe Charge</li>
					<li><code>AUTH</code> - Auth.net</li>
					<li><code>INTERAC</code> - Interac</li>
					<li><code>generic</code> - See <i>Appendix C: Generic Gateway Codes</i></li>
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

## Chargeback Notification

Notifies that a chargeback occurred on a transaction. Note that the transaction may be either a Payment Transaction or an Account Transfer.

In the case of a chargeback on a transaction that eDNA has not previously processed then the Payment Instrument information is required.

The following URL can be used for requesting chargeback notification evaluation:  
`POST https://edna.identitymind.com/im/jax/chargeback/`

#### Arguments
```code
EXAMPLE SERVICE REQUEST
```
```json
{
     "amt": 250,
     "cbtype": "DEBIT",
     "pccn": "DNsxhwmQCWeC5gPxTOwPRZlFfx",
     "pcct": "401201XXXXXX1110",
     "tid": "9900040"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message": "credit notification accepted"
}

{
  "error_message": "A JSONObject text must begin with ‘{‘ at character 1"
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
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is <code>USD</code>. Maximum length is three characters.</td>
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
					<li><code>DEBIT</code></li>
					<li><code>CREDIT</code></li>
					<li><code>REPRESENTMENT</code></li>
					<li><code>REVERSAL</code></li>
				</ul>
			The default is <code>DEBIT</code> if not provided.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>cbdate</td>
			<td>Date of the chargeback action. For example, if the cbtype is <code>CREDIT</code>, then the date field should be the date that the <code>CREDIT</code> happens. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"cbdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"cbdate":1293887536</code></li>
					<li><code>"cbdate":"1293887536"</code></li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>authdate</td>
			<td>Date of the original authorization transaction. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"authdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"authdate":1293887536</code></li>
					<li><code>"authdate":"1293887536"</code></li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>The name of the payment gateway used. This information is used to interpret the result/error codes. Currently, we support:
				<ul type="disc">
					<li><code>MES</code> - Merchant e-Solutions</li>
					<li><code>GC</code> - Google Checkout</li>
					<li><code>PPP</code> - PayPal Pro</li>
					<li><code>PFP</code> - Pay Flow Pro</li>
					<li><code>CDP</code> - Centro de Pagos</li>
					<li><code>commerce</code> - CommerceGate</li>
					<li><code>DHD</code> - DHD Media</li>
					<li><code>IDM</code> - IDMPay</li>
					<li><code>SC</code> - Safe Charge</li>
					<li><code>AUTH</code> - Auth.net</li>
					<li><code>INTERAC</code> - Interac</li>
					<li><code>generic</code> - See <i>Appendix C: Generic Gateway Codes</i></li>
				</ul>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data. 
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. <code>"tid":"123455"</code>). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Sub Merchant</th>
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
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
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
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's <code>PAYERID</code> field from PayPal Express Checkout.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's <code>EMAIL</code> field from PayPal Express Checkout.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the <code>buyer-id</code> element.</td>
			<td>Yes, if the provided tid does not refer to a transaction previously processed by eDNA.</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It corresponds to the <code>email</code> element.</td>
			<td>No</td>
		</tr>
	</table>

## Credit Notification

Notifies that a credit occurred on a transaction.

In the case of credit or blind credit on a transaction that eDNA has not previously processed, then the payment instrument information is required.

The following URL can be used for credit notification evaluation:  
`POST https://edna.identitymind.com/im/jax/credit/`
 
**Note**: The transaction may either be a payment transaction or an account transfer. 

#### Arguments
```code
EXAMPLE SERVICE REQUEST
```
```json
{
     "amt": 10.4,
     "pccn": "DNsxhwmQCWeC5gPxTOwPRZlFfx",
     "pcct": "401201XXXXXX1110",
     "tid": "988833" 
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message": "credit notification accepted"
}

{
  "error_message": "A JSONObject text must begin with ‘{‘ at character 1"
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
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is <code>USD</code>. Maximum length is three characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing the reason for the credit</td>
			<td>No</td>
		</tr>
		<tr>
			<td>crdate</td>
			<td>Date of the credit action. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"crdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"crdate":1293887536</code></li>
					<li><code>"crdate":"1293887536"</code></li>
				</ul>
			</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. <code>"tid":"123455"</code>). Maximum length is 40 characters.
			</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Sub Merchant</th>
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
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>PayPal</th>
		</tr>
		<tr>
			<td>pppi</td>
			<td>PayPal Payer ID. It corresponds to PayPal's <code>PAYERID</code> field from PayPal Express Checkout.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's <code>EMAIL</code> field from the PayPal Express Checkout</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Google Checkout</th>
		</tr>
		<tr>
			<td>gcbi</td>
			<td>Google Checkout Buyer ID. It corresponds to the <code>buyer-id</code> element.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>gcem</td>
			<td>Email address associated to the Google Checkout account. It corresponds to the <code>email</code> element.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Generic Financial Account</th>
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

## Transaction Neutral/Refund Notification

Notifies that a refund occurred on a transaction. All arguments are optional.

The transaction ID is part of the URL. The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud`

**Note**: The transaction may be either a payment transaction or an account transfer.

#### Arguments
```code
EXAMPLE SERVICE REQUEST
```
```json
{
    "amt": 0.25,
    "auth_response": "rejected",
    "auth_response_text": "Transaction already refunded",
    "error_code": "206",
    "reason": "Suspected friendly fraud",
    "tid": "42"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
    "message": "Feedback accepted for REFUND_FRAUD feedback on transaction 42"
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
					<li><code>a</code> - auth_only</li>
					<li><code>c</code> - captured</li>
					<li><code>d</code> - declined</li>
					<li><code>v</code> - void</li>
					<li><code>r</code> - refund</li>
					<li><code>b</code> - chargeback</li>
					<li><code>u</code> - unknown</li>
				</ul>
			Default is <code>u</code>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Transaction ID. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>

## Final Payment Transaction Result

#### Arguments

The following URLs are used to notify IdentityMind of the acceptance or rejection of the transaction that was previously analyzed with the given transaction ID by the merchant's payment gateway or the merchant themselves. All arguments are optional. The transaction ID is part of the URL.

##### Bank Authorization Feedback

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-accepted`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/bank-rejected`

##### Merchant Final Resolution Feedback

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-user-validated`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-user-failed-validation`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/accepted-default`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/rejected-default`

**Note**: The transaction may be a payment transaction or an account transfer.

```code
EXAMPLE SERVICE REQUEST
```
```json
{
  "auth_code": "T1627H",
  "auth_response_text": "Decline",
  "avs_result": "Y",
  "error_code": "05"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message": "Feedback accepted for ACCEPT feedback on transaction 42"
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
					<li><code>MES</code> - Merchant e-Solutions</li>
					<li><code>GC</code> - Google Checkout</li>
					<li><code>PPP</code> - PayPal Pro</li>
					<li><code>PFP</code> - Pay Flow Pro</li>
					<li><code>CDP</code> - Centro de Pagos</li>
					<li><code>commerce</code> - CommerceGate</li>
					<li><code>DHD</code> - DHD Media</li>
					<li><code>IDM</code> - IDMPay</li>
					<li><code>SC</code> - Safe Charge</li>
					<li><code>AUTH</code> - Auth.net</li>
					<li><code>INTERAC</code> - Interac</li>
					<li><code>generic</code> - See <i>Appendix C: Generic Gateway Codes</i></li>
				</ul>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data.</td>
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
					<li><code>a</code> - auth_only</li>
					<li><code>c</code> - captured</li>
					<li><code>d</code> - declined</li>
					<li><code>v</code> - void</li>
					<li><code>r</code> - refund</li>
					<li><code>b</code> - chargeback</li>
					<li><code>u</code> - unknown</li>
				</ul>
			Default is <code>u</code>
			<td>No</td>
		</tr>
	</table>