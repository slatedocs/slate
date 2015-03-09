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
			<th>amt</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>ccy</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pppi</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>m</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>Key</td>
			<td>Description</td>
		</tr>

	</table>

**Only one payment instrument is required. eDNA supports credit card, PayPal, and Google Checkout.*

***Inline feedback elements provide the results from the gateway call at the same time the payment transaction is being passed for anti-fraud evaluation. Inline feedback is only applicable when the anti-fraud evaluation is performed after the merchant receives the information from the gateway.*

**Note**: The clear text credit card number is never sent to IdentityMind. Instead, IdentityMind uses a cryptographically secure hash to have a unique representation of each credit card. IdentityMind provides the required utilities to generate these hashes.

## Transaction Feedback

### Transaction Neutral/Refund Notification

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
		</tr>
		<tr>
			<td>amt</td>
			<td>Amount of the refund/chargeback<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Response code from the gateway<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Text describing response code<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>Error code from the gateway, if an<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing reason for refund/chargeback<br><br><i>String, optional</i></td>
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
			<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Transaction ID. Maximum length is 40 characters.<<br><br><i>String, optional</i></td>
		</tr>
	</table>

### Final Payment Transaction Result

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
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Whether the gateway accepted or rejected the transaction<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>The error code fields from the authorization request as expressed by the gateway<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Auth comments from the gateway<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Free-form descriptive text providing additional information about the feedback<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td>The AVS response code from the gateway<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td>The CVV2 response code from the gateway<br><br><i>String, optional</i></td>
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
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data.<br><br><i>String, optional</i></td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td>Returned authorization code<br><br><i>String, optional</i></td>
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
			Default is <code>u</code><br><br><i>String, optional</i></td>
		</tr>
	</table>