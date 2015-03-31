# Reference

## Result Codes

Code | Meaning
-----|---------
100	| Good User Account Info
101	| Unknown User Account Info
102	| Bad User Account Info
103	| Suspicious User Account Info
104	| Very Good User Account Info
110	| Good Device
111	| Unknown Device
112	| Bad Device
113	| Suspicious Device
114	| Very Good Device
120	| Known Payment Instrument
121	| Unknown Payment Instrument
122	| Bad Payment Instrument
123	| Suspicious Payment Instrument
124	| Very Good Payment Instrument
130	| Trusted User
131	| Unknown User
132	| Bad User
133	| Recognized User
134	| Suspicious User
150	| No Relationship
151	| User Account Info, Device and Payment Instrument all related
152	| User Account Info and Device related
153	| User Account Info and Payment Instrument related
154	| Device and Payment Instrument related
155	| Payment Instrument related to User Account Info and Device via a household relationship
156	| User Account Info related to Payment Instrument and Device via a household relationship
157	| Device related to User Account Info and Payment Instrument via a household relationship
158	| User Account Info related to Payment Instrument, and Payment Instrument related to device
159	| User Account Info related to device, and User Account Info related to Payment Instrument
160	| User Account Info related to device, and device related to Payment Instrument
180	| Trusted Shipping Address
181	| Unknown Shipping Address
182	| Bad Shipping Address
183	| Recognized Shipping Address
184	| Suspicious Shipping Address
190	| Automated Review Policy Disabled
191	| Automated Review Policy Rejected
192	| Automated Review Policy Accepted
193	| Automated Review Policy Transaction Filtered
194	| Automated Review Policy Indeterminate
195	| Automated Review Policy Pending
200	| Validated User
201	| User Who Has Failed Validation
202	| Un-validated User
210	| Good Destination User Account Info
211	| Unknown Destination User Account Info
212	| Bad Destination User Account Info
213	| Suspicious Destination User Account Info
214	| Very Good Destination User Account Info
220	| Known Destination Payment Instrument
221	| Unknown Destination Payment Instrument
222	| Bad Destination Payment Instrument
223	| Suspicious Destination Payment Instrument
224	| Very Good Destination Payment Instrument
501	| Fraudulent Device
502	| Fraudulent Payment
503	| Fraudulent User Account
504	| Suspicious Device
505	| Suspicious Payment
506	| Suspicious User Account
507	| Validated User
508	| User who previously failed validation
509	| Existing Trusted User
510	| Existing, but newly created User
511	| New User, with good existing User Account, Device and Payment
512	| New User, with entities related via household relationships
516	| New account information, but previously used shipping address by the payment/device
517	| New account information, and a new shipping address
518	| New account information, for a device and payment pair
519	| New payment, but same billing address as other payments used by account/device
520	| New payment with new billing address for this account/device
521	| New payment for a device and user account pair
522	| New device with the same IP as a previously used device
523	| New device with a new IP, but using an existing shipping address for account/payment
524	| New device with a new IP and using a new shipping address
525	| New device with a new IP and no shipping address supplied
526	| New device for a payment and user account pair
528	| Previously unrelated good payment and device, no user account information supplied
529	| Existing relationship between payment and user account, no device information supplied, but using an existing shipping address
530	| Good Payment, neither device nor user account information supplied
531	| First Time Access
532	| Infrequent Access, over a long period of time
533	| Infrequent Access, over a short time period
534	| New device and payment, no user account information supplied
535	| New payment and user account info, no device information supplied
536	| New payment, neither device nor user account information supplied
537	| Good device and a new payment, no user account information supplied
538	| Good payment and a new device, no user account information supplied
539	| Good user account information and a new payment, no device information supplied
540	| Good payment and new user account information, no device information supplied
541	| Existing payment and device, though recently created, no user account information supplied
542	| Existing payment and device, no user account information supplied
543	| Existing relationship between payment and user account, no device information supplied
544	| Recently created existing relationship between payment and user account, no device information supplied
545	| Good Payment and User Account information, previously unrelated, no device information supplied
546	| Existing relationship between good User Account information and neutral device and payment
547	| Recently created existing relationship between good User Account information, and neutral device and payment
548	| Good User Account information with a new payment and device
549	| Existing relationship between a good payment and neutral device and user account information
550	| Recently created existing relationship between a good payment and neutral device and user account information
551	| Good payment with new device and user account information
552	| Existing relationship between a good device and neutral payment and user account information
553	| Recently created existing relationship between a good device and neutral payment and user account information
554	| Good device with new payment and user account information
555	| Validated User, that has been recently created
556	| New account information, no shipping address provided
557	| User validation extended to user with new device
558	| User validation extended to user with new device
559	| User validation extended to user with new payment
560	| User validation extended to user with new payment
561	| User validation extended to user with new account info
562	| User validation extended to user with new account info
563	| Validated user using a new device and a new shipping address
564	| Validated user using a new device and a new shipping address
565	| Good Payment Instrument, neither device nor user account information supplied
566	| Good Payment Instrument with clean history, neither device nor user account information supplied
567	| Fraudulent Shipping Address
568	| Suspicious Shipping Address
599	| Error
50001 | User is Validated (Account Transaction)
50002 | User failed validation (Account Transaction)
50003 |	Bad User (Account Transaction)
50004 |	Trusted User (Account Transaction)
50005 |	Unknown User (Account Transaction)
50006 |	New Device for Validated User (Account Transaction)
50007 |	New Payment for Validated User (Account Transaction)
50008 |	New Account for Validated User (Account Transaction)
50009 |	Validation Extended for Account
50010 |	Good History of Account and Destination Payment
50011 |	Recent History of Account and Destination Payment

