# Reference

## Quiz Response Encoding
```code
QUIZ RESPONSE ENCODING EXAMPLES
```
```json
{
   "questions":[
      {
         "questionId":0,
         "questionText":"With which of these cities have you been associated?",
         "choices":[
            "KERRVILLE",
            "HOUSTON",
            "SAN ANTONIO",
            "SAN DIEGO",
            "None of the above"
         ]
      },
      {
         "questionId":1,
         "questionText":"Which person has shared a previous address with you?",
         "choices":[
            "DICK",
            "TOM",
            "HARRY",
            "BOB",
            "None of the above"
         ]
      },
      {
         "questionId":2,
         "questionText":"What is SANDRA's birthday who shares your current or a recent address?",
         "choices":[
            "October 1964",
            "February 1965",
            "August 1966",
            "August 1946",
            "None of the above"
         ]
      },
      {
         "questionId":3,
         "questionText":"In what county is 1313 MOCKINGBIRD LN?",
         "choices":[
            "MUNSTER",
            "HOWELL",
            "TRANSYLVANIA",
            "COOK",
            "None of the above"
         ]
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
			<td>questions</td>
			<td>JSON Array of JSON encoded question objects</td>
		</tr>
		<tr>
			<td>questionId</td>
			<td>Integer identifier for this question</td>
		</tr>
		<tr>
			<td>questionText</td>
			<td>Text of the question that is to be asked of the consumer</td>
		</tr>
		<tr>
			<td>choices</td>
			<td>JSON Array of strings that represent the set of possible multiple choice answers</td>
		</tr>
	</table>

## Payment Instrument Hashing

#### Including Credit Number Hash and Token in Transaction Report

```java
For Java, the sample code is in imclientSDK/samplecode/java/REST/TransactionViaREST.java:

JSONObject jsonRequest = new JSONObject();

// credit card token and hash

// replace the 2nd parameter below with the actual card number

CreditCardUtils.addCreditCardData(jsonRequest, "4012012301230123"); 

…

// the json string generated below will include the token, and hashes generated from the actual number

String body = jsonRequest.toString(2);
```

```php
For PHP, the sample code is in imclientSDK/samplecode/php/ednaTransaction.php:

$arr = array();

/* 
replace the 2nd parameter below with the actual card number
*/

$arr[CREDIT_CARD_NUMBER] = identitymind_hashCCN("4012012301230123");

$arr[CREDIT_CARD_TOKEN] = identitymind_tokenCCN("4012012301230123");

…

/* 
Turn the array into a JSON string to be used as the body of the POST
*/

$data = json_encode($arr);
```

IdentityMind Transaction API does not accept actual credit card number. It accepts the following information about the credit card number used in the transaction: 

1.	Credit card number hash
2.	Credit card number token 

IdentityMind provides a client SDK for Java and PHP. If you use these languages, you can use the SDK to include the information in your request to the API. The SDK contains sample code on how to do that.

**Note**: The hash must be of the full card number, not a masked or tokenized representation.
If you use other languages, please see below "Credit Card Number Hash".


##### Credit Card Number Hash

To generate the credit card number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non-masked credit card number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field pccn. 

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex, you would concatenate the salt and the credit card number and pass that to the function to get credit card number hash.   Note that all non-numeric characters should be removed from the card number prior to hashing.

Please contact IdentityMind to get the salt. 

For example, the salted credit card number hash for 4012012301230123 is 32c1950468af7489efb48c911f9550092ebf34c5

The credit card number hash should be included in the JSON string of the request to IdentityMind Transaction API in the field "pccn". 

**Note**:  The hash must be of the full card number, not a masked or tokenized representation.


##### Credit Card Number Token

The credit card number token is the first 6 digits of the actual card number followed by XXXXXX followed by the last 4 digits of the actual card number. For example, the credit card number token for card number 4012012301230123 is 401201XXXXXX0123. 

The credit card number token should be included in the JSON string of the request to IdentityMind Transaction API in the field "pcct". 


#### Including Bank Account Hash and Token in Transaction Request

```java
For Java, the sample code is in imclientSDK/samplecode/java/REST/ACHTransactionViaREST.java:

JSONObject jsonRequest = new JSONObject();

// bank account hash and token

