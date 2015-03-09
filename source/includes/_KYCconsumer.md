# KYC: Consumer Application

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided.

The following URLs are used for consumer application validation:

Validate a consumer application:<br>
`POST https://edna.identitymind.com/im/account/creation`

Retrieve the current state of a consumer application:<br>
`GET https://edna.identitymind.com/im/account/creation/<tid>`

##### Arguments
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json  
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
    "parentMerchant":"eDNABlackListFail",
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
    }
}
```
> The response includes detailed result codes and the transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>dob</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>assn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>assnl4</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>scanData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>faceImageData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>backsideImageData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>merchantAid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>personalguarantee</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ownership</td>
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
			<td>pcty</td>
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

## Quiz Response

The response to this request is an application response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of "challenge" questions that should once again be passed back to the consumer for answers.

`POST https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
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
	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smsCode</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>amount</td>
			<td>Description</td>
		</tr>
	</table>

## Document Verification

The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

`POST https://edna.identitymind.com/im/account/consumer/<appid>/document`

```code
EXAMPLE SERVICE RESPONSE DATA
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
	<br>
	<table>
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

## Feedback

All arguments are optional, although a JSON object must be provided.

The following URLs are used to notify IdentityMind of the acceptance or rejection of an application by the merchant:

`POST https://edna.identitymind.com/im/account/consumer/<application_ID>/accepted`

`POST https://edna.identitymind.com/im/account/consumer/<application_ID>/rejected`

	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>reason</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>validate</td>
			<td>Description</td>
		</tr>
	</table>