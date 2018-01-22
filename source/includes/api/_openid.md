## openid object

openid objects have the following attributes:

####id

A unique identifier for this openid object.

####account

####openid

### openid.create

<script>tryit('openid.create')</script> 

Adds an openid to an existing account.

Required Parameters:

####account

+<dd>A single account identifier or an array of identifiers of accounts.</dd>

+<dd><b>NOTE:</b> If you are calling this method with the <span class="code">external_account</span> parameter, <span class="code">account</span> is not required.</dd>

+<dt>external_account</dt>

+<dd>A single external account identifier or an array of external identifiers of accounts.

+<dd><b>NOTE:</b> If you are calling this method with the <span class="code">account</span> parameter, <span class="code">external_account</span> is not required.</dd>

####openid

An openid url that will allow authentication to this account via

https://www.shiftboard.com/login/openid?http...

where http... is the designated url, URI-escaped. E.g. for openid http://www.example.com/, use the login link

https://www.shiftboard.com/login/openid?http%3A%2F%2Fwww.example.com%2F

If this openid is already in use for any account in Shiftboard, an error will be returned.

Response: On success, an `id` attribute will provide the identifier for the new account_openid.

### openid.delete

<script>tryit('openid.delete')</script> 

Deletes an account_openid object.

Required Parameter: `id`. Deleting an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### openid.update

<script>tryit('openid.update')</script> 

Updates an account_openid object.

Required Parameter: `id`. Any other account_openid object attributes may be specified. If openid is updated and the new openid is already in use for any account in Shiftboard, an error will be returned. Updating an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

