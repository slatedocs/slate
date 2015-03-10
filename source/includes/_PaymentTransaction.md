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
			<td>amt<br><font color=#446CB3>string</font>, optional</td>
			<td>Transaction amount</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font>, optional</td>
			<td>Transaction currency</td>
		</tr>
		<tr>
			<td>pppi<br><font color=#446CB3>string</font>, optional</td>
			<td>PayPal Payer ID</td>
		</tr>
		<tr>
			<td>pppe<br><font color=#446CB3>string</font>, optional</td>
			<td>PayPal Payer Email</td>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>m<br><font color=#446CB3>string</font>, optional</td>
			<td>Merchant Identifier. Used when a reseller is proxying requests for their merchants. Please contact IdentityMind support for further details of the usage of this field</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font>, optional</td>
			<td>Transaction Identifier. If not provided, an ID will be allocated</td>
		</tr>
		<tr>
			<td>pcty<br><font color=#446CB3>string</font>, optional</td>
			<td>The card type. Values are:
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
		</tr>
		<tr>
			<td>phash<br><font color=#446CB3>string</font>, optional</td>
			<td>Generic payment account unique identifier (Hash). This is used when IdentityMind does not natively support the payment type. NOTE: The hash must be of the full account number, not a masked or tokenized representation.,</td>
		</tr>
		<tr>
			<td>ptoken<br><font color=#446CB3>string</font>, optional</td>
			<td>A masked or tokenized version of the account token.</td>
		</tr>
		<tr>
			<td>pccn<br><font color=#446CB3>string</font>, optional</td>
			<td>Credit Card unique identifier (Hash). IdentityMind will supply procedure to generate hash. NOTE: The hash must be of the full card number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>pcct<br><font color=#446CB3>string</font>, optional</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
		</tr>
		<tr>
			<td>man<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tea<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>soc<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ip<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dfp<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dft<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tti<br><font color=#446CB3>integer</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bfn<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bln<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>profile<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smna<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bsn<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bco<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bz<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bc<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bs<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sfn<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sln<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ssn<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sco<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sz<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sc<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ss<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflid<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflsd<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>blg<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clat<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clong<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>phn<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pm<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pw<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pach<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pbc<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>memo<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
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
			<td>user<br><font color=#446CB3>EDNAPolicyResult</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>erd<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>upr<br><font color=#446CB3>EDNAPolicyResult</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>res<br><font color=#446CB3>FraudPolicyResult</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>rcd<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frn<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frp<br><font color=#446CB3>FraudPolicyResult</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frd<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpr<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpid<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>usc<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ednaScoreCard<br><font color=#446CB3>ExternalizedTransactionScorecard</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar<br><font color=#446CB3>AutomatedReviewEngine</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tr<br><font color=#446CB3>array[TestResult]</font</td>
			<td>>Description</td>
		</tr>
		<tr>
			<td>er<br><font color=#446CB3>ExternalizedEvaluationResult</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Automated Review Engine Result</th>
		</tr>
		<tr>
			<td>result</td>
			<td><font color=#446CB3>ReviewResult</font>Description</td>
		</tr>
		<tr>
			<td>ruleId<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleName<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleDescription<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Test Result</th>
		</tr>
		<tr>
			<td>testId<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testDetails<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testPass<br><font color=#446CB3>boolean</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testResult<br><font color=#446CB3>Object</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>waitingForData<br><font color=#446CB3>boolean</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>previouslyAccepted<br><font color=#446CB3>boolean</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Evaluation Result</th>
		</tr>
		<tr>
			<td>firedRules<br><font color=#446CB3>List[ExternalizedRule]</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>reportedRule<br><font color=#446CB3>ExternalizedRule</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Rule</th>
		</tr>
		<tr>
			<td>name<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>description<br><font color=#446CB3>string</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>resultCode<br><font color=#446CB3>FraudPolicyResult</font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleId<br><font color=#446CB3>integer</font></td>
			<td>Description</td>
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
			<td>reason<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>validation_status<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>how_validated<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>how_validated_details<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>validation_details<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>amt<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bank_status<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
	</table>

##### Response

	<table>		
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>message<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>error_message<br><font color=#446CB3>string</font>, optional</td>
			<td>Description</td>
		</tr>
	</table>