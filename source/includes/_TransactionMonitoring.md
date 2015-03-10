# Transaction Monitoring

The evidence is the account transfer transaction data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

The following URLs are used for account transaction validation:

Validate an external transfer (deposit) into an account:<br>
`POST https://edna.identitymind.com/im/account/transferin`

Validate an internal transfer between accounts:<br>
`POST https://edna.identitymind.com/im/account/transfer`

Validate an external transfer (withdrawal) from an account:<br>
`POST https://edna.identitymind.com/im/account/transferout`

##### Arguments

```code
EXAMPLE SERVICE REQUEST
```
```json
{ 
  "man" : "jdinh",
  "soc" : "facebook",
  "tea" : "james@gmail.com",
  "bc" : "Palo Alto",
  "bco" : "US",
  "bfn" : "James",
  "bln" : "Dinh",
  "bz" : "55555",
  "bs" : "CA",
  "bsn" : "123 anystreet",
  "dft" : "BC",
  "dfp" : "1872ABCD129E…",
  "ip" : "69.181.162.146",
  "tid" : "89",
  "pbc" : "792019bcc…",
  "ptoken"  : "356007XXXXXX000e",
  "dpbc" : "8ad0e8859…",
  "dptoken"  : "517074XXXXXX000e"
}
```

	<table>
		<tr>
			<th colspan=2>Account Transfer Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>dman</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>demail</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dph</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpccn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpcct</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpppi</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpppe</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dphash</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dptoken</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpach</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dpbc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>amt</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ccy</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>m</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pctv</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>phash</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ptoken</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pccn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pcct</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>man</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tea</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>soc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ip</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dfp</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dft</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tti</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bfn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bln</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>profile</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smna</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bsn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bco</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bz</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bs</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sfn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sln</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ssn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sco</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sz</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>sc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ss</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aflsd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>blg</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clat</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>clong</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>phn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pm</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pw</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pach</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>pbc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>memo</td>
			<td>Description</td>
		</tr>
	</table>

##### Response

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{ 
  "res" : "ACCEPT",
  "erd" : "Validated User",
  "tid" : "89",
  "rcd" : "1000,100,110,151,120",
  "frn" : "Fallthrough",
  "usc" : 43,
  "umrs":1372723453000,
  "ufs":1372101668000,
  "frd":"User is trusted and no fraud rules were triggered."
}

{
  "res" : "ERROR",
  "error_message" : "Bad data format:Failed to parse the date string provided in the data.  Please use ISO 8601 format."
}
```
> The response includes detailed result codes and the transaction unique identifier. The most important part of the response is whether the transaction is to be accepted, denied, or scheduled for manual review, which is dependent on the configured validation policy.

	<table>
		<tr>
			<th colspan=2>Transaction Reponse Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>user</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>erd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>upr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>res</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>rcd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frp</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>usc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ednaScoreCard</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Transaction Scorecard</th>
		</tr>
		<tr>
			<td>ar</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>er</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Automated Review Engine Result</th>
		</tr>
		<tr>
			<td>result</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleName</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleDescription</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Test Result</th>
		</tr>
		<tr>
			<td>testId</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testDetails</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testPass</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>testResult</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>waitingForData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>previouslyAccepted</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Evaluation Result</th>
		</tr>
		<tr>
			<td>firedRules</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>reportedRule</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Externalized Rule</th>
		</tr>
		<tr>
			<td>name</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>details</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>resultCode</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ruleId</td>
			<td>Description</td>
		</tr>
	</table>