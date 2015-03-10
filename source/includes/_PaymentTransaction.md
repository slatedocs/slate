# Payment Transaction

The evidence is the payment transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, anti-fraud evaluation is more comprehensive when richer evidence is provided. 

The following URL can be used for requesting payment transaction anti-fraud evaluation:<br>  
`POST https://edna.identitymind.com/im/transaction`

The following URL can be used to retrieve the current state of a transaction:<br>
`GET https://edna.identitymind.com/im/transaction/<transaction_ID>`

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
			<th colspan=2>PAyment Transaction Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Description</td>
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
			<td>tid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pctv</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>phash</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>man</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ip</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tti</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bfn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>profile</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smna</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sfn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sln</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ssn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sco</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sz</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ss</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>blg</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>phn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pw</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pach</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>memo</td>
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
			<td>user</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>erd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>upr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>res</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>rcd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frp</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>usc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ednaScoreCard</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>er</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Automated Review Engine Result</th>
		</tr>
		<tr>
			<td>result</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleName</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleDescription</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Test Result</th>
		</tr>
		<tr>
			<td>testId</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testDetails</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testPass</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testResult</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>waitingForData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>previouslyAccepted</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Evaluation Result</th>
		</tr>
		<tr>
			<td>firedRules</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>reportedRule</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Rule</th>
		</tr>
		<tr>
			<td>name</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>details</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>resultCode</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td>Description</td>
		</tr>
	</table>

## Transaction Feedback

##### Transaction Neutral/Refund Notification

Notifies IdentityMind that a refund occurred on a transaction.

The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback. All arguments are optional.

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud`

##### Bank Authorization Feedback

Notifies IdentityMind of the acceptance or rejection of the transaction that was previously analyzed with the given transaction ID by the merchant's payment gateway or the merchant themselves. All arguments are optional.

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
			<td>description</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>description</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>description</td>
		</tr>
		<tr>
			<td>avs_result</td>
			<td>description</td>
		</tr>
		<tr>
			<td>cvv2_result</td>
			<td>description</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>description</td>
		</tr>
		<tr>
			<td>auth_code</td>
			<td>description</td>
		</tr>
		<tr>
			<td>gateway</td>
			<td>description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>description</td>
		</tr>
		<tr>
			<td>validation_status</td>
			<td>description</td>
		</tr>
		<tr>
			<td>how_validated</td>
			<td>description</td>
		</tr>
		<tr>
			<td>how_validated_details</td>
			<td>description</td>
		</tr>
		<tr>
			<td>validation_details</td>
			<td>description</td>
		</tr>
		<tr>
			<td>details</td>
			<td>description</td>
		</tr>
		<tr>
			<td>amt</td>
			<td>description</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>description</td>
		</tr>
		<tr>
			<td>bank_status</td>
			<td>description</td>
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
			<td>description</td>
		</tr>
		<tr>
			<td>error_message</td>
			<td>description</td>
		</tr>
	</table>