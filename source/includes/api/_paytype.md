## paytype object

paytype objects have the following attributes:

####id

A unique identifier for this paytype.

####name

The name of this paytype. Maximum length 64 characters.

####description

A description for this paytype.

### paytype.list

> Request example:

```JSON
{
    "select" : {
       "paytype" : [2020, 2021]
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
       "paytypes" : [
          {
             "id" : "2020",
             "name" : "Per Diem",
             "description" : "Daily rate"
          },
          {
             "id" : "2021",
             "name" : "Mileage",
             "description" : "Mileage Reimbursement"
          }
       ]
    }
}
```

<span class="tryit" id="paytype-list-tryit"></span>
Returns information about paytypes. Uses [pagination](#pagination).

Optional parameters: `select` object with a `paytype` attribute identifying a single paytype or array of paytypes to be returned. E.g.`{select:{paytype:12345}}`

The response results `paytypes` attribute will be an array of paytype objects for the current page of paytypes.
 
 