# Payment Transaction

Evaluate a transaction for payment fraud.

The following URL can be used for requesting payment transaction anti-fraud evaluation:<br>
`POST https://edna.identitymind.com/im/transaction`

The following URL can be used to retrieve the current state of a transaction:<br>
`GET https://edna.identitymind.com/im/transaction/<transaction_id>`

<aside class="notice">Not all fields are required, but anti-fraud evaluation is more comprehensive when richer evidence is provided.</aside>

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
			<td>amt<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Transaction amount</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction currency</td>
		</tr>
		<tr>
			<td>pppi<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>PayPal Payer ID</td>
		</tr>
		<tr>
			<td>pppe<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>PayPal Payer Email</td>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form descriptive text providing additional information about the feedback</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
					<li><code>generic</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The error code, if any, from the gateway. Values are dependent on the gateway used.<br><br>
			For generic gateways:
				<ul type="disc">
					<li><code>0</code> - Approved</li>
					<li><code>1</code> - Insufficient funds</li>
					<li><code>2</code> - AVS mismatch</li>
					<li><code>3</code> - CVV mismatch</li>
					<li><code>4</code> - Card verification</li>
					<li><code>5</code> - System error</li>
					<li><code>6</code> - Cancelled card</li>
					<li><code>7</code> - Likely user input error</li>
					<li><code>8</code> - Fraud</li>
					<li><code>9</code> - Gateway fraud filter</li>
					<li><code>10</code> - Other - An uncategorized code</li>
					<li><code>CB1</code> - Chargeback fraud</li>
					<li><code>CB2</code> - Chargeback merchant error</li>
					<li><code>CB3</code> - Chargeback suspected friendly fraud</li>
					<li><code>CB4</code> - Chargeback other</li>
				</ul></td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - AVS match</li>
					<li><code>N</code> - AVS mismatch</li>
					<li><code>P</code> - AVS partial match</li>
					<li><code>U</code> - AVS unavailable</li>
				</ul></td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Authorization code returned by the gateway</td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - CVV match</li>
					<li><code>N</code> - CVV mismatch</li>
				</ul></td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Auth comments from the gateway</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The result of the auth/sale to the gateway. Possible values are:
				<ul type="disc">
					<li><code>accepted</code></li>
					<li><code>rejected</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>m<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Merchant Identifier. Used when a reseller is proxying requests for their merchants. Please contact IdentityMind support for further details of the usage of this field</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction identifier. If not provided, an ID will be allocated</td>
		</tr>
		<tr>
			<td>man<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Account name for the user</td>
		</tr>
		<tr>
			<td>tea<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Email address for the user</td>
		</tr>
		<tr>
			<td>soc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>OAuth service that authenticated the user. For example, <code>google</code> or <code>facebook</code></td>
		</tr>
		<tr>
			<td>ip<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer's IP address</td>
		</tr>
		<tr>
			<td>dfp<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Device fingerprint blob</td>
		</tr>
		<tr>
			<td>dft<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Device fingerprint type</td>
		</tr>
		<tr>
			<td>tti<br><font color=#446CB3>Object</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction time in UTC. Encoded as a Unix timestamp or ISO 8601 string. Data containing milliseconds will not be accepted.</td>
		</tr>
		<tr>
			<td>bfn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) first name</td>
		</tr>
		<tr>
			<td>bln<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) last name</td>
		</tr>
		<tr>
			<td>pccn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Credit card unique identifier (hash). IdentityMind will supply procedure to generate hash.<br><br> 
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>pcct<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.</td>
		</tr>
		<tr>
			<td>pcty<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The card type. Possible values are:
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
		</tr>
		<tr>
			<td>phash<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Generic payment account unique identifier (hash). This is used when IdentityMind does not natively support the payment type.<br><br> 
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>ptoken<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A masked or tokenized version of the account token.</td>
		</tr>
		<tr>
			<td>profile<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The policy profile to be used to evaluate this transaction. If no profile is specified, the DEFAULT profile is used. Prior to IDMRisk 1.19, this was encoded in the <code>smid</code> field.</td>
		</tr>
		<tr>
			<td>smna<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td><font color=#D91E18>Deprecated</font><br><br>The user-friendly name for the merchant for whom this transaction is being processed. Used for display purposes in the UI.</td>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td><font color=#D91E18>Deprecated</font><br><br>A unique identifier for the merchant for whom this transaction is being processed. Succeeded by the <code>profile</code> field in IDMRisk 1.19.</td>
		</tr>
		<tr>
			<td>bsn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>bco<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) country. ISO 3166 alpha-2 country code of the billing address of the transaction, encoded as a string. Default is <code>US</code>.</td>
		</tr>
		<tr>
			<td>bz<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) zip / postal code</td>
		</tr>
		<tr>
			<td>bc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) city</td>
		</tr>
		<tr>
			<td>bs<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing (source) state</td>
		</tr>
		<tr>
			<td>sfn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) first name</td>
		</tr>
		<tr>
			<td>sln<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) last name</td>
		</tr>
		<tr>
			<td>ssn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>sco<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) country. ISO 3166 alpha-2 country code of the shipping address of the transaction, encoded as a string. Default is <code>US</code></td>
		</tr>
		<tr>
			<td>sz<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) zip / postal code</td>
		</tr>
		<tr>
			<td>sc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) city</td>
		</tr>
		<tr>
			<td>ss<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping (destination) state</td>
		</tr>
		<tr>
			<td>aflid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Affiliate ID. The client specific identifier for the affiliate that generated this transaction.</td>
		</tr>
		<tr>
			<td>aflsd<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The signup/affiliate creation date of the affiliate associated with this transaction. Either an ISO 8601 encoded string or a Unix timestamp.</td>
		</tr>
		<tr>
			<td>blg<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer browser language</td>
		</tr>
		<tr>
			<td>clat<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer latitude</td>
		</tr>
		<tr>
			<td>clong<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer longitude</td>
		</tr>
		<tr>
			<td>phn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer primary phone number</td>
		</tr>
		<tr>
			<td>pm<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer mobile phone number</td>
		</tr>
		<tr>
			<td>pw<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Customer work phone number</td>
		</tr>
		<tr>
			<td>pach<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>ACH account unique identifier (hash)<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation</td>
		</tr>
		<tr>
			<td>pbc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Hash of the unique identifier for a Bitcoin wallet</td>
		</tr>
		<tr>
			<td>memo<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form memo field for client use</td>
		</tr>
	</table>

