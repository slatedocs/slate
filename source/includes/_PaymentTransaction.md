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
			<td>Free-form descriptive text providing additional information about the feedback</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font>, optional</td>
			<td>The name of the payment gateway used. This infromation is used to interpret the result/error codes.
				<ul type="disc">
					<li><code>MES</code> - Merchant e-Solutions</li>
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
				</ul></td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font>, optional</td>
			<td>The error code, if any, from the gateway. Values are dependent on the gateway used.</td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font>, optional</td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - AVS match</li>
					<li><code>N</code> - AVS mismatch</li>
					<li><code>P</code> - AVS partial match</li>
					<li><code>U</code> - AVS unavailable</li>
				</ul></td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Authorization code returned by the gateway</td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font>, optional</td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - CVV match</li>
					<li><code>N</code> - CVV mismatch</li>
				</ul></td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font>, optional</td>
			<td>Auth comments from the gateway</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font>, optional</td>
			<td>The result of the auth/sale to the gateway. Possible values are:
				<ul type="disc">
					<li><code>accepted</code></li>
					<li><code>rejected</code></li>
				</ul></td>
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
			<td>man<br><font color=#446CB3>string</font>, optional</td>
			<td>Account name for the user</td>
		</tr>
		<tr>
			<td>tea<br><font color=#446CB3>string</font>, optional</td>
			<td>Email address for the user</td>
		</tr>
		<tr>
			<td>soc<br><font color=#446CB3>string</font>, optional</td>
			<td>OAuth service that authenticated the user. For example, <code>google</code> or <code>facebook</code></td>
		</tr>
		<tr>
			<td>ip<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer's IP address</td>
		</tr>
		<tr>
			<td>dfp<br><font color=#446CB3>string</font>, optional</td>
			<td>Device fingerprint blob</td>
		</tr>
		<tr>
			<td>dft<br><font color=#446CB3>string</font>, optional</td>
			<td>Device fingerprint type</td>
		</tr>
		<tr>
			<td>tti<br><font color=#446CB3>Object</font>, optional</td>
			<td>Transaction time in UTC. Encoded as a Unix timestamp or ISO 8601 string.</td>
		</tr>
		<tr>
			<td>bfn<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing first name</td>
		</tr>
		<tr>
			<td>bln<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing last name</td>
		</tr>
		<tr>
			<td>pccn<br><font color=#446CB3>string</font>, optional</td>
			<td>Credit card unique identifier (hash). IdentityMind will supply procedure to generate hash.<br><br> 
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>pcct<br><font color=#446CB3>string</font>, optional</td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
		</tr>
		<tr>
			<td>pcty<br><font color=#446CB3>string</font>, optional</td>
			<td>The card type. Possible values are:
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
		</tr>
		<tr>
			<td>phash<br><font color=#446CB3>string</font>, optional</td>
			<td>Generic payment account unique identifier (hash). This is used when IdentityMind does not natively support the payment type.<br><br> 
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>ptoken<br><font color=#446CB3>string</font>, optional</td>
			<td>A masked or tokenized version of the account token.</td>
		</tr>
		<tr>
			<td>profile<br><font color=#446CB3>string</font>, optional</td>
			<td>The policy profile to be used to evaluate this transaction. Prior to IDMRISK 1.19, this was encoded in the <code>smna</code> and <code>smid</code> fields.</td>
		</tr>
		<tr>
			<td>smna<br><font color=#446CB3>string</font>, optional</td>
			<td>Deprecated<br><br>The user-friendly name for the merchant for whom this transaction is being processed.</td>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font>, optional</td>
			<td>Deprecated<br><br>A unique identifier for the merchant for whom this transaction is being processed. </td>
		</tr>
		<tr>
			<td>bsn<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>bco<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing country. ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is <code>US</code>.</td>
		</tr>
		<tr>
			<td>bz<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing zip / postal code</td>
		</tr>
		<tr>
			<td>bc<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing city</td>
		</tr>
		<tr>
			<td>bs<br><font color=#446CB3>string</font>, optional</td>
			<td>Billing state</td>
		</tr>
		<tr>
			<td>sfn<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping first name</td>
		</tr>
		<tr>
			<td>sln<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping last name</td>
		</tr>
		<tr>
			<td>ssn<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>sco<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping country. ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is <code>US</code></td>
		</tr>
		<tr>
			<td>sz<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping zip / postal code</td>
		</tr>
		<tr>
			<td>sc<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping city</td>
		</tr>
		<tr>
			<td>ss<br><font color=#446CB3>string</font>, optional</td>
			<td>Shipping state</td>
		</tr>
		<tr>
			<td>aflid<br><font color=#446CB3>string</font>, optional</td>
			<td>Affiliate ID. The client specific identifier for the affiliate that generated this transaction.</td>
		</tr>
		<tr>
			<td>aflsd<br><font color=#446CB3>string</font>, optional</td>
			<td>The signup/affiliate creation date of the affiliate associated with this transaction. Either an ISO 8601 encoded string or a Unix timestamp.</td>
		</tr>
		<tr>
			<td>blg<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer browser langauge</td>
		</tr>
		<tr>
			<td>clat<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer latitude</td>
		</tr>
		<tr>
			<td>clong<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer longitude</td>
		</tr>
		<tr>
			<td>phn<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer primary phone number</td>
		</tr>
		<tr>
			<td>pm<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer mobile phone number</td>
		</tr>
		<tr>
			<td>pw<br><font color=#446CB3>string</font>, optional</td>
			<td>Customer work phone number</td>
		</tr>
		<tr>
			<td>pach<br><font color=#446CB3>string</font>, optional</td>
			<td>ACH account unique identifier (hash)<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation</td>
		</tr>
		<tr>
			<td>pbc<br><font color=#446CB3>string</font>, optional</td>
			<td>Hash of the unique identifier for a Bitcoin wallet</td>
		</tr>
		<tr>
			<td>memo<br><font color=#446CB3>string</font>, optional</td>
			<td>Free-form memo field for client use</td>
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
			<td>The current reputation of the user. Possible values are:
				<ul type="disc">
					<li><code>TRUSTED</code></li>
					<li><code>WEAKLY_TRUSTED</code></li>
					<li><code>UNKNOWN</code></li>
					<li><code>SUSPICIOUS</code></li>
					<li><code>BAD</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>erd<br><font color=#446CB3>string</font>, optional</td>
			<td>A description of the reason for the user's reputation</td>
		</tr>
		<tr>
			<td>upr<br><font color=#446CB3>EDNAPolicyResult</font>, optional</td>
			<td>The previous reputation of the user when they were last evaluated. Possible values are:
				<ul type="disc">
					<li><code>TRUSTED</code></li>
					<li><code>WEAKLY_TRUSTED</code></li>
					<li><code>UNKNOWN</code></li>
					<li><code>SUSPICIOUS</code></li>
					<li><code>BAD</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>res<br><font color=#446CB3>FraudPolicyResult</font>, optional</td>
			<td>Result of policy evaluation. Combines the result of fraud and automated review evaluations. Possible values are:
			<ul type="disc">
					<li><code>ACCEPT</code></li>
					<li><code>MANUAL_REVIEW</code></li>
					<li><code>DENY</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>rcd<br><font color=#446CB3>string</font></td>
			<td>The et of result codes from the evaulation of the current transaction</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font></td>
			<td>The transaction ID of the current transaction</td>
		</tr>
		<tr>
			<td>frn<br><font color=#446CB3>string</font></td>
			<td>The name of the fraud rule that fired</td>
		</tr>
		<tr>
			<td>frp<br><font color=#446CB3>FraudPolicyResult</font>, optional</td>
			<td>Result of fraud evaluation. Possible values are:
			<ul type="disc">
					<li><code>ACCEPT</code></li>
					<li><code>MANUAL_REVIEW</code></li>
					<li><code>DENY</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>frd<br><font color=#446CB3>string</font></td>
			<td>The description of the fraud rule that fired</td>
		</tr>
		<tr>
			<td>arpr<br><font color=#446CB3>string</font>, optional</td>
			<td>Result of the automated review evaluation. Possible values are:
			<ul type="disc">
					<li><code>ERROR</code></li>
					<li><code>NO_POLICY</code></li>
					<li><code>DISABLED</code></li>
					<li><code>FILTERED</code></li>
					<li><code>PENDING</code></li>
					<li><code>FAIL</code></li>
					<li><code>INDETERMINATE</code></li>
					<li><code>SUCCESS</code></li>
				</ul></td>
		</tr>
				<tr>
			<td>arpd<br><font color=#446CB3>string</font>, optional</td>
			<td>The description, if any, of the automated review rule that fired</td>
		</tr>
		<tr>
			<td>arpid<br><font color=#446CB3>string</font>, optional</td>
			<td>The ID, if any, of the automated review rule that fired</td>
		</tr>
		<tr>
			<td>usc<br><font color=#446CB3>string</font>, optional</td>
			<td>User seen count</td>
		</tr>
		<tr>
			<td>ednaScoreCard<br><font color=#446CB3>ExternalizedTransactionScorecard</font></td>
			<td>The scorecard for the current transaction</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar<br><font color=#446CB3>AutomatedReviewEngineResult</font>, optional</td>
			<td>The result of the automated review policy for this transaction</td>
		</tr>
		<tr>
			<td>tr<br><font color=#446CB3>array[TestResult]</font></td>
			<td>The security test results for this transaction</td>
		</tr>
		<tr>
			<td>er<br><font color=#446CB3>ExternalizedEvaluationResult</font></td>
			<td>The result of the fraud policy evaluation for this transaction</td>
		</tr>
		<tr>
			<th colspan=2>Automated Review Engine Result</th>
		</tr>
		<tr>
			<td>result<br><font color=#446CB3>ReviewResult</font></td>
			<td>Result of rule. Possible values are:
				<ul type="disc">
					<li><code>ERROR</code></li>
					<li><code>NO_POLICY</code></li>
					<li><code>DISABLED</code></li>
					<li><code>FILTERED</code></li>
					<li><code>PENDING</code></li>
					<li><code>FAIL</code></li>
					<li><code>INDETERMINATE</code></li>
					<li><code>SUCCESS</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>ruleId<br><font color=#446CB3>string</font></td>
			<td>The unique rule identifier</td>
		</tr>
		<tr>
			<td>ruleName<br><font color=#446CB3>string</font></td>
			<td>The rule name</td>
		</tr>
		<tr>
			<td>ruleDescription<br><font color=#446CB3>string</font></td>
			<td>The rule description</td>
		</tr>
		<tr>
			<th colspan=2>Test Result</th>
		</tr>
		<tr>
			<td>testId<br><font color=#446CB3>string</font></td>
			<td>The unique test ID</td>
		</tr>
		<tr>
			<td>testDetails<br><font color=#446CB3>string</font>, optional</td>
			<td>Details of the evaluation of this test for the current transaction</td>
		</tr>
		<tr>
			<td>testPass<br><font color=#446CB3>boolean</font>, optional</td>
			<td>If this is a proscriptive test, the result of the test for the current transaction</td>
		</tr>
		<tr>
			<td>testResult<br><font color=#446CB3>Object</font></td>
			<td>If this is not a proscriptive test, the informational result of the test for the current transaction</td>
		</tr>
		<tr>
			<td>waitingForData<br><font color=#446CB3>boolean</font>, optional</td>
			<td>If this is an interactive test, whether the test is currently waiting for customer input</td>
		</tr>
		<tr>
			<td>previouslyAccepted<br><font color=#446CB3>boolean</font></td>
			<td>If this is a KYC transaction, whether this test has been previously accepted</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Evaluation Result</th>
		</tr>
		<tr>
			<td>firedRules<br><font color=#446CB3>List[ExternalizedRule]</font></td>
			<td>The complete set of rules that fired for this transaction</td>
		</tr>
		<tr>
			<td>reportedRule<br><font color=#446CB3>ExternalizedRule</font></td>
			<td>The rule that is being reported for this transaction. Other rules may have fired, see <code>firedRules</code></td>
		</tr>
		<tr>
			<th colspan=2>Externalized Rule</th>
		</tr>
		<tr>
			<td>name<br><font color=#446CB3>string</font></td>
			<td>The rule name</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font>, optional</td>
			<td>The rule description</td>
		</tr>
		<tr>
			<td>description<br><font color=#446CB3>string</font></td>
			<td>Details of the evaluation of this rule for the current transaction</td>
		</tr>
		<tr>
			<td>resultCode<br><font color=#446CB3>FraudPolicyResult</font></td>
			<td>Result of rule. Possible values are:
				<ul type="disc">
					<li><code>ACCEPT</code></li>
					<li><code>MANUAL_REVIEW</code></li>
					<li><code>DENY</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>ruleId<br><font color=#446CB3>integer</font></td>
			<td>The unique rule identifier</td>
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
			<td>Free-form descriptive text providing additional information about the feedback</td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font>, optional</td>
			<td>Auth comments from the gateway</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font>, optional</td>
			<td>The result of the auth/sale to the gateway. Possible values are:
				<ul type="disc">
					<li><code>accepted</code></li>
					<li><code>rejected</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font>, optional</td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - AVS match</li>
					<li><code>N</code> - AVS mismatch</li>
					<li><code>P</code> - AVS partial match</li>
					<li><code>U</code> - AVS unavailable</li>
				</ul></td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font>, optional</td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - CVV match</li>
					<li><code>N</code> - CVV mismatch</li>
				</ul></td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font>, optional</td>
			<td>The error code, if any, from the gateway. Values are dependent of the gateway used.</td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font>, optional</td>
			<td>Authorization code returned by the gateway</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font>, optional</td>
			<td>The name of the payment gateway used. This is used to interpret the result/error codes.
				<ul type="disc">
					<li><code>MES</code> - Merchant e-Solutions</li>
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
				</ul></td>
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
			<td>The current status of the transaction at the gateway/bank. Possible values are:
				<ul type="disc">
					<li><code>a</code> - auth_only</li>
					<li><code>c</code> - captured</li>
					<li><code>d</code> - declined</li>
					<li><code>v</code> - void</li>
					<li><code>r</code> - refund</li>
					<li><code>b</code> - chargeback</li>
					<li><code>u</code> - undefined</li>
				</ul>
			Default is <code>u</code></td>
		</tr>
	</table>

##### Response

	<table>
		<tr>
			<th colspan=2>Feedback Response</th>
		</tr>	
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>message<br><font color=#446CB3>string</font>, optional</td>
			<td>Confirmation message for the successful processing of the feedback</td>
		</tr>
		<tr>
			<td>error_message<br><font color=#446CB3>string</font>, optional</td>
			<td>Error message if an error occurred during the processing of the feedback</td>
		</tr>
	</table>