BankAccountUtils.addBankAccountData(json, "321076479", "74600015199010"); 
	
…
	
// the json string generated below will include the token, and hash generated from the actual number
	
String body = jsonRequest.toString(2);
```

```php
For PHP, the sample code is in imclientSDK/samplecode/php/achEdnaTransaction.php:

	$arr = array();

/* replace the 2nd parameter below with the actual card number */

$arr[BANK_ACCOUNT_NUMBER] = identitymind_hashBankRoutingAccount("321076479", "74600015199010");

$arr[BANK_ACCOUNT_TOKEN] = identitymind_bankRoutingAccountToken("321076479", "74600015199010");

	…

/* Turn the array into a JSON string to be used as the body of the POST */

	$data = json_encode($arr);
```

Similar to the mechanism for sending credit card information, IdentityMind Transaction API accepts: 

1.	Bank account number hash
2.	Bank account number token 

IdentityMind provides a client SDK for Java and PHP. If you use these languages, you can use the SDK to include the information in your request to the API. The SDK contains sample code on how to do that.

If you use other languages, please see "Bank Account Number Hash" below.

**Note**: The hash must be of the full account number, not a masked or tokenized representation.

##### Bank Account Number Hash

To generate the bank account number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non masked account number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field "pach".

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex:

- for a US bank account number concatenate the salt and the routing number and account number and pass that to the function to get account number hash
- for an international IBAN account number concatenate the salt and full IBAN account number and pass that to the function to get account number hash

**Note**: All spaces and dashes should be removed from the account number prior to hashing.

Please contact IdentityMind to get the salt. 

For example, the salted bank account number hash for 321076479 74600015199010 is 3f57733f34b677294fed96efd440b8d9e7728fa5 and the hash for SN12K00100152000025690007542 is dd91898995dfef188eca122c5e0dd92f3aa34550

The account number hash should be included in the JSON string of the request to IdentityMind Transaction API in the field "pach."


##### Bank Account Number Token

For the bank account number token we recommend: 
- for a US bank account number the first 6 digits of the routing number, followed by XXXXXXXX and the last 4 digits of the account number
- for an international IBAN account number the first 6 digits of the account, followed by XXXXXXXX and the last 4 digits of the account number

For example, the token for 321076479 74600015199010 is 321076XXXXXXXX9010 and the hash for SN12K00100152000025690007542 is SN12K0XXXXXXXX7542

The bank account number token should be included in the JSON string of the request to IdentityMind Transaction API in the field "ptoken."

## Change History

#### 1.19
- Added 1.18 backwards compatibility mode (rule number and name changes still relevant)
- Scorecard now included in transaction and transfer results
- smid and smna fields replaced by profile field
- Removed some unused fields
- Simplified TestResult encoding
- Changed KYC response so that it is consistent with other transaction types
- GET method added to im/transaction
- Google Checkout support removed
- Removed policy inheritance
	- Merchants do not inherit rules from global or reseller
	- Custom profiles do not inherit rules from the default
- KYC stage configuration is done via enabling rules for a certain stage
	- If a rule references a third party, then that service is accessed automatically
- Consumer and merchant application configuration subsumed into profile configuration


#### 1.18

- Updated Merchant and Consumer Application Validation Web Services to support multiple owners for a merchant.  We also added extra fields as required by our clients.
- Added additional security tests


#### 1.17.1

- Added Account Validation Rule 11010
- Switched from Experian 192 CheckID to Experian ProveID
	- Added "Unsupported Country" security test to Experian


#### 1.17

- Document the Quiz Response (Phone Ownership)
- Add Auth.net and Interac as supported gateways
- Document application accepted and rejected API
- Added bank_status property to the Merchant Accept/Reject Feedback API
- Corrected format of the "ufs" and "umrs" fields
- Add API call to get the current state of a consumer or merchant application
- Clarify that a payment hash must be of the original non-masked account number
- Documented memo field in Transfer and KYC transaction data


#### 1.16.2

- Added support for Jumio Netverify Multi Document
- Added additional KYC request attributes to support Jumio NetVerify
	- Face match in NetVerify Perform
	- Backside Image in NetVerity Perform
- Add security tests
	- IdentityMind Sanctions Screening
	- Jumio NetVerify Multi Document