<aside class="notice">The clear text credit card number is never sent to IdentityMind. Instead, IdentityMind uses a cryptographically secure hash to have a unique representation of each credit card. IdentityMind provides the required utilities to generate these hashes.</aside>

##### Response

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
    {
        "arpr": "DISABLED",
        "ednaScoreCard": {
            "ar": {
                "result": "DISABLED"
            },
            "er": {
                "reportedRule": {
                    "description": "Rule2360_RULE_DESC",
                    "details": "[Fired] ed:35(false) = false",
                    "name": "DUPTRANSACTION",
                    "resultCode": "MANUAL_REVIEW",
                    "ruleId": 2360,
                    "testResults": [
                        {
                            "details": "[Fired] ed:35(false) = false",
                            "fired": true,
                            "test": "ed:35"
                        }
                    ]
                }
            },
            "etr": [
                {
                    "details": "ed:34(true) = false",
                    "fired": false,
                    "test": "ed:34"
                },
                {
                    "details": "ed:32(true) = false",
                    "fired": false,
                    "test": "ed:32"
                },
                {
                    "details": "ed:36(true) = false",
                    "fired": false,
                    "test": "ed:36"
                },
                {
                    "details": "ed:1(true) = false",
                    "fired": false,
                    "test": "ed:1"
                },
                {
                    "details": "ed:2(true) = false",
                    "fired": false,
                    "test": "ed:2"
                },
                {
                    "details": "ed:56(true) = false",
                    "fired": false,
                    "test": "ed:56"
                },
                {
                    "details": "[Fired] ed:35(false) = false",
                    "fired": true,
                    "test": "ed:35"
                },
                {
                    "details": "USD",
                    "fired": false,
                    "test": "ed:42"
                },
                {
                    "details": "USD",
                    "fired": false,
                    "test": "ed:42"
                },
                {
                    "details": "ed:33(true) = false",
                    "fired": false,
                    "test": "ed:33"
                },
                {
                    "details": "ed:37(true) = false",
                    "fired": false,
                    "test": "ed:37"
                }
            ],
            "sc": [
               {
                    "details": "ed:37(true) = false",
                    "fired": false,
                    "test": "ed:37"
                }
            ]
        },
        "erd": "New card, neither device nor user account information supplied",
        "frd": "[Fired] ed:35(false) = false",
        "frn": "DUPTRANSACTION",
        "frp": "MANUAL_REVIEW",
        "rcd": "190,202,2360,131,536,150,121",
        "res": "MANUAL_REVIEW",
        "tid": "5200016",
        "upr": "UNKNOWN",
        "user": "UNKNOWN"
    }
