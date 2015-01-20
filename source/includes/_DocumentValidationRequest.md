# Document Validation Request

The body of the POST contains JSON encoding of the document type that is to be uploaded. The request will return an error if Jumio NetVerify has not been configured with eDNA.

The following URLs are used to initiate a Jumio Netverify Multi Document transaction for a Consumer or Merchant application:

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