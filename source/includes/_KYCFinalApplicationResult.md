# KYC: Final Application Result

All arguments are optional, although a JSON object must be provided.

The following URLs are used to notify IdentityMind of the acceptance or rejection of an application by the merchant:

`POST https://edna.identitymind.com/im/account/consumer/<application_ID>/accepted`

`POST https://edna.identitymind.com/im/account/consumer/<application_ID>/rejected`

`POST https://edna.identitymind.com/im/account/merchant/<application_ID>/accepted`

`POST https://edna.identitymind.com/im/account/merchant/<application_ID>/rejected`

#### Arguments
```code
EXAMPLE SERVICE REQUEST
```
```json
{
  "reason": "0",
  "description": "I like this application",
	  "validate": true
}
```
```code
or


{}
```
```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
  "message": "Accepted application"
}
```
	<br>
	<table>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>reason</td>
			<td>Free form code. Up to 4 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Free form descriptive text providing additional information about the feedback. Up to 255 characters</td>
			<td>No</td>
		</tr>
		<tr>
			<td>validate</td>
			<td>Whether the user defined in the application should be validated. Encoded as a boolean.
			<br><br>
			For a rejected application, the property is interpreted as whether to mark the applicant as having failed validation.
			<br><br>
			Defaults to <code>false</code></td>
			<td>No</td>
		</tr>
	</table>