# Document Validation Request

The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

The following URLs are used to initiate a Jumio Netverify Multi Document transaction for a Consumer or Merchant application:

[https://edna.identitymind.com/im/account/merchant/<appid>/document](https://edna.identitymind.com/im/account/merchant/<appid>/document)  (POST)

[https://edna.identitymind.com/im/account/consumer/<appid>/document](https://edna.identitymind.com/im/account/consumer/<appid>/document)  (POST)

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
					<li>BS - Bank statement</li>
					<li>CC - Credit card</li>
					<li>IC - Insurance card</li>
					<li>UB - Utility bill</li>
					<li>CAAP - Cash advance application</li>
					<li>CRC - Corporate resolution certificate</li>
					<li>CCS - Credit card statement</li>
					<li>LAG - Lease agreement</li>
					<li>LOAP - Loan application</li>
					<li>MOAP - Mortgage application</li>
					<li>TR - Tax return</li>
					<li>VT - Vehicle title</li>
					<li>VC - Voided check</li>
					<li>STUC - Student card</li>
					<li>HCC - Healthcare card</li>
					<li>CB - Council bill</li>
					<li>SENC - Seniors card</li>
					<li>MEDC - Medicare card</li>
					<li>BC - Birth certificate</li>
					<li>USSS - US social security card</li>
					<li>WWCC - Working with children check</li>
					<li>SS - Superannuation statement</li>
					<li>TAC - Trade associated card</li>
					<li>SEL - School enrollment letter</li>
					<li>PB - Phone bill</li>
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