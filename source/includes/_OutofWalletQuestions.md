# Out of Wallet Questions (IDAnalytics)

The response to this request is an application response containing the newly updated application.
Note that the response may, depending on the response from ID Analytics and your configuration within the eDNA platform, contain a further set of “challenge” questions that should once again be passed back to the consumer for answers.

The following URLs are used to return a customer’s response to a set of out of wallet questions returned either by a merchant or consumer application respectively:

`POST https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse`

`POST https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s answers to the quiz questions. The encoding is in JSON as shown below. The answers are processed and the response used to update the IDAnalytics CertainID Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse

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
	<br>
	<table>
		<tr>
			<th colspan=2>JSON Answers Encoding</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>answers</td>
			<td>JSON Array of JSON encoded answer objects</td>
		</tr>
		<tr>
			<td>questionId</td>
			<td>Integer identifier for this question. This value maps to the question within the question data.</td>
		</tr>
		<tr>
			<td>choice</td>
			<td>Text of the answer that was selected by the consumer</td>
		</tr>
	</table>