```
> The response includes detailed result codes and the transaction unique identifier. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured fraud policy.

<table>
		<tr>
			<th colspan=2>Transaction Response Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>user<br><font color=#446CB3>EDNAPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The current reputation of the user. Possible values are:
				<ul type="disc">
					<li><code>TRUSTED</code></li>
					<li><code>UNKNOWN</code></li>
					<li><code>SUSPICIOUS</code></li>
					<li><code>BAD</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>erd<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A description of the reason for the user's reputation</td>
		</tr>
		<tr>
			<td>upr<br><font color=#446CB3>EDNAPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The previous reputation of the user when they were last evaluated. Possible values are:
				<ul type="disc">
					<li><code>TRUSTED</code></li>
					<li><code>UNKNOWN</code></li>
					<li><code>SUSPICIOUS</code></li>
					<li><code>BAD</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>res<br><font color=#446CB3>FraudPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Result of policy evaluation. Combines the result of fraud and automated review evaluations. Possible values are:
			<ul type="disc">
					<li><code>ACCEPT</code></li>
					<li><code>MANUAL_REVIEW</code></li>
					<li><code>DENY</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>rcd<br><font color=#446CB3>string</font></td>
			<td>The set of result codes from the evaulation of the current transaction</td>
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
			<td>frp<br><font color=#446CB3>FraudPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>arpr<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>arpd<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The description, if any, of the automated review rule that fired</td>
		</tr>
		<tr>
			<td>arpid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The ID, if any, of the automated review rule that fired</td>
		</tr>
		<tr>
			<td>usc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>ar<br><font color=#446CB3>AutomatedReviewEngineResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The result of the automated review policy for this transaction</td>
		</tr>
		<tr>
			<td>etr<br><font color=#446CB3>array[ConditionResult]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The evaluated test results for this transaction</td>
		</tr>
		<tr>
			<td>sc<br><font color=#446CB3>array[ConditionResult]</font></td>
			<td>The test results for this transaction</td>
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
			<td>description<br><font color=#446CB3>string</font></td>
			<td>Details of the evaluation of this rule for the current transaction</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The rule description</td>
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
			<td>testResults<br><font color=#446CB3>array[ConditionResult]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The results of the individual assertions of the rule</td>
		</tr>
		<tr>
			<td>ruleId<br><font color=#446CB3>integer</font></td>
			<td>The unique rule identifier</td>
		</tr>
		<tr>
			<th colspan=2>Condition Result</th>
		</tr>
		<tr>
			<td>fired<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the condition fired or not</td>
		</tr>
		<tr>
			<td>test<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The ID of the security test or the key of the transaction data to which the condition applied</td>
		</tr>
		<tr>
			<td>waitingForData<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Indicates that the result is waiting for an asynchronous response from the customer and/or third party service.</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Textual result of the condition</td>
		</tr>
	</table>

	
## Chargeback Notification

Notifies that a chargeback occurred on a transaction. The transaction may be a Payment Transaction or an Account Transfer.

In the case of a chargeback on a transaction that eDNA has not previously processed, payment instrument information is required.

The following URL can be used for requesting chargeback notification evaluation:<br>
`POST https://edna.identitymind.com/im/jax/chargeback/`

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{
	"amt" : 250,
	"cbtype" : "DEBIT",
	"pccn" : "DNsxhwmQCWeC5gPxTOwPRZlFfx",
	"pcct" : "401201XXXXXX1110",
	"tid" : "9900040"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```

```json
{
	"message" : "credit notification accepted"
}

{
	"error_message" : "A JSONObject text must begin with '{' at character 1"
}
```

<table>
		<tr>
			<th colspan=2>Chargeback</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>amt<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Amount of the chargeback</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is <code>USD</code>.</td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>This should be used to pass the reason code for the chargeback. For a full set of reason codes as defined by the card brands, click <a href="https://www.merchantconnect.com/CWRWeb/pdf/chargeback_reason_codes.pdf">here</a>.</td>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Text describing the reason for refund/chargeback.</td>
		</tr>
		<tr>
			<td>cbtype<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The chargeback type:
				<ul type="disc">
					<li><code>DEBIT</code></li>
					<li><code>CREDIT</code></li>
					<li><code>REPRESENTMENT</code></li>
					<li><code>REVERSAL</code></li>
				</ul>
			The default is <code>DEBIT</code> if not provided.
			</td>
		</tr>
		<tr>
			<td>cbdate<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Date of the chargeback action. For example, if the cbtype is <code>CREDIT</code>, then the date field should be the date that the CREDIT happens. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"cbdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"cbdate":1293887536</code></li>
					<li><code>"cbdate":"1293887536"</code></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>authdate<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Date of the original authorization transaction. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"authdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"authdate":1293887536</code></li>
					<li><code>"authdate":"1293887536"</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
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
					<li><code>generic</code></li>
				</ul>
			<b>Note</b>: While this field is required, backwards compatibility feedback will not be rejected if not present, but will instead be interpreted as MES gateway data. 
			</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. <code>"tid" : "123455"</code>).</td>
		</tr>
		<tr>
			<th colspan=2>Sub Merchant</th>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.
			<br><br>
			<b>Note</b>: The value of the smid should not include the apostrophe symbol.</td>
		</tr>
		<tr>
			<th colspan=2>Credit Card</th>
		</tr>
		<tr>
			<td>pccn<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.<br><br><i>Required if the provided <code>tid</code> does not refer to a transaction previously processed by eDNA.</i></td>
		</tr>
		<tr>
			<td>pcct<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token. Maximum length is 64 characters.<br><br><i>Required if the provided <code>tid</code> does not refer to a transaction previously processed by eDNA</i></td>
		</tr>
		<tr>
			<td>ric<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1.</td>
		</tr>
		<tr>
			<td>pcty<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The card type. Values are:
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>pccn2<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Hash of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>pcct2<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Token of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.</td>
		</tr>
		<tr>
			<td>ric2<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The issuer country of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported. The country code is the two letter abbreviation as defined in ISO-3166-1.</td>
		</tr>
		<tr>
			<td>pcty2<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The type of the credit card to which the chargeback amount is to be credited if it is different from the credit card where the chargeback was reported.
				<ul type="disc">
					<li><code>CREDIT</code></li>
					<li><code>DEBIT</code></li>
					<li><code>PREPAID</code></li>
					<li><code>UNKNOWN</code></li>
				</ul>
			Default is <code>UNKNOWN</code></td>
		</tr>
		<tr>
			<th colspan=2>PayPal</th>
		</tr>
		<tr>
			<td>pppi<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>PayPal Payer ID. It corresponds to PayPal's <code>PAYERID</code> field from PayPal Express Checkout.<br><br><i>Required if the provided <code>tid</code> does not refer to a transaction previously processed by eDNA</i></td>
		</tr>
		<tr>
			<td>pppe<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's <code>EMAIL</code> field from PayPal Express Checkout.</td>
		</tr>
	</table>

## Credit Notification

Notifies that a credit occurred on a transaction.

In the case of credit or blind credit on a transaction that eDNA has not previously processed, the payment instrument information is required.

The following URL can be used for credit notification evaluation:  
`POST https://edna.identitymind.com/im/jax/credit/`
 
<aside class="notice">The transaction may either be a payment transaction or an account transfer.</aside>

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{
     "amt" : 10.4,
     "pccn" : "DNsxhwmQCWeC5gPxTOwPRZlFfx",
     "pcct" : "401201XXXXXX1110",
     "tid" : "988833" 
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message" : "credit notification accepted"
}

{
  "error_message" : "A JSONObject text must begin with '{' at character 1"
}
```

<table>
		<tr>
			<th colspan=2>Credit</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>amt<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Amount of the credit.</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The ISO 4217 currency code of the transaction encoded as a string. Default is <code>USD</code>.</td>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Text describing the reason for the credit.</td>
		</tr>
		<tr>
			<td>crdate<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Date of the credit action. The format of the value for this field is either an ISO 8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li><code>"crdate": "2011-01-01T13:12:16+0000"</code></li>
					<li><code>"crdate":1293887536</code></li>
					<li><code>"crdate":"1293887536"</code></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Merchant unique identifier for the original authorization transaction. The transaction ID must be encoded as a string (e.g. <code>"tid":"123455"</code>). Maximum length is 40 characters.
			</td>
		</tr>
		<tr>
			<th colspan=2>Sub Merchant</th>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A unique identifier for the merchant for whom this transaction is being processed.</td>
		</tr>
		<tr>
			<th colspan=2>Credit Card</th>
		</tr>
		<tr>
			<td>pccn<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Credit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate the hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.
			</td>
		</tr>
		<tr>
			<td>pcct<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate the token.</td>
		</tr>
		<tr>
			<td>ric<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1.</td>
		</tr>
		<tr>
			<td>pcty<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<th colspan=2>PayPal</th>
		</tr>
		<tr>
			<td>pppi<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>PayPal Payer ID. It corresponds to PayPal's <code>PAYERID</code> field from PayPal Express Checkout.</td>
		</tr>
		<tr>
			<td>pppe<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Email address associated to the PayPal account. It corresponds to PayPal's <code>EMAIL</code> field from the PayPal Express Checkout</td>
		</tr>
		<tr>
			<th colspan=2>Generic Financial Account</th>
		</tr>
		<tr>
			<td>phash<br><font color=#446CB3>string</font><br><font color=#CF000F><i>required</i></font></td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation.</td>
		</tr>
		<tr>
			<td>ptoken<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A masked or tokenized version of the account token.</td>
		</tr>
	</table>

## Transaction Neutral/Refund Notification

Notifies that a refund occurred on a transaction. All arguments are optional.

The transaction ID is part of the URL. The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud`

<aside class="notice">The transaction may be either a payment transaction or an account transfer.</aside>

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{
    "amt" : 0.25,
    "auth_response" : "rejected",
    "auth_response_text" : "Transaction already refunded",
    "error_code" : "206",
    "reason" : "Suspected friendly fraud",
    "tid" : "42"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
    "message" : "Feedback accepted for REFUND_FRAUD feedback on transaction 42"
}
```

<table>		
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>amt<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Amount of the refund/chargeback.</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Response code from the gateway.</td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Text describing response code.</td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Error code from the gateway, if any.</td>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Text describing reason for refund/chargeback</td>
		</tr>
		<tr>
			<td>bank_status<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction ID.</td>
		</tr>
	</table>

## Transaction Feedback

##### Transaction Neutral/Refund Notification

Notifies IdentityMind that a refund occurred on a transaction.

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-fraud`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-partial-ok`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/refund-partial-fraud`

<aside class="warning">The "refund-ok" URL should be used when the merchant believes that the refund is legitimate.<br>The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.</aside>

##### Bank Authorization Feedback

Notifies IdentityMind of the acceptance or rejection of the transaction that was previously analyzed with the given transaction ID.

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/bank-accepted`

`POST https://edna.identitymind.com/im/transaction/<transaction_id>/bank-rejected`

##### Merchant Final Resolution Feedback

Provides feedback that the transaction has been accepted after review.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted`

Provides feedback that the transaction has been rejected after review due to suspected fraud.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected`

Provides feedback that the transaction has been rejected after review.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-ok`

Provides feedback that the transaction has been accepted due to user validation.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted-user-validated`

Provides feedback that the transaction has been rejected due to user validation failure.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-user-failed-validation`

Provides feedback that the transaction has been accepted by default.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/accepted-default`

Provides feedback that the transaction has been rejected by default.<br>
`POST https://edna.identitymind.com/im/transaction/<transaction_id>/rejected-default`

<aside class="notice">The transaction may be a payment transaction or an account transfer. All arguments are optional.</aside>

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
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form descriptive text providing additional information about the feedback</td>
		</tr>
		<tr>
			<td>auth_response_text<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Auth comments from the gateway</td>
		</tr>
		<tr>
			<td>auth_response<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The result of the auth/sale to the gateway. Possible values are:
				<ul type="disc">
					<li><code>accepted</code></li>
					<li><code>rejected</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>avs_result<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - AVS match</li>
					<li><code>N</code> - AVS mismatch</li>
					<li><code>P</code> - AVS partial match</li>
					<li><code>U</code> - AVS unavailable</li>
				</ul></td>
		</tr>
		<tr>
			<td>cvv2_result<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The AVS result from the gateway. Possible values are:
				<ul type="disc">
					<li><code>Y</code> - CVV match</li>
					<li><code>N</code> - CVV mismatch</li>
				</ul></td>
		</tr>
		<tr>
			<td>error_code<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The error code, if any, from the gateway. Values are dependent on the gateway used.<br><br>
			For generic gateways:
				<ul type="disc">
					<li><code>0</code> - Approved</li>
					<li><code>1</code> - Insufficient funds</li>
					<li><code>2</code> - AVS mismatch</li>
					<li><code>3</code> - CVV mismatch</li>
					<li><code>4</code> - Card verification</li>
					<li><code>5</code> - System error</li>
					<li><code>6</code> - Cancelled card</li>
					<li><code>7</code> - Likely user input error</li>
					<li><code>8</code> - Fraud</li>
					<li><code>9</code> - Gateway fraud filter</li>
					<li><code>10</code> - Other - An uncategorized code</li>
					<li><code>CB1</code> - Chargeback fraud</li>
					<li><code>CB2</code> - Chargeback merchant error</li>
					<li><code>CB3</code> - Chargeback suspected friendly fraud</li>
					<li><code>CB4</code> - Chargeback other</li>
				</ul></td>
		</tr>
		<tr>
			<td>auth_code<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Authorization code returned by the gateway</td>
		</tr>
		<tr>
			<td>gateway<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
					<li><code>generic</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The transaction ID of the current transaction</td>
		</tr>
		<tr>
			<td>validation_status<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The current status of validation for the user. Possible values are:
				<ul type="disc">
					<li><code>Validated</code></li>
					<li><code>Failed Validation</code></li>
					<li><code>Unable to contact</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>how_validated<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>How the user was validated. Possible values are:
				<ul type="disc">
					<li><code>EMAIL</code></li>
					<li><code>PHONE</code></li>
					<li><code>MOBILE PHONE</code></li>
					<li><code>KNOWN RELATIONSHIPS</code></li>
					<li><code>OTHER</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>how_validated_details<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form text describing info used to validate user, if any. For example, the user's email, phone number, or mobile phone number.</td>
		</tr>
		<tr>
			<td>validation_details<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form text detailing how the user was validated</td>
		</tr>
		<tr>
			<td>details<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form text providing additional info about the action taken</td>
		</tr>
		<tr>
			<td>amt<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction amount, used to provide partial refunds</td>
		</tr>
		<tr>
			<td>ccy<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Transaction currency</td>
		</tr>
		<tr>
			<td>bank_status<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>message<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Confirmation message for the successful processing of the feedback</td>
		</tr>
		<tr>
			<td>error_message<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Error message if an error occurred during the processing of the feedback</td>
		</tr>
	</table>