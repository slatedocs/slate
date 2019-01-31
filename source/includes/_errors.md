# Errors

If an error occurs, the message will contain an <code>error</code> key containing an object with two keys: <code>code</code> and <code>message</code>.


Error Codes:

Code | Description
---- | -----------
4007 | Required parameter missing :
4008 | Please enter valid billing address.
4009 | Please enter valid order.
4010 | Please enter valid order Item.
4011 | Please enter valid order Items.


Example of error message:

<pre class="center-column">
error {
  message: "The Store Id Does Not Exist"
  code: 1001
}
</pre>