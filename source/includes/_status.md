# Status
The status endpoint can be used to get a status of a Process Identifier (PID)
 for a specific site. A valid pid must always be given as secondary parameter
 . When calling the [Process](#process) endpoint, it will return a valid pid. If
 an invalid PID will be given, the sites status will always be queued.
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication).</aside>

## GET
Get the status of PID for a site

```shell
curl -i -L -X GET \
 'https://platform-api.productsup.io/platform/v2/sites/<siteId>/status/<pid>' 
```

```shell    
{
    "success": true,
    "status": "failed",
    "links":[
        {
            # Only available when status equals failed
            "errors": "http://platform-api.productsup.io/platform/v2/sites/<siteId>/errors?pid=<pid>"
        },
        {
            "self": "http://platform-api.productsup.io/platform/v2/sites/<siteId>/status/<pid>"
        }
    ]
}
```

### HTTP Request
`GET https://platform-api.productsup.io/platform/v2/sites/<siteId>/status/<pid>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteId | integer | Site to which the PID belongs
pid | string | The PID you want to check the status of

### Response body fields
Field | Type | Description
------ | -------- | --------------
success | Boolean | Indicates status of the request
status | string | Indicates the [status](#status-resonse) of the pid
links | array | List of links, to resource itself and error resource (if status equals failed)

#### <a name="status-resonse"></a> Status value explanation
Status value | Description
------ | ------
queued | Site is queued (default when invalid pid given)
running | Site is being processed
success | Site has run, no errors found
failed | Site has run, but errors were found
