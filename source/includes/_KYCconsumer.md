# KYC: Consumer Application Validation Web Service

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

## Arguments

The following URLs are used for consumer application validation:

Validate a consumer application:<br>
[https://edna.identitymind.com/im/account/creation](https://edna.identitymind.com/im/account/creation) (POST)

Retrieve the current state of a consumer application:<br>
[https://edna.identitymind.com/im/account/creation/<tid>](https://edna.identitymind.com/im/account/creation/<tid>) (GET)

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
					<li>google</li>
					<li>facebook</li>
					<li>twitter</li>
					<li>yahoo</li>
				Maximum length is 60 characters.</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dob</td>
			<td>The date of birth of the individual opening the account. Format is ISO 8601 (e.g. 1984-01-21).</td>
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
			<td>The current latitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419").</td>
			<td>No</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>The current longitude of the customer, specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419").</td>
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
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the "dft" attribute</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type"disc">
					<li>BC - BlueCava</li>
				</ul>
			Default is BC</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Payment/Funding Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
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
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li>“tti”:129887536</li>
					<li>“tti”:“129887536”</li>
				</ul>
			If not supplied, eDNA will assign the time at which it receives the transaction.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Unique identifier for the application. eDNA assigns an internal ID if none is provided. The tid must be encoded as a string (e.g. "tid":"123455"). The tid is used to combine the multiple stages of an application. Maximum length is 40 characters.</td>
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
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>merchantAid</td>
			<td>If this consumer is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant (see tid in the Merchant Application API below)</td>
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