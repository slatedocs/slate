# KYC: Merchant Application

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

The following URLs are used for merchant application validation:

Validate a merchant application:<br>
`POST https://edna.identitymind.com/im/account/merchant`


Retrieve the current state of a merchant application:<br>
`GET https://edna.identitymind.com/im/account/merchant/<tid>`

#### How to associate a merchant with its owners

Each merchant can be associated with one or more owners.  The merchant will be evaluated with the Merchant Application Web Service.  One can provide an application ID (tid in the Request API), or extract this ID from the Response.

Each owner will be evaluated with the Consumer Application Web Service.  In the Consumer Application request, the merchantAid must be set to the value of the application ID of the Merchant Application.  This will link the merchant to all of its owners. 

![](http://i.imgur.com/rO16Xdb.png)

#### Arguments

> The response is a JSON encoding of the IdentityMind Service result:

```code
EXAMPLE SERVICE RESPONSE DATA

{
    "mtid": "eDNABlackListFail",
    "state": "R",
    “merchantAPIName”:“joseshoe”,
    “ownerApplicationIds”:[
        	“consumerapp001”,
        	“consumerapp002”,
	        “consumerapp003”
    ]

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
    },
} 
```

> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*. Parameters that are not defined here but appearing in the Request API will be categorized as custom data and can be displayed on the UI as proprietary information for the merchant.

	<br>
	<table>
		<tr>
			<th colspan=3>Application</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tid</td>
			<td>Unique application identifier. The system will assign one if not provided. It is recommended to pass one if needed to be correlated to client's backend system. The tid must be encoded as a string (e.g. <code>"tid":"123455"</code>). The tid is used to combine the multiple stages of an application. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Company</th>
		</tr>
		<tr>
			<td>amn</td>
			<td>Legal name of the company</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>dba</td>
			<td>Doing business as</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ataxid</td>
			<td>The merchant's tax ID</td>
			<td>Yes, unless SSN is provided</td>
		</tr>
		<tr>
			<td>assn</td>
			<td>The merchant's social security number</td>
			<td>Yes, unless tax ID is provided</td>
		</tr>
		<tr>
			<td>giin</td>
			<td>The merchant's Guild Intermediary Identification Number. GIIN is a 19 character number that uniquely identifies an entity as having registered with the IRS for purposes of FATCA</td>
			<td>No</td>
		</tr>
		<tr>
			<td>businesstype</td>
			<td>Business type. Possible values are:
				<ul type="disc">
					<li><code>corporation</code> - Corporation</li>
					<li><code>llc</code> - LLC</li>
					<li><code>partnership</code> - Partnership</li>
					<li><code>individual</code> - Individual/Sole Proprietorship</li>
					<li><code>nonprofit</code> - Nonprofit</li>
					<li><code>foreigncorp</code> - Foreign corporation</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>afn</td>
			<td>The first name of the contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aln</td>
			<td>The last name of the contact person for the business</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aph</td>
			<td>The merchant's business phone number</td>
			<td>No</td>
		</tr>
		<tr>
			<td>asn</td>
			<td>The merchant's street address</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ac</td>
			<td>The merchant's city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>as</td>
			<td>The merchant's state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>az</td>
			<td>The merchant's zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aco</td>
			<td>The merchant's country</td>
			<td>No</td>
		</tr>
		<tr>
			<td>mcc</td>
			<td>Merchant Category Code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>Credit card number. Maximum length is 64 characters.</td>
			<td>Yes, if pccn is provided</td>
		</tr>
		<tr>
			<td>bankaccounttype</td>
			<td>Bank account type. Valid values are:
				<ul type="disc">
					<li><code>checking</code></li>
					<li><code>saving</code></li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ccaccept</td>
			<td>Credit card. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ppaccept</td>
			<td>PayPal. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>achaccept</td>
			<td>ACH. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bitcoinaccept</td>
			<td>Bitcoin. Boolean</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li><code>"tti":129887536</code></li>
					<li><code>"tti":"129887536"</code></li>
				</ul>
			If not supplied, eDNA will assign the time at which it receives the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Stage of the application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Group</th>
		</tr>
		<tr>
			<td>merchantgroup</td>
			<td>IDM merchant aggregation that defines KYC configuration and monitoring thresholds</td>
			<td>No</td>
		</tr>
	</table>