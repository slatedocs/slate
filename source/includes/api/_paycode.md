## paycode object

paycode objects have the following attributes:

####id

A unique identifier for this paycode.

####name

The name of this paycode. Maximum length 64 characters.

####description

A description for this paycode.

####pay_rate

Pay rate (e.g. "10.00")

### paycode.create

<span class="tryit" id="paycode-create-tryit"></span>
Creates a new paycode record.

Parameters: Any attributes of a paycode object (except `id`) may be specified. A unique `name` parameter must be specified.

Response: On success, an `id` attribute will provide the identifier for the new paycode.

### paycode.delete

<span class="tryit" id="paycode-delete-tryit"></span>
Deletes a paycode.

Required parameter: `id`.

On success, empty results will be returned.

### paycode.get

> Request example:

```JSON
{
   "id" : 2020
}
```

> Response example:

```JSON
{
   "seconds" : "0.025599",
   "jsonrpc" : "2.0",
   "id" : "7",
   "result" : {
      "pay_rate" : "15.00",
      "name" : "universal minimum wage",
      "id" : "2020",
      "description" : ""
   }
}
```

<span class="tryit" id="paycode-get-tryit"></span>
Returns information about a single paycode.

Required parameter: `id`.

The response results will be a paycode object.

### paycode.list

> Request example:

```JSON
{
   "select" : {
      "paycode" : 2020
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.025599",
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
      "paycodes" : [
         {
            "pay_rate" : "15.00",
            "name" : "universal minimum wage",
            "id" : "2020",
            "description" : ""
         }
      ]
   }
}
```

<span class="tryit" id="paycode-list-tryit"></span>
Returns information about paycodes. Uses [pagination](#pagination).

Optional parameters: `select` object with a `paycode` attribute identifying a single paycode or array of paycodes to be returned. E.g.`{select:{paycode:12345}}`

The response results `paycodes` attribute will be an array of paycode objects for the current page of paycodes.

### paycode.update

<span class="tryit" id="paycode-update-tryit"></span>
Updates a paycode object.

Required parameter: `id`. Any other paycode object attributes may be specified.

Response: On success, empty results will be returned.