## Security Test IDs

Test ID | Security Test Name
-------|-----------------	
19:1|	Experian ProveID
19:2|	Experian ProveID: Name and Address Match
19:3|	Experian ProveID: High Risk Address Check
19:4|	Experian ProveID: Deceased
19:5|	Experian ProveID: OFAC
19:6|	Experian ProveID: Unsupported Country
19:7|	Experian ProveID: Previous Address Match
19:8|	Experian ProveID: Last Name and Address Match
19:9|	Experian ProveID: Date of Birth Match
19:10|	Experian ProveID: Alert
iq:1|	IDAnalytics CertainID: Out of Wallet Questions
iq:2|	IDAnalytics CertainID: Unsupported Country
ia:1|	IDAnalytics IDScore
ia:2|	IDAnalytics IDscore: IDScore
ia:3|	IDAnalytics IDScore: OFAC Check
ia:4|	IDAnalytics IDScore: Higher Risk
ia:5|	IDAnalytics IDScore: Inactive Credit
ia:6|	IDAnalytics IDScore: Unsupported Country
id:0|	Idology ExpectID
id:1|	Idology ExpectID: Public Records Match
id:2|	Idology ExpectID: SSN Valid
id:3|	Idology ExpectID: SSN Match
id:4|	Idology ExpectID: Date of Birth Match
id:5|	Idology ExpectID: Phone Match
id:6|	Idology ExpectID: Address Match
id:7|	Idology ExpectID: Warm Address
id:8|	Idology ExpectID: Hot Address
id:9|	Idology ExpectID: Deceased
id:10|	IDology ExpectID: Unsupported Country
of:1|	IDology ExpectID PA
of:2|	IDology ExpectID PA: OFAC Check
nv:0|   Jumio NetVerify
nv:1|	Jumio NetVerify: Document Validity
nv:2|	Jumio NetVerify: Document Identity Match
nv:3|	Jumio NetVerify: Face Match
nv:4|	Jumio NetVerify: First Name
nv:5|	Jumio NetVerify: Last Name
nv:6|	Jumio NetVerify: Address
nv:7|	Jumio NetVerify: Date of Birth
nv:8|	Jumio NetVerify: ID Expiration
nv:9|	Jumio NetVerify: DoB Match
nv:10|	Jumio NetVerify: State Match
nv:11|	Jumio NetVerify: Multi Document
nv:12|	Jumio NetVerify: Scan ID
nv:13|	Jumio NetVerify: Unsupported Country
cq:1|	NeuStar/TargusInfo CQR: Valid Phone
cq:2|	NeuStar/TargusInfo CQR
cq:3|	NeuStar/TargusInfo CQR: Unsupported Country
ev:1|	NeuStar/TargusInfo Email: Unsupported Country
ev:3|	Neustar/TargusInfo Email Confidence
po:1|	Phone Ownership: Correct Code Provided
ra:0|	RapLeaf 
ra:1|	RapLeaf: Email History
ra:2|	RapLeaf: Email First Seen
ra:3|	RapLeaf: Unsupported Country
ss:0|	Sanctions Screening
ss:1|	Sanctions Screening: Sanction Match
ss:2|	Sanctions Screening: Sanction List
ss:3|	Sanctions Screening: Sanction Entry Update
ss:4|   Sanctions Screening: IP From Crimea
ts:1|	Telesign PhoneID: Telesign
ts:2|	Telesign PhoneID: Telephone Number Safe
ts:3|	Telesign PhoneID: Telephone Country
ts:4|	Telesign PhoneID: Telephone City
ts:5|	Telesign PhoneID: Telephone Carrier
ts:6|	Telesign PhoneID: Telephone Contact
av:1|   IDM Bank Account Validation: Deposit Amount
ed:0|	Account Policy Evaluation
ed:1|	Blacklist
ed:2|	Watchlist
ed:3|	Chargeback Count
ed:4|	Payment Reputation
ed:5|	Payment Instrument Application Count
ed:6|	Payment User Account Count
ed:7|	Payment Device Count
ed:8|	Payment Shipping Address Count
ed:9|	Payment Billing Address Count
ed:10|	Payment First Seen
ed:11|	Device Reputation
ed:12|	Device Failed Validation
ed:13|	Device Merchant Application Count
ed:14|	Device Payment Count
ed:15|	Device User Account Count
ed:16|	Device Shipping Address Count
ed:17|	Device Billing Address Count
ed:18|	Device First Seen
ed:19|	User Account Reputation
ed:20|	Account Failed Validation
ed:21|	User Account Application Count
ed:22|	User Account Payment Count
ed:23|	User Account Device Count
ed:24|	User Account Shipping Address Count
ed:25|	User Account Billing Address Count
ed:26|	User Account Age
ed:27|	Billing Address Reputation
ed:28|	Billing country on acceptable list
ed:29|	Email First Seen
ed:30|	User Validated
ed:31|	Billing state on acceptable list
ed:32|  Element of Transaction on Provider Blacklist
ed:33|  Element of Transaction on Provider Watchlist
ed:34|  Transaction Declined By Bank
ed:35|  Duplicate Transaction
ed:36|  Shipping Country Blacklist
ed:37|  Billing Country Blacklist
ed:38|  IP Country Blacklist
ed:39|  Shipping Country Watchlist
ed:40|  Source Payment Type
ed:41|  Destination Payment Type
ed:42|  Transaction Amount
ed:43|  Shipping Address Reputation
ed:44|  Destination Payment Reputation
ed:45|  Destination Account Reputation
ed:46|  Shipping Country on Acceptable List
ed:47|  Billing and Shipping Country Match
ed:48|  Account Has Completed KYC
ed:49|  Disposable Email Address
ed:50|  Card Type
ed:51|  Bad First Degree Relation
ed:52|  Billing and Shipping Address Match
ed:53|  Billing and Card Issuer Country Match
ed:54|  IP and Card Issuer Country Match
ed:55|  Issuer Country Count
ed:56|  Card Issuer Country on Blacklist
ed:57|  IP to Billing Address Distance
ed:58|  IP to Shipping Address Distance
ed:59|  Multiple Accounts for User
ed:60|  Previous Rejected Transaction for User
ed:61|  IP Country Watchlist
ed:62|  CVV Mismatch
ed:63|  AVS Mismatch
ed:64|  AVS Mismatch for a Domestic Issuer
ed:65|  Credit Count
ed:66|  Transaction Time
ed:67|  Corporate Payment Instrument
ed:68|  Subscription Request
ed:69|  Verified PayPal Account
ed:70|  Confirmed PayPal Address
ed:73|  PayPal Count for User
ed:74|  Card Count for Device
ed:75|  Card Count for User
ed:76|  Multiple Non-Prepaid Card for Device
ed:77|  Multiple Non-Prepaid for User
ed:78|  Multiple Shipping Addresses for User
ed:79|  Multiple Shipping Addresses for Device
ed:80|  Multiple Shipping Address for Payment
ed:81|  Multiple Payment Instruments for Shipping Address
ed:82|  Unvalidated User
ed:83|  IP Country Not Acceptable
ed:84|  Billing BIN Match
ed:500|  1 Hour Source Transaction Velocity
ed:501|  1 Hour Destination Transaction Velocity
ed:502|  1 Hour IP Transaction Velocity
ed:503|  1 Hour Account Creation Velocity
ed:504|  1 Hour IP Account creation Velocity
ed:505|  24 Hour Source Transaction Velocity
ed:506|  24 Hour Destination Transaction Velocity
ed:507|  24 Hour IP Transaction Velocity
ed:508|  24 Hour Account Creation Velocity
ed:509|  24 Hour IP Account Creation Velocity
ed:510|  28 Day Source Transaction Velocity
ed:511|  28 Day Destination Transaction Velocity
ed:512|  28 Day IP Transaction Velocity
ed:513|  28 Day Account Creation Velocity
ed:514|  28 Day IP Account Creation Velocity
tc:0|	TIN Verification
tc:1|	TIN Verification: TIN and Name Match
tc:2|	TIN Verification: Possible Death Master File Match Found
tc:3|	TIN Verification: EIN and Name Match
tc:4|	TIN Verification: Lists Match
tc:5|	TIN Verification: Unsupported Country
tc:6|	TIN Verification: Address Match
mh:0|	MATCH 
mh:1|	MATCH: Terminated Merchant
mh:2|	MATCH: Terminated Merchant for Fraudulent Reason
ep:1|	Experian BIS
au:0|   Augur: Using Tor Browser
bc:0|	BlueCava 
bc:1|	BlueCava: Using Anonymous Proxy
bc:2|	BlueCava: Has Used Anonymous Proxy
bc:3|	BlueCava: Using Proxy
mm:0|	MaxMind Minfraud
mm:1|	MaxMind MinFraud: IP Bad Proxy
mm:2|	MaxMind MinFraud: IP Proxy
mm:3|	MaxMind MinFraud: IP Risk Score
mm:4|	MaxMind MinFraud: IP Country Code
mm:5|	MaxMind MinFraud: IP ISP
mm:6|	MaxMind MinFraud: IP City
mm:7|	MaxMind MinFraud: IP Region / State Match
mm:8|   MaxMind MinFraud: IP Region / Country Banned
mm:10|  Maxmind MinFraud: Using Anonymous Proxy

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

