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
			<td>Date of the chargeback action. For example, if the cbtype is "CREDIT," then the date field should be the date that the "CREDIT" happens. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
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
			<td>Date of the original authorization transaction. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
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
					<li>"generic" - See <i>Appendix C: Generic Gateway Codes</i></li>
				</ul>
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