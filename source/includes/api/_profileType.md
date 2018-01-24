## profileType object

profileType objects have the following attributes:

####id

A unique identifier for this profile type.

####name

The name of this profile type.

### profileType.list

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.039222",
   "jsonrpc" : "2.0",
   "id" : "1",
   "result" : {
      "count" : "2",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "profile_types" : [
         {
            "name" : "Basic Profile",
            "id" : "1"
         },
         {
            "name" : "Staff",
            "id" : "2"
         }
      ]
   }
}
```

<span class="tryit" id="profiletype-list-tryit"></span>
Returns information about profile types. Uses [pagination](#pagination).

Optional parameters: `select` object with a `profile_type` attribute identifying a single profile type to be returned. E.g. `{select:{profile_type:12345}}`

The response results `profile_types` attribute will be an array of the current page of profile_types. Each element of the array will be a profile_type object.

