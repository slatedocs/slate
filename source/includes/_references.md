# References

## Result Keys and Codes

#### Out of Wallet Questions Encoding
```code
OUT OF WALLET QUESTIONS EXAMPLE
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

#### Result Codes

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


#### Payment Fraud Rule Codes

This section documents the result codes related to payment transaction fraud policy processing.  In the table below codes such as 104X represent the codes 1041-1045 where the first three digits indicate the fraud rule and the last digit represents the reputation of the User that triggered that rule as follows:

1.	Trusted
2.	Recognized
3.	Unknown
4.	Suspicious
5.	Bad

Thus, the code 1042 indicates that the rule "TRANSACTION REJECTED BY BANK" triggered for a Recognized User.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Rule Editor view (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

Code | Meaning
-----|--------
1000|	NO FRAUD RULE TRIGGERED, USER IS TRUSTED
1001|	NO FRAUD RULE TRIGGERED, USER IS RECOGNIZED
1002|	NO FRAUD RULE TRIGGERED, USER IS UNKNOWN
1003|	NO FRAUD RULE TRIGGERED, USER IS SUSPICIOUS
1004|	NO OTHER FRAUD RULE TRIGGERED, USER IS BAD
104X|	TRANSACTION REJECTED BY BANK
105X|	WHITELIST: USER, DEVICE OR PAYMENT WHITELISTED BY MERCHANT.
107X|	CHARGEBACK COUNT THRESHOLD EXCEEDED
108X|	REFUND COUNT THRESHOLD EXCEEDED
109X|	CVV MISMATCH
111X|	BLACKLIST: USER, DEVICE OR PAYMENT BLACKLISTED BY MERCHANT
113X|	SHIPPING COUNTRY BANNED BY MERCHANT
115X|	EMAIL ADDRESS IS DISPOSABLE
117X|	IP COUNTRY IS BLACKLISTED BY MERCHANT
119X|	IP COUNTRY IS WATCHLISTED BY MERCHANT
121X|	SHIPPING COUNTRY IS WATCHLISTED BY MERCHANT
123X|	PREFERRED: USER, DEVICE OR PAYMENT IS ON THE PREFERRED LIST FOR THE MERCHANT
125X|	WATCHLIST: USER, DEVICE OR PAYMENT WATCHLISTED BY MERCHANT
130X|	TRANSACTION AMOUNT IS BELOW SET THRESHOLD
132X|	TRANSACTION AMOUNT IS ABOVE SET THRESHOLD
134X|	PREPAID CARD TRANSACTION
135X|	DEBIT CARD TRANSACTION
137X|	PREPAID CARD TRANSACTION FOR SUBSCRIPTION SERVICE
138X|	DEBIT CARD TRANSACTION FOR SUBSCRIPTION SERVICE
140X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
141X|	IP VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
142X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
143X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
144X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
145X|	IP VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
146X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
147X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
148X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
149X|	IP VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
150X|	THE USER, DEVICE OR PAYMENT IN THE TRANSACTION HAS A FIRST DEGREE RELATIONSHIP WITH A BAD ENTITY
152X|	PAYMENT HAS BEEN USED FROM MORE THAN THE SET THRESHOLD COUNT OF DEVICES
154X|	DEVICE HAS BEEN USED BY MORE THAN THE SET THRESHOLD COUNT OF USERS
156X|	USER HAS USED MORE THAN THE SET THRESHOLD COUNT OF PAYMENTS
160X|	AVS MISMATCH
162X|	BILLING AND SHIPPING ADDRESS DIFFER
163X|	FAILED AVS FROM DOMESTIC BANK
164X|	ABSENT AVS FROM DOMESTIC BANK
165X|	CARD ISSUING BANK IN DIFFERENT COUNTRY FROM BILLING ADDRESS
166X|	CARD IS ISSUED FROM FOREIGN BANK DIFFERENT THAN COUNTRY BASED ON IP ADDRESS LOCATION
167X|	USER OR DEVICE ASSOCIATED TO MULTIPLE CARDS ISSUED BY DIFFERENT COUNTRIES
168X|	CARD ISSUED FROM A HIGH RISK COUNTRY
170X|	IP RISK SCORE IS HIGHER THAN THRESHOLD
171X|	ERROR ACCESSING IP REPUTATION SERVICE
172X|	IP TO BILLING DISTANCE GREATER THAN THRESHOLD
173X|	BROWSER LANGUAGE DOES NOT MATCH IP COUNTRY
174X|	IP ADDRESS IS A KNOWN BAD PROXY
175X|	IP TO SHIPPING DISTANCE GREATER THAN THRESHOLD
176X|	BILLING ADDRESS TO BIN MISMATCH
177X|	THE PAYPAL ACCOUNT ON THE TRANSACTION IS NOT PAYPAL VERIFIED AND ADDRESS IS NOT PAYPAL CONFIRMED
179X|	THE TRANSACTION USES A VERIFIED PAYPAL ACCOUNT WITH A CONFIRMED SHIPPING ADDRESS
180X|	THERE ARE MULTIPLE PAYPAL ACCOUNTS ASSOCIATED WITH THE USER ACCOUNT
181X|	THE PAYPAL ACCOUNT ON THE TRANSACTION IS NOT PAYPAL VERIFIED BUT IS USING A SHIPPING ADDRESS THAT HAS BEEN PREVIOUSLY USED BY THIS USER
182X|	THE PAYPAL ACCOUNT IS NOT VERIFIED
183X|	THE PAYMENT HAS NOW BEEN USED N TIMES, VALIDATE THE USER BEFORE FURTHER TRANSACTIONS WITH BE ALLOWED
185X|	MULTIPLE PHONE NUMBERS ARE ASSOCIATED WITH A USER
186X|	USER HAD USED MORE THEN THE THRESHOLD DEVICES
187X|	PAYMENT HAS BEEN USED BY MORE THAN THRESHOLD USERS
188X|	PAYPAL ACCOUNT HAS BEEN USED BY MORE THAN THRESHOLD USERS
189X|	DEVICE HAS USED MULTIPLE PAYPAL ACCOUNTS
190X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
191X|	MULTIPLE GOOGLE CHECKOUT ACCOUNTS ASSOCIATED WITH USER ACCOUNT
192X|	THE TRANSACTION IS NOT ELIGIBLE FOR GOOGLE PAYMENT GUARANTEE
193X|	GOOGLE CHECKOUT ACCOUNT USED IN THE TRANSACTION IS LESS THAT THRESHOLD DAYS OLD
194X|	IP VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
195X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 5 MINUTE THRESHOLD
196X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 1 HOUR THRESHOLD
197X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
198X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
199X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 24 HOUR THRESHOLD
200X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
201X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
202X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 28 DAY THRESHOLD
203X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
204X|	DEVICE VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
205X|	PAYMENT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
206X|	USER ACCOUNT VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
207X|	IP VELOCITY HAS EXCEEDED MERCHANT 5 MINUTE THRESHOLD
208X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
209X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
210X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
211X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
212X|	IP VELOCITY HAS EXCEEDED GLOBAL 1 HOUR THRESHOLD
213X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
214X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
215X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
216X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
217X|	IP VELOCITY HAS EXCEEDED GLOBAL 24 HOUR THRESHOLD
218X|	USER, DEVICE OR PAYMENT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
219X|	DEVICE VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
220X|	PAYMENT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
221X|	USER ACCOUNT VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
222X|	IP VELOCITY HAS EXCEEDED GLOBAL 28 DAY THRESHOLD
223X|	NON US ISSUED CARD
224X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 5 MINUTE VELOCITY
225X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 1 HOUR VELOCITY
226X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 24 HOUR VELOCITY
227X|	SHIPPING ADDRESS VELOCITY HAS EXCEEDED 28 DAY VELOCITY
228X|	SHIPPING ADDRESS IS BANNED
229X|	UNSAFE TELEPHONE TYPE
230X|	MULTIPLE SHIPPING ADDRESS ASSOCIATED WITH USER ACCOUNT, DEVICE OR PAYMENT INSTRUMENT
231X|	MULTIPLE PAYMENT INSTRUMENTS ASSOCIATED WITH SHIPPING ADDRESS
232X|	ELEMENT OF TRANSACTION ON OFFICE OF FOREIGN ASSETS CONTROL (OFAC) SPECIALLY DESIGNATED NATIONALS (SDN) LIST
233X|	SHIPPING COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
234X|	BILLING COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
235X|	IP COUNTRY IS NOT ON THE LIST OF ALLOWED COUNTRIES
236X|	DUPLICATE TRANSACTION
237X|	UNMATCHED BILLING NAME AND BILLING ADDRESS
238X|	HIGH RISK BILLING ADDRESS
239X|	HIGH RISK SHIPPING ADDRESS
240X|	NO EMAIL ADDRESS HISTORY
241X|	UNMATCHED BILLING ADDRESS AND EMAIL ADDRESS
242X|	3RD PARTY PROVIDER NOT ACCESSIBLE
243X|	MULTICARD (NO PREPAID) DEVICE
244X|	MULTICARD (NO PREPAID) USER ACCOUNT
246X|	DUPLICATE TRANSACTION, SMALL AMOUNT
250X|	DEVICE BILLING ADDRESS COUNT
251X|	USER ACCOUNT BILLING ADDRESS COUNT
252X|	UNREACHABLE BILLING USER 
253X|	UNMATCHED EMAIL ADDRESS
254X|	NONEXISTENT EMAIL DOMAIN
255X|	PROVIDER BLACKLIST
256X|	RESERVED
257X|	RESERVED
258X|	USING PROXY
259X|	COUNTRY MISMATCH AND WATCHLIST


#### Account Validation Rule Codes

This section documents the result codes related to account validation policy processing.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Rule Editor section (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

Code |	Meaning
-----|-------
10000|	NO FRAUD RULE TRIGGERED
10010|	USER FAILED VALIDATION
10020|	BLACKLIST
10030|	5 MINUTE ACCOUNT CREATION VELOCITY
10040|	1 HOUR ACCOUNT CREATION VELOCITY
10050|	24 HOUR ACCOUNT CREATION VELOCITY
10060|	28 DAY ACCOUNT CREATION VELOCITY
10150|	5 MINUTE ACCOUNT TRANSFER OUT VELOCITY
10160|	1 HOUR ACCOUNT TRANSFER OUT VELOCITY
10170|	24 HOUR ACCOUNT TRANSFER OUT VELOCITY
10180|	28 DAY ACCOUNT TRANSFER OUT VELOCITY
10280|	DEVICE REPUTATION
10320|	PAYMENT REPUTATION
10410|	MULTIPLE ACCOUNTS FOR DEVICE
10550|	DEVICE FAILED VALIDATION
10580|	WATCHLIST
10590|	5 MINUTE IP ACCOUNT CREATION VELOCITY
10620|	5 MINUTE IP ACCOUNT TRANSFER OUT VELOCITY
10630|	1 HOUR IP ACCOUNT CREATION VELOCITY
10660|	1 HOUR IP ACCOUNT TRANSFER OUT VELOCITY
10670|	24 HOUR IP ACCOUNT CREATION VELOCITY
10700|	24 HOUR IP ACCOUNT TRANSFER OUT VELOCITY
10710|	28 DAY IP ACCOUNT CREATION VELOCITY
10740|	28 DAY IP ACCOUNT TRANSFER OUT VELOCITY
10750|	UNSAFE PHONE
10760|	NO EMAIL ADDRESS HISTORY
10770|	UNMATCHED BILLING ADDRESS AND EMAIL ADDRESS
10780|	UNMATCHED BILLING NAME AND ADDRESS
10790|	3RD PARTY PROVIDER NOT ACCESSIBLE
10800|	HIGH RISK BILLING ADDRESS
10810|	HIGH RISK SHIPPING ADDRESS
10820|	SHIPPING COUNTRY NOT ACCEPTABLE
10830|	BILLING COUNTRY NOT ACCEPTABLE
10840|	IP COUNTRY NOT ACCEPTABLE
10850|	UNVALIDATED USER
10860|	MULTIPLE MERCHANT APPLICATIONS FOR DEVICE
10870|	MULTIPLE MERCHANT APPLICATIONS FOR PAYMENT
10880|	MULTIPLE MERCHANT APPLICATIONS FOR USER ACCOUNT
10890|	CHARGEBACK COUNT
10900|	MULTIPLE BILLLING ADDRESSES FOR USER ACCOUNT
10910|	MULTIPLE BILLLING ADDRESSES FOR DEVICE
10920|	IDANALYTICS IDSCORE
10930|	IP REPUTATION
10940|	BAD PROXY
10950|	DESTINATION FINANCIAL ACCOUNT REPUTATION
10960|	DESTINATION USER ACCOUNT REPUTATION
10970|	RESERVED
10980|	RESERVED
10990|	USING PROXY
11000|	RESERVED
11010|	USING DISPOSABLE EMAIL ADDRESS


#### Automated Review Policy Rule Codes

This section documents the result codes related to Automated Review Policy processing.

**Note**: Rules are updated regularly. The following table may not represent the most current set. Please refer to the UI Automated Review Policy section (in the web user interface) for up-to-date rules. The code for each rule is accessible through the UI.

Code |	Meaning
-----|--------
20005|	ACCEPT TRANSACTION FROM A USER THAT HAS A GOOD HISTORY
20006|	ACCEPT PREPAID CARD
20007|	SIMILAR TRANSACTION PREVIOUSLY MANUALLY ACCEPTED
20008|	TRANSACTION AMOUNT IS BELOW THRESHOLD FOR REVIEW
20009|	COUNTRY MISMATCH OVERRIDE
20010|	ACCEPT MOTO=2 (REBILL) TRANSACTIONS


#### Consumer/Merchant Application Security Tests

This section documents the security tests returned for Consumer or Merchant Applications.

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
bc:0|	BlueCava 
bc:1|	BlueCava: Using Anonymous Proxy
bc:2|	BlueCava: Has Used Anonymous Proxy
bc:3|	BlueCava: Using Proxy
cq:1|	NeuStar/TargusInfo CQR: Valid Phone
cq:2|	NeuStar/TargusInfo CQR
cq:3|	NeuStar/TargusInfo CQR: Unsupported Country
ed:0|	Account Policy Evaluation
ed:1|	Black List
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
ed:2|	Watch List
ed:20|	Account Failed Validation
ed:21|	User Account Application Count
ed:22|	User Account Payment Count
ed:23|	User Account Device Count
ed:24|	User Account Shipping Address Count
ed:25|	User Account Billing Address Count
ed:26|	User Account First Seen
ed:27|	Billing Address Reputation
ed:28|	Billing country on acceptable list
ed:29|	Email First Seen
ed:30|	User Validated
ed:31|	Billing state on acceptable list
ed:3|	Chargeback Count
ed:4|	Payment Reputation
ed:5|	Payment Instrument Application Count
ed:6|	Payment User Account Count
ed:7|	Payment Device Count
ed:8|	Payment Shipping Address Count
ed:9|	Payment Billing Address Count
ep:1|	Experian BusinessIQ Premier Profile
ep:2|	Experian BusinessIQ Premier Profile: Present in Database
ep:3|	Experian BusinessIQ Premier Profile: Active Business
ep:4|	Experian BusinessIQ Premier Profile: Intelliscore Plus Score
ev:1|	NeuStar/TargusInfo Email: Unsupported Country
ev:3|	Neustar/TargusInfo Email Confidence
ia:1|	IDAnalytics IDScore
ia:2|	IDScore
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
iq:1|	IDAnalytics CertainID: Out of Wallet Questions
iq:2|	IDAnalytics CertainID: Unsupported Country
mh:0|	MATCH 
mh:1|	MATCH: Terminated Merchant
mh:2|	MATCH: Terminated Merchant for Fraudulent Reason
mm:0|	MaxMind
mm:1|	MaxMind MinFraud: IP Bad Proxy
mm:2|	MaxMind MinFraud: IP Proxy
mm:3|	MaxMind MinFraud: IP Risk Score
mm:4|	MaxMind MinFraud: IP Country Code
mm:5|	MaxMind MinFraud: IP ISP
mm:6|	MaxMind MinFraud: IP City
mm:7|	MaxMind MinFraud: IP Region / State Match
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
of:1|	IDology ExpectID PA
of:2|	IDology ExpectID PA: OFAC Check
jpo:1|	Phone Ownership: Correct Code Provided
ra:0|	RapLeaf 
ra:1|	RapLeaf: Email History
ra:2|	RapLeaf: Email First Seen
ra:3|	RapLeaf: Unsupported Country
ss:0|	Sanctions Screening
ss:1|	Sanctions Screening: Sanction Match
ss:2|	Sanctions Screening: Sanction List
ss:3|	Sanctions Screening: Sanction Entry Update
ts:1|	Telesign 
ts:2|	Telesign PhoneID: Telephone Number Safe
ts:3|	Telesign PhoneID: Telephone Country
ts:4|	Telesign PhoneID: Telephone City
ts:5|	Telesign PhoneID: Telephone Carrier
ts:6|	Telesign PhoneID: Telephone Contact
tc:0|	TIN Verification
tc:1|	TIN Verification: TIN and Name Match
tc:2|	TIN Verification: Possible Death Master File Match Found
tc:3|	TIN Verification: EIN and Name Match
tc:4|	TIN Verification: Lists Match
tc:5|	TIN Verification: Unsupported Country
tc:6|	TIN Verification: Address Match

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