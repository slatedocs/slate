## news object

### news.get

<script>tryit('news.get')</script> 

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
     seconds: "0.065741", 
    jsonrpc: "2.0", 
    id: "7", 
     result: {
         news: {
             member: "Member news goes here", 
             manager: "Manager news goes here", 
            team: {
                 "Example": {
                     news: "This is the news section for my Workgroup"
                 }
             }
         }
     }
}
```

Returns the news for managers, teams, and members.

Optional parameters:

####org_id

