# Phone Ownership Validation (Twilio)

The response to this request is an application response containing the newly updated application.

The following URLs are used to return a customer’s response to a phone validation request:

`POST https://edna.identitymind.com/im/account/merchant/<appid>/quizresponse`

`POST https://edna.identitymind.com/im/account/consumer/<appid>/quizresponse`

> The body of the request contains an encoding of the customer’s code response. The encoding is in JSON as shown below. The answers are processed and the response is used to update the Phone Ownership Security Test and the Application state.

```code
EXAMPLE SERVICE REQUEST DATA

https://edna.identitymind.com/im/account/merchant/743567/quizresponse


{
   "smsCode":”1234”
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
			<td>smsCode</td>
			<td>The response code provided by the consumer. Encoded as a string</td>
		</tr>
	</table>