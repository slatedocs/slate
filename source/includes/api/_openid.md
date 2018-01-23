## openid object

openid objects have the following attributes:

####id

A unique identifier for this openid object.

####account

####external_account

####openid

### openid.create

> Request example:

```JSON
{
   "openid" : "http://openid4.example.com/",
   "account" : 918
}
```

> Response example:

```JSON
{
   "seconds" : "0.064778",
   "jsonrpc" : "2.0",
   "id" : "43",
   "result" : {
      "id" : 785
   }
}
```

<span class="tryit" id="openid-create-tryit"></span>
Adds an openid to an existing account.

Required Parameters:

####account

A single account identifier or an array of identifiers of accounts.

**NOTE:** If you are calling this method with the `external_account` parameter, `account` is not required.

####external_account

A single external account identifier or an array of external identifiers of accounts.

**NOTE:** If you are calling this method with the `account` parameter, `external_account` is not required.

####openid

An openid url that will allow authentication to this account via

https://www.shiftboard.com/login/openid?http...

where http... is the designated url, URI-escaped. E.g. for openid http://www.example.com/, use the login link

https://www.shiftboard.com/login/openid?http%3A%2F%2Fwww.example.com%2F

If this openid is already in use for any account in Shiftboard, an error will be returned.

Response: On success, an `id` attribute will provide the identifier for the new account_openid.

### openid.delete

> Request example:

```JSON
{
   "id" : "785"
}
```

> Response example:

```JSON
{
   "seconds" : "0.051149",
   "jsonrpc" : "2.0",
   "id" : "46",
   "result" : {}
}
```

<span class="tryit" id="openid-delete-tryit"></span>
Deletes an account_openid object.

Required Parameter: `id`. Deleting an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

### openid.update

> Request example:

```JSON
{
   "openid" : "http://openid4.example.com/new",
   "id" : 785
}
```

> Response example:

```JSON
{
   "seconds" : "0.064496",
   "jsonrpc" : "2.0",
   "id" : "45",
   "result" : {}
}
```

<span class="tryit" id="openid-update-tryit"></span>
Updates an account_openid object.

Required Parameter: `id`. Any other account_openid object attributes may be specified. If openid is updated and the new openid is already in use for any account in Shiftboard, an error will be returned. Updating an account_openid object is not allowed if the account is active with more than one organization's Shiftboard.

Response: On success, empty results will be returned.

