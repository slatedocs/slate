# KYC: Consumer Application

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided.

The following URLs are used for consumer application validation:

Validate a consumer application:<br>
`POST https://edna.identitymind.com/im/account/creation`

Retrieve the current state of a consumer application:<br>
`GET https://edna.identitymind.com/im/account/creation/<tid>`

### Arguments

```code
> The response is a JSON encoding of the IdentityMind Service result:   

EXAMPLE SERVICE RESPONSE DATA

{
    "mtid": "consumerUIWalkthrough",
    "state": "A",
    "merchantApplicationResponse": {
        "erd": "Unknown User",
        "frd": "No fraud rules triggered.",
        "frn": "Account Fallthrough",
        "rcd": "50005,202,111,101,121,131,10000",
        "res": "ACCEPT",
        "tid": "consumerUIWalkthrough",
        "ufs": 1414122024000,
        "umrs": 1414122024000,
        "upr": "UNKNOWN",
        "usc": 0,
        "user": "UNKNOWN"
    },
    “parentMerchant”:”eDNABlackListFail”,
    "ednaScoreCard": {
        "tr": [
                  {
                "testCategory": "Identity",
                "testDescription": "Checks whether the address is risky: prisons, warehouses, hospitals, universities, etc.\nIt fails if the address is high risk.",
                "testId": "id:7",
                "testName": "IDology ExpectID: Warm Address",
                "testPass": true
            },
            {
                "testCategory": "Device",
                "testDescription": "Checks whether the device is currently using an anonymous proxy.  It fails when an anonymous proxy is being used.",
                "testDetails": "The device is not currently using an anonymous proxy",
                "testId": "bc:1",
                "testName": "BlueCava: Using Anonymous Proxy",
                "testPass": true
            },
            {
                "testCategory": "eDNA",
                "testDescription": "Checks the number of applications for a particular funding payment instrument.\nIt fails when the number of applications is higher than the configured threshold.",
                "testDetails": "0",
                "testId": "ed:5",
                "testName": "Payment Instrument Application Count",
                "testPass": true
            },
        ]
    },
}
```
> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

	<br>
	<table>
		<tr>
			<th colspan=3>User</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>bfn</td>
			<td>The first name of the individual opening the account. Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>The last name of the individual opening the account. Maximum length is 50 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>man</td>
			<td>Free form unique identifier for this account at this merchant. Maximum length is 60 characters.</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Email address on record. An email address that the merchant is comfortable using to validate access to the account. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site; in particular, that it is used for Oauth authentication. The content of the field is merchant defined, but the following values are recommended:
				<ul type="disc">
					<li><code>facebook</code></li>
					<li><code>google</code></li>
					<li><code>twitter</code></li>
					<li><code>yahoo</code></li>
				</ul>
			Maximum length is 60 characters.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dob</td>
			<td>The date of birth of the individual opening the account. Format is ISO 8601 (e.g. <code>1984-01-21</code>).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>phn</td>
			<td>Customer's primary phone number. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Cstomer's mobile phone number. Maximum length is 60 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. <code>"clat":"37.4419"</code>).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. <code>"clong":"-122.1419"</code>).</td>
			<td>No</td>
		</tr>
		<tr>
			<td>scanData</td>
			<td>If using Jumio NetVerify Perform, the document front side image data, Base64 encoded. If provided, this will override the configured "Jumio client integration." 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>backsideImageData</td>
			<td>If using Jumio NetVerify Perform, the document back side image data, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>
		<tr>
			<td>faceImageData</td>
			<td>If using Jumio NetVerify Perform with face match enabled, the face image file, Base64 encoded. 5MB maximum size</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the <code>dft</code> attribute</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type"disc">
					<li><code>BC</code> - BlueCava</li>
				</ul>
			Default is <code>BC</code></td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Payment/Funding Account</th>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Credit/debit card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The hash must be of the full card number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>A masked or tokenized version of the credit card number. Maximum length is 64 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>phash</td>
			<td>Account unique identifier (hash) while obscuring actual number. This is used when IdentityMind does not natively support the payment type.
			<br><br>
			<b>Note</b>: The hash must be of the full account ID, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Hash of the unique identifier for a Bitcoin wallet. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>pach</td>
			<td>Hash of the unique identifier for an ACH account
			<br><br>
			<b>Note</b>: The hash must be of the full account number, not a masked or tokenized representation. Maximum length is 128 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td>Payment street address. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>Payment city. Data truncates to 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>Payment state Maximum length is 30 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>Payment zip code. Maximum length is 20 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>Payment country. Maximum length is three characters.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li><code>“tti”:129887536</code></li>
					<li><code>“tti”:“129887536”</code></li>
				</ul>
			If not supplied, eDNA will assign the time at which it receives the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Unique identifier for the application. eDNA assigns an internal ID if none is provided. The tid must be encoded as a string (e.g. <code>"tid":"123455"</code>). The tid is used to combine the multiple stages of an application. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>The affiliate ID associated with this transaction. Encoded as a string. Maximum length is 100 characters.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>The signup/creation date of the affiliate associated with this transaction. Either an ISO 8601 encoded string or a UNIX timestamp.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>memo</td>
			<td>Free form text memo field</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Merchant</th>
		</tr>
		<tr>
			<td>merchantAid</td>
			<td>If this consumer is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>personalguarantee</td>
			<td>Personal guarantee. Boolean</td>
			<td>No</td>
		</tr>
		<tr>
			<td>ownership</td>
			<td>The percentage of ownership</td>
			<td>No</td>
		</tr>
		<tr>
			<td>title</td>
			<td>Title of the owner</td>
			<td>No</td>
		</tr>
	</table>

