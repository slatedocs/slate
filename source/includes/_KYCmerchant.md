# KYC: Merchant Application

The evidence is the application data to be evaluated. It is supplied in the body of the HTTP-POST as JSON-encoded key value pairs. While all fields are not required, validation evaluation is more comprehensive when richer evidence is provided. 

The following URLs are used for merchant application validation:

Validate a merchant application:<br>
`POST https://edna.identitymind.com/im/account/merchant`

Retrieve the current state of a merchant application:<br>
`GET https://edna.identitymind.com/im/account/merchant/<tid>`

##### Arguments

	<table>
		<tr>
			<th colspan=2>Merchant Application Request Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>ataxid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>amn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>afn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aln</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>asn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ac</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aco</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>as</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>az</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>aph</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dba</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>businesstype</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ccaccept</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ppaccept</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>achaccept</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bitcoinaccept</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>merchantgroup</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>bankaccounttype</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>mcc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>giin</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>title</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>dob</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>assn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>assnl4</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>stage</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>scanData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>faceImageData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>backsideImageData</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>merchantAid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>personalguarantee</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ownership</td>
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
			<td>pcty</td>
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
    "mtid": "eDNABlackListFail",
    "state": "R",
    "merchantAPIName":"joseshoe",
    "ownerApplicationIds":[
        	"consumerapp001",
        	"consumerapp002",
	        "consumerapp003"
    ],

    "merchantApplicationResponse": {
        "erd": "Bad User",
        "frd": "1414110157324_accountname in black list.  Added from a test player file",
        "frn": "Account Black List",
        "rcd": "50003,202,111,101,132,10020",
        "res": "DENY",
        "tid": "eDNABlackListFail",
        "ufs": 1414110157000,
        "umrs": 1414110157000,
        "upr": "UNKNOWN",
        "usc": 0,
        "user": "BAD"
    },
    "ednaScoreCard": {
        "tr": [
            {
                "testCategory": "eDNA",
                "testDescription": "Informational -- It displays the number of payment instruments associated with the applicant's device.",
                "testId": "ed:14",
                "testName": "Device Payment Count",
                "testResult": "0"
            },
            {
                "testCategory": "Device",
                "testDescription": "Checks whether the device is currently using an anonymous proxy.  It fails when an anonymous proxy is being used.",
                "testDetails": "The device is not currently using an anonymous proxy",
                "testId": "bc:1",
                "testName": "BlueCava: Using Anonymous Proxy",
                "testPass": true
            },
        ]
    }
} 
```

> The response includes detailed result codes and the transaction unique identifier. Parameters that are not defined here but appearing in the Request API will be categorized as custom data and can be displayed on the UI as proprietary information for the merchant.

	<table>
		<tr>
			<th colspan=2>Application Reponse Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>mtid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>acVerification</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>docVerification</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ownerApplicationIds</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>parentMerchant</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>oowQuestions</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smsVerification</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>merchantAPIName</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>state</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>user</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>upr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>erd</td>
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
			<td>frn</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>ednaScoreCard</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpd</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpid</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>arpr</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>frp</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>usc</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Document Verification</th>
		</tr>
		<tr>
			<td>redirectURL</td>
			<td>Description</td>
		</tr>
		<tr>
			<th colspan=2>Questions Wrapper</th>
		</tr>
		<tr>
			<td>questions</td>
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

## Quiz Response

The response to this request is an application response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of "challenge" questions that should once again be passed back to the consumer for answers.

`POST https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

```code
EXAMPLE SERVICE RESPONSE DATA
```
```json
{
   "answers":[
      {
         "questionId":"0",
         "choice":"KERRVILLE"
      },
      {
         "questionId":"1",
         "choice":"DICK"
      },
      {
         "questionId":"2",
         "choice":" None of the above "
      },
      {
         "questionId":"3",
         "choice":"MUNSTER"
      }
   ]
}
```

	<table>
		<tr>
			<th colspan=2>Feedback Quiz Response Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>smsCode</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>amount</td>
			<td>Description</td>
		</tr>
	</table>

## Feedback

All arguments are optional, although a JSON object must be provided.

The following URLs are used to notify IdentityMind of the acceptance or rejection of an application by the merchant:

`POST https://edna.identitymind.com/im/account/merchant/<application_ID>/accepted`

`POST https://edna.identitymind.com/im/account/merchant/<application_ID>/rejected`

	<table>
		<tr>
			<th colspan=2>Application Feedback Data</th>
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>reason</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>description</td>
			<td>Description</td>
		</tr>
		<tr>
			<td>validate</td>
			<td>Description</td>
		</tr>
	</table>

##### Response

	<table>
		<tr>
			<th colspan=2>Feedback Response</th>
		</tr>		
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>message</td>
			<td>description</td>
		</tr>
		<tr>
			<td>error_message</td>
			<td>description</td>
		</tr>
	</table>