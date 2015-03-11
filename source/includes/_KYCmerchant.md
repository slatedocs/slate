# KYC: Merchant Application

Perform a merchant KYC.

Evaluate a merchant application for the provided user data:<br>
`POST https://edna.identitymind.com/im/account/merchant`

Retrieve the current state of a merchant application:<br>
`GET https://edna.identitymind.com/im/account/merchant/<transaction_id>`

<aside class="notice">Not all fields are required, but anti-fraud evaluation is more comprehensive when richer evidence is provided.</aside>

##### Arguments

<table>
		<tr>
			<th colspan=2>Merchant Application Request Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>ataxid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business tax ID</td>
		</tr>
		<tr>
			<td>amn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Legal name of the business</td>
		</tr>
		<tr>
			<td>afn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The first name of the contact person for the business</td>
		</tr>
		<tr>
			<td>aln<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The last name of hte contract person for the business</td>
		</tr>
		<tr>
			<td>asn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' street address</td>
		</tr>
		<tr>
			<td>ac<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' city</td>
		</tr>
		<tr>
			<td>aco<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' country</td>
		</tr>
		<tr>
			<td>as<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' state</td>
		</tr>
		<tr>
			<td>az<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' zip / postal code</td>
		</tr>
		<tr>
			<td>aph<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' primary phone number</td>
		</tr>
		<tr>
			<td>dba<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Alternate "doing business as" name of the business</td>
		</tr>
		<tr>
			<td>businesstype<br><font color=#446CB3>BusinessType</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The type of business. Possible values are:
				<ul type="disc">
					<li><code>corporation</code> - Corporation</li>
					<li><code>llc</code> - LLC</li>
					<li><code>partnership</code> - Partnership</li>
					<li><code>individual</code> - Individual/Sole Proprietorship</li>
					<li><code>nonprofit</code> - Nonprofit</li>
					<li><code>foreigncorp</code> - Foreign corporation</li>
				</ul></td>
		</tr>
		<tr>
			<td>ccaccept<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the business accepts credit cards</td>
		</tr>
		<tr>
			<td>ppaccept<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the business accepts PayPal</td>
		</tr>
		<tr>
			<td>achaccept<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the business accepts ACH</td>
		</tr>
		<tr>
			<td>bitcoinaccept<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Whether the business accepts Bitcoin</td>
		</tr>
		<tr>
			<td>merchantgroup<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Aggregation that defines the KYC policy configuration and risk monitoring thresholds</td>
		</tr>
		<tr>
			<td>bankaccounttype<br><font color=#446CB3>BankAccountType</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Bank account type. Valid values are:
				<ul type="disc">
					<li><code>checking</code></li>
					<li><code>saving</code></li>
				</ul></td>
		</tr>
		<tr>
			<td>mcc<br><font color=#446CB3>MerchantCategoryCode</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The MCC code of the buisness</td>
		</tr>
		<tr>
			<td>giin<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>The business' Global Intermediary Identification Number. GIIN is a 19 character number that uniquely identifies an entity as having registered with the IRS for hte purposes of FACTA</td>
		</tr>
		<tr>
			<td>title<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Title of the applicant</td>
		</tr>
		<tr>
			<td>stage<br><font color=#446CB3>integer</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1.</td>
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
			<td>merchantAid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant</td>
		</tr>
		<tr>
			<td>personalguarantee<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of hte owners of the business, whether the individual provides a personal guarantee of debt</td>
		</tr>
		<tr>
			<td>ownership<br><font color=#446CB3>number</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this individual is linked to a merchant (business) as one of the owners of the business, the percentage of ownership</td>
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
			<td>dob<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Applicant's date of birth encoded as an ISO 8601 string</td>
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
			<td>Transaction time in UTC. Encoded as a Unix timestamp or ISO 8601 string.</td>
		</tr>
		<tr>
			<td>bfn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing first name</td>
		</tr>
		<tr>
			<td>bln<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing last name</td>
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
			<td>The policy profile to be used to evaluate this transaction. Prior to IDMRisk 1.19, this was encoded in the <code>smna</code> and <code>smid</code> fields.</td>
		</tr>
		<tr>
			<td>smna<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td><font color=#D91E18>Deprecated</font><br><br>The user-friendly name for the merchant for whom this transaction is being processed. Succeeded by the <code>profile</code> field in IDMRisk 1.19.</td>
		</tr>
		<tr>
			<td>smid<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td><font color=#D91E18>Deprecated</font><br><br>A unique identifier for the merchant for whom this transaction is being processed. Succeeded by the <code>profile</code> field in IDMRisk 1.19.</td>
		</tr>
		<tr>
			<td>bsn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>bco<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing country. ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is <code>US</code>.</td>
		</tr>
		<tr>
			<td>bz<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing zip / postal code</td>
		</tr>
		<tr>
			<td>bc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing city</td>
		</tr>
		<tr>
			<td>bs<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Billing state</td>
		</tr>
		<tr>
			<td>sfn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping first name</td>
		</tr>
		<tr>
			<td>sln<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping last name</td>
		</tr>
		<tr>
			<td>ssn<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping street. Includes house number, street name, and apartment number.</td>
		</tr>
		<tr>
			<td>sco<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping country. ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is <code>US</code></td>
		</tr>
		<tr>
			<td>sz<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping zip / postal code</td>
		</tr>
		<tr>
			<td>sc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping city</td>
		</tr>
		<tr>
			<td>ss<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Shipping state</td>
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
			<td>Customer browser langauge</td>
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
    "mtid": "eDNABlackListFail",
    "state": "R",
    "merchantAPIName":"joseshoe",
    "ownerApplicationIds":[
        	"consumerapp001",
        	"consumerapp002",
	        "consumerapp003"
    ],

    "merchantApplicationResponse": {
        "erd": "Bad User",
        "frd": "1414110157324_accountname in black list.  Added from a test player file",
        "frn": "Account Black List",
        "rcd": "50003,202,111,101,132,10020",
        "res": "DENY",
        "tid": "eDNABlackListFail",
        "ufs": 1414110157000,
        "umrs": 1414110157000,
        "upr": "UNKNOWN",
        "usc": 0,
        "user": "BAD"
    },
    "ednaScoreCard": {
        "tr": [
            {
                "testCategory": "eDNA",
                "testDescription": "Informational -- It displays the number of payment instruments associated with the applicant's device.",
                "testId": "ed:14",
                "testName": "Device Payment Count",
                "testResult": "0"
            },
            {
                "testCategory": "Device",
                "testDescription": "Checks whether the device is currently using an anonymous proxy.  It fails when an anonymous proxy is being used.",
                "testDetails": "The device is not currently using an anonymous proxy",
                "testId": "bc:1",
                "testName": "BlueCava: Using Anonymous Proxy",
                "testPass": true
            },
        ]
    }
} 