<aside class="notice">The hash must be of the full card number, not a masked or tokenized representation.
If you use other languages, please see "Credit Card Number Hash".</aside>


##### Credit Card Number Hash

To generate the credit card number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non-masked credit card number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field pccn. 

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex, you would concatenate the salt and the credit card number and pass that to the function to get credit card number hash.   Note that all non-numeric characters should be removed from the card number prior to hashing.

Please contact IdentityMind to get the salt. 

For example, the salted credit card number hash for 4012012301230123 is 32c1950468af7489efb48c911f9550092ebf34c5

The credit card number hash should be included in the JSON string of the request to IdentityMind Transaction API in the field "pccn". 

<aside class="notice">The hash must be of the full card number, not a masked or tokenized representation.</aside>


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

<aside class="notice">The hash must be of the full account number, not a masked or tokenized representation.</aside>

##### Bank Account Number Hash

To generate the bank account number hash, you use the salt provided by IdentityMind, to generate a SHA-1 hash for the non masked account number, and convert the byte array of the hash to Hexadecimal string. The hash should be included in the JSON string of the request in the field "pach".

Say you have a function sha1(String s) that takes a string s and return the sha1 hash of the string in hex:

- for a US bank account number concatenate the salt and the routing number and account number and pass that to the function to get account number hash
- for an international IBAN account number concatenate the salt and full IBAN account number and pass that to the function to get account number hash

<aside class="notice">All spaces and dashes should be removed from the account number prior to hashing.</aside>

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

#### 1.18

- Updated Merchant and Consumer Application Validation Web Services to support multiple owners for a merchant.  We also added extra fields as required by our clients.
- Added additional security tests