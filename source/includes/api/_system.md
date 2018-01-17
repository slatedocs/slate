## system object

### system.echo

<script>tryit('system.echo')</script>

> Request example:

```JSON
{
     true: true, 
     null: null, 
     false: false
}
```

> Response example:

```JSON
 {
     seconds: "0.040819", 
     jsonrpc: "2.0", 
     id: "3", 
     result: {
         true: true, 
         null: null, 
         false: false
     }
}
```

For use in client testing only. Returns the object passed as params as its result.

### system.endBatch

<script>tryit('system.endBatch')</script> 

> Request example:

```JSON
{}
```

> Response example:

```JSON

 {
     seconds: "0.273929", 
     jsonrpc: "2.0", 
     id: "41", 
     result: {}
}
```


Ends a batch of requests.

See [Request Batches](#batch) for more
details.

### system.timestamp

<script>tryit('system.timestamp')</script> 

> Request example:

```JSON

 {}
```JSON

> Response example:

```JSON
 {
     seconds: "0.039812", 
     jsonrpc: "2.0", 
     id: "2", 
     result: {
         timezone: "America/Los_Angeles", 
         timestamp: 1410988108, 
         "24_hour_clock": true, 
         localtime: "2014-09-17T14:08:28-0700"
     }
}
```

Returns the current time.  The `timestamp` attribute is epoch
seconds, for later use as the `updated_since` select criterion by
some methods.  The `localtime` attribute is the RFC 3339 date-time
for the current time in the organization's timezone.  The "24_hour_clock"
attribute is true if the organization is configured to display time
in a 24-hour format.  The `timezone` attribute is the organization's
selected time zone.

### system.whoami

<script>tryit('system.whoami')</script> 

> Request example:

```JSON
 {}
```JSON

> Response example:

```JSON
 {
     seconds: "0.04893", 
     jsonrpc: "2.0", 
     id: "1", 
     result: {
         account: "2"
     }
}
```

Returns account, the account id for the registered API used.