```
> The response includes detailed result codes and the transaction unique identifier. Parameters that are not defined here but appearing in the Request API will be categorized as custom data and can be displayed on the UI as proprietary information for the merchant.

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
			<td>Description</td>
		</tr>
		<tr>
			<td>docVerification<br><font color=#446CB3>DocumentVerification</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ownerApplicationIds<br><font color=#446CB3>array[string]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>parentMerchant<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
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
			<td>Description</td>
		</tr>
		<tr>
			<td>smsVerification<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>merchantAPIName<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<td>user<br><font color=#446CB3>EDNAPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>upr<br><font color=#446CB3>EDNAPolicyResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>frd<br><font color=#446CB3>string</font></td>
			<td>The description of the fraud rule that fired</td>
		</tr>
		<tr>
			<td>ednaScoreCard<br><font color=#446CB3>ExternalizedTransactionScorecard</font></td>
			<td>The scorecard for the current transaction</td>
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
			<td>usc<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>User seen count</td>
		</tr>
		<tr>
			<th colspan=2>Document Verification</th>
		</tr>
		<tr>
			<td>redirectURL<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Questions Wrapper</th>
		</tr>
		<tr>
			<td>questions<br><font color=#446CB3>List[QuestionsWrapper]</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar<br><font color=#446CB3>AutomatedReviewEngineResult</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>testDetails<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>Details of the evaluation of this test for the current transaction</td>
		</tr>
		<tr>
			<td>testPass<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td>If this is a proscriptive test, the result of the test for the current transaction</td>
		</tr>
		<tr>
			<td>testResult<br><font color=#446CB3>Object</font></td>
			<td>If this is not a proscriptive test, the informational result of the test for the current transaction</td>
		</tr>
		<tr>
			<td>waitingForData<br><font color=#446CB3>boolean</font><br><font color=#BDC3C7><i>optional</i></font></td>
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
			<td>ruleId<br><font color=#446CB3>integer</font></td>
			<td>The unique rule identifier</td>
		</tr>
	</table>

## Quiz Response

Provide a quiz response on the named KYC.

`POST https://edna.identitymind.com/im/account/merchant/<transaction_id>/quizresponse`

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
   "smsCode":”1234”
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
			<td>The response code provided by the merchant</td>
		</tr>
		<tr>
			<td>amount<br><font color=#446CB3>string</font><br><font color=#BDC3C7><i>optional</i></font></td>
			<td></td>
		</tr>
	</table>

## Transaction Feedback

Provide feedback to IdentityMind as to the acceptance or rejection of an application by the merchant.

`POST https://edna.identitymind.com/im/account/merchant/<transaction_id>/accepted`

`POST https://edna.identitymind.com/im/account/merchant/<transaction_id>/rejected`

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