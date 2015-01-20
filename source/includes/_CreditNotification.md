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
					<li><code>“crdate”: “2011-01-01T13:12:16+0000”</code></li>
					<li><code>“crdate”:1293887536</code></li>
					<li><code>“crdate”:”1293887536”</code></li>
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
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
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
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
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