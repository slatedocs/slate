## client object

client objects have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client. Maximum length 128 characters.

####business_name

Business name. Maximum length 100 characters.

####address

Address line (e.g. "*123 Main St*"). Maximum length 100 characters.

####address_second

Second address line. Maximum length 100 characters.

####city

City. Maximum length 100 characters.

####state

Abbreviation or full name of state/province/subdivision. Maximum length 64 characters.

####zip

Postal code. Maximum length 12 characters.

####country

Country. Maximum length 24 characters.

####contact_first_name

First name of contact person. Maximum length 100 characters.

####contact_last_name

Last name of contact person. Maximum length 100 characters.

####contact_phone

Phone number of contact person. Maximum length 100 characters.

####contact_email

Email address of contact person. Maximum length 255 characters.

Notes

####special_instructions

### client.create

> Request example:

```JSON
{
   "workgroup" : "226072",
   "name" : "client 887"
}
```

> Response example:

```JSON
{
   "seconds" : "0.391969",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "id" : "988"
   }
}
```

> Request example with "exists_ok" set:

```JSON
{
   "workgroup" : "226072",
   "name" : "client 887",
   "exists_ok": true
}
```

> Response example when client didn't already exist:

```JSON
{
   "seconds" : "0.391969",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "id" : "988",
      "new": true
   }
}
```

> Response example when client already existed:

```JSON
{
   "seconds" : "0.391969",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "id" : "988",
      "new": false
   }
}
```

<span class="tryit" id="client-create-tryit"></span>
Creates a new client record.

Parameters: Any attributes of a client object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this client. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this client.

Response: On success, an `id` attribute will provide the identifier for the new client.

### client.delete

<span class="tryit" id="client-delete-tryit"></span>
Deletes a client.

Required parameter: `id`.

On success, empty results will be returned.

### client.get

> Request example:

```JSON
{
   "id" : "988"
}
```

> Response example:

```JSON
{
   "seconds" : "0.065741",
   "jsonrpc" : "2.0",
   "id" : "7",
   "result" : {
      "special_instructions" : "test special instructions",
      "country" : "USA",
      "contact_phone" : "5555551212",
      "contact_last_name" : "test",
      "name" : "client 887",
      "contact_first_name" : "client",
      "state" : "WA",
      "city" : "testmetro",
      "zip" : "90210",
      "notes" : "test note",
      "address_second" : "apt 1 test",
      "contact_email" : "test@example.com",
      "id" : "988",
      "address" : "123 test st",
      "business_name" : "test"
   }
}
```

<span class="tryit" id="client-get-tryit"></span>
Returns information about a single client.

Required parameter: `id`

The response results will be a client object.

### client.list

> Request example:

```JSON
{
   "select" : {
      "client" : "988"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.065741",
   "jsonrpc" : "2.0",
   "id" : "7",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "clients" : [
         {
            "special_instructions" : "test special instructions",
            "country" : "USA",
            "contact_phone" : "5555551212",
            "contact_last_name" : "test",
            "name" : "client 887",
            "contact_first_name" : "client",
            "state" : "WA",
            "city" : "testmetro",
            "zip" : "90210",
            "notes" : "test note",
            "address_second" : "apt 1 test",
            "contact_email" : "test@example.com",
            "id" : "988",
            "address" : "123 test st",
            "business_name" : "test"
         }
      ]
   }
}
```

<span class="tryit" id="client-list-tryit"></span>
Returns information about clients. Uses [pagination](#pagination).

Optional parameters:

####select

An object specifying selection criteria for this request. Allowed criteria are:

#####client

A single client identifier or array of client identifiers.

#####search

A generic search string; select clients containing this string in their name.

#####workgroup

The response results `clients` attribute will be an array of the current page of clients. Each element of the array may have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client.

### client.update

> Request example:

```JSON
{
   "special_instructions" : "test special instructions",
   "contact_phone" : "5555551212",
   "contact_last_name" : "test",
   "country" : "USA",
   "contact_first_name" : "client",
   "state" : "WA",
   "city" : "testmetro",
   "zip" : 90210,
   "notes" : "test note",
   "contact_email" : "test@example.com",
   "address_second" : "apt 1 test",
   "address" : "123 test st",
   "id" : "988",
   "business_name" : "test"
}
```

> Response example:

```JSON
{
   "seconds" : "0.04165",
   "jsonrpc" : "2.0",
   "id" : "6",
   "result" : {}
}
```

<span class="tryit" id="client-update-tryit"></span>
Updates a client object.

Required parameter: `id`. Any other client object attributes may be specified.

Response: On success, empty results will be returned.

