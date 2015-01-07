# Appendix B: Additional Reseller Fields

## Transaction Validation Web Service

The following additional fields are available to resellers of the IdentityMind eDNA service:

	<table>
		<tr>
			<th colspan=3>Transaction</th>
		</tr>
		<tr>
			<th>Key</th>
			<th>Description</th>
			<th>Required</th>
		</tr>
		<tr>
			<td>m</td>
			<td>The EDNA API username of the merchant to whom the transaction is to be associated.  This field is used when the reseller’s credentials are used to authenticate the service call, but the transaction is to be associated with a Merchant that is being accessing the EDNA service via the reseller’s system.
			<br><br>  
			<b>Note:</b> a Merchant account must be created in the EDNA system prior to providing this field.
			</td>
			<td>No</td>
		</tr>
	</table>