# Out of Wallet Questions (IDAnalytics)

The response to this request is an application response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of “challenge” questions that should once again be passed back to the consumer for answers.

The following URLs are used to return a customer’s response to a set of out of wallet questions returned either by a merchant or consumer application respectively:

`POST https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse`

`POST https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The encoding is in JSON as shown below. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse

{
   "answers":[
      {
         "questionId":"0",
         "choice":"KERRVILLE"
      },
      {
         "questionId":"1",
         "choice":"DICK"
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
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Answers Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers</td>
			<td>JSON Array of JSON encoded answer objects</td>
		</tr>
		<tr>
			<td>questionId</td>
			<td>Integer identifier for this question. This value maps to the question within the question data.</td>
		</tr>
		<tr>
			<td>choice</td>
			<td>Text of the answer that was selected by the consumer</td>
		</tr>
	</table>

# Phone Ownership Validation (Twilio)

The response to this request is an application response containing the newly updated application.

The following URLs are used to return a customer’s response to a phone validation request:

`POST https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse`

`POST https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s code response. The encoding is in JSON as shown below. The answers are processed and the response is used to update the Phone Ownership Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse


{
   "smsCode":”1234”
}
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Answers Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>smsCode</td>
			<td>The response code provided by the consumer. Encoded as a string</td>
		</tr>
	</table>

# Document Validation Request (Jumio NetVerify)

The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

The following URLs are used to initiate a Jumio NetVerify Multi Document transaction for a Consumer or Merchant application:

`POST https://edna.identitymind.com/im/account/merchant/<appid>/document`

`POST https://edna.identitymind.com/im/account/consumer/<appid>/document`

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/consumer/743567/document 

{
   "documentTypeCode”:”CC”
}


EXAMPLE SERVICE RESPONSE DATA

{
    "authorizationToken”:”f9d32f46-8f11-4b7c-b146-6d7a95aa765f”
}
```
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Request Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>documentTypeCode</td>
			<td>One of the following document type codes:
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
			This key is required and is encoded as a string.
			</td>
		</tr>
	</table>	
	<table>
		<tr>
			<th colspan=2>JSON Response Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>authorizationToken</td>
			<td>The token that is to be provided to the Jumio NetVerify client widget</td>
		</tr>
	</table>