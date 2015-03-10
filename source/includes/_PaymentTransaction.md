# Payment Transaction

The evidence is the payment transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, anti-fraud evaluation is more comprehensive when richer evidence is provided. 

The following URL can be used for requesting payment transaction anti-fraud evaluation:<br>  
`POST https://edna.identitymind.com/im/transaction`

The following URL can be used to retrieve the current state of a transaction:<br>
`GET https://edna.identitymind.com/im/transaction/<transaction_id>`

##### Arguments

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
	<table>
		<tr>
			<th colspan=2>Payment Transaction Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>amt</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Transaction amount</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Transaction currency</td>
		</tr>
		<tr>
			<td>pppi</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			PayPal Payer ID</td>
		</tr>
		<tr>
			<td>pppe</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			PayPal Payer Email</td>
		</tr>
		<tr>
			<td>reason</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>m</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Merchant Identifier. Used when a reseller is proxying requests for their merchants. Please contact IdentityMind support for further details of the usage of this field</td>
		</tr>
		<tr>
			<td>tid</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Transaction Identifier. If not provided, an ID will be allocated</td>
		</tr>
		<tr>
			<td>pcty</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			The card type. Values are:
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
		</tr>
		<tr>
			<td>phash</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Generic payment account unique identifier (Hash). This is used when IdentityMind does not natively support the payment type. NOTE: The hash must be of the full account number, not a masked or tokenized representation.,</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			A masked or tokenized version of the account token.</td>
		</tr>
		<tr>
			<td>pccn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>
			Credit Card unique identifier (Hash). IdentityMind will supply procedure to generate hash. NOTE: The hash must be of the full card number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td><font color=#446CB3>string</font>, optional<br><br>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
		</tr>
		<tr>
			<td>man</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>tea</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>soc</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>ip</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>dft</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>tti</td>
			<td><font color=#446CB3>integer</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bfn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bln</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>profile</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>smna</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>smid</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bco</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bz</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bc</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bs</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>sfn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>sln</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>ssn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>sco</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>sz</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>sc</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>ss</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>blg</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>clat</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>clong</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>phn</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>pm</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>pw</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>pach</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>memo</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
	</table>

**Note**: The clear text credit card number is never sent to IdentityMind. Instead, IdentityMind uses a cryptographically secure hash to have a unique representation of each credit card. IdentityMind provides the required utilities to generate these hashes.

##### Response

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

> The response includes detailed result codes and the transaction unique identifier. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured fraud policy.

	<table>
		<tr>
			<th colspan=2>Transaction Reponse Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>user</td>
			<td><font color=#446CB3>EDNAPolicyResult</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>erd</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>upr</td>
			<td><font color=#446CB3>EDNAPolicyResult</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>res</td>
			<td><font color=#446CB3>FraudPolicyResult</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>rcd</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>frn</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>frp</td>
			<td><font color=#446CB3>FraudPolicyResult</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>frd</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>arpr</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>arpid</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>usc</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>ednaScoreCard</td>
			<td><font color=#446CB3>ExternalizedTransactionScorecard</font><br><br>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar</td>
			<td><font color=#446CB3>AutomatedReviewEngine</font><br><br>Description</td>
		</tr>
		<tr>
			<td>tr</td>
			<td><font color=#446CB3>array[TestResult]</font><br><br>Description</td>
		</tr>
		<tr>
			<td>er</td>
			<td><font color=#446CB3>ExternalizedEvaluationResult</font><br><br>Description</td>
		</tr>
		<tr>
			<th colspan=2>Automated Review Engine Result</th>
		</tr>
		<tr>
			<td>result</td>
			<td><font color=#446CB3>ReviewResult</font><br><br>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>ruleName</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>ruleDescription</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<th colspan=2>Test Result</th>
		</tr>
		<tr>
			<td>testId</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>testDetails</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>testPass</td>
			<td><font color=#446CB3>boolean</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>testResult</td>
			<td><font color=#446CB3>Object</font><br><br>Description</td>
		</tr>
		<tr>
			<td>waitingForData</td>
			<td><font color=#446CB3>boolean</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>previouslyAccepted</td>
			<td><font color=#446CB3>boolean</font><br><br>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Evaluation Result</th>
		</tr>
		<tr>
			<td>firedRules</td>
			<td><font color=#446CB3>List[ExternalizedRule]</font><br><br>Description</td>
		</tr>
		<tr>
			<td>reportedRule</td>
			<td><font color=#446CB3>ExternalizedRule</font><br><br>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Rule</th>
		</tr>
		<tr>
			<td>name</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>details</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>description</td>
			<td><font color=#446CB3>string</font><br><br>Description</td>
		</tr>
		<tr>
			<td>resultCode</td>
			<td><font color=#446CB3>FraudPolicyResult</font><br><br>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td><font color=#446CB3>integer</font><br><br>Description</td>
		</tr>
	</table>

## Transaction Feedback

##### Transaction Neutral/Refund Notification

Notifies IdentityMind that a refund occurred on a transaction.

The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback. All arguments are optional.

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-fraud`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-partial-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-partial-fraud`

##### Bank Authorization Feedback

Notifies IdentityMind of the acceptance or rejection of the transaction that was previously analyzed with the given transaction ID by the merchant's payment gateway or the merchant themselves. All arguments are optional.

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/bank-accepted`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/bank-rejected`

##### Merchant Final Resolution Feedback

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted-user-validated`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-user-failed-validation`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted-default`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-default`

**Note**: The transaction may be a payment transaction or an account transfer.

##### Arguments
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
			<th colspan=2>Feedback Data</th>
		</tr>		
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>reason</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>validation_status</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>how_validated</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>how_validated_details</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>validation_details</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>details</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>amt</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>bank_status</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
	</table>

##### Response

	<table>		
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>message</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
		<tr>
			<td>error_message</td>
			<td><font color=#446CB3>string</font>, optional<br><br>Description</td>
		</tr>
	</table>