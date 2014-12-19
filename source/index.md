---
title: eDNA API Reference

language_tabs:
  - java
  - javascript
  - PHP
  - python
  - ruby
  - shell

toc_footers:
  - placeholder

includes:
  - errors

search: true
---

# Welcome

# Transaction Evaluation

The IdentityMind Engine exports a REST based Web Service interface over HTTPS, using JSON to encode service request and response data.

A typical Merchant / IdentityMind interaction to validate a transaction is shown below


![](http://i.imgur.com/UwJEaJZ.png)

## Authentication

placeholder

# Payment Transaction Validation Web Service

## URL

placeholder

## Arguments

### Billing Name

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>First Name</td>
			<td>bfn</td>
			<td>The first name of the billing name.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>bln</td>
			<td>The last name of the billing name.</td>
			<td>No</td>
		</tr>
	</table>

### Billing Address

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Street</td>
			<td>bsn</td>
			<td>The billing street address, (e.g. "123 Main Street")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>City</td>
			<td>bc</td>
			<td>The billing city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>State</td>
			<td>bs</td>
			<td>The billing state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Zip</td>
			<td>bz</td>
			<td>The billing zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Country</td>
			<td>bco</td>
			<td>ISO 3166 country code of the billing address of the transaction, encoded as a string. Default is "US"</td>
			<td>No</td>
		</tr>
	</table>

### Shipping Name

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>First Name</td>
			<td>sfn</td>
			<td>The first name of the shipping name</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>sln</td>
			<td>The last name of the shipping name</td>
			<td>No</td>
		</tr>
	</table>

### Shipping Address

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Company</td>
			<td>scomp</td>
			<td>The name of the company that is being shipped to, if any (e.g. "IdentityMind")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Street</td>
			<td>ssn</td>
			<td>The shipping street address (e.g. "123 Main Street")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>City</td>
			<td>sc</td>
			<td>The shipping city</td>
			<td>No</td>
		</tr>
		<tr>
			<td>State</td>
			<td>ss</td>
			<td>The shipping state</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Zip</td>
			<td>sz</td>
			<td>The shipping zip code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Country</td>
			<td>sco</td>
			<td>ISO 3166 country code of the shipping address of the transaction, encoded as a string. Default is "US"</td>
			<td>No</td>
		</tr>
	</table>

### Device

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Received IP Address</td>
			<td>ip</td>
			<td>The IP address of the consumer as seen by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint</td>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the attribute "dft"</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Fingerprint Type</td>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to genereate the blob.
				<ul type="disc">
					<li>BC - BlueCava</li>
				</ul> 
			Default is "BC"</td>
			<td>data</td>
		</tr>
		<tr>
			<td>Browser Language</td>
			<td>blg</td>
			<td>The configured language of the browser. Typically available in the HTTP_ACCEPT_LANGUAGE header. Values are defined in ISO-639-1.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Device Token and Scheme</td>
			<td>dts</td>
			<td>Third party service token and scheme identified. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>
	</table>

### Consumer Account

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Transaction Email Address</td>
			<td>tea</td>
			<td>Email of the user account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Social Authentication</td>
			<td>soc</td>
			<td>Indicates that the provided email address is associated with a social networking site, used for OAuth authentication. The content of the field is merchant defined, but the following values are recommended: 
				<ul type="disc">
					<li>facebook</li>
					<li>google</li>
					<li>twitter</li>
					<li>yahoo</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Creation Date</td>
			<td>acd</td>
			<td>The date on which the account was initially created by the consumer. Either an ISO8601 encoded string or a UNIX timestamp.
				<ul type="disc">
					<li>"acd": "2011-01-01T13:12:16+0000"</li>
					<li>"acd":1293887536</li>
					<li>"acd":"1293887536"</li>
				</ul>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Name</td>
			<td>man</td>
			<td>Consumer account identifier. This identifier must uniquely identify the account at the merchant.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Email</td>
			<td>mem</td>
			<td>DEPRECATED: <strike>email address associated to the consumer account</strike></td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Email Last Change</td>
			<td>memcd</td>
			<td>Date on which the account email was last changed</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Home Phone</td>
			<td>ph</td>
			<td>Registered home phone number associated to the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Account Mobile Phone</td>
			<td>pm</td>
			<td>Registered mobile phone number associated to the account</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Consumer Location - Latitude</td>
			<td>clat</td>
			<td>The current latitude of the customer specified in decimal degrees. Encoded as a string (e.g. "clat":"37.4419")</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Customer Location - Longitude</td>
			<td>clong</td>
			<td>The current longitude of the customer specified in decimal degrees. Encoded as a string (e.g. "clong":"-122.1419")</td>
			<td>No</td>
		</tr>
	</table>

### Credit Card

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>Number Hash</td>
			<td>pccn</td>
			<td>Credit Card unique identifier (hash) while obscuring actual number. IdentityMind will supply procedure to generate hash.
			<br><br>
			<b>Note</b>: The has must be of the full card number, not a masked or tokenized representation.
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### PayPal

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### Google Checkout

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### Generic Financial Account

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### Bitcoin

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### ACH

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### Transaction

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

### Inline Feedback**

	<table>
		<tr>
			<th>Facet</th>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
		<tr>
			<td>data</td>
			<td>data</td>
			<td>data</td>
			<td>data</td>
		</tr>
	</table>

## Response

placeholder


# Chargeback Notification

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Credit Notification

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Feedback: Transaction Neutral/Refund Notification

## Arguments

placeholder

## Response

placeholder


# Feedback: Final Payment Transaction Result

## URL

placeholder

## Response

placeholder


# Account Transfer Validation Web Service (Transaction Monitoring)

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Merchant Application Validation Web Service

## Reseller Only Feature: How to associate a merchant with its owners

placeholder

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Consumer Application Validation Web Service (KYC)

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Quiz Response (IDAnalytics)

## URL

placeholder


# Quiz Response (Phone Validation)

## URL

placeholder


# Document Validation Request

## URL

placeholder


# Feedback: Final Application Result

## URL

placeholder

## Example Service Request

placeholder

## Response

placeholder


# Login Annotation Web Service

## URL

placeholder

## Arguments

placeholder

## Response

placeholder


# Appendix A: Result Keys and Codes

## Result Key Names

### Payment Transaction

placeholder

### Account Transfer / Login Validation Transaction

placeholder

### Merchant/Customer Application Transaction

placeholder


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


## Payment Fraud Rule Codes

placeholder

## Account Validation Rule Codes

placeholder

## Automated Review Policy Rule Codes

placeholder

## Consumer/Merchant Application Security Tests

placeholder


# Appendix B: Additional Reseller Fields

## Transaction Validation Web Service

placeholder


# Appendix C: Generic Gateway Codes

## "gateway" property

placeholder

## "auth_response" property

placeholder

## "avs_result" property

placeholder

## "cvv2_result" property

placeholder

## "error_code" property in bank-accepted and bank-rejected feedback

placeholder

## "error_code" property in chargeback feedback

placeholder


# Appendix D: Payment Instrument Hashing

## Including Credit number Hash and Token in Transaction Report

placeholder

### Credit Card Number Hash

placeholder

### Credit Card Number Token

placeholder

## Including Bank Account Hash and Token in Transaction Request

placeholder

### Bank Account Number Hash

placeholder

### Bank Account Number Token

placeholder


# Appendix E: Change History


## 1.18

placeholder

## 1.17.1

placeholder

## 1.17

placeholder

## 1.16.2

placeholder
