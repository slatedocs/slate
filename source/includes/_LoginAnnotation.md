# Login Annotation

The evidence is the login transaction data to be added to the entities transaction record. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided.

The following URLs are used for account login transactions:

Annotate a user's transactions with login data:  
`POST https://edna.identitymind.com/im/account/login`

#### Arguments

```json
EXAMPLE SERVICE REQUEST

https://edna.identitymind.com/im/account/login   

{ 
  "man" : "jdinh",
  "soc" : "facebook"
  "tea" : "james@gmail.com",
  "dft" : "BC",
  "dfp" : "1872ABCD129E…",
  "ip" : "69.181.162.146",
  "tid" : "89"
}
```

> The response is a JSON encoding of the IdentityMind service result. The response includes detailed result codes and transaction unique identifier. The keys are fully defined in *Appendix A: Result Keys and Codes*.

```json
EXAMPLE SERVICE RESPONSE DATA

{ 
  "res" : "ACCEPT",
  "erd" : "Validated User",
  "tid" : "89",
  "rcd" : "1000,100,110,151,120",
  "frn" : "Fallthrough",
  "usc" : 43,
  "ufs" : 1372101668000,
  "umrs" : 1371231456000,
  "frd":"User is trusted and no fraud rules were triggered."
}
```
	<br>
	<table>
		<tr>
			<th colspan=3>User Account</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>man</td>
			<td>Free form unique identifier for the account at this merchant. Maximum length is 60 characters.</td>
			<td>No</td>
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
			<th colspan=3>Device</th>
		</tr>
		<tr>
			<td>ip</td>
			<td>The IP address of the client as observed by the merchant</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Device fingerprint blob. The interpretation of this blob is specified by the value of the <code>dft</code> attribute.</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Device fingerprint type. Specifies the technology that was used to generate the blob.
				<ul type="disc">
					<li><code>BC</code> - BlueCava</li>
				</ul>
			Default is <code>BC</code>
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>dts</td>
			<td>Third party service device token and scheme identifier. Contact IdentityMind for detailed format information.</td>
			<td>No</td>
		</tr>


		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<td>tti</td>
			<td>The date and time of the transaction as processed by the merchant. Expressed in UTC, encoded as a UNIX timestamp.
				<ul type="disc">
					<li><code>"tti":129887536</code></li>
					<li><code>"tti":"129887536"</code></li>
				</ul></td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Merchant unique identifier for the transaction. eDNA assigns an internal ID if none is provided. The transaction ID must be encoded as a string (e.g. <code>"tid":"123455"</code>). Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>