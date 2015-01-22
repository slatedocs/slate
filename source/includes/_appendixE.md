# Appendix E: Change History


### 1.18

- Updated Merchant and Consumer Application Validation Web Services to support multiple owners for a merchant.  We also added extra fields as required by our clients.
- Added additional security tests


### 1.17.1

- Added Account Validation Rule 11010
- Switched from Experian 192 CheckID to Experian ProveID
	- Added “Unsupported Country” security test to Experian


### 1.17

- Document the Quiz Response (Phone Ownership)
- Add Auth.net and Interac as supported gateways
- Document application accepted and rejected API
- Added bank_status property to the Merchant Accept/Reject Feedback API
- Corrected format of the “ufs” and “umrs” fields
- Add API call to get the current state of a consumer or merchant application
- Clarify that a payment hash must be of the original non-masked account number
- Documented memo field in Transfer and KYC transaction data


### 1.16.2

- Added support for Jumio Netverify Multi Document
- Added additional KYC request attributes to support Jumio NetVerify
	- Face match in NetVerify Perform
	- Backside Image in NetVerity Perform
- Add security tests
	- IdentityMind Sanctions Screening
	- Jumio NetVerify Multi Document