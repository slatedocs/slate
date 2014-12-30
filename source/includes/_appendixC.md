# Appendix C: Generic Gateway Codes

The gateway property of feedback lets IdentityMind know the gateway that processed the transaction, and how to interpret the response codes. IdentityMind supports many gateways natively, and adds new gateway support as requested by merchants. If a merchant would prefer to perform their own mapping from their gateway’s codes, the following generic gateway definition is provided. 

This appendix defines the values to be used for feedback properties for the generic gateway.

	<table>

		<tr>
			<th colspan=2>"gateway" property</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>generic</td>
			<td>-</td>
		</tr>
		<tr>
			<th colspan=2>"auth_response" property</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>accepted</td>
			<td>The transaction was approved by the gateway</td>
		</tr>
		<tr>
			<td>rejected</td>
			<td>The transaction was rejected by the gateway</td>
		</tr>


		<tr>
			<th colspan=2>"avs_result" property</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>Y</td>
			<td>AVS match</td>
		</tr>
		<tr>
			<td>N</td>
			<td>AVS mismatch</td>
		</tr>
		<tr>
			<td>P</td>
			<td>AVS partial match</td>
		</tr>
		<tr>
			<td>U</td>
			<td>AVS unavailable</td>
		</tr>


		<tr>
			<th colspan=2>"cvv2_result" property</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>Y</td>
			<td>CVV match</td>
		</tr>
		<tr>
			<td>N</td>
			<td>CVV mismatch</td>
		</tr>


		<tr>
			<th colspan=2>"error_code" property in bank-accepted and bank-rejected feedback</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>0</td>
			<td>Approved</td>
		</tr>
		<tr>
			<td>1</td>
			<td>Insufficient funds</td>
		</tr>
		<tr>
			<td>2</td>
			<td>AVS mismatch</td>
		</tr>
		<tr>
			<td>3</td>
			<td>CVV mismatch</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Card verification</td>
		</tr>
		<tr>
			<td>5</td>
			<td>System error</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Cancelled card</td>
		</tr>
		<tr>
			<td>7</td>
			<td>Likely user input error. In IdentityMind's experience, the majority of bank declines are due to the consumer accidentally entering erroneous payment information. This error code is specifically handled within eDNA to reduce teh level of false positives from, for example, velocity based fraud rules. Examples of decline reasons that should be catagorized as Likely User Input Error are:
				<ul type="disc">
					<li>No Such Issuer</li>
					<li>Expired Card</li>
					<li>Invalid Card Number</li>
					<li>Invalid PIN</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Fraud. For example, the card has responded with a code meaning "pickup card / stolen." Only use this error code if the gateway is explicit that this is a fraudulent card.</td>
		</tr>
		<tr>
			<td>9</td>
			<td>Gateway Fraud Filter - The gateway has decline the transaction due to its internal fraud filters</td>
		</tr>
		<tr>
			<td>10</td>
			<td>Other - An uncategorized code.</td>
		</tr>


		<tr>
			<th colspan=2>"error_code" property in chargeback feedback</th>
		</tr>
		<tr>
			<th>Value</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>CB1</td>
			<td>Fraud</td>
		</tr>
		<tr>
			<td>CB2</td>
			<td>Merchant Error</td>
		</tr>
		<tr>
			<td>CB3</td>
			<td>Suspected Friendly Fraud</td>
		</tr>
		<tr>
			<td>CB4</td>
			<td>Other</td>
	</table>

In addition to the above generic codes, the standard chargeback codes as defined by the card brands are supported. Please reference http://www.managechargebacks.com/reasoncodes.html for the complete set.

Please contact IdentityMind support if you have questions with how to categorize a specific error code.