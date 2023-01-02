---
title:

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - http

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Apps API
---

# Introduction
##AUTHNULL
 



# Apps

Welcome to the Apps! You can use our API to access Apps API endpoints, which can get information on various apps in our database.

We have language bindings in Shell and HTTP! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.
> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: Authnull"
```

```http
Content-Type: application/json
Content-Length: 139
```

<aside class="notice">
You must replace <code>apps</code> with your personal API key.
</aside>

# List All Apps

## List All
  List All gives us the entire list of Apps that are present.


```shell
curl "POST 'https://api.authnull.kloudlearn.com/api/v1/apps/listAll' \" \
  -H "Authorization: Authnull"
```

```HTTP
POST /api/v1/apps/listAll HTTP/1.1

```json
{
    "domainId": 1,
    "pageId" : 1,
    "pageSize" :10,
    "filter" :{
        "value": "",
        "filterBy":""

    }
    }
```

### HTTP Request

`POST /api/v1/apps/listAll HTTP/1.1`

### Query Parameters

Parameter  | Description
--------- | -----------
 domainId| Domain Id of the Apps
filter | Filter is used for Advanced Search
pageId | page Id represents the page Number
pageSize | page size represents the number of apps to be returned in the response

<aside class="success">
List All Apps.
</aside>

# Delete Apps

## Delete
  Delete Apps removes the particular apps from the list. 


```shell
curl "DELETE 'https://api.authnull.kloudlearn.com/api/v1/apps/deleteApp' \" \
  -H "Authorization: Authnull"
```

```HTTP
DELETE /api/v1/apps/deleteApp HTTP/1.1;


```json
{
    "id": 84,
    "domainId": 1
}
```

### HTTP Request

`DELETE /api/v1/apps/deleteApp HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | -----------
 id| Id of the App that needs to be deleted.
domainId | Domain Id in which the app belongs to.


<aside class="success">
App Deleted !
</aside>


