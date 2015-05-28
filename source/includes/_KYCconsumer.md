# KYC: Consumer Application

Perform a customer KYC.

Evaluate a consumer application for the provided user data:<br>
`POST https://edna.identitymind.com/im/account/consumer`

Retrieve the current state of a consumer application:<br>
`GET https://edna.identitymind.com/im/account/consumer/<transaction_id>`

<aside class="notice">Not all fields are required, but anti-fraud evaluation is more comprehensive when richer evidence is provided.</aside>


##### Arguments

<table>
		<tr>
			<th colspan=2>Account Creation Request Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>dob<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Applicant's date of birth encoded as an ISO 8601 string</td>
		</tr>
		<tr>
			<td>assn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Applicant's social security number or national identification number</td>
		</tr>
		<tr>
			<td>assnl4<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Last 4 digits of the applicant's social security number or national identification number</td>
		</tr>
		<tr>
			<td>scanData<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If using Jumio NetVerify Perform, the document front side image data, Base64 encoded. If provided, this will override the configured Jumio client integration. 5MB maximum size.</td>
		</tr>
		<tr>
			<td>faceImageData<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If using Jumio NetVerify Perform with face match enabled, the face image file, Base64 encoded. 5MB maximum size.</td>
		</tr>
		<tr>
			<td>backsideImageData<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If using Jumio NetVerify Perform, the document back side image data, Base64 encoded. 5MB maximum size.</td>
		</tr>		
		<tr>
			<td>stage<br><font color=#446CB3>integer</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1.</td>
		</tr>
		<tr>
			<td>merchantAid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant</td>
		</tr>
		<tr>
			<td>personalguarantee<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of the owners of the business, whether the individual provides a personal guarantee of debt</td>
		</tr>
		<tr>
			<td>ownership<br><font color=#446CB3>number</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of the owners of the business, the percentage of ownership</td>
		</tr>
		<tr>
			<td>title<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Title of the applicant</td>
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
			<td>Transaction time in UTC. Encoded as a Unix time stamp or ISO 8601 string. Data containing milliseconds will not be accepted.</td>
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


