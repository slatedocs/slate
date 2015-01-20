# Feedback: Transaction Neutral/Refund Notification

Notifies that a refund occurred on a transaction. All arguments are optional. 

**Note**: The transaction may be either a payment transaction or an account transfer.

## Arguments

The transaction ID is part of the URL. The "refund-ok" URL should be used when the merchant believes that the refund is legitimate. The "refund-fraud" URL should be used when the merchant believes there is fraud, but a refund is being made to avoid a later chargeback.

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-ok)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-fraud)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-ok)

[https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud](https://edna.identitymind.com/im/transaction/<transaction_ID>/refund-partial-fraud)
 
```code
EXAMPLE SERVICE REQUEST

{
    “amt”: 0.25,
    “auth_response”: “rejected”,
    “auth_response_text”: “Transaction already refunded”,
    “error_code”: “206”,
    “reason”: “Suspected friendly fraud”,
    “tid”: “42”
}
```

> The response contains a JSON encoded message or error message:

```code
EXAMPLE SERVICE RESPONSE DATA

{
    “message”: “Feedback accepted for REFUND_FRAUD feedback on transaction 42”
}
```

	<table>		
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>amt</td>
			<td>Amount of the refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response</td>
			<td>Response code from the gateway</td>
			<td>No</td>
		</tr>
		<tr>
			<td>auth_response_text</td>
			<td>Text describing response code</td>
			<td>No</td>
		</tr>
		<tr>
			<td>error_code</td>
			<td>Error code from the gateway, if any</td>
			<td>No</td>
		</tr>
		<tr>
			<td>reason</td>
			<td>Text describing reason for refund/chargeback</td>
			<td>No</td>
		</tr>
		<tr>
			<td>bank_status</td>
			<td>The status of the transaction at the gateway/bank:
				<ul type="disc">
					<li>"a" - auth_only</li>
					<li>"c" - captured</li>
					<li>"d" - declined</li>
					<li>"v" - void</li>
					<li>"r" - refund</li>
					<li>"b" - chargeback</li>
					<li>"u" - unknown</li>
				</ul>
			Default is "u"
			</td>
			<td>No</td>
		</tr>
		<tr>
			<td>tid</td>
			<td>Transaction ID. Maximum length is 40 characters.</td>
			<td>No</td>
		</tr>
	</table>