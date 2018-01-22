## system object

### system.echo

> Request example:

```JSON
{
   "false" : false,
   "true" : true,
   "null" : null
}
```

> Response example:

```JSON
{
   "seconds" : "0.040819",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "false" : false,
      "true" : true,
      "null" : null
   }
}
```

<span class="tryit" id="system-echo-tryit"></span>
For use in client testing only. Returns the object passed as params as its result.

### system.endBatch

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.273929",
   "jsonrpc" : "2.0",
   "id" : "41",
   "result" : {}
}
```

<span class="tryit" id="system-endbatch-tryit"></span>
Ends a batch of requests.

See [Performance Batching](#performance-batching) for more details.

### system.timestamp

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.039812",
   "jsonrpc" : "2.0",
   "id" : "2",
   "result" : {
      "localtime" : "2014-09-17T14:08:28-0700",
      "timezone" : "America/Los_Angeles",
      "timestamp" : 1410988108,
      "24_hour_clock" : true
   }
}
```

<span class="tryit" id="system-timestamp-tryit"></span>
Returns the current time.  The `timestamp` attribute is epoch
seconds, for later use as the `updated_since` select criterion by
some methods.  The `localtime` attribute is the RFC 3339 date-time
for the current time in the organization's timezone.  The "24_hour_clock"
attribute is true if the organization is configured to display time
in a 24-hour format.  The `timezone` attribute is the organization's
selected time zone.

### system.whoami

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.04893",
   "jsonrpc" : "2.0",
   "id" : "1",
   "result" : {
      "account" : "2"
   }
}
```

<span class="tryit" id="system-whoami-tryit"></span>

**NOTE:** external_account, the external account id for the registered API user will be included if external ids are enabled for the site.