##### Response

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json  
{
    "ednaScoreCard": {
        "er": {
            "reportedRule": {
                "description": "Fallthrough for transaction with an unknown entity. No other rules triggered.",
                "details": "Fallthrough for transaction with an unknown entity. No other rules triggered.",
                "name": "Unknown Fallthrough",
                "resultCode": "ACCEPT",
                "ruleId": 1002,
                "testResults": []
            }
        },
        "etr": [
            {
                "details": "ed:1(false) = true",
                "fired": false,
                "test": "ed:1" 
            },
            {
                "details": "true",
                "test": "19:2" 
            },
            {
                "details": "ed:34(false) = true",
                "fired": false,
                "test": "ed:34" 
            },
            {
                "details": "ed:36(false) = true",
                "fired": false,
                "test": "ed:36" 
            },
            {
                "details": "true",
                "test": "19:9" 
            },
            {
                "details": "ed:38(false) = true",
                "fired": false,
                "test": "ed:38" 
            },
            {
                "details": "ed:61(false) = true",
                "fired": false,
                "test": "ed:61" 
            },
            {
                "details": "ed:32(false) = true",
                "fired": false,
                "test": "ed:32" 
            },
            {
                "details": "ed:37(false) = true",
                "fired": false,
                "test": "ed:37" 
            },
            {
                "details": "ed:2(false) = true",
                "fired": false,
                "test": "ed:2" 
            },
            {
                "details": "ed:87(false) = true",
                "fired": false,
                "test": "ed:87" 
            },
            {
                "details": "true",
                "test": "19:1" 
            }
        ],
        "sc": []
    },
    "erd": "Unknown User",
    "frd": "Fallthrough for transaction with an unknown entity. No other rules triggered.",
    "frn": "Unknown Fallthrough",
    "frp": "ACCEPT",
    "mtid": "26860023",
    "rcd": "1002,101,202,111,131,50005,150",
    "res": "ACCEPT",
    "state": "A",
    "tid": "26860023",
    "upr": "UNKNOWN",
    "user": "UNKNOWN" 
}
```
> The response includes detailed result codes and the transaction unique identifier.

<table>
		<tr>
			<th colspan=2>Application Response Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>mtid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The transaction ID for this KYC. This ID should be provided on subsequent updates to the KYC</td>
		</tr>
		<tr>
			<td>acVerification<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<td>docVerification<br><font color=#446CB3>DocumentVerification</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<td>ownerApplicationIds<br><font color=#446CB3>array[string]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>List of owner applications associated with the merchant</td>
		</tr>
		<tr>
			<td>parentMerchant<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<td>smsVerification<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<td>merchantAPIName<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<td>state<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The current state of the KYC. Possible values are:
				<ul type="disc">
					<li><code>A</code> - Accepted</li>
					<li><code>R</code> - Under Review</li>
					<li><code>D</code> - Rejected</li>
				</ul></td>
		</tr>
		<tr>
			<td>oowQuestions<br><font color=#446CB3>QuestionsWrapper</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
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
			<td>rcd<br><font color=#446CB3>string</font></td>
			<td>The set of result codes from the evaluation of the current transaction</td>
		</tr>
		<tr>
			<td>frn<br><font color=#446CB3>string</font></td>
			<td>The name of the fraud rule that fired</td>
		</tr>
		<tr>
			<td>frd<br><font color=#446CB3>string</font></td>
			<td>The description of the fraud rule that fired</td>
		</tr>
		<tr>
			<td>ednaScoreCard<br><font color=#446CB3>ExternalizedTransactionScorecard</font></td>
			<td>The score card for the current transaction</td>
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
			<td>frp<br><font color=#446CB3>FraudPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Result of fraud evaluation. Possible values are:
			<ul type="disc">
					<li><code>ACCEPT</code></li>
					<li><code>MANUAL_REVIEW</code></li>
					<li><code>DENY</code></li>
				</ul></td>
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
			<td>erd<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>A description of the reason for the user's reputation</td>
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
			<td>usc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>User seen count</td>
		</tr>
		<tr>
			<td>tid<br><font color=#446CB3>string</font></td>
			<td>The transaction ID.</td>
		</tr>		
		<tr>
			<th colspan=2>Document Verification</th>
		</tr>
		<tr>
			<td>redirectURL<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Jumio NetVerify document verification redirect URL.</td>
		</tr>
		<tr>
			<th colspan=2>Questions Wrapper</th>
		</tr>
		<tr>
			<td>questions<br><font color=#446CB3>List[QuestionsWrapper]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Score Card</th>
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

## Document Verification

Provide a document as part of a Jumio NetVerify multi-document verification.

`POST https://edna.identitymind.com/im/account/consumer/<transaction_id>/document`

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{
   "documentTypeCode":"CC"
}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
    "authorizationToken":"f9d32f46-8f11-4b7c-b146-6d7a95aa765f"
}
```
<table>
		<tr>
			<th colspan=2>Account KYC Jumio Document Data</th>
		</tr>	
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>documentTypeCode<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The type of document that the customer will upload:
				<ul type="disc">
					<li><code>BS</code> - Bank statement</li>
					<li><code>CC</code> - Credit card</li>
					<li><code>IC</code> - Insurance card</li>
					<li><code>UB</code> - Utility bill</li>
					<li><code>CAAP</code> - Cash advance application</li>
					<li><code>CRC</code> - Corporate resolution certificate</li>
					<li><code>CCS</code> - Credit card statement</li>
					<li><code>LAG</code> - Lease agreement</li>
					<li><code>LOAP</code> - Loan application</li>
					<li><code>MOAP</code> - Mortgage application</li>
					<li><code>TR</code> - Tax return</li>
					<li><code>VT</code> - Vehicle title</li>
					<li><code>VC</code> - Voided check</li>
					<li><code>STUC</code> - Student card</li>
					<li><code>HCC</code> - Healthcare card</li>
					<li><code>CB</code> - Council bill</li>
					<li><code>SENC</code> - Seniors card</li>
					<li><code>MEDC</code> - Medicare card</li>
					<li><code>BC</code> - Birth certificate</li>
					<li><code>USSS</code> - US social security card</li>
					<li><code>WWCC</code> - Working with children check</li>
					<li><code>SS</code> - Superannuation statement</li>
					<li><code>TAC</code> - Trade associated card</li>
					<li><code>SEL</code> - School enrollment letter</li>
					<li><code>PB</code> - Phone bill</li>
				</ul>
			</td>
		</tr>
	</table>

## Quiz Response

Provide a quiz response on the named KYC. 

`POST https://edna.identitymind.com/im/account/consumer/<transaction_id>/quizresponse`

<aside class="notice">The response may, depending on the response from IDAnalytics and your configuration within the eDNA platform, contain a further set of "challenge" questions that should once again be passed back to the consumer for answers.</aside>

##### Arguments

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the application state.

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
   "answers":[
      {
         "questionId":"0",
         "choice":"SAN DIEGO"
      },
      {
         "questionId":"1",
         "choice":"BOB"
      },
      {
         "questionId":"2",
         "choice":" None of the above "
      },
      {
         "questionId":"3",
         "choice":"MUNSTER"
      }
   ]
}

{
   "smsCode":"1234"
}
```
<table>
		<tr>
			<th colspan=2>Feedback Quiz Response Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers<br><font color=#446CB3>List[Answer]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>JSON array of JSON encoded answer objects</td>
		</tr>
		<tr>
			<td>smsCode<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The response code provided by the consumer</td>
		</tr>
		<tr>
			<td>amount<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
	</table>

## Application Feedback

Provide feedback to IdentityMind as to the acceptance or rejection of an application by the merchant.

`POST https://edna.identitymind.com/im/account/consumer/<transaction_id>/accepted`

`POST https://edna.identitymind.com/im/account/consumer/<transaction_id>/rejected`

<aside class="notice">All arguments are optional, although a JSON object must be provided.</aside>

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{
  "reason": "0",
  "description": "I like this application",
  "validate": true
}
```
<table>
		<tr>
			<th colspan=2>Application Feedback Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>reason<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form code</td>
		</tr>
		<tr>
			<td>description<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Free-form descriptive text providing additional information about the feedback</td>
		</tr>
		<tr>
			<td>validate<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the user defined in the application should be validated.<br><br>For a rejected application, the property is interpreted as whether to mark the applicant as having failed validation.</td>
		</tr>
	</table>

##### Response
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message": "Accepted application"
}
```
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
			<td>Feedback response message</td>
		</tr>
		<tr>
			<td>error_message<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Feedback response error message, if any</td>
		</tr>
	</table>